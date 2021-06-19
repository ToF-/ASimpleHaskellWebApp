{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
-- {-# OPTIONS_GHC -ddump-splices     #-}

module Server where

import Control.Applicative
import Control.Monad.IO.Class
import Data.IORef
import Data.Maybe
import Data.Text
import Yesod
import Yesod.Form.Jquery
import Yesod.Static

type UserId = Text
data User = User
    { userId  :: UserId
    , userPassword :: Text }
    deriving (Eq, Show)

data HelloWorld = HelloWorld { getStatic :: Static
                             , userRef   :: IORef (Maybe UserId) }

appUser :: HelloWorld -> IO UserId
appUser app = do
    the_user_id <- readIORef (userRef app)
    return $ maybe "" id the_user_id

staticFiles "static"

mkYesod "HelloWorld" [parseRoutes|
/        HomeR    GET POST
/static  StaticR  Static getStatic
|]

instance Yesod HelloWorld

instance RenderMessage HelloWorld FormMessage where
    renderMessage _ _ = defaultFormMessage

instance YesodJquery HelloWorld

userForm :: Html -> MForm Handler (FormResult User, Widget)
userForm = renderDivs $ User
    <$> areq textField "Id" Nothing
    <*> areq passwordField "Password" Nothing


getHomeR :: Handler Html
getHomeR = do
    state <- getYesod
    user_id <- liftIO $ appUser state
    (formWidget, enctype) <- generateFormPost userForm
    defaultLayout $ do
        addStylesheet (StaticR css_main_css)
        [whamlet|
            <p> Hello world!
            $if (user_id /= "")
                <p>Welcome #{user_id} !
            $else
                <form method=post action=@{HomeR} enctype=#{enctype}>
                    ^{formWidget}
                    <button>Login
|]

postHomeR :: Handler Html
postHomeR = do
    ((result, widget), enctype) <- runFormPost userForm
    state <- getYesod
    let ref = userRef state
    case result of
      FormSuccess user -> do
          liftIO $ writeIORef ref (Just (userId user))
          liftIO $ print ((userId user) <> " (pseudo) logged in")
    redirect HomeR

staticFilesPath = "static"

serve :: IO ()
serve = do
    static <- staticDevel staticFilesPath  -- will check for modification each time a request is made on static files
    ref <- liftIO $ newIORef Nothing
    warp 3000 $ HelloWorld { getStatic = static, userRef = ref }

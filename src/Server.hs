{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}

module Server where

import Control.Applicative
import Data.Text
import Yesod
import Yesod.Form.Jquery
import Yesod.Static


data HelloWorld = HelloWorld { getStatic :: Static }

staticFiles "static"

mkYesod "HelloWorld" [parseRoutes|
/        HomeR    GET POST
/static  StaticR  Static getStatic
|]

instance Yesod HelloWorld

instance RenderMessage HelloWorld FormMessage where
    renderMessage _ _ = defaultFormMessage

instance YesodJquery HelloWorld

data User = User
    { userId  :: Text
    , userPassword :: Text }
    deriving Show

userForm :: Html -> MForm Handler (FormResult User, Widget)
userForm = renderDivs $ User
    <$> areq textField "Id" Nothing
    <*> areq passwordField "Password" Nothing


getHomeR :: Handler Html
getHomeR = do
    (formWidget, enctype) <- generateFormPost userForm
    defaultLayout $ do
        addStylesheet (StaticR css_main_css)
        [whamlet|
            <p> Hello world!
            <form method=post action=@{HomeR} enctype=#{enctype}>
                ^{formWidget}
                <button>Login
|]

postHomeR :: Handler Html
postHomeR = defaultLayout [whamlet|
    <p> Hello world!
|]

serve :: IO ()
serve = do
    static <- staticDevel "static"
    warp 3000 $ HelloWorld { getStatic = static }

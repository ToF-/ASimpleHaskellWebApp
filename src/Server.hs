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


data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET POST
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
serve = warp 3000 HelloWorld

{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Home where

import Import
import Helpers.Subject

getHomeR :: Handler Html
getHomeR = do
    (formWidget, formEnctype) <- generateFormPost subjectForm

    subjects <- runDB $ selectList [] []

    defaultLayout $ do
        setTitle "Tracker"
        $(widgetFile "homepage")

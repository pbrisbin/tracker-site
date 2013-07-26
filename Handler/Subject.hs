module Handler.Subject where

import Import

getSubjectR :: SubjectId -> Handler Html
getSubjectR sid = do
    subject <- runDB $ get404 sid

    defaultLayout $ do
        setTitle "Subject"
        $(widgetFile "subject")

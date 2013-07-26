module Handler.CreateSubject where

import Import
import Helpers.Subject

postCreateSubjectR :: Handler Html
postCreateSubjectR = do
    ((res,_), _) <- runFormPost subjectForm

    case res of
        FormSuccess s -> do
            sid <- runDB $ insert s
            redirect $ SubjectR sid

        _ -> undefined

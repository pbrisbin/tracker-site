module Handler.CreateSnapshots where

import Import
import Data.Time (getCurrentTime)
import Control.Monad (forM_)
import Tracker.Value
import qualified Data.Text as T

postCreateSnapshotsR :: Handler Html
postCreateSnapshotsR = do
    subjects <- runDB $ selectList [] []

    now <- liftIO $ getCurrentTime

    forM_ subjects $ \(Entity sid s) -> do
        mvalue <- liftIO $ getValue (T.unpack $ subjectUrl s) (T.unpack $ subjectSelector s)

        case mvalue of
            Just value -> do
                _ <- runDB $ insert (Snapshot sid now (T.pack value))

                return ()

            _ -> return ()

    defaultLayout $ [whamlet|OK|]

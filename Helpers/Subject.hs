module Helpers.Subject where

import Import

subjectForm :: Form Subject
subjectForm = renderBootstrap $ Subject
    <$> areq textField "URL" Nothing
    <*> areq textField "Selector" Nothing

module Utils 
     ( videoSelect
     , pdfSelect
     , pictureSelect
     , restartXMonad
     , roleName ) where

import XMonad
import XMonad.Actions.TopicSpace

import Config

videoSelect :: X ()
videoSelect = spawn "mplayer \"$(zenity --file-selection --title=\"Select a video\" --filename=$HOME/video/)\""

pdfSelect :: X ()
pdfSelect = spawn "llpp $(zenity --file-selection --title=\"Select a pdf\" --filename=$HOME/doc/pdf/)"

pictureSelect :: X ()
pictureSelect = spawn "feh \"$(zenity --file-selection --title=\"Select a Picture\" --filename=$HOME/images/walls/)\""

roleName :: Query String
roleName = stringProperty "WM_WINDOW_ROLE"

restartXMonad :: X ()
restartXMonad = spawn "pkill dzen2; xmonad --recompile; xmonad --restart"

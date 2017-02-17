module Config 
     ( homeDir
     , myScripts
     , myIconDir
     , myNotesFile
     , myWindowSpacing
     , myStatusBar
     , myConky
     , username
     , myFont
     , myXPConfig
     , defaultFG
     , defaultBG
     , colorBlk1
     , colorBlk2
     , colorRed1
     , colorRed2
     , colorGrn1
     , colorGrn2
     , colorYlw1
     , colorYlw2
     , colorBlu1
     , colorBlu2
     , colorMag1
     , colorMag2
     , colorCyn1
     , colorCyn2
     , colorWht1
     , colorWht2
     , norBorder
     , focBorder
     , myTerminal
     , myFocusFollowsMouse
     , myClickJustFocuses
     , myBorderWidth
     , myModMask ) where

import XMonad

import XMonad.Prompt

username 		= "tyler"
homeDir         = "/home/" ++ username ++ "/"
myScripts       = homeDir ++ "bin/"
myIconDir		= homeDir ++ "images/icons"
myNotesFile 	= homeDir ++ "doc/txt/TODO"

myStatusBar = "dzen2 -x '0' -y '0' -w '960' -h '16' -ta 'l' -fn " ++ myFont ++ " -fg " ++ defaultFG ++ " -bg " ++ defaultBG
myConky     = "conky --config=\"/home/tyler/.xmonad/conkyrc\" | dzen2 -x '960' -y '0' -w '960' -h '16' -ta 'r' -fn " ++ myFont ++ " -fg " ++ defaultFG ++ " -bg " ++ defaultBG

myTerminal = "urxvt"
myFocusFollowsMouse = True
myClickJustFocuses  = True

myBorderWidth :: Dimension
myBorderWidth = 1

myWindowSpacing :: Int
myWindowSpacing = 2

myModMask = mod4Mask

myFont = "bitocra13"

----
--Color Values
----
norBorder = defaultBG -- Normal border
focBorder = colorWht1 -- Focused border

defaultFG = "#C6A57B" -- Default foreground
defaultBG = "#151515" -- Default background

colorBlk1 = "#252525" --Black
colorBlk2 = "#404040"
colorWht1 = "#dddddd" --White
colorWht2 = "#707070"
colorRed1 = "#953331" --Red
colorRed2 = "#8D4A48"
colorGrn1 = "#546A29" --Green
colorGrn2 = "#7E9960"
colorYlw1 = "#909737" --Yellow
colorYlw2 = "#9CA554"
colorBlu1 = "#385E6B" --Blue
colorBlu2 = "#5C737C"
colorMag1 = "#7F355E" --Magenta
colorMag2 = "#95618B"
colorCyn1 = "#34676F" --Cyan
colorCyn2 = "#5D858A"

myXPConfig =
	defaultXPConfig
	{ font              = myFont
	, fgColor           = defaultFG
	, bgColor           = defaultBG
	, fgHLight          = colorRed1
	, bgHLight          = defaultBG
	, borderColor       = colorBlk1
	, promptBorderWidth = 1
	, height            = 17
	, position          = Top
	, historySize       = 100
	, historyFilter     = deleteConsecutive
	}

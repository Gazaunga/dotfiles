module Themes
	 ( myTheme
	 , myPP
	 , myTabTheme
	 , myButtonTheme ) where

import XMonad.Layout.Decoration
import XMonad.Prompt
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.DynamicHooks
import XMonad.Util.Loggers
import XMonad.Layout.ImageButtonDecoration
import XMonad.Util.WorkspaceCompare
import XMonad.Util.Image

import Config

--------
----PrettyPrinter Config
--------
myPP :: PP
myPP =
	defaultPP
	{ ppHiddenNoWindows = dzenColor colorBlk1 defaultBG . (\ x -> wsRenamer x )
	, ppHidden          = dzenColor colorWht2 defaultBG . (\ x -> wsRenamer x )
	, ppUrgent          = dzenColor colorRed1 colorRed2 . (\ x -> wsRenamer x )
	, ppCurrent         = dzenColor colorCyn1 colorBlk1 . (\ x -> wsRenamer x)
	, ppVisible         = dzenColor colorWht2 defaultBG . (\ x -> wsRenamer x )
	, ppTitle           = dzenColor colorGrn1 defaultBG . shorten 50 . pad
	, ppLayout          = dzenColor colorGrn1 defaultBG . (\ x -> layoutRenamer x )
	, ppWsSep           = "^fg(" ++ colorBlk1 ++ ")^r(1x16)^fg()"
	, ppSep             = " ^fg(" ++ colorBlk1 ++ ")^r(2x2)^fg() "
	, ppOutput          = putStrLn
	, ppSort            = getSortByIndex
	, ppExtras          = []
	, ppOrder           = \(ws:l:t:xs)   -> [ws,l,t] ++ xs
	}
	where
		-- Replace some workspace names
		wsRenamer name = case name of
			"dash"    -> "^ca(1,xdotool key super+w 1) ^i(/home/tyler/images/icons/8/arch_10x10.xbm) ^fg(" ++ colorBlk1 ++ ")^r(1x16)^fg()^ca()"
			"web"     -> "^ca(1,xdotool key super+w w) webs ^ca()"
			"code"    -> "^ca(1,xdotool key super+w c) code ^ca()"
			"haskell" -> "^ca(1,xdotool key super+w h) haskell ^ca()"
			"grfx"    -> "^ca(1,xdotool key super+w g) grfx ^ca()"
			"video"   -> "^ca(1,xdotool key super+w v) video ^ca()"
			"file"    -> "^ca(1,xdotool key super+w f) file ^ca()"
			"xmonad"  -> "^ca(1,xdotool key super+w x) xmonad ^ca()"
			"script"  -> "^ca(1,xdotool key super+w s) script ^ca()"
			"ruby"    -> "^ca(1,xdotool key super+w r) ruby ^ca()"
			"docs"    -> "^ca(1,xdotool key super+w d) docs ^ca()"
			"pdf"     -> "^ca(1,xdotool key super+w p) pdf ^ca()"
			"music"   -> "^ca(1,xdotool key super+w m) music ^ca()"
			"scrots"  -> "^ca(1,xdotool key super+w q) scrots ^ca()"
			"NSP"     -> ""
			_         -> name

		--Replace some layout names
		layoutRenamer x = case x of
			"DefaultDecoration Spacing 5 Tall"                                                  -> xbmIcon "tall"
			"DefaultDecoration Spacing 5 Tall"                                                  -> xbmIcon "tall"
			"DefaultDecoration Spacing 40 Tall"                                                 -> xbmIcon "tall"
			"DefaultDecoration Spacing 40 Tall"                                                 -> xbmIcon "tall"
			"DefaultDecoration Spacing 80 Tall"                                                 -> xbmIcon "tall"
			"DefaultDecoration Mirror Spacing 5 Tall"                                           -> xbmIcon "mtall"
			"DefaultDecoration Mirror Spacing 40 Tall"                                          -> xbmIcon "mtall"
			"Tabbed Simplest"                                                                   -> xbmIcon "tabbed"
			"DefaultDecoration Full"                                                            -> xbmIcon "full"
			"Full"                                                                              -> xbmIcon "full"
			"DefaultDecoration Grid"                                                            -> xbmIcon "grid"
			"ImageButtonDeco Maximize Minimize DefaultDecoration Float"                         -> xbmIcon "floating"
			"IM ReflectX IM ReflectX Tabbed Simplest"                                           -> xbmIcon "gimpTab"
			"IM ReflectX IM ReflectX DefaultDecoration Spacing 5 Grid"                          -> xbmIcon "gimpGrid"
			"IM ReflectX IM ReflectX DefaultDecoration Spacing 5 ThreeCol"                      -> xbmIcon "gimpThreeCol"
			"IM ReflectX IM ReflectX ImageButtonDeco Maximize Minimize DefaultDecoration Float" -> xbmIcon "gimpFloat"
			"IM ReflectX IM ReflectX DefaultDecoration Spacing 5 Tall"                          -> xbmIcon "gimpTile"
			"IM ReflectX IM ReflectX DefaultDecoration Mirror Spacing 5 Tall"                   -> xbmIcon "gimpMirror"
			"DefaultDecoration Spacing 5 ThreeCol"                                              -> xbmIcon "threeCol"
			"DefaultDecoration Spacing 5 Grid"                                                  -> xbmIcon "grid"
			"DefaultDecoration Spacing 40 ThreeCol"                                             -> xbmIcon "threeCol"
			"DefaultDecoration Spacing 40 Grid"                                                 -> xbmIcon "grid"
			"Spacing 5 Spiral"                                                                  -> xbmIcon "spiral"
			"Spacing 40 Spiral"                                                                 -> xbmIcon "spiral"
			_                                                                                   -> x

		-- Iconizer
		xbmIcon icon = "^ca(1,xdotool key super+space) ^i(" ++ myIconDir ++ "/8/" ++ icon ++".xbm) ^ca()"
		-- Hide the 'NSP' workspace
		noScratchPad ws = if ws == "NSP" then "$" else ws
		-- Create a function to 'tag' loggers
		tagL l = onLogger $ wrap (l ++ ": ") ""
		--Create and tag a volume logger
		lVol   = logCmd "pamixer --get-volume"
		logVol = tagL "^i(/home/tyler/images/icons/8/spkr_01.xbm)" lVol

--------
----Theme Config
--------
myTheme :: Theme
myTheme =
	defaultTheme
	{ fontName            = myFont
	, inactiveBorderColor = colorBlk2
	, inactiveColor       = colorBlk1
	, inactiveTextColor   = colorWht2
	, activeBorderColor   = colorBlk2
	, activeColor         = colorBlk2
	, activeTextColor     = colorWht1
	, urgentBorderColor   = colorRed1
	, urgentTextColor     = colorRed2
	, decoHeight          = 18
	}

myTabTheme :: Theme
myTabTheme =
	myTheme
	{ inactiveColor       = colorBlk1
	, inactiveBorderColor = colorBlk2
	, activeBorderColor   = colorBlk2
	}

myButtonTheme :: Theme
myButtonTheme =
	defaultThemeWithImageButtons
	{ fontName            = myFont
	, inactiveBorderColor = colorWht1
	, inactiveColor       = colorBlk1
	, inactiveTextColor   = colorWht2
	, activeBorderColor   = colorWht2
	, activeColor         = colorBlk2
	, activeTextColor     = colorWht1
	, urgentBorderColor   = colorRed1
	, urgentTextColor     = colorRed2
	, decoHeight          = 18
	, windowTitleIcons    = [ (menuButton  , CenterLeft 3)
							, (closeButton , CenterRight 3)
							, (maxiButton  , CenterRight 18)
							, (miniButton  , CenterRight 33)
							]
	}
	where
		convertToBool' :: [Int] -> [Bool]
		convertToBool' = map (\x -> x == 1)
		convertToBool :: [[Int]] -> [[Bool]]
		convertToBool = map convertToBool'
		menuButton' :: [[Int]]
		menuButton' = [[0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,1,1,0,0,1,1,0,0],
					   [0,0,1,0,0,0,0,1,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,1,0,0,0,0,1,0,0],
					   [0,0,1,1,0,0,1,1,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0]]
		menuButton :: [[Bool]]
		menuButton = convertToBool menuButton'
		miniButton' :: [[Int]]
		miniButton' = [[0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,0,0,0,0,0,0,0,0,0],
					   [0,1,1,1,1,1,1,1,1,0],
					   [0,0,0,0,0,0,0,0,0,0]]
		miniButton :: [[Bool]]
		miniButton = convertToBool miniButton'
		maxiButton' :: [[Int]]
		maxiButton' = [[0,0,0,0,0,0,0,0,0,0],
					   [0,1,1,1,1,1,1,1,1,0],
					   [0,1,0,0,0,0,0,0,1,0],
					   [0,1,0,0,0,0,0,0,1,0],
					   [0,1,0,0,0,0,0,0,1,0],
					   [0,1,0,0,0,0,0,0,1,0],
					   [0,1,0,0,0,0,0,0,1,0],
					   [0,1,0,0,0,0,0,0,1,0],
					   [0,1,1,1,1,1,1,1,1,0],
					   [0,0,0,0,0,0,0,0,0,0]]
		maxiButton :: [[Bool]]
		maxiButton = convertToBool maxiButton'
		closeButton' :: [[Int]]
		closeButton' = [[0,0,0,0,0,0,0,0,0,0],
					    [0,0,0,0,0,0,0,0,0,0],
					    [0,0,1,0,0,0,0,1,0,0],
					    [0,0,0,1,0,0,1,0,0,0],
					    [0,0,0,0,1,1,0,0,0,0],
					    [0,0,0,0,1,1,0,0,0,0],
					    [0,0,0,1,0,0,1,0,0,0],
					    [0,0,1,0,0,0,0,1,0,0],
					    [0,0,0,0,0,0,0,0,0,0],
					    [0,0,0,0,0,0,0,0,0,0]]
		closeButton :: [[Bool]]
		closeButton = convertToBool closeButton'

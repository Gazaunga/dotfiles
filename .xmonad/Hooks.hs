module Hooks
     ( myStartupHook
     , myLogHook
     , myManageHook
     , myHandleEventHook ) where

import XMonad
import System.IO

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.DynamicHooks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.Minimize
import XMonad.ManageHook

import XMonad.Actions.CopyWindow
import XMonad.Layout.LayoutModifier

import qualified XMonad.StackSet as W

import Themes
import Topics
import Scratch


-- Runs on WM startup
myStartupHook :: X ()
myStartupHook = do
	ewmhDesktopsStartup

myHandleEventHook = minimizeEventHook


-- dzen, ewmh & fading windows
myLogHook :: Handle -> X ()
myLogHook h =  do
	myStatusBarLogHook h
	--myFadeInactiveLogHook
	ewmhDesktopsLogHook
	return ()

-- dzen log hook
myStatusBarLogHook :: Handle -> X()
myStatusBarLogHook h = dynamicLogWithPP $ myPP
	{ ppOutput = System.IO.hPutStrLn h }

-- 0 is transparent and 1 is fully opaque
-- Inactive windows are going to use this value to control their transparency
-- must have compton or similar running
myFadeInactiveLogHook :: X ()
myFadeInactiveLogHook = fadeInactiveLogHook fadeAmount
	where
		fadeAmount = 0.70


--------
----ManageHook Config
--------
myManageHook :: ManageHook
myManageHook =
	(composeAll . concat $
	[ [ className =? x                  --> doLayoutToGimp | x <- gimp ]
	, [ className =? x                  --> doCenterFloat' | x <- floats ]
	, [ appName   =? "bash"             --> doCenterFloat' ]
	, [ title     =? x                  --> doCenterFloatToAll | x <- urgent ]
	, [ isDialog                        --> doCenterFloat' ]
	, [ className =? "Zenity"           --> ask >>= doF . W.sink ]
	, [ className =? x 					--> doLayoutToGame | x <- games ]
	, [ myNSManageHook myScratchPads ]
	])
	where
		-- Important windows get floated to the center of ALL workspaces
		urgent = []
		-- Floats get floated to the center of the current workspace
		floats    = ["Xmessage"]
		-- gimp gets layed out to the 'gimp' workspace''
		gimp      = ["Gimp", "gimp"]
		-- games get layed out to game workspace
		games     = ["net-minecraft-LauncherFrame"]
		
		doMaster = doF W.shiftMaster --append this to all floats so new windows always go on top, regardless of the current focus
		doCenterFloat' = doCenterFloat <+> doMaster
		doFloatAt' x y = doFloatAt x y <+> doMaster
		doSideFloat' p = doSideFloat p <+> doMaster
		doRectFloat' r = doRectFloat r <+> doMaster
		doFullFloat' = doFullFloat <+> doMaster
		doShiftAndGo ws = doF (W.greedyView ws) <+> doShift ws
		doCopyToAll = ask >>= doF . \w -> (\ws -> foldr($) ws (map (copyWindow w) myTopics))
		doCenterFloatToAll = doCopyToAll <+> doCenterFloat'
		doLayoutToGimp = doShiftAndGo "GRFX" <+> (ask >>= doF . W.sink)
		doLayoutToGame = doShiftAndGo "GAME"

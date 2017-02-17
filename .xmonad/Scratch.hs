module Scratch 
	 ( myScratchPads
	 , myNSManageHook ) where

import XMonad
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageHelpers
import XMonad.Util.NamedScratchpad
import XMonad.Util.Scratchpad
import qualified XMonad.StackSet as W

import Utils
import Topics

--------
----Scratchpad Config
--------
myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "web" spawnWeb findWeb manageWeb            -- | Google search
                , NS "terminal" spawnTerm  findTerm  manageTerm  -- | Terminal
                , NS "irb" spawnIrb findIrb manageIrb            -- | IRB
                , NS "ghc" spawnGhc findGhc manageGhc            -- | GHCi
                , NS "volume" spawnVol findVol manageVol         -- | Pavucontrol
                , NS "ncmpcpp" spawnMus findMus manageMus        -- | NCMPCPP
                ]  
	where
		spawnTerm  = "urxvt -name terminal -title terminal"
		findTerm   = resource  =? "terminal"
		manageTerm = customFloating $ W.RationalRect l t w h
			where
				h = 0.60           -- Height
				w = 0.60           -- Width
				t = (1-h)/2        -- Distance from top
				l = (1-w)/2        -- Distance from left
		spawnWeb  = "google-chrome --app=\"http://www.google.com\""
		findWeb   = roleName  =? "pop-up"
		manageWeb = customFloating $ W.RationalRect l t w h
			where
				h = 0.60           -- Height
				w = 0.60           -- Width
				t = (1-h)/2        -- Distance from top
				l = (1-w)/2        -- Distance from left
		spawnIrb  = "urxvt -name irb -title irb -e irb"
		findIrb   = resource =? "irb"
		manageIrb = customFloating $ W.RationalRect l t w h
			where
				h = 0.60           -- Height
				w = 0.60           -- Width
				t = (1-h)/2        -- Distance from top
				l = (1-w)/2        -- Distance from left
		spawnGhc  = "urxvt -name ghc -title ghc -e ghci"
		findGhc   = resource =? "ghc"
		manageGhc = customFloating $ W.RationalRect l t w h
			where
				h = 0.60           -- Height
				w = 0.60           -- Width
				t = (1-h)/2        -- Distance from top
				l = (1-w)/2        -- Distance from left
		spawnVol  = "pavucontrol"
		findVol   = className =? "Pavucontrol"
		manageVol = customFloating $ W.RationalRect l t w h
			where
				h = 0.60           -- Height
				w = 0.60           -- Width
				t = (1-h)/2        -- Distance from top
				l = (1-w)/2        -- Distance from left
		spawnMus  = "urxvt -name ncmpcpp -title ncmpcpp -e ncmpcpp"
		findMus   = resource =? "ncmpcpp"
		manageMus = customFloating $ W.RationalRect l t w h
			where
				h = 0.60           -- Height
				w = 0.60           -- Width
				t = (1-h)/2        -- Distance from top
				l = (1-w)/2        -- Distance from left

myNSManageHook :: NamedScratchpads -> ManageHook
myNSManageHook s =
	namedScratchpadManageHook s
	<+> composeOne
		[ title =? "terminal" -?> (ask >>= \w -> liftX (setOpacity w 0.74) >> idHook)
		, roleName =? "pop-up" -?> (ask >>= \w -> liftX (setOpacity w 0.74) >> idHook)
		, title =? "terminal" -?> (ask >>= \w -> liftX (setOpacity w 0.74) >> idHook)
		, className =? "Pavucontrol" -?> (ask >>= \w -> liftX (setOpacity w 0.74) >> idHook) ]

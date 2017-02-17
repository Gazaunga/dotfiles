module Layouts
     ( myLayoutHook ) where


import XMonad.Layout.ImageButtonDecoration
import XMonad.Layout.DecorationMadness
import XMonad.Layout.LayoutModifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.PerWorkspace
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Decoration
import XMonad.Layout.NoBorders
import XMonad.Layout.Minimize
import XMonad.Layout.Maximize
import XMonad.Layout.Renamed
import XMonad.Layout.Reflect
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout

import XMonad.Hooks.Minimize

import Themes

--------
----Layout Config
--------

myLayoutHook = onWorkspace "grfx"   gimp
	$          onWorkspace "dash"   wide
	$          onWorkspace "web"    web
	$          onWorkspace "scrots" scrots
	$ def
	where
		nmaster = 1
		ratio = 2/3
		delta = 1/100

		grid      = spacing 5 $ Grid                                      -- | Grid with default gaps
		grid'     = spacing 40 $ Grid                                     -- | Grid with 10 pixel gaps
		tiled     = spacing 5 $ Tall nmaster delta ratio                  -- | Tiled with default gaps
		tiled'    = spacing 40 $ Tall nmaster delta ratio                 -- | Tiled with 10 pixel gaps
		threeCol  = spacing 5 $ ThreeColMid 1 (3/100) (1/2)               -- | Three column layout, default gaps
		threeCol' = spacing 40 $ ThreeColMid 1 (3/100) (1/2)              -- | Three Column Layout, 10 pixel gaps
		nbFull    = noBorders $ Full                                      -- | No Borders, Full

		scrot      = spacing 80 $ Tall nmaster delta ratio
		decoScrot  = decorateLayout scrot myTheme

		-- Setting up some preferred layouts
		decoGrid     = decorateLayout grid myTheme
		decoFloat    = imageButtonDeco shrinkText myButtonTheme (maximize (minimize (floatDefault shrinkText myTheme {decoHeight = 0})))
		decoStack    = decorateLayout tiled myTheme
		decoBottom   = decorateLayout (Mirror tiled) myTheme
		decoTabbed   = tabbed shrinkText myTabTheme
		decoThreeCol = decorateLayout threeCol myTheme

		-- Wide border layouts
		-- Setting up some preferred layouts
		decoGrid'     = decorateLayout grid' myTheme
		decoStack'    = decorateLayout tiled' myTheme
		decoBottom'   = decorateLayout (Mirror tiled') myTheme
		decoThreeCol' = decorateLayout threeCol' myTheme

		-- Layouts for "gimp" workspace, no gaps
		gimpFloat  = gimpLayout decoFloat
		gimpTab    = gimpLayout decoTabbed
		gimpGrid   = gimpLayout decoGrid
		gimpTile   = gimpLayout decoStack
		gimpBottom = gimpLayout decoBottom
		gimpCols   = gimpLayout decoThreeCol

		-- Spiral Layout
		goldenRatio         = toRational (2/(1 + sqrt 5 :: Double))
		goldenSpiral 	    = spacing 5 $ spiral goldenRatio
		goldenSpiral'       = spacing 40 $ spiral goldenRatio
		fullGoldenSpiral 	= spiral goldenRatio

		-- Layouts everywhere!!
		def    = decoStack ||| decoBottom ||| decoGrid ||| decoThreeCol ||| decoFloat
		conf   = decoStack ||| decoBottom ||| decoGrid ||| decoThreeCol ||| goldenSpiral ||| decoTabbed
		wide   = decoStack' ||| decoBottom' ||| decoGrid' ||| decoThreeCol' ||| goldenSpiral' ||| decoFloat
		web    = decoStack ||| decoTabbed ||| decoThreeCol
		gimp   = gimpTab ||| gimpGrid ||| gimpCols ||| gimpTile ||| gimpBottom ||| gimpFloat
		scrots = decoScrot

		-- Function to decorate layout 'l' with theme 't'
		decorateLayout l t = decoration shrinkText t DefaultDecoration l
		-- Function to "Gimp-ify" a layout, used for my "gimp" workspace
		gimpLayout l = withIM (0.15) (Role "gimp-toolbox") $ reflectHoriz $ withIM (0.15) (Role "gimp-dock") $ reflectHoriz $ l

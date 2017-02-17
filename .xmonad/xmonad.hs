import XMonad
import Data.Monoid
import System.Exit

-- Util
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.NamedScratchpad
import XMonad.Util.Scratchpad

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicHooks
import XMonad.Hooks.Minimize

-- Actions
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.TopicSpace
import XMonad.Actions.WithAll

-- Layout
import XMonad.Layout.NoBorders

-- 'as' imports
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified Data.Set        as S

-- Custom Modules
import Hooks
import Utils
import Config
import Themes
import Topics as T
import Scratch
import Layouts


------------------------------------------------------------------------------------
---- Keybindings
------------------------------------------------------------------------------------
myKeys :: [(String, X())]
myKeys =
    -- | WM Keybindings
    [ ("M-b"                        , sendMessage ToggleStruts                          )        -- Toggle Struts
    , ("M-S-c"                      , kill                                              )        -- Close focused window
    , ("M-n"                        , refresh                                           )        -- Tell focused window to re-draw itself
    , ("M-<Space>"                  , sendMessage NextLayout                            )        -- Rotate to next available layout algorithm
    , ("M-<Tab>"                    , windows W.focusDown                               )        -- Move focus to next window
    , ("M-S-<Tab>"                  , windows W.focusUp                                 )        -- Move focus to prev window
    , ("M-m"                        , windows W.focusMaster                             )        -- Move focus to master window
    , ("M-<Return>"                 , windows W.swapMaster                              )        -- Swap focused window with master window
    , ("M-h"                        , sendMessage Shrink                                )        -- Shrink the master area
    , ("M-l"                        , sendMessage Expand                                )        -- Expand the master area
    , ("M-t"                        , withFocused $ windows . W.sink                    )        -- Push window back in to tiling
    , ("M-,"                        , sendMessage (IncMasterN 1)                        )        -- Increment number of windows in master area
    , ("M-."                        , sendMessage (IncMasterN (-1))                     )        -- Decrement number of windows in master area
    , ("M-r"                        , spawn "xmonad --recompile"                        )        -- Recompile XMonad
    , ("M-q"                        , restartXMonad                                     )        -- Restart XMonad
    , ("M-S-q"                      , io (exitWith ExitSuccess)                         )        -- Quit XMonad
    -- | Workspace (TopicSpace, DynamicWorkspaces) Bindings
    , ("M-w 1"                      , createOrGoto "dash"                               )        -- | Workspace bindings
    , ("M-w w"                      , createOrGoto "web"                                )        -- | these bindings either
    , ("M-w c"                      , createOrGoto "code"                               )        -- | create the workspace if
    , ("M-w h"                      , createOrGoto "haskell"                            )        -- | it does not exist or
    , ("M-w g"                      , createOrGoto "grfx"                               )        -- | goes to the workspace if
    , ("M-w v"                      , createOrGoto "video"                              )        -- | it does exist.
    , ("M-w f"                      , createOrGoto "file"                               )        -- |
    , ("M-w x"                      , createOrGoto "xmonad"                             )        -- |
    , ("M-w s"                      , createOrGoto "script"                             )        -- |
    , ("M-w r"                      , createOrGoto "ruby"                               )        -- |
    , ("M-w d"                      , createOrGoto "docs"                               )        -- |
    , ("M-w p"                      , createOrGoto "pdf"                                )        -- |
    , ("M-w m"                      , createOrGoto "music"                              )        -- |
    , ("M-w q"                      , createOrGoto "scrots"                             )        -- |
    , ("M-w <Backspace>"            , killAll >> removeWorkspace >> createOrGoto "dash" )        -- | Removes the current workspace
    -- | Program Launching Bindings
    , ("M-S-<Return>"               , spawnShell                                        )        -- Launch a terminal in current workspace directory
    , ("M-p"                        , spawn "dmenu_run"                                 )        -- Launch dmenu
    , ("M-S-p"                      , spawn "gmrun"                                     )        -- Launch gmrun
    , ("M-x w"                      , spawn "google-chrome"                             )        -- Google Chrome
    , ("M-x e"                      , spawnSubl                                         )        -- Sublime Text, in current directory
    , ("M-x f"                      , spawnFile                                         )        -- Launch file man in cureent ws directory
    -- | Scratchpads
    , ("M1-z"                       , scratchTerm                                       )        -- ZSH Scratchpad
    , ("M1-w"                       , scratchWeb                                        )
    , ("M1-r"                       , scratchIrb                                        )
    , ("M1-g"                       , scratchGhc                                        )
    , ("M1-v"                       , scratchVol                                        )
    , ("M1-m"                       , scratchMus                                        )
    -- | Media Keybindings
    , ("<Print>"                    , spawn "scrot "                                    )
    , ("<XF86AudioNext>"            , spawn "mpc next"                                  )
    , ("<XF86AudioPrev>"            , spawn "mpc prev"                                  )
    , ("<XF86AudioStop>"            , spawn "mpc stop"                                  )
    , ("<XF86AudioPlay>"            , spawn "mpc toggle"                                )
    , ("<XF86AudioLowerVolume>"     , spawn (myScripts ++ "dvol -d 1")                  )
    , ("<XF86AudioRaiseVolume>"     , spawn (myScripts ++ "dvol -i 1")                  )
    ] where
        scratchTerm  = namedScratchpadAction myScratchPads "terminal"
        scratchWeb   = namedScratchpadAction myScratchPads "web"
        scratchIrb   = namedScratchpadAction myScratchPads "irb"
        scratchGhc   = namedScratchpadAction myScratchPads "ghc"
        scratchVol   = namedScratchpadAction myScratchPads "volume"
        scratchMus   = namedScratchpadAction myScratchPads "ncmpcpp"


------------------------------------------------------------------------------------
---- Main Function
------------------------------------------------------------------------------------
main = do
    dzen <- spawnPipe myStatusBar
    conky <- spawnPipe myConky
    xmonad $ withUrgencyHook NoUrgencyHook $ ewmh defaultConfig
        { terminal           = myTerminal
        , focusFollowsMouse  = myFocusFollowsMouse
        , clickJustFocuses   = myClickJustFocuses
        , borderWidth        = myBorderWidth
        , modMask            = myModMask
        , workspaces         = ["dash"]
        , normalBorderColor  = norBorder
        , focusedBorderColor = focBorder
        -- hooks, layouts
        , layoutHook         = smartBorders $ avoidStruts $ myLayoutHook
        , manageHook         = myManageHook  <+> manageDocks
        , handleEventHook    = myHandleEventHook <+> ewmhDesktopsEventHook
        , logHook            = myLogHook dzen
        , startupHook        = ewmhDesktopsStartup <+> myStartupHook
        } `additionalKeysP` myKeys

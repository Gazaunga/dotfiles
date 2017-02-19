import XMonad
import qualified Data.Map as M
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

 
myTerminal = "Terminal"
 
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [
    ...
    , ((modMask, xK_b), sendMessage ToggleStruts)
    ...
    , ((modMask .|. shiftMask, xK_q), spawn "xfce4-session-logout")
    ...
    , ((modMask, xK_p), xfrun4)
    ...
    ]
 
main = xmonad defaultConfig
              { manageHook = manageDocks <+> manageHook defaultConfig
              , logHook    = ewmhDesktopsLogHook
              , layoutHook = avoidStruts $ layoutHook defaultConfig
              , handleEventHook = ewmhDesktopsEventHook
              , startupHook = ewmhDesktopsStartup
              , modMask    = mod1Mask
              , keys       = myKeys
              }

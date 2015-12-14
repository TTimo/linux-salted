import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.GroupNavigation
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- TODO: how to show xmobar on both displays?

main = do
  xmproc <- spawnPipe "xmobar /home/timo/.xmonad/xmobarrc"
  xmonad $ ewmh defaultConfig {
    modMask = mod4Mask, 
    terminal = "urxvt",
    manageHook = manageDocks <+> manageHook defaultConfig,
    layoutHook = avoidStruts $ layoutHook defaultConfig,
		-- TODO: can this syntax be cleaned up
    logHook = ( dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc,
                          ppTitle = xmobarColor "green" "" . shorten 50
                        } ) >> historyHook
  }

-- TODO: add this key .. how
myKeys = [ ("M-x", nextMatch History (return True)) ]

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.GroupNavigation
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar /home/timo/.xmonad/xmobarrc"
  xmonad $ ewmh $ defaultConfig {
    modMask = mod4Mask, 
    terminal = "urxvt",
    manageHook = manageDocks <+> manageHook defaultConfig,
    layoutHook = avoidStruts $ layoutHook defaultConfig,
    logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc,
                          ppTitle = xmobarColor "green" "" . shorten 50
                        } >> historyHook
  } `additionalKeysP` myKeys

myKeys = [ ("M-x", nextMatch History (return True)) ]

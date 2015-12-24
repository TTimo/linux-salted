import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.GroupNavigation
import XMonad.Actions.CycleRecentWS
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO

main = do
  -- TODO: use two spawnPipe, make this more haskellish
  xmproc <- spawnPipe "bash -c 'tee >(xmobar -x 1 /home/timo/.xmonad/xmobarrc) | xmobar -x 0 /home/timo/.xmonad/xmobarrc'"
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

-- FIXME: this only flips between the last WindowSet and the current one
-- I may be after cycleWindowSets instead?
-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Actions-CycleRecentWS.html
myKeys = [ ("M-x", nextMatch History (return True)) ]

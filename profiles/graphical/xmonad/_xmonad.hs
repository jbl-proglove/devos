import           Control.Monad                       (liftM2)
import           Data.Monoid                         (Endo)

import           XMonad

import           XMonad.Core                         (Layout, Query,
                                            ScreenDetail, ScreenId,
                                            WorkspaceId, X)

import qualified XMonad.StackSet                     as S (StackSet, greedyView,
                                                            shift)

import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.SetWMName

import           Graphics.X11.ExtraTypes.XF86        (xF86XK_AudioLowerVolume,
                                                      xF86XK_AudioMute,
                                                      xF86XK_AudioRaiseVolume)
import           Graphics.X11.Types                  (KeyMask, KeySym, Window)

import           XMonad.Layout.ResizableTile         (ResizableTall(..), MirrorResize (MirrorShrink, MirrorExpand))
import           XMonad.Layout.MultiToggle
import           XMonad.Layout.MultiToggle.Instances
import           XMonad.Layout.Spacing
import           XMonad.Layout.NoBorders             (smartBorders, noBorders)
import           XMonad.Layout.PerWorkspace          (onWorkspace)
import           XMonad.Layout.Reflect               (reflectHoriz)

import           XMonad.Util.EZConfig                (additionalKeys)
import           XMonad.Util.Cursor
import           XMonad.Util.Run

main = do
  xmobar <- spawnPipe "xmobar /etc/xmobar/xmobarrc"
  xmonad $ docks $ myConfig xmobar

myConfig logHandle = defaultConfig {
    terminal    = "alacritty"
  , modMask     = myModKey
  , startupHook = myAutostart
  , logHook     = myLogHook logHandle
  , layoutHook  = noBorders $ avoidStruts $ mySpacing $ layoutHook defaultConfig
--  , layoutHook  = mySpacing $ avoidStruts $ layoutHook defaultConfig
  , manageHook  = myManageHook
                  <+> manageHook defaultConfig
                  <+> manageDocks
}
  `additionalKeys` myKeys

myLogHook logHandle = dynamicLogWithPP $ xmobarPP {
  ppOutput = hPutStrLn logHandle
}

{-|
The layout hook consists of several parts:
1. smartBorders
2. avoidStruts
3. multiToggle for fullscreen
4. workspace-specific layouts
5. a default layout
myLayout =
  . mkToggle ( NBFULL ?? EOT )
  . onWorkspace "7:im" ( half ||| Mirror half ||| tiled ||| reflectHoriz tiled )
  $ tiled ||| reflectHoriz tiled ||| half ||| Mirror half
    where
      tiled     = ResizableTall nmaster delta ratiot []
      half      = ResizableTall nmaster delta ratioh []
      nmaster   = 1
      ratiot    = 309/500
      ratioh    = 1/2
      delta     = 1/9
-}


mySpacing = spacingRaw False (Border 4 4 4 4) True (Border 4 4 4 4) True

-- Move Programs by X11 Class to specific workspaces on opening
-- TODO rework
myManageHook :: Query
  ( Endo
    ( S.StackSet WorkspaceId (Layout Window) Window ScreenId ScreenDetail )
  )
myManageHook = composeAll
  [ className =? "st-256color" --> viewShift "1:main"
  , className =? "qutebrowser" --> viewShift "1:main"
  , className =? "Gimp"        --> viewShift "2:art"
  , className =? "krita"       --> viewShift "2:art"
  , className =? "qBittorrent" --> viewShift "3:torrent"
  , className =? "PCSX2"       --> viewShift "5:game"
  , className =? "RPCS3"       --> viewShift "5:game"
  , className =? "mpv"         --> viewShift "6:media"
  , className =? "Zathura"     --> viewShift "4:pdf"
  , className =? "Signal"      --> doShift "7:im"
  , className =? "Steam"       --> doFloat
  , className =? "Wine"        --> doFloat
  ]
    where viewShift = doF . liftM2 (.) S.greedyView S.shift

-- TODO is this the "right" way?
-- Set ModKey to the Windows Key
myModKey :: KeyMask
myModKey = mod4Mask

module Topics 
     ( myTopics
     , myTopicConfig
     , spawnSublIn
     , spawnSubl
     , spawnFileIn
     , spawnFile
     , spawnShellIn
     , spawnShell
     , createOrGoto
     , createGoto
     , promptedGoto
     , promptedShift
     ,  ) where

import XMonad
import XMonad.Prompt
import XMonad.Prompt.Workspace
import XMonad.Actions.TopicSpace
import XMonad.Actions.DynamicWorkspaces

import XMonad.Prompt.Input as PI
import qualified XMonad.StackSet as W
import qualified Data.Map as M

import Config
import Utils

------------------------------------------------------------------------------------
------ Topic configuration
------------------------------------------------------------------------------------
myTopics :: [Topic]
myTopics = [ "dash" , "code", "web"
		   , "haskell", "xmonad", "video"
		   , "conf", "script", "ruby", "music"
		   , "docs", "file", "pdf" ]

myTopicConfig :: TopicConfig
myTopicConfig = defaultTopicConfig
	{ topicDirs = M.fromList $ 
		[ ( "dash"    , homeDir                     )
		, ( "conf"    , homeDir ++ "/etc"           )
		, ( "code"    , homeDir ++ "/src/c"         )
		, ( "web"     , homeDir ++ "/down/web"      )
		, ( "haskell" , homeDir ++ "/src/haskell"   )
		, ( "xmonad"  , homeDir ++ "/etc/xmonad"    )
		, ( "video"   , homeDir ++ "/video"         )
		, ( "script"  , homeDir ++ "/bin"           )
		, ( "ruby"    , homeDir ++ "/src/ruby"      )
		, ( "docs"    , homeDir ++ "/doc"           )
		, ( "file"    , homeDir                     )
		, ( "pdf"     , homeDir ++ "/doc/pdf"       )
		, ( "music"   , homeDir ++ "/audio/music"   )
		, ( "scrots"  , homeDir ++ "/images/scrots" )
		]
	, defaultTopicAction = const $ spawn ""
	, defaultTopic       = "dash"
	, topicActions       = M.fromList $
		[ ( "conf"    , spawnShell >> spawnFile >> spawnSubl                        ) -- | A shell, a file manager, and a text editor
		, ( "code"    , spawnShell >*> 2 >> spawnSubl                               ) -- | 2 shells and a text editor
		, ( "web"     , spawn "google-chrome"                                       ) -- | Google Chrome
		, ( "haskell" , spawnShell >> spawn "urxvt -e ghci" >> spawnSubl            ) -- | A shell, ghci, and a text editor
		, ( "grfx"    , spawn "gimp"                                                ) -- | Image editor
		, ( "xmonad"  , spawnShell >> spawnShellIn "/home/tyler/etc/xmonad/lib" >>
						spawnSubl                                                   ) -- | 2 shells and a text editor
		, ( "video"   , videoSelect                                                 ) -- | Video selection prompt
		, ( "script"  , spawnShell >*> 2 >> spawnSubl                               ) -- | 2 shells and a text editor
		, ( "ruby"    , spawnShell >> spawn "urxvt -e irb" >> spawnSubl             ) -- | A shell, irb, and a text editor
		, ( "file"    , spawnFile                                                   ) -- | A file manager, in current directory
		, ( "pdf"     , pdfSelect                                                   ) -- | PDF selection prompt
		, ( "music"   , spawn "urxvt -e ncmpcpp" >>
						spawn "urxvt -e ncmpcpp --screen visualizer"                ) -- | 2 instances of ncmpcpp
		, ( "scrots"  , spawnShell >> pictureSelect >> spawn "urxvt --hold -e alsi" )
		]
	}

------------------------------------------------------------------------------------
------ Functions on workspaces (topics)
------------------------------------------------------------------------------------
goto :: WorkspaceId -> X ()
goto = switchTopic myTopicConfig

shift :: WorkspaceId -> X()
shift = windows . W.shift

spawnSublIn :: Dir -> X ()
spawnSublIn dir = spawn $ "subl -n -a " ++ dir

spawnSubl :: X ()
spawnSubl = currentTopicDir myTopicConfig >>= spawnSublIn

spawnFileIn :: Dir -> X ()
spawnFileIn dir = spawn $ "pcmanfm " ++ dir

spawnFile :: X ()
spawnFile = currentTopicDir myTopicConfig >>= spawnFileIn

spawnShellIn :: Dir -> X ()
spawnShellIn dir = spawn $ "urxvt -cd " ++ dir

spawnShell :: X ()
spawnShell = currentTopicDir myTopicConfig >>= spawnShellIn

promptedGoto :: X ()
promptedGoto = workspacePrompt myXPConfig goto

promptedShift :: X ()
promptedShift = workspacePrompt myXPConfig $ shift

createGoto :: WorkspaceId -> X ()
createGoto w = newWorkspace w >> switchTopic myTopicConfig w

createOrGoto :: WorkspaceId -> X ()
createOrGoto w = do
	exists <- workspaceExist w
	if (not exists)
	then
		createGoto w
	else
		goto w

newWorkspace :: WorkspaceId -> X ()
newWorkspace w = do
	exists <- workspaceExist w
	if (not exists)
	then
		addHiddenWorkspace w
	else
		return ()

workspaceExist :: WorkspaceId -> X Bool
workspaceExist w = do xs <- get
                      return $ workspaceExists w ( windowset xs )

workspaceExists :: WorkspaceId -> W.StackSet WorkspaceId l a s sd -> Bool
workspaceExists w ws = w `elem` map W.tag  (W.workspaces ws)

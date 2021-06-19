ASimpleHaskellWebApp-0.1.0.0: unregistering (local file changes: ASimpleHaskellWebApp.cabal ChangeLog.md README.md app/Main.hs package.yaml src/Lib.hs src/Server.hs)
Building all executables for `ASimpleHaskellWebApp' once. After a successful build of all of them, only specified executables will be rebuilt.
ASimpleHaskellWebApp> configure (lib + exe)
Configuring ASimpleHaskellWebApp-0.1.0.0...
ASimpleHaskellWebApp> build (lib + exe)
Preprocessing library for ASimpleHaskellWebApp-0.1.0.0..
Building library for ASimpleHaskellWebApp-0.1.0.0..
[1 of 3] Compiling Lib
[2 of 3] Compiling Paths_ASimpleHaskellWebApp
[3 of 3] Compiling Server
/Users/tof_/dev/ASimpleHaskellWebApp/src/Server.hs:33:1-20: Splicing declarations
    staticFiles "static"
  ======>
    css_main_css :: StaticRoute
    css_main_css
      = (StaticRoute ((Prelude.map pack) ["css", "main.css"]))
          [(pack "etag", pack "H5Aq1J6S")]
/Users/tof_/dev/ASimpleHaskellWebApp/src/Server.hs:(35,35)-(38,2): Splicing expression
    template-haskell-2.16.0.0:Language.Haskell.TH.Quote.quoteExp
      parseRoutes
      "\n\
      \/        HomeR    GET POST\n\
      \/static  StaticR  Static getStatic\n"
  ======>
    [yesod-core-1.6.20.1:Yesod.Routes.TH.Types.ResourceLeaf
       (((((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Resource "HomeR")
             [])
            ((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Methods Nothing)
               ["GET", "POST"]))
           [])
          True),
     yesod-core-1.6.20.1:Yesod.Routes.TH.Types.ResourceLeaf
       (((((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Resource "StaticR")
             [yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Static "static"])
            ((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Subsite "Static")
               "getStatic"))
           [])
          True)]
/Users/tof_/dev/ASimpleHaskellWebApp/src/Server.hs:(35,1)-(38,2): Splicing declarations
    mkYesod
      "HelloWorld"
      ([yesod-core-1.6.20.1:Yesod.Routes.TH.Types.ResourceLeaf
          (((((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Resource "HomeR")
                [])
               ((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Methods Nothing)
                  ["GET", "POST"]))
              [])
             True),
        yesod-core-1.6.20.1:Yesod.Routes.TH.Types.ResourceLeaf
          (((((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Resource "StaticR")
                [yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Static "static"])
               ((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Subsite "Static")
                  "getStatic"))
              [])
             True)])
  ======>
    instance ParseRoute HelloWorld where
      parseRoute
        = ((\ f_a7qJ x_a7qK -> (f_a7qJ ()) x_a7qK) ::
             (() -> ([Text], [(Text, Text)]) -> Maybe (Route a_a7qL))
             -> ([Text], [(Text, Text)]) -> Maybe (Route a_a7qL))
            helper_a7qI
        where
            helper_a7qI env2626_a7qt req2626_a7qu
              = helper2626_a7qv (fst req2626_a7qu)
              where
                  helper2626_a7qv []
                    = ((((\ _ _ x_a7qx _ -> x_a7qx) (error "mdsGetHandler"))
                          env2626_a7qt)
                         (Just HomeR))
                        req2626_a7qu
                  helper2626_a7qv ((:) "static" restPath_a7qy)
                    = (((((\ _runHandler_a7qB _getSub_a7qC toMaster_a7qD _env_a7qE
                             -> (fmap toMaster_a7qD . parseRoute))
                            (\ _ _ x_a7qF _ -> x_a7qF))
                           (\ sub_a7qG -> getStatic sub_a7qG))
                          (\ sroute_a7qH -> StaticR sroute_a7qH))
                         env2626_a7qt)
                        (((\ p_a7qz (_, q_a7qA) -> (p_a7qz, q_a7qA)) restPath_a7qy)
                           req2626_a7qu)
                  helper2626_a7qv _
                    = ((((\ _ _ x_a7qw _ -> x_a7qw) (error "mds404")) env2626_a7qt)
                         Nothing)
                        req2626_a7qu
    instance RenderRoute HelloWorld where
      data Route HelloWorld
        = HomeR | StaticR (Route Static)
        deriving (Show, Eq, Read)
      renderRoute HomeR = ([], [])
      renderRoute (StaticR sub_a7qe)
        = (\ (a_a7qf, b_a7qg) -> ((pack "static" : a_a7qf), b_a7qg))
            (renderRoute sub_a7qe)
    instance RouteAttrs HelloWorld where
      routeAttrs HomeR {}
        = containers-0.6.2.1:Data.Set.Internal.fromList []
      routeAttrs StaticR {}
        = containers-0.6.2.1:Data.Set.Internal.fromList []
    resourcesHelloWorld ::
      [yesod-core-1.6.20.1:Yesod.Routes.TH.Types.ResourceTree String]
    resourcesHelloWorld
      = [yesod-core-1.6.20.1:Yesod.Routes.TH.Types.ResourceLeaf
           (((((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Resource "HomeR")
                 [])
                ((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Methods Nothing)
                   ["GET", "POST"]))
               [])
              True),
         yesod-core-1.6.20.1:Yesod.Routes.TH.Types.ResourceLeaf
           (((((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Resource "StaticR")
                 [yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Static "static"])
                ((yesod-core-1.6.20.1:Yesod.Routes.TH.Types.Subsite "Static")
                   "getStatic"))
               [])
              True)]
    type Handler = HandlerFor HelloWorld
    type Widget = WidgetFor HelloWorld ()
    instance YesodDispatch HelloWorld where
      yesodDispatch env8172_a7qh req8172_a7qi
        = helper8172_a7qj
            (wai-3.2.3:Network.Wai.Internal.pathInfo req8172_a7qi)
        where
            helper8172_a7qj []
              = case wai-3.2.3:Network.Wai.Internal.requestMethod req8172_a7qi of
                  "GET"
                    -> (((yesodRunner getHomeR) env8172_a7qh) (Just HomeR))
                         req8172_a7qi
                  "POST"
                    -> (((yesodRunner postHomeR) env8172_a7qh) (Just HomeR))
                         req8172_a7qi
                  _ -> (((yesodRunner (Data.Functor.void badMethod)) env8172_a7qh)
                          (Just HomeR))
                         req8172_a7qi
            helper8172_a7qj ((:) "static" restPath_a7qk)
              = (((((\ parentRunner_a7qn getSub_a7qo toParent_a7qp env_a7qq
                       -> yesodSubDispatch
                            yesod-core-1.6.20.1:Yesod.Core.Types.YesodSubRunnerEnv
                              {yesod-core-1.6.20.1:Yesod.Core.Types.ysreParentRunner = parentRunner_a7qn,
                               yesod-core-1.6.20.1:Yesod.Core.Types.ysreGetSub = getSub_a7qo,
                               yesod-core-1.6.20.1:Yesod.Core.Types.ysreToParentRoute = toParent_a7qp,
                               yesod-core-1.6.20.1:Yesod.Core.Types.ysreParentEnv = env_a7qq})
                      yesodRunner)
                     (\ sub_a7qr -> getStatic sub_a7qr))
                    (\ sroute_a7qs -> StaticR sroute_a7qs))
                   env8172_a7qh)
                  (((\ p_a7ql r_a7qm
                       -> r_a7qm {wai-3.2.3:Network.Wai.Internal.pathInfo = p_a7ql})
                      restPath_a7qk)
                     req8172_a7qi)
            helper8172_a7qj _
              = (((yesodRunner (Data.Functor.void notFound)) env8172_a7qh)
                   Nothing)
                  req8172_a7qi
/Users/tof_/dev/ASimpleHaskellWebApp/src/Server.hs:(60,18)-(68,2): Splicing expression
    template-haskell-2.16.0.0:Language.Haskell.TH.Quote.quoteExp
      whamlet
      "\n\
      \            <p> Hello world!\n\
      \            $if (user_id /= \"\")\n\
      \                <p>Welcome #{user_id} !\n\
      \            $else\n\
      \                <form method=post action=@{HomeR} enctype=#{enctype}>\n\
      \                    ^{formWidget}\n\
      \                    <button>Login\n"
  ======>
    do (asWidgetT . toWidget)
         ((blaze-markup-0.8.2.8:Text.Blaze.Internal.preEscapedText . pack)
            "<p> Hello world!</p>
")
       (shakespeare-2.0.25:Text.Hamlet.condH
          [(((/=) user_id) "", 
            do (asWidgetT . toWidget)
                 ((blaze-markup-0.8.2.8:Text.Blaze.Internal.preEscapedText . pack)
                    "<p>Welcome ")
               (asWidgetT . toWidget) (toHtml user_id)
               (asWidgetT . toWidget)
                 ((blaze-markup-0.8.2.8:Text.Blaze.Internal.preEscapedText . pack)
                    " !</p>
"))])
         (Just
            (do (asWidgetT . toWidget)
                  ((blaze-markup-0.8.2.8:Text.Blaze.Internal.preEscapedText . pack)
                     "<form method="post" action="")
                (getUrlRenderParams
                   >>=
                     (\ urender_a806
                        -> (asWidgetT . toWidget)
                             (toHtml ((\ u_a807 -> (urender_a806 u_a807) []) HomeR))))
                (asWidgetT . toWidget)
                  ((blaze-markup-0.8.2.8:Text.Blaze.Internal.preEscapedText . pack)
                     "" enctype="")
                (asWidgetT . toWidget) (toHtml enctype)
                (asWidgetT . toWidget)
                  ((blaze-markup-0.8.2.8:Text.Blaze.Internal.preEscapedText . pack)
                     "">")
                (asWidgetT . toWidget) formWidget
                (asWidgetT . toWidget)
                  ((blaze-markup-0.8.2.8:Text.Blaze.Internal.preEscapedText . pack)
                     "
<button>Login</button>
</form>
")))
Preprocessing executable 'ASimpleHaskellWebApp-exe' for ASimpleHaskellWebApp-0.1.0.0..
Building executable 'ASimpleHaskellWebApp-exe' for ASimpleHaskellWebApp-0.1.0.0..
[1 of 2] Compiling Main
[2 of 2] Compiling Paths_ASimpleHaskellWebApp
Linking .stack-work/dist/x86_64-osx/Cabal-3.2.1.0/build/ASimpleHaskellWebApp-exe/ASimpleHaskellWebApp-exe ...
ASimpleHaskellWebApp> copy/register
Installing library in /Users/tof_/dev/ASimpleHaskellWebApp/.stack-work/install/x86_64-osx/00d5364d5f1fb19be3d3c9e4477ca354bec71d339ad7b1b2710b12e919396c7c/8.10.4/lib/x86_64-osx-ghc-8.10.4/ASimpleHaskellWebApp-0.1.0.0-1zJEvnk9sor43DTNnqdwH5
Installing executable ASimpleHaskellWebApp-exe in /Users/tof_/dev/ASimpleHaskellWebApp/.stack-work/install/x86_64-osx/00d5364d5f1fb19be3d3c9e4477ca354bec71d339ad7b1b2710b12e919396c7c/8.10.4/bin
Registering library for ASimpleHaskellWebApp-0.1.0.0..

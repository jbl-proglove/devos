{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      b4dm4n.nixpkgs-fmt
      #      rust-lang.rust
      jnoortheen.nix-ide
      pkief.material-icon-theme
      #      matklad.rust-analyzer
      ms-python.python
      ms-toolsai.jupyter
      #      ms-vscode.cpptools
      roscop.activefileinstatusbar
      #      nash.awesome-flutter-snippets
      coenraads.bracket-pair-colorizer-2
      dzhavat.css-initial-value
      #      dart-code.dart-code
      #      dart-code.flutter
      #      icrawl.discord-vscode
      #      mikestead.dotenv
      eamodio.gitlens
      #      zignd.html-css-class-completion
      #      mathiasfrohlich.kotlin
      yzhang.markdown-all-in-one
      shd101wyy.markdown-preview-enhanced
      pkief.material-icon-theme
      zhuangtongfa.material-theme
      ibm.output-colorizer
      #      alefragnani.pascal
      #      alefragnani.pascal-formatter
      esbenp.prettier-vscode
      #      jeroen-meijer.pubspec-assist
      ms-python.python
      humao.rest-client
      adpyke.codesnap
      #      msjsdiag.vscode-react-native
      #      dbaeumer.vscode-eslint
      pflannery.vscode-versionlens
      svelte.svelte-vscode
      #      dendron.dendron
      github.vscode-codeql
      tamasfe.even-better-toml
    ];
    userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
      "gitlens.defaultDateFormat" = "H:mm:ss dd.MM.yy";
      "gitlens.hovers.currentLine.over" = "line";
      "gitlens.statusBar.alignment" = "left";
      "gitlens.views.repositories.location" = "scm";
      "editor.fontSize" = 16;
      "editor.tabSize" = 2;
      "git.autofetch" = true;
      "files.exclude" = {
        "**/.classpath" = true;
        "**/.factorypath" = true;
        "**/.project" = true;
        "**/.settings" = true;
        "**/*.exe" = true;
        "**/*.o" = true;
      };
      "breadcrumbs.enabled" = true;
      "editor.fontFamily" = "Iosevka Nerd Font, Consolas, monospace";
      "debug.console.fontFamily" = "Iosevka Term";
      "debug.console.fontSize" = 16;
      "terminal.integrated.fontFamily" = "Iosevka Term";
      "terminal.integrated.fontSize" = 18;
      "editor.suggestSelection" = "first";
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "python.jediEnabled" = false;
      "javascript.validate.enable" = false;
      #      "dart.flutterCreateAndroidLanguage" = "kotlin";
      #      "dart.flutterCreateIOSLanguage" = "swift";
      #      "dart.previewFlutterUiGuides" = true;
      "go.useLanguageServer" = true;
      "editor.fontLigatures" = true;
      "terminal.integrated.shellArgs.windows" = [
        "-nologo"
      ];
      "terminal.integrated.experimentalUseTitleEvent" = true;
      "files.autoSave" = "onWindowChange";
      "workbench.sideBar.location" = "right";
      "python.insidersChannel" = "off";
      #      "pascal.format.indent" = 4;
      #      "pascal.formatter.engine" = "ptop";
      # "pascal.formatter.enginePath" = "C:/FPC/3.0.4/bin/i386-win32/ptop.exe";
      # "pascal.formatter.engineParameters" = "C:/FPC/3.0.4/bin/i386-win32/ptop.cfg";
      "snapcode.transparentBackground" = true;
      #      "dart.flutterAndroidX" = true;
      #      "dart.previewBuildRunnerTasks" = true;
      #      "dart.previewFlutterUiGuidesCustomTracking" = true;
      #      "dart.previewToStringInDebugViews" = true;
      #      "dart.warnWhenEditingFilesOutsideWorkspace" = false;
      #      "sync.gist" = "3b04862294bc90a4dbdc946ae42dfbfd";
      "editor.tabCompletion" = "onlySnippets";
      "nix.enableLanguageServer" = true;
      "oneDarkPro.editorTheme" = "oneDarkPro";
      "oneDarkPro.vivid" = true;
      "oneDarkPro.bold" = true;
      "workbench.colorTheme" = "One Dark Pro";
      "workbench.editor.wrapTabs" = true;
      "workbench.editor.tabSizing" = "fit";
      "workbench.editor.decorations.colors" = true;
      "workbench.editor.decorations.badges" = true;
      "workbench.editor.enablePreviewFromCodeNavigation" = true;
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "[rust]" = {
        "editor.defaultFormatter" = "matklad.rust-analyzer";
      };
      "update.mode" = "none";
    };
    keybindings = [
      {
        key = "alt+f9";
        command = "workbench.action.tasks.build";
      }
      {
        key = "ctrl+shift+b";
        command = "workbench.action.tasks.build";
      }
      {
        key = "ctrl+alt+\\";
        command = "editor.action.goToTypeDefinition";
      }
      {
        key = "ctrl+alt+f";
        command = "explorer.newFolder";
      }
      {
        key = "shift+alt+m";
        command = "workbench.action.tasks.test";
      }
    ];
  };
}

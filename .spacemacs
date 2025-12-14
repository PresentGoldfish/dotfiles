;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;;
;; OPTIMIZED SPACEMACS CONFIGURATION
;; Includes performance improvements, bug fixes, and modern best practices

(defun dotspacemacs/layers ()
"Layer configuration:
This function should only modify configuration layer settings."
(setq-default
 ;; Base distribution to use. This is a layer contained in the directory
 ;; `+distribution'. For now available distributions are `spacemacs-base'
 ;; or `spacemacs'. (default 'spacemacs)
 dotspacemacs-distribution 'spacemacs

 ;; Lazy installation of layers (i.e. layers are installed only when a file
 ;; with a supported type is opened). Possible values are `all', `unused'
 ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
 ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
 ;; lazy install any layer that support lazy installation even the layers
 ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
 ;; installation feature and you have to explicitly list a layer in the
 ;; variable `dotspacemacs-configuration-layers' to install it.
 ;; (default 'unused)
 dotspacemacs-enable-lazy-installation 'unused

 ;; If non-nil then Spacemacs will ask for confirmation before installing
 ;; a layer lazily. (default t)
 dotspacemacs-ask-for-lazy-installation t

 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
 dotspacemacs-configuration-layer-path '()

 ;; List of configuration layers to load.
 dotspacemacs-configuration-layers
 '(
   ;; ----------------------------------------------------------------
   ;; Core layers
   ;; ----------------------------------------------------------------
   better-defaults
   emacs-lisp
   git
   ivy                                ; Alternative to helm (lighter)
   (lsp :variables
        lsp-use-plists t              ; Better performance
        lsp-lens-enable t             ; Show references/implementations
        lsp-headerline-breadcrumb-enable t) ; Navigation breadcrumbs
   markdown
   multiple-cursors
   osx

   ;; Enable org layer with useful features
   (org :variables
        org-enable-github-support t
        org-enable-reveal-js-support t)

   (shell :variables
          shell-default-height 30
          shell-default-position 'bottom)

   spell-checking
   syntax-checking
   auto-completion

   (version-control :variables
                    version-control-diff-tool 'git-gutter  ; or 'diff-hl (default)
                    version-control-diff-side 'left        ; or 'right (default)
                    version-control-global-margin t)        ; Enable globally

   ;; ----------------------------------------------------------------
   ;; Development tools
   ;; ----------------------------------------------------------------
   (docker :variables docker-dockerfile-backend 'lsp)

   ;; ----------------------------------------------------------------
   ;; Languages
   ;; ----------------------------------------------------------------
   yaml
   toml
   html
   ruby
   ruby-on-rails

   ;; JavaScript/TypeScript with optimized settings
   (javascript :variables
               javascript-linter 'eslint
               javascript-backend 'lsp
               js2-mode-show-strict-warnings nil)
   react
   (typescript :variables
               typescript-fmt-on-save t
               typescript-backend 'lsp
               typescript-fmt-tool 'typescript-formatter
               typescript-linter 'eslint)

   ;; ----------------------------------------------------------------
   ;; File management
   ;; ----------------------------------------------------------------
   (treemacs :variables
             treemacs-position 'right
             treemacs-width 35                    ; Slightly narrower
             treemacs-follow-mode t               ; Remove quotes, fix typo
             treemacs-git-mode 'deferred          ; Fixed: was 'deffered
             treemacs-show-cursor t               ; Better visibility
             treemacs-indentation 1))             ; Cleaner look

 ;; List of additional packages that will be installed without being wrapped
 ;; in a layer. Enhanced with useful UI and development packages.
 dotspacemacs-additional-packages '(
                                    ;; AI completion
                                    minuet
                                    plz
                                    dash

                                    ;; Themes and UI
                                    doom-themes
                                    which-key-posframe    ; Better which-key display
                                    company-box           ; Better completion UI
                                    all-the-icons-dired   ; Icons in dired
                                    rainbow-mode)         ; Color preview in CSS/code

 ;; A list of packages that cannot be updated.
 dotspacemacs-frozen-packages '()

 ;; A list of packages that will not be installed and loaded.
 dotspacemacs-excluded-packages '()

 ;; Defines the behaviour of Spacemacs when installing packages.
 ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
 ;; `used-only' installs only explicitly used packages and deletes any unused
 ;; packages as well as their unused dependencies. `used-but-keep-unused'
 ;; installs only the used packages but won't delete unused ones. `all'
 ;; installs *all* packages supported by Spacemacs and never uninstalls them.
 ;; (default is `used-only')
 dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
"Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
;; This setq-default sexp is an exhaustive list of all the supported
;; spacemacs settings.
(setq-default
 ;; Maximum allowed time in seconds to contact an ELPA repository.
 ;; (default 5)
 dotspacemacs-elpa-timeout 5

 ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
 ;; OPTIMIZED: Increased for better performance during startup
 ;; (default '(100000000 0.1))
 dotspacemacs-gc-cons '(800000000 0.1)

 ;; Set `read-process-output-max' when startup finishes.
 ;; OPTIMIZED: Increased to 4MB for better LSP performance
 ;; (default (* 1024 1024))
 dotspacemacs-read-process-output-max (* 4 1024 1024)

 ;; If non-nil then Spacelpa repository is the primary source to install
 ;; a locked version of packages. If nil then Spacemacs will install the
 ;; latest version of packages from MELPA. Spacelpa is currently in
 ;; experimental state please use only for testing purposes.
 ;; (default nil)
 dotspacemacs-use-spacelpa nil

 ;; If non-nil then verify the signature for downloaded Spacelpa archives.
 ;; (default t)
 dotspacemacs-verify-spacelpa-archives t

 ;; If non-nil then spacemacs will check for updates at startup
 ;; when the current branch is not `develop'. Note that checking for
 ;; new versions works via git commands, thus it calls GitHub services
 ;; whenever you start Emacs. (default nil)
 dotspacemacs-check-for-update nil

 ;; If non-nil, a form that evaluates to a package directory. For example, to
 ;; use different package directories for different Emacs versions, set this
 ;; to `emacs-version'. (default 'emacs-version)
 dotspacemacs-elpa-subdirectory 'emacs-version

 ;; One of `vim', `emacs' or `hybrid'.
 ;; `hybrid' is like `vim' except that `insert state' is replaced by the
 ;; `hybrid state' with `emacs' key bindings. The value can also be a list
 ;; with `:variables' keyword (similar to layers). Check the editing styles
 ;; section of the documentation for details on available variables.
 ;; (default 'vim)
 dotspacemacs-editing-style 'vim

 ;; If non-nil show the version string in the Spacemacs buffer. It will
 ;; appear as (spacemacs version)@(emacs version)
 ;; (default t)
 dotspacemacs-startup-buffer-show-version t

 ;; Specify the startup banner. Default value is `official', it displays
 ;; the official spacemacs logo. An integer value is the index of text
 ;; banner, `random' chooses a random text banner in `core/banners'
 ;; directory. A string value must be a path to an image format supported
 ;; by your Emacs build.
 ;; If the value is nil then no banner is displayed. (default 'official)
 dotspacemacs-startup-banner 'official

 ;; Scale factor controls the scaling (size) of the startup banner. Default
 ;; value is `auto' for scaling the logo automatically to fit all buffer
 ;; contents, to a maximum of the full image height and a minimum of 3 line
 ;; heights. If set to a number (int or float) it is used as a constant
 ;; scaling factor for the default logo size.
 dotspacemacs-startup-banner-scale 'auto

 ;; List of items to show in startup buffer or an association list of
 ;; the form `(list-type . list-size)`. If nil then it is disabled.
 ;; Possible values for list-type are:
 ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
 ;; List sizes may be nil, in which case
 ;; `spacemacs-buffer-startup-lists-length' takes effect.
 ;; The exceptional case is `recents-by-project', where list-type must be a
 ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
 ;; number is the project limit and the second the limit on the recent files
 ;; within a project.
 dotspacemacs-startup-lists '((recents . 5)
                              (projects . 7))

 ;; True if the home buffer should respond to resize events. (default t)
 dotspacemacs-startup-buffer-responsive t

 ;; Show numbers before the startup list lines. (default t)
 dotspacemacs-show-startup-list-numbers t

 ;; The minimum delay in seconds between number key presses. (default 0.4)
 dotspacemacs-startup-buffer-multi-digit-delay 0.4

 ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
 ;; This has no effect in terminal or if "nerd-icons" package or the font
 ;; is not installed. (default nil)
 dotspacemacs-startup-buffer-show-icons nil

 ;; Default major mode for a new empty buffer. Possible values are mode
 ;; names such as `text-mode'; and `nil' to use Fundamental mode.
 ;; (default `text-mode')
 dotspacemacs-new-empty-buffer-major-mode 'text-mode

 ;; Default major mode of the scratch buffer (default `text-mode')
 dotspacemacs-scratch-mode 'text-mode

 ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
 ;; *scratch* buffer will be saved and restored automatically.
 dotspacemacs-scratch-buffer-persistent nil

 ;; If non-nil, `kill-buffer' on *scratch* buffer
 ;; will bury it instead of killing.
 dotspacemacs-scratch-buffer-unkillable nil

 ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
 ;; (default nil)
 dotspacemacs-initial-scratch-message nil

 ;; List of themes, the first of the list is loaded when spacemacs starts.
 ;; OPTIMIZED: Reordered by preference with doom-opera first
 dotspacemacs-themes '(doom-zenburn
                       doom-spacegrey
                       doom-opera
                       doom-opera-light
                       spacemacs-dark
                       spacemacs-light
                       doom-earl-grey)

 ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
 ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
 ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
 ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
 ;; refer to the DOCUMENTATION.org for more info on how to create your own
 ;; spaceline theme. Value can be a symbol or list with additional properties.
 ;; (default '(spacemacs :separator wave :separator-scale 1.5))
 dotspacemacs-mode-line-theme '(spacemacs :separator nil :separator-scale 1.5)

 ;; If non-nil the cursor color matches the state color in GUI Emacs.
 ;; (default t)
 dotspacemacs-colorize-cursor-according-to-state t

 ;; Default font or prioritized list of fonts. This setting has no effect when
 ;; running Emacs in terminal. The font set here will be used for default and
 ;; fixed-pitch faces. The `:size' can be specified as
 ;; a non-negative integer (pixel size), or a floating-point (point size).
 ;; Point size is recommended, because it's device independent. (default 10.0)
 dotspacemacs-default-font '("InconsolataGo Nerd Font Propo"
                             :size 15.0
                             :weight normal
                             :width normal)

 ;; MODERNIZED: Updated to use nerd-icons instead of all-the-icons
 dotspacemacs-default-icons-font 'nerd-icons

 ;; The leader key (default "SPC")
 dotspacemacs-leader-key "SPC"

 ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
 ;; (default "SPC")
 dotspacemacs-emacs-command-key "SPC"

 ;; The key used for Vim Ex commands (default ":")
 dotspacemacs-ex-command-key ":"

 ;; The leader key accessible in `emacs state' and `insert state'
 ;; (default "M-m")
 dotspacemacs-emacs-leader-key "M-m"

 ;; Major mode leader key is a shortcut key which is the equivalent of
 ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
 dotspacemacs-major-mode-leader-key ","

 ;; Major mode leader key accessible in `emacs state' and `insert state'.
 ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
 ;; Thus M-RET should work as leader key in both GUI and terminal modes.
 ;; C-M-m also should work in terminal mode, but not in GUI mode.
 dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

 ;; These variables control whether separate commands are bound in the GUI to
 ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
 ;; Setting it to a non-nil value, allows for separate commands under `C-i'
 ;; and TAB or `C-m' and `RET'.
 ;; In the terminal, these pairs are generally indistinguishable, so this only
 ;; works in the GUI. (default nil)
 dotspacemacs-distinguish-gui-tab nil

 ;; Name of the default layout (default "Default")
 dotspacemacs-default-layout-name "Default"

 ;; If non-nil the default layout name is displayed in the mode-line.
 ;; (default nil)
 dotspacemacs-display-default-layout nil

 ;; If non-nil then the last auto saved layouts are resumed automatically upon
 ;; start. (default nil)
 dotspacemacs-auto-resume-layouts nil

 ;; If non-nil, auto-generate layout name when creating new layouts. Only has
 ;; effect when using the "jump to layout by number" commands. (default nil)
 dotspacemacs-auto-generate-layout-names nil

 ;; Size (in MB) above which spacemacs will prompt to open the large file
 ;; literally to avoid performance issues. Opening a file literally means that
 ;; no major mode or minor modes are active. (default is 1)
 dotspacemacs-large-file-size 1

 ;; Location where to auto-save files. Possible values are `original' to
 ;; auto-save the file in-place, `cache' to auto-save the file to another
 ;; file stored in the cache directory and `nil' to disable auto-saving.
 ;; (default 'cache)
 dotspacemacs-auto-save-file-location 'cache

 ;; ENHANCED: Increased rollback slots for better safety
 ;; (default 5)
 dotspacemacs-max-rollback-slots 10

 ;; If non-nil, the paste transient-state is enabled. While enabled, after you
 ;; paste something, pressing `C-j' and `C-k' several times cycles through the
 ;; elements in the `kill-ring'. (default nil)
 dotspacemacs-enable-paste-transient-state nil

 ;; Which-key delay in seconds. The which-key buffer is the popup listing
 ;; the commands bound to the current keystroke sequence. (default 0.4)
 dotspacemacs-which-key-delay 0.4

 ;; Which-key frame position. Possible values are `right', `bottom' and
 ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
 ;; right; if there is insufficient space it displays it at the bottom.
 ;; It is also possible to use a posframe with the following cons cell
 ;; `(posframe . position)' where position can be one of `center',
 ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
 ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
 ;; (default 'bottom)
 dotspacemacs-which-key-position 'bottom

 ;; Control where `switch-to-buffer' displays the buffer. If nil,
 ;; `switch-to-buffer' displays the buffer in the current window even if
 ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
 ;; displays the buffer in a same-purpose window even if the buffer can be
 ;; displayed in the current window. (default nil)
 dotspacemacs-switch-to-buffer-prefers-purpose nil

 ;; Make consecutive tab key presses after commands such as
 ;; `spacemacs/alternate-buffer' (SPC TAB) cycle through previous
 ;; buffers/windows/etc. Please see the option's docstring for more information.
 ;; Set the option to t in order to enable cycling for all current and
 ;; future cycling commands. Alternatively, choose a subset of the currently
 ;; supported commands: '(alternate-buffer alternate-window). (default nil)
 dotspacemacs-enable-cycling nil

 ;; Whether side windows (such as those created by treemacs or neotree)
 ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
 ;; (default t)
 dotspacemacs-maximize-window-keep-side-windows t

 ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
 ;; put the most likely path on the top of `load-path' to reduce walking
 ;; through the whole `load-path'. It's an experimental feature to speedup
 ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
 dotspacemacs-enable-load-hints nil

 ;; OPTIMIZED: Enable package quickstart for faster loading
 ;; (default nil)
 dotspacemacs-enable-package-quickstart t

 ;; If non-nil a progress bar is displayed when spacemacs is loading. This
 ;; may increase the boot time on some systems and emacs builds, set it to
 ;; nil to boost the loading time. (default t)
 dotspacemacs-loading-progress-bar t

 ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
 ;; (Emacs 24.4+ only)
 dotspacemacs-fullscreen-at-startup nil

 ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
 ;; Use to disable fullscreen animations in OSX. (default nil)
 dotspacemacs-fullscreen-use-non-native nil

 ;; If non-nil the frame is maximized when Emacs starts up.
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 ;; (default t) (Emacs 24.4+ only)
 dotspacemacs-maximized-at-startup t

 ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
 ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
 ;; without external boxes. Also disables the internal border. (default nil)
 dotspacemacs-undecorated-at-startup nil

 ;; A value from the range (0..100), in increasing opacity, which describes
 ;; the transparency level of a frame when it's active or selected.
 ;; Transparency can be toggled through `toggle-transparency'. (default 90)
 dotspacemacs-active-transparency 90

 ;; A value from the range (0..100), in increasing opacity, which describes
 ;; the transparency level of a frame when it's inactive or deselected.
 ;; Transparency can be toggled through `toggle-transparency'. (default 90)
 dotspacemacs-inactive-transparency 90

 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame background when it's active or selected. Transparency
 ;; can be toggled through `toggle-background-transparency'. (default 90)
 dotspacemacs-background-transparency 90

 ;; If non-nil show the titles of transient states. (default t)
 dotspacemacs-show-transient-state-title t

 ;; If non-nil show the color guide hint for transient state keys. (default t)
 dotspacemacs-show-transient-state-color-guide t

 ;; If non-nil unicode symbols are displayed in the mode line.
 ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
 ;; the value to quoted `display-graphic-p'. (default t)
 dotspacemacs-mode-line-unicode-symbols t

 ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
 ;; scrolling overrides the default behavior of Emacs which recenters point
 ;; when it reaches the top or bottom of the screen. (default t)
 dotspacemacs-smooth-scrolling t

 ;; Show the scroll bar while scrolling. The auto hide time can be configured
 ;; by setting this variable to a number. (default t)
 dotspacemacs-scroll-bar-while-scrolling t

 ;; IMPROVED: Better line numbers configuration
 ;; Control line numbers activation with selective disabling for certain modes
 dotspacemacs-line-numbers '(:relative nil
                                       :visual nil
                                       :disabled-for-modes dired-mode
                                       doc-view-mode
                                       markdown-mode
                                       pdf-view-mode
                                       :size-limit-kb 1000)

 ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
 ;; (default 'evil)
 dotspacemacs-folding-method 'evil

 ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
 ;; `smartparens-strict-mode' will be enabled in programming modes.
 ;; (default nil)
 dotspacemacs-smartparens-strict-mode nil

 ;; If non-nil smartparens-mode will be enabled in programming modes.
 ;; (default t)
 dotspacemacs-activate-smartparens-mode t

 ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
 ;; over any automatically added closing parenthesis, bracket, quote, etc...
 ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
 dotspacemacs-smart-closing-parenthesis nil

 ;; Select a scope to highlight delimiters. Possible values are `any',
 ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
 ;; emphasis the current one). (default 'all)
 dotspacemacs-highlight-delimiters 'all

 ;; If non-nil, start an Emacs server if one is not already running.
 ;; (default nil)
 dotspacemacs-enable-server nil

 ;; Set the emacs server socket location.
 ;; If nil, uses whatever the Emacs default is, otherwise a directory path
 ;; like \"~/.emacs.d/server\". It has no effect if
 ;; `dotspacemacs-enable-server' is nil.
 ;; (default nil)
 dotspacemacs-server-socket-dir nil

 ;; If non-nil, advise quit functions to keep server open when quitting.
 ;; (default nil)
 dotspacemacs-persistent-server nil

 ;; List of search tool executable names. Spacemacs uses the first installed
 ;; tool of the list. Supported tools are `rg', `ag', `ack' and `grep'.
 ;; (default '("rg" "ag" "ack" "grep"))
 dotspacemacs-search-tools '("rg" "ag" "ack" "grep")

 ;; The backend used for undo/redo functionality. Possible values are
 ;; `undo-redo', `undo-fu' and `undo-tree' see also `evil-undo-system'.
 ;; Note that saved undo history does not get transferred when changing
 ;; your undo system from or to undo-tree. (default `undo-redo')"
 dotspacemacs-undo-system 'undo-redo

 ;; Format specification for setting the frame title.
 ;; %a - the `abbreviated-file-name', or `buffer-name'
 ;; %t - `projectile-project-name'
 ;; %I - `invocation-name'
 ;; %S - `system-name'
 ;; %U - contents of $USER
 ;; %b - buffer name
 ;; %f - visited file name
 ;; %F - frame name
 ;; %s - process status
 ;; %p - percent of buffer above top of window, or Top, Bot or All
 ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
 ;; %m - mode name
 ;; %n - Narrow if appropriate
 ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
 ;; %Z - like %z, but including the end-of-line format
 ;; If nil then Spacemacs uses default `frame-title-format' to avoid
 ;; performance issues, instead of calculating the frame title by
 ;; `spacemacs/title-prepare' all the time.
 ;; (default "%I@%S")
 dotspacemacs-frame-title-format "%I@%S"

 ;; Format specification for setting the icon title format
 ;; (default nil - same as frame-title-format)
 dotspacemacs-icon-title-format nil

 ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
 ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
 ;; (default t)
 dotspacemacs-show-trailing-whitespace t

 ;; Delete whitespace while saving buffer. Possible values are `all'
 ;; to aggressively delete empty line and long sequences of whitespace,
 ;; `trailing' to delete only the whitespace at end of lines, `changed' to
 ;; delete only whitespace for changed lines or `nil' to disable cleanup.
 ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
 ;; which major modes have whitespace cleanup enabled or disabled
 ;; by default.
 ;; (default nil)
 dotspacemacs-whitespace-cleanup nil

 ;; If non-nil activate `clean-aindent-mode' which tries to correct
 ;; virtual indentation of simple modes. This can interfere with mode specific
 ;; indent handling like has been reported for `go-mode'.
 ;; If it does deactivate it here.
 ;; (default t)
 dotspacemacs-use-clean-aindent-mode t

 ;; Accept SPC as y for prompts if non-nil. (default nil)
 dotspacemacs-use-SPC-as-y nil

 ;; If non-nil shift your number row to match the entered keyboard layout
 ;; (only in insert state). Currently supported keyboard layouts are:
 ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
 ;; New layouts can be added in `spacemacs-editing' layer.
 ;; (default nil)
 dotspacemacs-swap-number-row nil

 ;; Either nil or a number of seconds. If non-nil zone out after the specified
 ;; number of seconds. (default nil)
 dotspacemacs-zone-out-when-idle nil

 ;; Run `spacemacs/prettify-org-buffer' when
 ;; visiting README.org files of Spacemacs.
 ;; (default nil)
 dotspacemacs-pretty-docs nil

 ;; If nil the home buffer shows the full path of agenda items
 ;; and todos. If non-nil only the file name is shown.
 dotspacemacs-home-shorten-agenda-source nil

 ;; If non-nil then byte-compile some of Spacemacs files.
 dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
"Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
(spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
"Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")

(defun dotspacemacs/user-config ()
"Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

;; ================================================================
;; DEVELOPMENT ENVIRONMENT SETUP
;; ================================================================

;; Node.js path configuration - more flexible approach
(let ((node-path "~/.local/share/mise/shims/node"))
  (when (file-exists-p (expand-file-name node-path))
    (setq exec-path (append exec-path (list node-path)))))

;; Disable auto-lockfiles for better performance
(setq create-lockfiles nil)

;; ================================================================
;; LANGUAGE-SPECIFIC CONFIGURATIONS
;; ================================================================

;; Consolidated JavaScript/TypeScript configuration
(defun my/setup-js-ts-config ()
  "Configure JavaScript and TypeScript settings."
  (setq-default typescript-indent-level 2
                js2-basic-offset 2
                js-indent-level 2
                css-indent-offset 2
                web-mode-markup-indent-offset 2
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2
                web-mode-attr-indent-offset 2))

(my/setup-js-ts-config)

;; Web-mode improvements
(with-eval-after-load 'web-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

;; Ruby configuration
(setq ruby-insert-encoding-magic-comment nil)

;; ================================================================
;; AI COMPLETION SETUP (MINUET)
;; ================================================================

;; Enhanced Minuet configuration with error handling
(when (require 'minuet nil t)
  ;; Provider: Ollama via OpenAI FIM-compatible completions
  (setq minuet-provider 'openai-fim-compatible)
  (setq minuet-n-completions 1) ;; local LLMs: keep it light
  (setq minuet-context-window 512)

  ;; Ollama configuration
  (plist-put minuet-openai-fim-compatible-options :end-point "http://localhost:11434/v1/completions")
  (plist-put minuet-openai-fim-compatible-options :name "Ollama")
  (plist-put minuet-openai-fim-compatible-options :api-key "TERM") ;; placeholder; Ollama ignores
  (plist-put minuet-openai-fim-compatible-options :model "deepseek-coder-v2:16b")
  (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 32)

  ;; Performance tuning
  (setq minuet-request-timeout 10  ; Shorter timeout for better UX
        minuet-context-window 512
        minuet-n-completions 1
        minuet-auto-suggestion-debounce-delay 0.25
        minuet-auto-suggestion-throttle-delay 0.7)

  ;; Make ghost text clearly visible
  (setq minuet-ghost-text-priority 1001)

  ;; Turn on auto suggestions for programming buffers
  (add-hook 'prog-mode-hook #'minuet-auto-suggestion-mode)

  ;; Handy keys: show/accept ghost text
  (with-eval-after-load 'minuet
    (define-key prog-mode-map (kbd "<tab>") #'minuet-accept-suggestion)
    (define-key prog-mode-map (kbd "C-;") #'minuet-show-suggestion)))

;; ================================================================
;; UI ENHANCEMENTS
;; ================================================================

;; Enable which-key posframe if available
(when (require 'which-key-posframe nil t)
  (which-key-posframe-mode 1))

;; Enable company-box for better completion UI
(when (require 'company-box nil t)
  (add-hook 'company-mode-hook 'company-box-mode))

;; Enable all-the-icons in dired
(when (require 'all-the-icons-dired nil t)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; Enable rainbow-mode for color preview
(when (require 'rainbow-mode nil t)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'scss-mode-hook 'rainbow-mode)
  (add-hook 'sass-mode-hook 'rainbow-mode)))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
"Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-link aggressive-indent alert all-the-icons all-the-icons-dired amx
              auto-compile auto-highlight-symbol auto-yasnippet
              avy-jump-helm-line browse-at-remote bundler centered-cursor-mode
              clean-aindent-mode code-review column-enforce-mode company-box
              company-web counsel counsel-css counsel-projectile devdocs diff-hl
              diminish dired-quick-sort disable-mouse doom-themes dotenv-mode
              drag-stuff dumb-jump eat edit-indirect elisp-def elisp-demos
              elisp-slime-nav emmet-mode emr esh-help eshell-prompt-extras
              eshell-z eval-sexp-fu evil-anzu evil-args evil-cleverparens
              evil-collection evil-easymotion evil-escape evil-evilified-state
              evil-exchange evil-goggles evil-iedit-state evil-indent-plus
              evil-lion evil-lisp-state evil-matchit evil-mc evil-nerd-commenter
              evil-numbers evil-org evil-surround evil-textobj-line evil-tutor
              evil-unimpaired evil-visual-mark-mode evil-visualstar
              expand-region eyebrowse fancy-battery feature-mode flx
              flycheck-elsa flycheck-package flycheck-pos-tip
              flyspell-correct-helm flyspell-correct-ivy frame-local
              fringe-helper gh-md git-gutter git-gutter-fringe git-link
              git-messenger git-modes git-timemachine gitignore-templates gntp
              gnuplot golden-ratio google-translate helm-ag helm-c-yasnippet
              helm-comint helm-company helm-css-scss helm-descbinds helm-ls-git
              helm-lsp helm-make helm-mode-manager helm-org helm-projectile
              helm-purpose helm-swoop helm-xref hide-comnt highlight-indentation
              highlight-numbers highlight-parentheses hl-todo holy-mode
              hungry-delete hybrid-mode impatient-mode indent-guide info+
              inspector ivy ivy-avy ivy-hydra ivy-purpose ivy-xref ivy-yasnippet
              js-doc js2-refactor json-mode json-navigator json-reformat
              launchctl link-hint livid-mode log4e lorem-ipsum lsp-ivy
              lsp-origami lsp-treemacs lsp-ui macrostep markdown-toc minitest
              multi-line multi-term multi-vterm mwim nameless nerd-icons
              nodejs-repl npm-mode open-junk-file org-category-capture
              org-cliplink org-contrib org-download org-mime org-pomodoro
              org-present org-project-capture org-projectile org-re-reveal
              org-rich-yank org-superstar orgit orgit-forge osx-clipboard
              osx-dictionary osx-trash overseer ox-gfm page-break-lines paradox
              password-generator popwin prettier-js projectile-rails pug-mode
              quickrun rainbow-delimiters rainbow-mode restart-emacs
              reveal-in-osx-finder rjsx-mode rspec-mode rubocop rubocopfmt
              ruby-hash-syntax ruby-refactor ruby-test-mode ruby-tools sass-mode
              scss-mode shell-pop slim-mode smeargle space-doc spaceline
              spacemacs-purpose-popwin spacemacs-whitespace-cleanup
              string-edit-at-point string-inflection swiper symbol-overlay symon
              tagedit term-cursor terminal-here toc-org treemacs-evil
              treemacs-icons-dired treemacs-magit treemacs-persp
              treemacs-projectile typescript-mode undo-fu-session unfill
              vi-tilde-fringe volatile-highlights vundo web-beautify web-mode
              wgrep which-key-posframe winum writeroom-mode ws-butler yaml-mode
              yasnippet-snippets zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

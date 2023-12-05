(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
				(url-retrieve-synchronously
				 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
				 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; (setq mouse-wheel-scroll-amount '(1))
;; (setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq mouse-wheel-progressive-speed nil)
(pixel-scroll-precision-mode t)
(setq-default word-wrap -1)
(toggle-truncate-lines 1)
(global-set-key (kbd "<wheel-right>") '(lambda ()
																				 (interactive)
																				 (scroll-left 1)))
(global-set-key (kbd "<wheel-left>") '(lambda ()
																				(interactive)
																				(scroll-right 1)))
;; (global-set-key (kbd "<wheel-down>") 'pixel-scroll-up)
;; (global-set-key (kbd "<wheel-up>") 'pixel-scroll-down)

(setq package-enable-at-startup nil)
(straight-use-package 'use-package)

(prefer-coding-system 'utf-8)
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 16
	    jit-lock-defer-contextually t
	    jit-lock-stealth-nice 0.5)
(setq-default font-lock-multiline t)

(setq inhibit-startup-message t)
;;(global-hl-line-mode 1)
;;(toggle-debug-on-error)

(scroll-bar-mode  -1)
(tool-bar-mode -1)
(tooltip-mode  -1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode 1)
(electric-pair-mode 1)
(setq gc-cons-threshold 5000000000)
(setq posframe-mouse-banish nil)
(setq warning-minimum-level :emergency)

(use-package goto-line-preview
	:straight t
	:ensure t)

(setq backup-directory-alist '(("." . "~/.config/emacs/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 20   ; and how many of the old
      )

;;(setq use-package-always-defer t)
(setq auto-save-default nil)
(setq indent-tabs-mode nil)
(setq-default tab-width 2)

(set-face-attribute 'default nil :font "Iosevka Nerd Font Propo-14")
(set-face-attribute 'mode-line nil :font "DroidSansM Nerd Font Propo-12")
(set-face-attribute 'variable-pitch nil :font "DroidSansM Nerd Font-12")
(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font Propo-14")

(setq-default cursor-type '(bar . 1))
(menu-bar-mode -1)
(cua-mode 1)

;;###-BASIC KEY BINDS-###;;

(use-package vterm
	:straight t
	:ensure t)

(setq vterm-shell "/bin/fish")

(defun split-window-vertically-down-and-create-shell-buffer ()
  "Split the current window and create a shell buffer in the new window."
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (vterm)
  (shrink-window 15)
  (windmove-up)
  )

;; scroll one line at a time (less "jumpy" than defaults)

;; (setq mouse-wheel-scroll-amount '(4 ((shift) . 1)))
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

(setq redisplay-dont-pause t)

(global-set-key (kbd "C-A") 'mark-whole-buffer)
;;(global-set-key (kbd "M-<right>") 'next-buffer)
;;(global-set-key (kbd "M-<left>") 'previous-buffer)
(global-set-key (kbd "M-g") 'goto-line-preview)
(global-set-key (kbd "C-;") 'split-window-vertically-down-and-create-shell-buffer)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defadvice keyboard-escape-quit
    (around keyboard-escape-quit-dont-close-windows activate)
  (let ((buffer-quit-function (lambda () ()))) ad-do-it))

(global-set-key (kbd "C-X C-<up>") 'enlarge-window)
(global-set-key (kbd "C-X C-<down>") 'shrink-window)
(global-set-key (kbd "C-X C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-X C-<left>") 'shrink-window-horizontally)

(global-set-key (kbd "M-q") 'delete-window)

(global-set-key (kbd "C-x C-q") 'delete-other-windows)
(global-set-key (kbd "C-x q") 'kill-buffer-and-window)

(global-set-key (kbd "C-X S-<left>") 'windmove-left)
(global-set-key (kbd "C-X S-<right>") 'windmove-right)
(global-set-key (kbd "C-X S-<up>") 'windmove-up)
(global-set-key (kbd "C-X S-<down>") 'windmove-down)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

(use-package vscode-icon
  :straight t
	:demand t
  :ensure t)

(use-package all-the-icons
  :straight t
	:demand t
  :ensure t
  )

(use-package nerd-icons
  :straight t
	:demand t
  :ensure t
  )

(use-package theme-magic
	:straight t
	:ensure t)

;; (use-package base16-theme
;; 	:straight t
;; 	:ensure t)

;; (use-package nano-theme
;; 	:straight t
;; 	:ensure t)

;; (load-theme 'base16-ocean t)

;; (load-theme 'nano-dark t)
;; (enable-theme 'nano-dark)

;; (use-package timu-spacegrey-theme
;;   :straight t
;;   :ensure t)
;; (load-theme 'timu-spacegrey t)

(use-package modus-themes
	:straight t
	:ensure t
	:config
	(setq modus-themes-italic-constructs t
				modus-themes-bold-constructs t
				modus-themes-mixed-fonts t
				modus-themes-variable-pitch-ui t
				modus-themes-custom-auto-reload t
				modus-themes-prompts 'thin
				modus-themes-completions
				'((matches . (bold underline italic))
					(selection . (regular italic)))
				)
	(setq modus-themes-common-palette-overrides
				'((comment "#648b7e")
					(bg-main "#3e4249")
					(bg-dim "#313640")
					(fg-main "#e9f0f9")
					(fg-alt "#bc9fb1")
					(bg-hover "#606c7f")
					(string "#bc9fb1")
					(bg-mode-line-active "#606c7f")
					(fg-mode-line-active fg-main)
					(border-mode-line-active "#FFFFFF")
					(cursor "#bc9fb1")
					(builtin "#bc9fb1")
					(constant "#8bc9bb")
					(docstring "#63a38e")
					(fnname "#c98b8b")
					(keyword "#9f8bc9")
					(preprocessor "#8b8bc9")
					(type "#606c7f")
					(variable "#c9b08b")
					)
				)
	)

(load-theme 'modus-vivendi-tinted t)
(enable-theme 'modus-vivendi-tinted)

;; (use-package nano-theme
;; 	:straight t
;; 	:ensure t)

;; (load-theme 'nano-dark t)

(unless (daemonp)
  (theme-magic-from-emacs))

(use-package dashboard
	:straight t
	:demand t
  :ensure t
  :config
	(setq dashboard-banner-logo-title "Codin' time")
	(setq dashboard-startup-banner "/home/pine/.config/emacs/banner.png")
	(setq dashboard-center-content t)
	(setq dashboard-items '((recents  . 5)
													(bookmarks . 5)))

	(setq dashboard-item-names '(("Recent Files:" . "Recently opened files:")
															 ("Bookmarks:" . "Your bookmarks:")))

	(setq dashboard-icon-type 'all-the-icons)
	(setq dashboard-set-navigator t)
	(setq dashboard-set-init-info t)
	(setq dashboard-set-footer nil)
	(dashboard-setup-startup-hook))



;;; Git client
(use-package magit
	:straight t
	:ensure t)

(use-package treesit-auto
	:straight t
	:ensure t
	:demand t
	:config
	(global-treesit-auto-mode))

;;; Markdown support

(use-package markdown-mode
	:ensure t)

;; (use-package centaur-tabs
;; 	:after all-the-icons
;; 	:straight t
;; 	:ensure t
;; 	:demand t
;; 	:config
;; 	(setq centaur-tabs-style "wave"
;; 				centaur-tabs-set-modified-marker t
;; 				centaur-tabs-height 32
;; 				centaur-tabs-set-icons t
;; 				centaur-tabs-show-new-tab-button nil
;; 				centaur-tabs-show-navigation-buttons nil
;; 				centaur-tabs-set-bar nil
;; 				centaur-tabs-gray-out-icons 'buffer
;; 				centaur-tabs-show-count nil)
;; 	(centaur-tabs-mode t)

;; 	:bind
;; 	("M-<left>" . centaur-tabs-backward)
;; 	("M-<right>" . centaur-tabs-forward)
;; 	("M-<up>" . centaur-tabs-forward-group)
;; 	("M-<down>" . centaur-tabs-backward-group)
;; 	)

(use-package awesome-tab
	:after all-the-icons
	:straight t
	:ensure t
	:demand t
	:config
	(setq awesome-tab-height 160)
	:bind
	("M-<left>" . awesome-tab-backward)
	("M-<right>" . awesome-tab-forward)
	("M-<up>" . awesome-tab-forward-group)
	("M-<down>" . awesome-tab-backward-group)
	)

(defun awesome-tab-hide-tab (x)
  (let ((name (format "%s" x)))
    (or
     (string-prefix-p "*Messages" name)
     (string-prefix-p "*Async-native-compile-log" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*straight-process" name)
		 (derived-mode-p 'treemacs-mode)
		 (string-prefix-p "*scratch" name)
		 (string-prefix-p " *eldoc" name)
		 (string-prefix-p " *eldoc-box*" name)
		 (string-prefix-p "*vterm*" name)
		 (string-prefix-p " *eldoc-box" name)
     (string-prefix-p "*dashboard" name)
     )))

(awesome-tab-mode t)

(defun org-setup ()
	(org-indent-mode)
	(variable-pitch-mode t)
	(buffer-face-mode -1)
	(auto-fill-mode 0)
	(visual-line-mode))

(straight-use-package '(org :type built-in))
(use-package org
	:ensure t
	:defer t
	:hook (org-mode . org-setup)
	:config
	(setq org-todo-keywords '((sequence "TODO" "WORKING" "DONE")))
	(setq org-todo-keyword-faces '(("TODO" . org-todo)
 																 ("WORKING" . "#b38d46")
 																 ("DONE" . org-done)))
	(setq org-support-shift-select t)
	(setq org-CUA-compatible t)
	(global-set-key (kbd "C-M-<return>") 'org-insert-todo-heading)
	(global-set-key (kbd "C-M-<right>") 'org-indent-item-tree)
	(global-set-key (kbd "C-M-<left>") 'org-outdent-item-tree)
	(setq org-ellipsis ""
 				org-hide-emphasis-markers t)
	(set-face-underline 'org-ellipsis nil))

(add-hook 'org-mode-hook 'flyspell-mode)

(use-package org-modern
	:straight t
	:ensure t)

(with-eval-after-load 'org (global-org-modern-mode))

(use-package org-roam
	:after org
	:straight t
	:ensure t)

(use-package org-roam-ui
	:after org
	:straight t
	:ensure t)

(use-package cmake-ide
	:straight t
	:ensure t
	)

(use-package rtags
	:straight t
	:ensure t
	)
(require 'rtags)
(cmake-ide-setup)

(use-package highlight-indent-guides
	:straight t
	:ensure t
	:hook(prog-mode . highlight-indent-guides-mode)
	:config
	(setq highlight-indent-guides-method 'bitmap
				highlight-indent-guides-bitmap-function 'highlight-indent-guides--bitmap-line
				highlight-indent-guides-auto-character-face-perc 90)
	)


(use-package vertico
	:straight t
	:ensure t
	:init
	(setq vertico-cycle t)
	(setq vertico-resize nil)
	(setq vertico-count 10)
	(vertico-mode)
	(vertico-mouse-mode))

(use-package vertico-posframe
	:straight t
	:ensure t
	:config
	(setq vertico-posframe-border-width 1
				vertico-posframe-height 20
				vertico-posframe-min-height 20))

;; (setq vertico-multiform-commands
;;       '((execute-extended-command
;;          posframe
;;          (vertico-posframe-poshandler . posframe-poshandler-frame-top-center)
;;          (vertico-posframe-fallback-mode . vertico-buffer-mode))
;;         (t posframe)
;; 				(file (:not posframe))
;; 				))

(use-package bm
	:straight t
	:ensure t
	:demand t

	:init
	;; restore on load (even before you require bm)
	(setq bm-restore-repository-on-load t)


	:config
	;; Allow cross-buffer 'next'
	(setq bm-cycle-all-buffers t)

	;; where to store persistant files
	(setq bm-repository-file "~/.config/emacs/bm-repository")

	;; save bookmarks
	(setq-default bm-buffer-persistence t)

	;; Loading the repository from file when on start up.
	(add-hook 'after-init-hook 'bm-repository-load)

	;; Saving bookmarks
	(add-hook 'kill-buffer-hook #'bm-buffer-save)

	;; Saving the repository to file when on exit.
	;; kill-buffer-hook is not called when Emacs is killed, so we
	;; must save all bookmarks first.
	(add-hook 'kill-emacs-hook #'(lambda nil
																 (bm-buffer-save-all)
																 (bm-repository-save)))

	;; The `after-save-hook' is not necessary to use to achieve persistence,
	;; but it makes the bookmark data in repository more in sync with the file
	;; state.
	(add-hook 'after-save-hook #'bm-buffer-save)

	;; Restoring bookmarks
	(add-hook 'find-file-hooks   #'bm-buffer-restore)
	(add-hook 'after-revert-hook #'bm-buffer-restore)

	;; The `after-revert-hook' is not necessary to use to achieve persistence,
	;; but it makes the bookmark data in repository more in sync with the file
	;; state. This hook might cause trouble when using packages
	;; that automatically reverts the buffer (like vc after a check-in).
	;; This can easily be avoided if the package provides a hook that is
	;; called before the buffer is reverted (like `vc-before-checkin-hook').
	;; Then new bookmarks can be saved before the buffer is reverted.
	;; Make sure bookmarks is saved before check-in (and revert-buffer)
	(add-hook 'vc-before-checkin-hook #'bm-buffer-save)


	:bind (("C-<tab>" . bm-next)
				 ("C-`" . bm-previous)
				 ("M-RET" . bm-toggle))
	)

(require 'posframe)
(defun my-posframe-poshandler-frame-top-center (info)
	(cons (/ (- (plist-get info :parent-frame-width)
							(plist-get info :posframe-width))
					 2)
				50))

(setq vertico-multiform-commands '((find-file (:not posframe))
																	 (t posframe
																			(vertico-count . 20)
																			(vertico-posframe-poshandler . my-posframe-poshandler-frame-top-center)
																			(vertico-posframe-parameters . ((left-fringe . 20) (right-fringe . 20)))
																			)))

(vertico-multiform-mode 1)

;; use-package neotree(
;; 	:straight t
;; 	:ensure t
;; 	:config
;; 	(setq neo-theme 'icons)
;; 	)

(use-package treemacs
	:straight t
	:ensure t
	:config
	:config
	(progn
		(setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
					treemacs-deferred-git-apply-delay        0.5
					treemacs-directory-name-transformer      #'identity
					treemacs-display-in-side-window          t
					treemacs-eldoc-display                   'simple
					treemacs-file-event-delay                2000
					treemacs-file-extension-regex            treemacs-last-period-regex-value
					treemacs-file-follow-delay               0.1
					treemacs-file-name-transformer           #'identity
					treemacs-follow-after-init               t
					treemacs-expand-after-init               t
					treemacs-find-workspace-method           'find-for-file-or-pick-first
					treemacs-git-command-pipe                ""
					treemacs-goto-tag-strategy               'refetch-index
					treemacs-header-scroll-indicators        '(nil . "^^^^^^")
					treemacs-hide-dot-git-directory          t
					treemacs-indentation                     2
					treemacs-indentation-string              " "
					treemacs-is-never-other-window           nil
					treemacs-max-git-entries                 5000
					treemacs-missing-project-action          'ask
					treemacs-move-forward-on-expand          t
					treemacs-no-png-images                   nil
					treemacs-no-delete-other-windows         t
					treemacs-project-follow-cleanup          nil
					treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" "~")
					treemacs-position                        'left
					treemacs-read-string-input               'from-child-frame
					treemacs-recenter-distance               0.1
					treemacs-recenter-after-file-follow      nil
					treemacs-recenter-after-tag-follow       nil
					treemacs-recenter-after-project-jump     'always
					treemacs-recenter-after-project-expand   'on-distance
					treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
					treemacs-project-follow-into-home        t
					treemacs-show-cursor                     nil
					treemacs-show-hidden-files               t
					treemacs-silent-filewatch                nil
					treemacs-silent-refresh                  nil
					treemacs-sorting                         'alphabetic-asc
					treemacs-select-when-already-in-treemacs 'move-back
					treemacs-space-between-root-nodes        t
					treemacs-tag-follow-cleanup              t
					treemacs-tag-follow-delay                1.5
					treemacs-text-scale                      nil
					treemacs-user-mode-line-format           nil
					treemacs-user-header-line-format         nil
					treemacs-wide-toggle-iwdth               70
					treemacs-width                           35
					treemacs-width-increment                 1
					treemacs-width-is-initially-locked       t
					treemacs-workspace-switch-cleanup        nil)

		(treemacs-filewatch-mode t)
		(treemacs-fringe-indicator-mode 'always)
		(when treemacs-python-executable
			(treemacs-git-commit-diff-mode t))

		(pcase (cons (not (null (executable-find "git")))
								 (not (null treemacs-python-executable)))
			(`(t . t)
			 (treemacs-git-mode 'deferred))
			(`(t . _)
			 (treemacs-git-mode 'simple)))

		(treemacs-hide-gitignored-files-mode nil))
	:bind
	(:map global-map
				("M-0"      . treemacs-select-window)
				("C-x t e"   . treemacs)
				))

(use-package treemacs-nerd-icons
	:after treemacs
	:straight t
  :config
  (treemacs-load-theme "nerd-icons"))

;; (treemacs)

(use-package vertico-directory
	:after vertico
	:ensure nil
	;; More convenient directory navigation commands
	:bind (:map vertico-map
							("RET" . vertico-directory-enter)
							("M-DEL" . vertico-directory-delete-word)
							("DEL" . vertico-directory-delete-char))
	;; Tidy shadowed file namespixel-scroll-precision-use-momentum
	:hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
	:straight t
	:ensure t
	:demand t
	:init
	;; Configure a custom style dispatcher (see the Consult wiki)
	;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
	;;       orderless-component-separator #'orderless-escapable-split-on-space)
	(setq completion-styles '(orderless basic)
				completion-category-defaults nil
				completion-category-overrides '((file (styles partial-completion)))))

(use-package savehist
	:straight t
	:ensure t
	:init
	(savehist-mode))

(use-package rainbow-delimiters
	:straight t
	:ensure t
	:hook (prog-mode . rainbow-delimiters-mode))

;; (use-package starhugger
;; 	:after company
;; 	:straight (:type git :host github :repo "daanturo/starhugger.el")
;; 	:init
;; 	(setq starhugger-api-token "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")
;; 	;;(starhugger-auto-mode t)
;; 	:config
;; 	;; `starhugger-inline-menu-item' makes a conditional binding that is only active at the inline suggestion start
;; 	(global-set-key (kbd "C-x C-<tab>") 'starhugger-trigger-suggestion)
;; 	(keymap-set starhugger-inlining-mode-map "<tab>" (starhugger-inline-menu-item #'starhugger-accept-suggestion-by-line))
;; 	(keymap-set starhugger-inlining-mode-map "C-x C-<tab>" (starhugger-inline-menu-item #'starhugger-dismiss-suggestion))
;; 	(keymap-set starhugger-inlining-mode-map "M-[" (starhugger-inline-menu-item #'starhugger-show-prev-suggestion))
;; 	(keymap-set starhugger-inlining-mode-map "M-]" (starhugger-inline-menu-item #'starhugger-show-next-suggestion))
;; 	(keymap-set starhugger-inlining-mode-map "M-f" (starhugger-inline-menu-item #'starhugger-accept-suggestion-by-word)))

;; (use-package cmake-ide
;;   :straight t
;;   :ensure t)

;; (use-package lsp-bridge
;;   :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
;; 												 :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
;; 												 :build (:not compile))
;;   :config
;;   (setq lsp-bridge-c-lsp-server "ccls"
;; 				lsp-bridge-python-lsp-server "jedi"
;; 				acm-enable-doc-markdown-render t
;; 				acm-enable-tabnine nil
;; 				acm-enable-yas t
;; 				acm-enable-doc t
;; 				acm-enable-codeium nil
;;         lsp-bridge-signature-show-with-frame t
;; 				lsp-bridge-signature-show-with-frame-position 'top-right
;; 				lsp-bridge-symbols-enable-which-func t
;; 				lsp-bridge-enable-hover-diagnostic t
;; 				acm-enable-quick-access t)
;;   :init
;;   (global-lsp-bridge-mode))

(use-package kurecolor
	:straight t
	:ensure t)

;; (use-package anaconda-mode
;; 	:straight t
;; 	:ensure t
;; 	:config
;; 	(add-hook 'python-mode-hook 'anaconda-mode)
;; 	(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; 	)

(use-package lua-mode
	:straight t
	:ensure t)

;; (use-package dired-sidebar
;;   :straight t
;;   :bind ("C-x t" . dired-sidebar-toggle-sidebar)
;;   :ensure t
;;   :commands (dired-sidebar-toggle-sidebar)
;;   :config
;;   (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
;;   (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

;;   (setq dired-sidebar-follow-file-idle-delay 2)

;;   (setq dired-sidebar-should-follow-file nil)
;;   (setq dired-sidebar-subtree-line-prefix "  -")
;;   (setq dired-sidebar-theme 'vscode)
;;   (setq dired-sidebar-width 25)

;;   (setq dired-sidebar-use-term-integration t)
;;   (setq dired-sidebar-use-custom-font nil)
;;   (setq dired-sidebar-window-fixed nil)
;;   (setq dired-sidebar-no-delete-other-windows t)
;;   :init
;;   (add-hook 'dired-sidebar-mode-hook
;; 	    (lambda ()
;;               (unless (file-remote-p default-directory)
;;                 (auto-revert-mode)))))

;; (dired-sidebar-show-sidebar)

;; (add-hook 'dired-mode 'dired-hide-details-mode)
;; (add-hook 'dired-sidebar-mode-hook (lambda () (display-line-numbers-mode -1)))

(use-package format-all
	:straight t
	:ensure t
	:hook (
				 (prog-mode . format-all-mode)
				 (format-all-mode . format-all-ensure-formatter))
	:config
	(setq format-all-default-formatters '(
																				("Assembly" asmfmt)
																				("C" clang-format)
																				("C#" csharpier)
																				("C++" (astyle  "--style=k&r" "--indent=spaces=2" "-n"))
																				;;("C++" clang-format)
																				("CMake" cmake-format)
																				("CSS" prettier)
																				("Dockerfile" dockfmt)
																				("Emacs Lisp" emacs-lisp)
																				("Fish" fish-indent)
																				("GLSL" clang-format)
																				("Go" gofmt)
																				("GraphQL" prettier)
																				("Haskell" brittany)
																				("HTML" html-tidy)
																				("HTML+EEX" mix-format)
																				("HTML+ERB" erb-format)
																				("Java" clang-format)
																				("JavaScript" prettier)
																				("JSON" prettier)
																				("Kotlin" ktlint)
																				("Lua" lua-fmt)
																				("Markdown" prettier)
																				("OCaml" ocp-indent)
																				("Perl" perltidy)
																				("PHP" prettier)
																				("PureScript" purty)
																				("Python" black)
																				("Ruby" rufo)
																				("Rust" rustfmt)
																				("SCSS" prettier)
																				("Shell" shfmt)
																				("Solidity" prettier)
																				("SQL" sqlformat)
																				("Swift" swiftformat)
																				("TypeScript" prettier)
																				("Vue" prettier)
																				("XML" html-tidy)
																				("YAML" prettier))
				)
	)

(use-package undo-fu
	:straight t
	:ensure t)

(undo-fu-session-global-mode t)

(global-set-key (kbd "C-Z") 'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)

(use-package meow
	:straight t
	:ensure t
	:demand t
	)
(defun meow-setup ()
	(setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
	(meow-motion-overwrite-define-key
	 '("j" . meow-next)
	 '("k" . meow-prev)
	 '("<escape>" . ignore))
	(meow-leader-define-key
	 ;; SPC j/k will run the original command in MOTION state.
	 '("j" . "H-j")
	 '("k" . "H-k")
	 ;; Use SPC (0-9) for digit arguments.
	 '("1" . meow-digit-argument)
	 '("2" . meow-digit-argument)
	 '("3" . meow-digit-argument)
	 '("4" . meow-digit-argument)
	 '("5" . meow-digit-argument)
	 '("6" . meow-digit-argument)
	 '("7" . meow-digit-argument)
	 '("8" . meow-digit-argument)
	 '("9" . meow-digit-argument)
	 '("0" . meow-digit-argument)
	 '("/" . meow-keypad-describe-key)
	 '("?" . meow-cheatsheet))
	(meow-normal-define-key
	 '("0" . meow-expand-0)
	 '("9" . meow-expand-9)
	 '("8" . meow-expand-8)
	 '("7" . meow-expand-7)
	 '("6" . meow-expand-6)
	 '("5" . meow-expand-5)
	 '("4" . meow-expand-4)
	 '("3" . meow-expand-3)
	 '("2" . meow-expand-2)
	 '("1" . meow-expand-1)
	 '("-" . negative-argument)
	 '(";" . meow-reverse)
	 '("," . meow-inner-of-thing)
	 '("." . meow-bounds-of-thing)
	 '("[" . meow-beginning-of-thing)
	 '("]" . meow-end-of-thing)
	 '("a" . meow-append)
	 '("A" . meow-open-below)
	 '("b" . meow-back-word)
	 '("B" . meow-back-symbol)
	 '("c" . meow-change)
	 '("d" . meow-delete)
	 '("D" . meow-backward-delete)
	 '("e" . meow-next-word)
	 '("E" . meow-next-symbol)
	 '("f" . meow-find)
	 '("g" . meow-cancel-selection)
	 '("G" . meow-grab)
	 '("h" . meow-left)
	 '("H" . meow-left-expand)
	 '("i" . meow-insert)
	 '("I" . meow-open-above)
	 '("j" . meow-next)
	 '("J" . meow-next-expand)
	 '("k" . meow-prev)
	 '("K" . meow-prev-expand)
	 '("l" . meow-right)
	 '("L" . meow-right-expand)
	 '("m" . meow-join)
	 '("n" . meow-search)
	 '("o" . meow-block)
	 '("O" . meow-to-block)
	 '("p" . cua-paste)
	 '("q" . meow-quit)
	 '("Q" . goto-line-preview)
	 '("r" . meow-replace)
	 '("R" . meow-swap-grab)
	 '("s" . meow-kill)
	 '("t" . meow-till)
	 '("u" . undo-fu-only-undo)
	 '("U" . undo-fu-only-redo)
	 '("v" . meow-visit)
	 '("w" . meow-mark-word)
	 '("W" . meow-mark-symbol)
	 '("x" . meow-line)
	 '("X" . meow-goto-line)
	 '("y" . clipboard-kill-ring-save)
	 '("Y" . meow-sync-grab)
	 '("z" . meow-pop-selection)
	 '("'" . repeat)
	 '("<escape>" . ignore))
	)
(meow-setup)
(meow-global-mode 1)

(use-package impatient-mode
	:straight t
	:ensure t
	:hook (pine-html-mode . impatient-mode)
	:config
	(add-to-list 'imp-default-user-filters '(pine-html-mode . nil)))

;; (use-package dimmer
;;   :straight t
;;   :ensure t
;;   :config
;;   (dimmer-configure-which-key)
;;   (dimmer-configure-org)
;;   (dimmer-configure-magit)
;;   (setq dimmer-adjustment-mode :foreground)
;;   (setq dimmer-use-colorspace :rgba)
;;   (setq dimmer-fraction 0.2)
;;   (dimmer-mode t))

(use-package focus
	:straight t
	:ensure t
	:init
	(global-set-key (kbd "C-c g") 'focus-mode)
	)

(use-package powerline
	:straight t
	:ensure t)
(powerline-nano-theme)

(define-derived-mode pine-html-mode web-mode "pineHTML")
(add-to-list 'auto-mode-alist '("\\.html\\'" . pine-html-mode))

(define-derived-mode pine-js-mode web-mode "pineJS")
(add-to-list 'auto-mode-alist '("\\.js\\'" . pine-js-mode))

(define-derived-mode pine-css-mode css-mode "pineCSS")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-ts-mode))

(use-package yasnippet
	:straight t
	:ensure t
	:demand t
	:config
	(yas-global-mode 1))

(use-package yasnippet-snippets
	:straight t
	:demand t
	:ensure t)

(setq yas-triggers-in-field nil)

;; (use-package company
;; 	:after eglot
;; 	:straight t
;; 	:ensure t
;; 	:config
;; 	(setq company-backends '((company-capf company-dabbrev)))
;; 	)

;; (add-hook 'after-init-hook 'global-company-mode)

;; (use-package company-quickhelp
;; 	:straight t
;; 	:after company
;; 	:ensure t
;; 	:init
;; 	(company-quickhelp-mode))

(use-package nerd-icons-corfu
	:straight t
	:ensure t)

;; (use-package jedi
;; 	:straight t
;; 	:ensure t)

;; LSP Support
(use-package eglot
	:straight t
	:after corfu
	:ensure t
	:demand t
	:config
	(add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
	(add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
	(add-to-list 'eglot-server-programs '(c-ts-mode . ("clangd")))
	(add-to-list 'eglot-server-programs '(c++-ts-mode . ("clangd")))
	(add-to-list 'eglot-server-programs '(java-mode . ("jdtls" "--stdio")))
	(add-to-list 'eglot-server-programs '(java-mode . ("jdtls" "--stdio")))
	(add-to-list 'eglot-server-programs '(python-ts-mode . ("jedi-language-server")))
	(add-to-list 'eglot-server-programs '(python-mode . ("jedi-language-server")))
	(add-to-list 'eglot-server-programs
							 `(pine-html-mode . ("vscode-html-language-server" "--stdio" )))
	(add-to-list 'eglot-server-programs
							 `(pine-css-mode . ("vscode-css-language-server" "--stdio" )))
	(add-to-list 'eglot-server-programs
							 `(pine-js-mode . ("typescript-language-server" "--stdio" )))
	(add-to-list 'eglot-server-programs
							 `(python-mode . ("jedi-language-server" "--stdio" )))
	:custom
	(eglot-autoshutdown t)
	(eglot-events-buffer-size 10000)
	(eglot-send-changes-idle-time 0)
	(flymake-no-changes-timeout 5)
	:hook
	(python-mode . eglot-ensure)
	(python-ts-mode . eglot-ensure)
	(java-ts-mode . eglot-ensure)
	(java-mode . eglot-ensure)
	(c-mode . eglot-ensure)
	(c++-mode . eglot-ensure)
	(c-ts-mode . eglot-ensure)
	(c++-ts-mode . eglot-ensure)
	(pine-html-mode . eglot-ensure)
	(pine-css-mode . eglot-ensure)
	(pine-js-mode . eglot-ensure)
	)

(use-package codeium
	:straight (:type git :host github :repo "Exafunction/codeium.el")
	:init
	;; use globally
	(add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
	;; or on a hook
	;; (add-hook 'python-mode-hook
	;;     (lambda ()
	;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

	;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
	;; (add-hook 'python-mode-hook
	;;     (lambda ()
	;;         (setq-local completion-at-point-functions
	;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
	;; an async company-backend is coming soon!

	;; codeium-completion-at-point is autoloaded, but you can
	;; optionally set a timer, which might speed up things as the
	;; codeium local language server takes ~0.2s to start up
	(add-hook 'emacs-startup-hook
						(lambda () (run-with-timer 0.1 nil #'codeium-init)))

	:defer t ;; lazy loading, if you want
	:config
	(setq use-dialog-box nil) ;; do not use popup boxes

	;; if you don't want to use customize to save the api-key
	;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
	;; get codeium status in the modeline
	(setq codeium-mode-line-enable
				(lambda (api) (not (memq api '(CancelRequest AcceptCompletion)))))
	;;(add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
	;; alternatively for a more extensive mode-line
	(add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

	;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
	(setq codeium-api-enabled
				(lambda (api)
					(memq api '(GetCompletions CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
	;; you can also set a config for a single buffer like this:
	;; (add-hook 'python-mode-hook
	;;     (lambda ()
	;;         (setq-local codeium/editor_options/tab_size 4)))

	;; You can overwrite all the codeium configs!
	;; for example, we recommend limiting the string sent to codeium for better performance
	(defun my-codeium/document/text ()
		(buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
	;; if you change the text, you should also change the cursor_offset
	;; warning: this is measured by UTF-8 encoded bytes
	(defun my-codeium/document/cursor_offset ()
		(codeium-utf8-byte-length
		 (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
	(setq codeium/document/text 'my-codeium/document/text)
	(setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))
(add-to-list 'completion-at-point-functions #'codeium-completion-at-point)

(defun my-corfu-quit ()
	(interactive)
	(if (minibufferp)
			(keyboard-escape-quit)
		(corfu-quit)))

(use-package corfu
	:demand t
	:straight t
	:ensure t
	:custom
	(corfu-cycle t)
	(corfu-auto t)
	(corfu-auto-delay 0)
	(corfu-auto-prefix 1)
	(corfu-on-exact-match nil)
	(corfu-min-width 1)
	(corfu-max-width 9999)
	(corfu-echo-delay nil)
	(corfu-popupinfo-delay 0.1)
	(corfu-popupinfo-hide nil)
	:init
	(global-corfu-mode)
	(corfu-history-mode)
	(corfu-popupinfo-mode))

(define-key corfu-map [escape] 'my-corfu-quit)

;; for corfu
(use-package cape
	:straight t
	:ensure t)

(setq cape-dabbrev-check-other-buffers nil)

(add-hook 'c++-ts-mode-hook
					(lambda ()
						(yas-activate-extra-mode 'c++-mode)))

(add-hook 'c-ts-mode-hook
					(lambda ()
						(yas-activate-extra-mode 'c-mode)))

(defun my/eglot-capf ()
	(setq-local completion-at-point-functions
							(list (cape-super-capf
										 #'eglot-completion-at-point
										 #'codeium-completion-at-point
										 #'cape-dabbrev
										 (cape-company-to-capf #'company-yasnippet)
										 #'cape-file))))

(setq cape-dabbrev-min-length 1)
(add-hook 'text-mode-hook (lambda () (setq-local completion-at-point-functions (list (cape-super-capf #'cape-dabbrev #'cape-file #'cape-history #'cape-dict)))))

(add-hook 'eglot-managed-mode-hook #'my/eglot-capf)

(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

(use-package eldoc-box
	:straight t
	:ensure t
	:hook (prog-mode . eldoc-box-hover-mode))

(use-package rainbow-delimiters
	:straight t
	:ensure t
	:hook (prog-mode . rainbow-delimiters-mode))

(use-package web-mode
	:straight t
	:ensure t
	:config
	(setq web-mode-enable-auto-pairing t)
	(setq web-mode-enable-auto-indentation t)
	(setq web-mode-enable-auto-opening t)
	(setq web-mode-enable-auto-closing t)
	(setq web-mode-enable-auto-quoting t)
	(setq web-mode-enable-current-element-highlight t)
	(setq web-mode-enable-current-column-highlight nil)
	)

;; (use-package sublimity
;; 	:straight t
;; 	:ensure t
;; 	:init
;; 	(sublimity-mode))

;; (require 'sublimity-scroll)

;; (setq sublimity-scroll-weight 1
;; 			sublimity-scroll-drift-length 1)

;; (use-package fast-scroll
;; 	:straight t
;; 	:ensure t
;; 	:init
;; 	(fast-scroll-config)
;; 	(fast-scroll-mode))

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
	(load custom-file))

(setq use-short-answers t)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(setq truncate-lines t)
(save-place-mode t)
(recentf-mode t)

(defun my-configure-font (frame)
	(set-face-attribute 'default nil :font "Iosevka Nerd Font Propo-14")
	(set-face-attribute 'mode-line nil :font "DroidSansM Nerd Font Propo-12")
	(set-face-attribute 'variable-pitch nil :font "DroidSansM Nerd Font-12")
	(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font Propo-14")
	(run-with-timer 0.1 nil #'theme-magic-from-emacs)
	(theme-magic-export-theme-mode t)
	(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
	;;(remove-hook 'after-make-frame-functions #'my-configure-font)
	)

(add-hook 'server-after-make-frame-hook 'awesome-tab-mode)
(add-hook 'server-after-make-frame-hook 'treemacs--init)
(add-hook 'after-make-frame-functions #'my-configure-font)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("1cd4df5762b3041a09609b5fb85933bb3ae71f298c37ba9e14804737e867faf3" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)

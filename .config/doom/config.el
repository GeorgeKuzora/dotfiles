;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Georgiy Kuzora"
      user-mail-address "rafale87@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 24)
      doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font"))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato) ;; or 'latte, 'macchiato, or 'mocha

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Notes/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; MY CONFIGURATION

;; Display vertical line on column 80
(global-display-fill-column-indicator-mode 1)

;; Enable Evil mode exit Insert mode by 'ii'
(use-package key-chord
        :init
        (setq key-chord-two-keys-delay 0.5)
        (setq key-chord-one-keys-delay 0.5)
        :config
        (key-chord-mode 1))
        (key-chord-define evil-insert-state-map "ii" 'evil-normal-state)
        (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
        (key-chord-define evil-insert-state-map "kk" 'evil-normal-state)

;; Fine undo when in insert mode
(setq evil-want-fine-undo 'fine)

;; Drag and drop selected text with the mouse
(setq mouse-drag-and-drop-region t)

;; Tree-sitter enable globally
(global-tree-sitter-mode 1)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Company CMP enable global
(add-hook 'prog-mode-hook 'global-company-mode) ;'after-init-hook
;; Company-backends settings
(setq company-backends '((company-capf
                          company-dabbrev
                          company-files
                          company-dabbrev-code
                          company-yasnippet)
                         company-files))
(global-set-key (kbd "C-c C-/") #'company-other-backend)
(global-set-key (kbd "C-c y") 'company-yasnippet)
(setq company-global-modes '(not org-mode))
(setq company-global-modes '(not gfm-mode))
(setq company-global-modes '(not markdown-mode))
(setq company-idle-delay 0.3)

;; LSP mode settings
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Dired reuse the same buffer
(setq dired-kill-when-opening-new-dired-buffer t)

;;Beacon mode for not loosing cursor
(beacon-mode 1)

;; Bookmarks additional keybindings
(map! :leader
      (:prefix ("b". "buffer")
       :desc "List bookmarks"                          "L" #'list-bookmarks
       :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))

;; Additional logical ibuffer mappings
(evil-define-key 'normal ibuffer-mode-map
  (kbd "f c") 'ibuffer-filter-by-content
  (kbd "f d") 'ibuffer-filter-by-directory
  (kbd "f f") 'ibuffer-filter-by-filename
  (kbd "f m") 'ibuffer-filter-by-mode
  (kbd "f n") 'ibuffer-filter-by-name
  (kbd "f x") 'ibuffer-filter-disable
  (kbd "g h") 'ibuffer-do-kill-lines
  (kbd "g H") 'ibuffer-update)

;; Making deleted files go to trash can
(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")

;; EVALUATE ELISP EXPRESSIONS logical evlaluation commands
(map! :leader
      (:prefix ("e". "evaluate/ERC/EWW")
       :desc "Evaluate elisp in buffer"  "b" #'eval-buffer
       :desc "Evaluate defun"            "d" #'eval-defun
       :desc "Evaluate elisp expression" "e" #'eval-expression
       :desc "Evaluate last sexpression" "l" #'eval-last-sexp
       :desc "Evaluate elisp in region"  "r" #'eval-region))

;; Large Markdown headers
(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))

;; Global raindow mode. Show collor for writen hex value
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )

;; remove title bar and decorations
(setq default-frame-alist '((undecorated . t)))
(setq initial-frame-alist '((undecorated . t) (fullscreen . maximized)))
(add-to-list 'default-frame-alist '(drag-internal-border . 1))
(add-to-list 'default-frame-alist '(internal-border-width . 5))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Raindow delimeters for all languages
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Treemacs config
(setq doom-themes-treemacs-theme "doom-colors")

;; Python auto-venv config
;; (use-package auto-virtualenv
;;   :ensure t
;;   :init
;;   (use-package pyvenv
;;     :ensure t)
;;   :config
;;   (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
;;   (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)  ;; If using projectile
;;   (add-hook 'window-configuration-change-hook 'auto-virtualenv-set-virtualenv)
;;   (add-hook 'focus-in-hook 'auto-virtualenv-set-virtualenv)
;;   )

;; FOLDING CONFIGURATION
;; Enable hs-minor-mode for code folding
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Popup-kill-ring
(use-package popup-kill-ring
  :ensure t
  :bind ("M-u" . popup-kill-ring))
;; Scroll margin from top and bottom
(custom-set-variables
 '(scroll-conservatively 1000)
 '(scroll-margin 8)
 )
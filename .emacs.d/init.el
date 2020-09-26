;;; init.el --- tadashigaki's custom emacs config

;; Author: <tadashi.akama@gmail.com>
;; Keyword: init

;;; Commentary:

;; 

;;; Code:

;; this enables this running method
;;   emacs -q -l ~/.debug.emacs.d/init.el

;; <leaf-install-code>
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("melpa-stable" . "http://stable.melpa.org/packages/")
                       ("ELPA" . "http://tromey.com/elpa/")
                       ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

;; custom configuration starts here

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left)))
  (leaf transient-dwim
    :ensure t
    :bind (("M-=" . transient-dwim-dispatch))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf paren
  :doc "highlight matching paren"
  :tag "builtin"
  :custom ((show-paren-delay . 0.1))
  :global-minor-mode show-paren-mode)

(leaf startup
  :custom
  ((inhibit-startup-screen . t)
   (inhibit-startup-message . t)
   (inhibit-splash-screen . t)
   (inhibit-startup-echo-area-message . t)
   (initial-scratch-message . nil)
   (tool-bar-mode . nil)
   (menu-bar-mode . nil)
   (scroll-bar-mode . nil)
   (indent-tabs-mode . nil)
   (trauncate-lines . t)
   (tab-width . 4)
   (auto-save-default . nil)
   (auto-save-list-file-prefix . nil)
   (create-lockfiles . nil)
   (make-backup-files . nil))
  :config
  (global-display-line-numbers-mode))

(leaf ivy
  :doc "Incremental Vertical completYon"
  :req "emacs-24.5"
  :tag "matching" "emacs>=24.5"
  :added "2020-09-23"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.5
  :ensure t
  :custom
  (ivy-use-virtual-buffers . t)
  (ivy-count-format . "(%d/%d) ")
  :config
  (ivy-mode 1)
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-c" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x C-r" . counsel-recentf)
  ("C-s" . swiper-isearch)
  ("M-y" . counsel-yank-pop)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("<f2> j" . counsel-set-variable)
  ("C-x b" . ivy-switch-buffer)
  ("C-c v" . ivy-push-view)
  ("C-c V" . ivy-pop-view))

(leaf magit
  :doc "A Git porcelain inside Emacs."
  :req "emacs-25.1" "async-20200113" "dash-20200524" "git-commit-20200516" "transient-20200601" "with-editor-20200522"
  :tag "vc" "tools" "git" "emacs>=25.1"
  :added "2020-09-23"
  :emacs>= 25.1
  :ensure t
  :bind
  ("C-x g" . magit-status))

(leaf flycheck
  :doc "On-the-fly syntax checking"
  :req "dash-2.12.1" "pkg-info-0.4" "let-alist-1.0.4" "seq-1.11" "emacs-24.3"
  :tag "tools" "languages" "convenience" "emacs>=24.3"
  :added "2020-09-24"
  :url "http://www.flycheck.org"
  :emacs>= 24.3
  :ensure t
  :init (global-flycheck-mode))

(leaf doom-themes
  :doc "an opinionated pack of modern color-themes"
  :req "emacs-25.1" "cl-lib-0.5"
  :tag "nova" "faces" "icons" "neotree" "theme" "one" "atom" "blue" "light" "dark" "emacs>=25.1"
  :added "2020-09-25"
  :url "https://github.com/hlissner/emacs-doom-theme"
  :emacs>= 25.1
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(leaf doom-modeline
  :doc "A minimal and modern mode-line"
  :req "emacs-25.1" "all-the-icons-2.2.0" "shrink-path-0.2.0" "dash-2.11.0"
  :tag "mode-line" "faces" "emacs>=25.1"
  :added "2020-09-25"
  :url "https://github.com/seagle0128/doom-modeline"
  :emacs>= 25.1
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-buffer-file-name-style quote truncate-with-project)
           (doom-modeline-icon . t)
           (doom-modeline-major-mode-icon . t)
           (doom-modeline-major-mode-color-icon . t)
           (line-number-mode . 1)
           (column-number-mode . 1)))


(leaf which-key
  :doc "Display available keybindings in popup"
  :req "emacs-24.4"
  :tag "emacs>=24.4"
  :added "2020-09-25"
  :url "https://github.com/justbur/emacs-which-key"
  :emacs>= 24.4
  :ensure t
  :config
  (which-key-mode))

(leaf projectile
  :doc "Manage and navigate projects in Emacs easily"
  :req "emacs-25.1" "pkg-info-0.4"
  :tag "convenience" "project" "emacs>=25.1"
  :added "2020-09-26"
  :url "https://github.com/bbatsov/projectile"
  :emacs>= 25.1
  :ensure t
  :config
  (projectile-mode +1)
  :bind
  ("s-p" . projectile-command-map)
  ("C-c p" . projectile-command-map))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(create-lockfiles nil)
 '(imenu-list-position 'left t)
 '(imenu-list-size 30 t)
 '(indent-tabs-mode nil)
 '(inhibit-splash-screen t)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-message t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(ivy-count-format "(%d/%d) ")
 '(ivy-use-virtual-buffers t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")
     ("ELPA" . "http://tromey.com/elpa/")
     ("org" . "https://orgmode.org/elpa/")))
 '(package-selected-packages
   '(doom-modeline doom doom-themes transient-dwim counsel macrostep leaf-tree leaf-convert ivy eldoc ## racer quickrun helm-ag flycheck rustic which-key neotree projectile magit use-package lsp-mode rust-mode solarized-theme helm))
 '(projectile-mode t nil (projectile))
 '(scroll-bar-mode nil)
 '(show-paren-delay 0.1)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(trauncate-lines t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;; Local Variables:
;; End:

;;; init.el ends here

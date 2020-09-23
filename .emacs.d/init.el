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
             (imenu-list-position . 'left))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf ivy
  :doc "Incremental Vertical completYon"
  :req "emacs-24.5"
  :tag "matching" "emacs>=24.5"
  :added "2020-09-23"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.5
  :ensure t)

(leaf magit
  :doc "A Git porcelain inside Emacs."
  :req "emacs-25.1" "async-20200113" "dash-20200524" "git-commit-20200516" "transient-20200601" "with-editor-20200522"
  :tag "vc" "tools" "git" "emacs>=25.1"
  :added "2020-09-23"
  :emacs>= 25.1
  :ensure t
  :after git-commit with-editor)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(macrostep leaf-tree leaf-convert ivy eldoc ## racer quickrun helm-ag flycheck rustic which-key neotree projectile magit use-package lsp-mode rust-mode solarized-theme helm))
 '(projectile-mode t nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;; Local Variables:

;; indent-tabs-mode: nil
(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4)          ; 4 char wide for TAB
(setq indent-tabs-mode nil) ; force use of spaces

(setq inhibit-splash-screen t) ; hide welcome screen

(menu-bar-mode -1) ; hide menu bar
(tool-bar-mode -1) ; hide tool bar
(toggle-scroll-bar -1)  ; hide scroll bar
(setq initial-scratch-message "") ; hide scratch message

(setq auto-save-default nil) ; not make auto safe file
(setq auto-save-list-file-prefix nil) ; not make auto save list
(setq create-lockfiles nil) ; not make lock file
(setq make-backup-files nil) ; not make backup file

(global-display-line-numbers-mode) ; show line numbers

(setq byte-compile-warnings '(not cl-functions obsolete)) ; skip cl obsolete

;; End:

;;; init.el ends here

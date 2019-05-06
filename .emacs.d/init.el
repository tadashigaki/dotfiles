;;; init.el --- tadashigaki's custom emacs config

;; Author: <tadashi.akama@gmail.com>
;; Keyword: init

;;; Commentary:

;;

;;; Code:
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
     (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
             (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path ".cask")

(require 'cask)
(cask-initialize)

(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq initial-scratch-message "")
(setq inhibit-startup-screen t)

(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(set-scroll-bar-mode nil)

(set-background-color "Black")
(set-foreground-color "LightGray")
(set-cursor-color "Gray")
;; (set-face-attribute 'default nil :family "MeiryoKe_Console" :height 150)
;; (set-face-attribute 'default nil :family "Inconsolata" :height 150)
(set-frame-font "Inconsolata-12")
(set-face-font 'variable-pitch "Inconsolata-12")
(set-frame-parameter (selected-frame) 'alpha '(75 . 50))
(add-to-list 'default-frame-alist '(alpha . (75 . 50)))

(setq default-directory "~/")
(setq command-line-default-directory "~/")

(cua-mode t)
(setq cua-enable-cua-keys nil)
(put 'erase-buffer 'disabled nil)

(windmove-default-keybindings)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(flycheck-disabled-checkers (quote (javascript-jshint javascript-jscs)))
 '(package-selected-packages
   (quote
    (company-terraform neotree web-mode typescript-mode open-junk-file helm-descbinds helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'helm)
(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "C-c ;") 'helm-for-files)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-M-O") 'helm-occur)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(require 'helm-descbinds)
(helm-descbinds-mode)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-c") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(setq recentf-max-saved-items 2000)
(setq recentf-auto-cleanup 'never)
(recentf-mode 1)
(global-set-key (kbd "<f5>") 'quickrun)
(global-unset-key (kbd "<C-down-mouse-1>"))

(require 'org)
(autoload 'org-mode "org-mode"
  "Major mode for editing Org files" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-use-speed-commands t)
(setq org-agenda-files '("~/gtd/work.org"))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq open-junk-file-format "~/junk/%Y%m%d_%H%M%S.")
(global-set-key (kbd "C-x j") 'open-junk-file)

(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(setq typescript-indent-level 2)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$'" . yaml-mode))

(require 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(setq ace-jump-mode-move-keys
      (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
(setq ace-jump-word-mode-use-query-char nil)
(global-set-key (kbd "C-:") 'ace-jump-char-mode)
(global-set-key (kbd "C-;") 'ace-jump-word-mode)
(global-set-key (kbd "C-M-;") 'ace-jump-line-mode);

(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        ))

(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-window t)

(add-hook 'ag-mode-hook '(lambda
                           (require 'wgrep-ag)
                           (setq wgrep-auto-save-buffer t)
                           (setq wgrep-enable-key "r")
                           (wgrep-ag-setup)))

(require 'diminish)
(column-number-mode t)
(line-number-mode t)

(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
    ))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-include-browser-externs nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-highlight-external-variables nil)
(setq js2-include-jslint-globals nil)

(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 120) (height . 100)))

(show-paren-mode t)
(global-hl-line-mode t)

(require 'go-mode)
(require 'company-go)
(add-hook 'go-mode-hook 'company-mode)

(when (require 'multi-term nil t)
  (setq multi-term-program "/bin/sh"))

(provide 'init)
;;; init.el ends here

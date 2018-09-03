(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
     (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
             (normal-top-level-add-subdirs-to-load-path))))))

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
(set-default-font "Inconsolata-12")
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
 '(package-selected-packages
   (quote
    (neotree web-mode typescript-mode open-junk-file helm-descbinds helm))))
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

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(require 'helm-descbinds)
(helm-descbinds-mode)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-c") 'helm-M-x)
(global-set-key (kbd "C-x C-r") 'replace-string)
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

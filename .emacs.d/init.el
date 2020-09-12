;;; init.el --- tadashigaki's custom emacs config

;; Author: <tadashi.akama@gmail.com>
;; Keyword: init

;;; Commentary:

;; 

;;; Code:

;;;
;;; basic configurations
;;;

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

;;;
;;; theme
;;;


(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/")
(load-theme 'solarized-dark t)

;;;
;;; package repositories
;;;

(require 'package)
  
;; HTTP
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
  
(package-initialize)


;;;
;;; use-package
;;;

(eval-when-compile
  (require 'use-package))


;;;
;;; helm
;;;

(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x C-c" . helm-M-x)
         ("C-x C-r" . helm-recentf)))


(provide 'init)
;;; init.el ends here

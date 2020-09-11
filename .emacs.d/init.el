;;; init.el --- tadashigaki's custom emacs config

;; Author: <tadashi.akama@gmail.com>
;; Keyword: init

;;; Commentary:

;; 

;;; Code:
(setq c-basic-offset 4) ; indents 4 chars                                                                                                              
(setq tab-width 4)          ; 4 char wide for TAB
(setq indent-tabs-mode nil) ; force use of spaces

(setq inhibit-splash-screen t) ; hide welcome screen

(menu-bar-mode -1) ; hide menu bar
(tool-bar-mode -1) ; hide tool bar
(toggle-scroll-bar -1)  ; hide scroll bar

(provide 'init)
;;; init.el ends here

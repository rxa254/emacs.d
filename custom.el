;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messages* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 308 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-fill-function nil t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-file "~/.emacs.d/custom.el")
 '(custom-theme-directory "~/.emacs.d/Themes/")
 '(default-frame-alist
    (quote
     ((fringe)
      (right-fringe)
      (left-fringe . 1)
      (internal-border-width . 0)
      (vertical-scroll-bars . right)
      (cursor-type . box)
      (menu-bar-lines . 1)
      (tool-bar-lines . 1)
      (background-toolbar-color . "#000000000000")
      (bottom-toolbar-shadow-color . "#000000000000")
      (top-toolbar-shadow-color . "#ffffffffffff")
      (background-color . "black")
      (background-mode . dark)
      (border-color . "white")
      (cursor-color . "yellow")
      (foreground-color . "white")
      (mouse-color . "white"))))
 '(fringe-indicator-alist
   (quote
    ((continuation nil nil)
     (truncation left-truncation right-truncation)
     (continuation left-continuation right-continuation)
     (overlay-arrow . right-triangle)
     (up . up-arrow)
     (down . down-arrow)
     (top top-left-angle top-right-angle)
     (bottom bottom-left-angle bottom-right-angle top-right-angle top-left-angle)
     (top-bottom left-bracket right-bracket top-right-angle top-left-angle)
     (empty-line . empty-line)
     (unknown . question-mark))) t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(visual-line-mode t t)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(emacs-lisp-mode-default ((t (:height 150 :family "Menlo"))) t)
 '(latex-mode-default ((t (:height 180 :family "Inconsolata")))))


;; Spell checking in Latex
(require 'flymake)

(defun flymake-get-tex-args (file-name)
(list "pdflatex"
(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flymake-mode)

(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

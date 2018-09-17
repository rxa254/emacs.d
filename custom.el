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
 '(package-selected-packages
   (quote
    (uptimes regex-tool osx-location flycheck-ledger ledger-mode origami cask-mode flycheck-package flycheck highlight-quoted macrostep cl-lib-highlight aggressive-indent redshank immortal-scratch hl-sexp auto-compile ipretty lively elisp-slime-nav paredit-everywhere paredit company-anaconda anaconda-mode pip-requirements css-eldoc skewer-less less-css-mode scss-mode sass-mode rainbow-mode yagist whole-line-or-region whitespace-cleanup-mode wgrep unfill undo-tree symbol-overlay switch-window smex session scratch rainbow-delimiters projectile page-break-lines nlinum multiple-cursors move-dup mmm-mode magit-gh-pulls list-unicode-display ivy-historian indent-guide ibuffer-vc highlight-escape-sequences guide-key gitignore-mode github-issues github-clone gitconfig-mode git-timemachine git-messenger git-blamed fullframe fill-column-indicator expand-region exec-path-from-shell disable-mouse diminish default-text-scale counsel company-quickhelp command-log-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmd-to-echo bug-reference-github browse-kill-ring avy anzu alert))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Spell checking in Latex
;;(require 'flymake)

;;(defun flymake-get-tex-args (file-name)
;;(list "pdflatex"
;;(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

;;(add-hook 'LaTeX-mode-hook 'flymake-mode)

(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

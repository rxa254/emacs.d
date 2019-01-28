;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "24.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.4")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(require 'tls)
(push "/usr/local/etc/libressl/cert.pem" gnutls-trustfiles)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;---------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
;;(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
;;(require 'init-osx-keys)
;;(require 'init-gui-frames)
;;(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
(require 'init-smex)
;;(require 'init-ivy)
(require 'init-hippie-expand)
(require 'init-company)
;;(require 'init-windows)
;;(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)

(require 'init-editing-utils)
(require 'init-whitespace)
(require 'init-fci)

;;(require 'init-vc)
;;(require 'init-darcs)
(require 'init-git)
(require 'init-github)

;;(require 'init-projectile)

(require 'init-compile)
;;(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
;;(require 'init-csv)
;;(require 'init-erlang)
;;(require 'init-javascript)
;;(require 'init-php)
;;(require 'init-org)
;;(require 'init-nxml)
;;(require 'init-html)
;;(require 'init-css)
;;(require 'init-haml)
(require 'init-python-mode)
(unless (version<= emacs-version "24.3")
  ;;(require 'init-haskell)
  )
;;(require 'init-elm)
;;(require 'init-ruby-mode)
;;(require 'init-rails)
;;(require 'init-sql)

;;(require 'init-paredit)
;;(require 'init-lisp)
;;(require 'init-slime)
;;(unless (version<= emacs-version "24.2")
;;  (require 'init-clojure)
;;  (require 'init-clojure-cider))
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-misc)

;;(require 'init-folding)
;;(require 'init-dash)
;;(require 'init-ledger)

;; Extra packages which don't require any configuration
;;(require-package 'gnuplot)
;;(require-package 'lua-mode)
;;(require-package 'htmlize)
;;(require-package 'dsvn)

(when *is-a-mac*
  (require-package 'osx-location))
(maybe-require-package 'regex-tool)



;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)


(when (maybe-require-package 'uptimes)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))

(provide 'init)

(desktop-save-mode 0)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;; Melpa

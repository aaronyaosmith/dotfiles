;; Keep track of loading time
(defconst emacs-start-time (current-time))

;; initalize all ELPA packages
(require 'package)
(setq package-user-dir "~/.elpa")
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(let ((elapsed (float-time (time-subtract (current-time)
                                          emacs-start-time))))
  (message "Loaded packages in %.3fs" elapsed))

;; Load other lisp files
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Load use-package, used for loading packages
(require 'use-package)

;; keep customize settings in their own file
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

;; Package-specific settings in orgfile
(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))

;; Load themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Message how long it took to load everything (minus packages)
(let ((elapsed (float-time (time-subtract (current-time)
                                          emacs-start-time))))
  (message "Loading settings...done (%.3fs)" elapsed))


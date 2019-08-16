(setq initial-buffer-choice t)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq-default fill-column 79)

(setq myfont
  (font-spec
  :name "InputMono"
  :style "Light"
  :size 12))
(cond
 ((string-equal system-name "aaron-UX330UAK")
  (set-face-attribute 'default nil :font myfont)))

(load-theme 'gruvbox-dark-medium t)

(use-package ido
:config
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1))

(use-package python-docstring
  :config
  (add-hook 'python-mode-hook (lambda () (python-docstring-mode t))))

(use-package sphinx-doc
  :config
  (add-hook 'python-mode-hook (lambda () (sphinx-doc-mode t))))

(elpy-enable)
(use-package py-autopep8
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package org
  :config
  (setq org-agenda-files '("~/org/agenda"))
  (setq org-startup-indented t)
  (setq org-directory "~/org")
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cb" 'org-switchb)
  (setq org-log-done t)
  (setq org-todo-keywords
    (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
      (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
  (add-hook 'org-mode-hook #'visual-line-mode))

(use-package hideshow-orgmode
  :config
  (global-set-key (kbd "C-c TAB") 'hs-cycle)
  (global-set-key (kbd "C-c C") 'hs-cycle-all)
  (global-set-key (kbd "C-c h") 'hs-fold-all)
  (global-set-key (kbd "C-c s") 'hs-show-all))

(use-package org-journal
  :config
  (setq org-journal-file-format "%Y-%m-%d.org")
  (setq org-journal-time-format "")
  (setq org-journal-time-prefix "")
  (setq org-journal-dir "~/org/journal")
  (setq org-extend-today-until 4))

(use-package org-ref
  :config
  (setq org-ref-bibliography-notes "~/org/refs/refs.org"
  org-ref-default-bibliography '("~/org/refs/refs.bib")
  org-ref-pdf-directory "~/org/refs/pdfs/"))

(use-package interleave)

(use-package org-capture)

(use-package ocp-indent)
(use-package lineker)

(add-hook
 'tuareg-mode-hook
 (lambda ()
   (setq hs-hide-comments-when-hiding-all nil)
   (when (require 'hideshow nil t)
     (unless (assq 'tuareg-mode hs-special-modes-alist)
       (add-to-list
    'hs-special-modes-alist
    `(tuareg-mode
      ,(concat "^" tuareg-definitions-regexp)
      ,tuareg-semicolon-match-stop-regexp
      nil ;; nil means to use `comment-start'
      (lambda (_arg)
        (tuareg-next-phrase t nil)
        (tuareg-skip-back-blank-and-comments))
      nil))))
  (when (featurep 'hideshow)
     (hs-minor-mode 1)
     (require 'fold-dwim))
   ))


(with-eval-after-load 'tuareg
  (add-hook 'tuareg-mode-hook 'lineker-mode))
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(add-to-list 'auto-mode-alist '("\\.base\\'" . conf-mode))

(use-package go-mode
  :config
  (add-hook 'go-mode-hook
    (lambda ()
      (add-hook 'before-save-hook 'gofmt-before-save)
      (setq tab-width 4)
      (setq indent-tabs-mode 1))))

(use-package flycheck
  :config
  (add-hook 'go-mode-hook 'flycheck-mode))

(use-package whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode 1))

(global-set-key (kbd "C-c g") 'magit-status)

(global-set-key "\M-n" 'scroll-up-line)
(global-set-key "\M-p" 'scroll-down-line)

(setq vc-follow-symlinks t)

;; Put backup files neatly away
(let ((backup-dir "~/.cache/emacs/backups")
      (auto-saves-dir "~/.cache/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kpept-old-versions 2)   ; and some old ones, too

(setq browse-url-browser-function 'browse-url-chrome)
;; Always show column numbers.
(setq-default column-number-mode t)

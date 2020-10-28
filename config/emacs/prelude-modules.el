;;; prelude-modules.el --- A listing of modules to load on startup
;;
;; Copyright © 2011-2020 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file is just a list of Prelude modules to load on startup.
;; For convenience the modules are grouped in several categories.
;; The prelude-modules.el in the samples folder should be copied
;; to your personal folder and edited there.

;; Note that some modules can't be used together - e.g. you shouldn't
;; enable both prelude-ido and prelude-ivy, as they serve the same
;; purpose.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;;; Uncomment the modules you'd like to use and restart Prelude afterwards

;;; General productivity tools

;; (require 'prelude-ido) ;; Supercharges Emacs completion for C-x C-f and more
(require 'prelude-ivy) ;; A mighty modern alternative to ido
;; (require 'prelude-helm) ;; Interface for narrowing and search
;; (require 'prelude-helm-everywhere) ;; Enable Helm everywhere
(require 'prelude-company)
; (require 'prelude-key-chord) ;; Binds useful features to key combinations
(require 'prelude-evil)

;;; Org-mode (a legendary productivity tool that deserves its own category)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more

;;; Programming languages support

(require 'prelude-c)
;; (require 'prelude-clojure)
;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
(require 'prelude-css)
;; (require 'prelude-dart)
(require 'prelude-emacs-lisp)
;; (require 'prelude-erlang)
;; (require 'prelude-elixir)
;; (require 'prelude-go)
;; (require 'prelude-haskell)
(require 'prelude-js)
;; (require 'prelude-latex)
(require 'prelude-lisp)
(require 'prelude-lsp)
;; (require 'prelude-ocaml)
;; (require 'prelude-perl)
(require 'prelude-python)
(require 'prelude-ruby)
;; (require 'prelude-rust)
;; (require 'prelude-scala)
;; (require 'prelude-scheme)
(require 'prelude-shell)
;; (require 'prelude-scss)
(require 'prelude-ts)
(require 'prelude-web) ;; Emacs mode for web templates
;; (require 'prelude-xml)
(require 'prelude-yaml)

;;; Misc
;; (require 'prelude-erc) ;; A popular Emacs IRC client (useful if you're still into Freenode)

(provide 'prelude-modules)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(add-hook 'web-mode-hook
      (lambda ()
        (setq whitespace-line-column 120)))

(add-hook 'typescript-mode-hook
      (lambda ()
        (setq whitespace-line-column 120)))

(add-hook 'ruby-mode-hook
      (lambda ()
        (setq whitespace-line-column 140)))

(setq whitespace-style '(face lines-tail))

(setq company-tooltip-align-annotations t)

(setq-default typescript-indent-level 2)
(global-set-key (kbd "C-SPC") 'company-complete)
(set-default-font "Inconsolata LGC")
(setq seoul256-background 233)
; (load-theme 'seoul256 t)
; (load-theme 'zenburn t)
(setq make-backup-files nil)
;;; prelude-modules.el ends here

(add-to-list 'load-path "~/.emacs.d/lisp-files/")
;; Added to allow the use of the melpa repository
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  
  
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;Start with 2 split windows left-right
(split-window-right)

;;Auto Complete
(require 'auto-complete)
(global-auto-complete-mode t)

;;Ctags (for going to definition)
(require 'ctags)
(setq path-to-ctags "C:\Users\Ben\AppData\Roaming\.emacs.d\ctags") ;; <- your ctags path here
  (defun create-tags (dir-name)
    "Create tags file."
    (interactive "DDirectory: ")
    (shell-command
		;;(format "ctags -R" path-to-ctags )))
     (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )

;;Highlight symbol 
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;;avy-flycheck, syntax errors
(add-hook 'after-init-hook #'global-flycheck-mode)

;;Move buffer window left and right
(add-to-list 'load-path "~/.emacs.d/lisp-files/")
(require 'buffer-move)
(global-set-key (kbd "C-<left>")   'buf-move-left)
(global-set-key (kbd "C-<right>")  'buf-move-right)
(global-set-key (kbd "C-<up>")  'buf-move-up)
(global-set-key (kbd "C-<down>")  'buf-move-down)

;;Hotkey for compile
(global-set-key "\C-x\C-m" 'compile)

;;Ascii table
(autoload 'ascii-table "ascii-table" "Show ASCII table." t)

;;Auto Complete
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;;Start Auto-Completion when entered 3 characters
(setq ac-auto-start 3)

;;Start zone mode if idle for more than 2 mins
(require 'zone)
(zone-when-idle 120)

(add-to-list 'load-path "~/.emacs.d/lisp-files/")
(require 'ob-C)
;; enable python for in-buffer evaluation
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)))

;; all python code be safe
(defun my-org-confirm-babel-evaluate (lang body)
(not (string= lang "python")))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;;Add timestamp to org 'DONE'
 (setq org-log-done 'time)
 
;;Stop the annoying little warning bell sound
(setq ring-bell-function 'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-use-frame-buffer-list t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 0)
 '(auto-show-mode t t)
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(delete-auto-save-files nil)
 '(delete-old-versions (quote other))
 '(ido-mode (quote both) nil (ido))
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 500000)
 '(initial-buffer-choice "C:/Users/Benjamin/Documents/emacs/TODO_List_Uni.org")
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-file-name-function (quote ignore))
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mouse-wheel-follow-mouse nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (15)))
 '(org-agenda-files
   (quote
    ("c:/Users/Benjamin/Desktop/helloworld/orgTest.org")))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (auctex-latexmk emoji-cheat-sheet-plus pdf-tools restart-emacs highlight-symbol flycheck-color-mode-line avy-flycheck ctags auto-complete shimbun switch-window timesheet password-generator pacmacs color-theme-sanityinc-solarized color-theme-solarized 2048-game org)))
 '(tool-bar-mode nil)
 '(truncate-lines nil)
 '(version-control nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scroll-bar ((t (:background "black" :foreground "snow")))))


 

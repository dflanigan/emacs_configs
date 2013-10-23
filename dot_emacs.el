;; 
;;
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
)

(package-refresh-contents)

(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

;; make more packages available with the package installer
(setq to-install
      '(python-mode magit yasnippet jedi auto-complete autopair find-file-in-repository))

(mapc 'install-if-needed to-install)

;; git interface
(require 'magit)
(global-set-key "\C-xg" 'magit-status)


;; Load python-mode for scons files
;; ;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq auto-mode-alist(cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist(cons '("SConscript" . python-mode) auto-mode-alist))

;; Robot mode settings
(load-file "~/emacs_config/manual_install/robot-mode.el")
(add-to-list 'auto-mode-alist '("\\.robot\\'" . robot-mode))

;; Google Protobuf mode
(load-file "~/emacs_config/manual_install/protobuf-mode.el")
(add-to-list 'auto-mode-alist '("\\.tlc\\'" . protobuf-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(make-backup-files nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier" :foundry "Adobe" :slant normal :weight normal :height 102 :width normal)))))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
)

;; Load python-mode for scons files
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

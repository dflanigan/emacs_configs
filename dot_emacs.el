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
      '(python-mode magit yasnippet jedi auto-complete autopair find-file-in-repository flycheck helm))

(mapc 'install-if-needed to-install)

;;linum
;;(setq linum-format "%3d ")

;; helm
(require 'helm-config)
(helm-mode 1)

;; git interface
(require 'magit)
(global-set-key "\C-xg" 'magit-status)

;; auto-pair
(require 'autopair)
;; yasnippet
(require 'yasnippet)

;; ;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq auto-mode-alist(cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist(cons '("SConscript" . python-mode) auto-mode-alist))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

;; auto-complete mode extra settings
(require 'auto-complete)
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

(add-hook 'python-mode-hook 'auto-complete-mode)

;; ;; Jedi settings
(require 'jedi)
;; It's also required to run "pip install --user jedi" and "pip
;; install --user epc" to get the Python side of the library work
;; correctly.
;; With the same interpreter you're using.

;; if you need to change your python intepreter, if you want to change it
;; (setq jedi:server-command
;;       '("python2" "/home/andrea/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))
(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
            (local-set-key "\C-cd" 'jedi:show-doc)
            (local-set-key (kbd "M-SPC") 'jedi:complete)
            (local-set-key (kbd "M-.") 'jedi:goto-definition)))

;;flycheck mode;
;;(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;javascript mode


;; Robot mode settings
(load-file "~/emacs_config/manual_install/robot-mode.el")
(add-to-list 'auto-mode-alist '("\\.robot\\'" . robot-mode))

;; Google Protobuf mode
(load-file "~/emacs_config/manual_install/protobuf-mode.el")
(add-to-list 'auto-mode-alist '("\\.tlc\\'" . protobuf-mode))

;; Interactively Do Things
;; (ido-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier" :foundry "Adobe" :slant normal :weight normal :height 102 :width normal))))
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt :foreground "DeepSkyBlue1"))))
 '(minibuffer-prompt ((t (:foreground "DodgerBlue1")))))


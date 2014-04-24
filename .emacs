(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get/ecb")
(add-to-list 'load-path "/Users/t4/Library/Haskell/Common/ghc-mod-1.11.2/elisp/")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
(setq
 el-get-sources
 '(el-get				; el-get is self-hosting
   escreen            			; screen for emacs, C-\ C-h
   switch-window			; takes over C-x o
   zencoding-mode			; http://www.emacswiki.org/emacs/ZenCoding

   (:name buffer-move			; have to add your own keys
	  :after (lambda ()
		   (global-set-key (kbd "<C-S-up>")     'buf-move-up)
		   (global-set-key (kbd "<C-S-down>")   'buf-move-down)
		   (global-set-key (kbd "<C-S-left>")   'buf-move-left)
		   (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

   (:name smex				; a better (ido like) M-x
	  :after (lambda ()
		   (setq smex-save-file "~/.emacs.d/.smex-items")
		   (global-set-key (kbd "M-x") 'smex)
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit				; git meet emacs, and a binding
	  :after (lambda ()
		   (global-set-key (kbd "C-x C-z") 'magit-status)))

   (:name goto-last-change		; move pointer back to last change
	  :after (lambda ()
		   ;; when using AZERTY keyboard, consider C-x C-_
		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

(setenv "PATH" (concat "/Users/t4/bin:"
                (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin:"
                (getenv "PATH")))
(setenv "PATH" (concat "/Users/t4/Library/Erlang/Current/bin:"
                (getenv "PATH")))
(setenv "PATH" (concat "/Users/t4/Library/Haskell/Current/bin:"
                (getenv "PATH")))
(setenv "PATH" (concat "/Users/t4/Library/Haskell/Cabal/bin:"
                (getenv "PATH")))
(setenv "PATH" (concat "/Users/t4/Library/Haskell/Common/ghc-mod-1.11.2/dist/build/ghc-mod:"
                (getenv "PATH")))

(setq exec-path (cons "/Users/t4/Library/Haskell/Current/bin" exec-path))
(setq exec-path (cons "/usr/local/bin" exec-path))
(setq exec-path (cons "/Users/t4/Library/Haskell/Cabal/bin" exec-path))
(setq exec-path (cons "/Users/t4/Library/Haskell/Common/ghc-mod-1.11.2/dist/build/ghc-mod" exec-path))

(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

(add-to-list 'load-path "/Users/t4/Library/Erlang/Current/tools/emacs")
(setq erlang-root-dir "/Users/t4/Library/Erlang/Current")
(setq erlang-man-root-dir "/Users/t4/Library/Erlang/Current/lib/erlang")
(setq exec-path (cons "/Users/t4/Library/Erlang/Current/bin" exec-path))

(unless (string-match "apple-darwin" system-configuration)
  (loop for p in '(color-theme		; nice looking emacs
		   color-theme-tango	; check out color-theme-solarized
		   )
	do (add-to-list 'el-get-sources p)))

;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
(unless (string-match "apple-darwin" system-configuration)
	(when (el-get-executable-find "cvs")
  		(add-to-list 'el-get-sources 'emacs-goodies-el)))

(when (el-get-executable-find "svn")
  (loop for p in '(psvn    		; M-x svn-status
		   yasnippet		; powerful snippet mode
		   )
	do (add-to-list 'el-get-sources p)))

;; install new packages and init already installed packages
(el-get 'sync)

;; some more useful setup

(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

;; choose your own fonts, in a system dependant way
(if (string-match "apple-darwin" system-configuration)
    (set-face-font 'default "Monaco-12")
  (set-face-font 'default "Monospace-10"))

(global-hl-line-mode)			; highlight current line
(global-linum-mode 1)			; add line numbers on the left

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t))

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

; winner-mode provides C-<left> to get back to previous window layout
(winner-mode 1)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(global-set-key (kbd "C-x o") 'switch-to-minibuffer)
(global-set-key (kbd "C-x M-l") 'goto-line)
(global-set-key (kbd "C-c M-l") 'delete-trailing-whitespace)

;; (require 'smart-tab)
;; (global-smart-tab-mode 1)
(show-paren-mode 1)

;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))

;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x M-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x M-c") 'ido-switch-buffer)
(global-set-key (kbd "C-x B") 'ibuffer)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;; dev modes and utils

(defvar prog-modes-hooks
  '(c-mode-hook erlang-mode-hook haskell-mode-hook emacs-lisp-mode-hook
                ocaml-mode-hook lisp-mode-hook scheme-mode-hook java-mode-hook)
  "A list of hooks for major modes that deal with programming languages")

(defun add-prog-modes-hook (hook)
  "Adds the hook to all the programming modes in `prog-modes-hooks'"
  (mapc (lambda (mode-hook)
          (add-hook mode-hook hook))
        prog-modes-hooks))

;; (require 'yasnippet)
;; (setq yas-snippet-dirs '("~/snippets"))

(require 'ecb)
; (require 'ecb-autoloads)
(setq stack-trace-on-error t)
(global-set-key (kbd "C-c p") 'ecb-nav-goto-previous)
(global-set-key (kbd "C-c n") 'ecb-nav-goto-next)
(global-set-key (kbd "C-c . M-f") 'ecb-grep)

(require 'erlang-start)
(add-to-list 'load-path "/Users/t4/Library/Erlang/Site/distel/elisp")
(add-to-list 'load-path "/Users/t4/Library/Erlang/Site/wrangler-1.0/elisp")
(require 'wrangler)

(global-set-key (kbd "C-x M-l") 'goto-line)

;; Some Erlang customizations

(add-hook 'erlang-mode-hook
  (lambda ()
  ;; when starting an Erlang shell in Emacs, default in the node name
  (setq inferior-erlang-machine-options (list "-sname" "emacs" "-remsh" (string erl-nodename-cache)))))
  ;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)

;; tell distel to default to that node
(setq erl-nodename-cache
     (make-symbol
       (concat
        "distel@"
        (car (split-string (shell-command-to-string "hostname -s"))))))

;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
  (lambda ()
	;; add some Distel bindings to the Erlang shell
        (dolist (spec distel-shell-keys)
        (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(require 'erlang-flymake)
(defun ebm-find-rebar-top-recr (dirname)
      (let* ((project-dir (locate-dominating-file dirname "rebar.config")))
        (if project-dir
            (let* ((parent-dir (file-name-directory (directory-file-name project-dir)))
                   (top-project-dir (if (and parent-dir (not (string= parent-dir "/")))
                                       (ebm-find-rebar-top-recr parent-dir)
                                      nil)))
              (if top-project-dir
                  top-project-dir
                project-dir))
              project-dir)))

(defun ebm-find-rebar-top ()
  (interactive)
  (let* ((dirname (file-name-directory (buffer-file-name)))
         (project-dir (ebm-find-rebar-top-recr dirname)))
    (if project-dir
        project-dir
      (erlang-flymake-get-app-dir))))

 (defun ebm-directory-dirs (dir name)
    "Find all directories in DIR."
    (unless (file-directory-p dir)
      (error "Not a directory `%s'" dir))
    (let ((dir (directory-file-name dir))
          (dirs '())
          (files (directory-files dir nil nil t)))
        (dolist (file files)
          (unless (member file '("." ".."))
            (let ((absolute-path (expand-file-name (concat dir "/" file))))
              (when (file-directory-p absolute-path)
                (if (string= file name)
                    (setq dirs (append (cons absolute-path
                                             (ebm-directory-dirs absolute-path name))
                                       dirs))
                    (setq dirs (append
                                (ebm-directory-dirs absolute-path name)
                                dirs)))))))
          dirs))

(defun ebm-get-deps-code-path-dirs ()
    (ebm-directory-dirs (ebm-find-rebar-top) "ebin"))

(defun ebm-get-deps-include-dirs ()
   (ebm-directory-dirs (ebm-find-rebar-top) "include"))

;; (fset 'erlang-flymake-get-code-path-dirs 'ebm-get-deps-code-path-dirs)
;; (fset 'erlang-flymake-get-include-dirs-function 'ebm-get-deps-include-dirs)

;; distel and autocomplete

(defvar ac-source-distel
  '((candidates . ac-distel-candidates)
    (requires . 0)
    (cache)))

(defvar ac-distel-candidates-cache nil
  "Horrible global variable that caches the selection to be returned.")

(defun ac-distel-candidates ()
  (ac-distel-complete)
  ac-distel-candidates-cache)

(defun ac-distel-complete ()
  "Complete the module or remote function name at point."
  (interactive)
  (let ((node erl-nodename-cache)
        (end (point))
        (beg (ignore-errors
               (save-excursion (backward-sexp 1)
                               ;; FIXME: see erl-goto-end-of-call-name
                               (when (eql (char-before) ?:)
                                 (backward-sexp 1))
                               (point)))))
    (when beg
      (let* ((str (buffer-substring-no-properties beg end))
             (buf (current-buffer))
             (continuing (equal last-command (cons 'erl-complete str))))
        (setq this-command (cons 'erl-complete str))
        (if (string-match "^\\(.*\\):\\(.*\\)$" str)
            ;; completing function in module:function
            (let ((mod (intern (match-string 1 str)))
                  (pref (match-string 2 str))
                  (beg (+ beg (match-beginning 2))))
              (erl-spawn
               (erl-send-rpc node 'distel 'functions (list mod pref))
               (&ac-distel-receive-completions "function" beg end pref buf
                                               continuing)))
          ;; completing just a module
          (erl-spawn
           (erl-send-rpc node 'distel 'modules (list str))
           (&ac-distel-receive-completions "module"
                                           beg end str buf continuing)))))))

(defun &ac-distel-receive-completions (what beg end prefix buf continuing)
  (let ((state (erl-async-state buf)))
    (erl-receive (what state beg end prefix buf continuing)
        ((['rex ['ok completions]]
          (setq ac-distel-candidates-cache completions))
         (['rex ['error reason]]
          (message "Error: %s" reason))
         (other
          (message "Unexpected reply: %S" other))))))

(defun ac-distel-setup ()
  (setq ac-sources '(ac-source-distel)))
(add-hook 'erlang-mode-hook 'ac-distel-setup)
(add-hook 'erlang-mode-hook 'erlang-wrangler-on)
(add-hook 'erlang-mode-hook (lambda () (erlang-extended-mode 1)))
(add-hook 'erlang-shell-mode-hook 'ac-distel-setup)

(require 'auto-complete-config)
(require 'flyspell)
(ac-flyspell-workaround)
(require 'whitespace)

(setq-default indent-tabs-mode nil)

;; visual aids (thanks bitonic)
;; (invert-face 'default)
;; (set-default 'cursor-type 'box)
(setq-default indicate-empty-lines t)
(setq whitespace-style '(face lines-tail)
      whitespace-line-column 80)
(add-prog-modes-hook (lambda ()
                       ; We use `show-trailing-whitespace' instead of
                       ; `whitespace-mode' because the former plays better with
                       ; auto-complete
                       (setq show-trailing-whitespace t)
                       (show-paren-mode 1)
                       (whitespace-mode 1)
                       (auto-complete-mode 1)))

(global-hl-line-mode 1)

;; (set-face-background 'hl-line "#1a1a1a")
;; we set the completion as well, since completions will
;; always be on the highlighted line
;; (set-face-background 'ac-completion-face "#1a1a1a")

(load "~/.emacs.d/el-get/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

;; hslint on the command line only likes this indentation mode;
;; alternatives commented out below.
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")

(autoload 'ghc-init "ghc" nil t)
(require 'flymake)

(defun flymake-Haskell-init ()
  (flymake-simple-make-init-impl
   'flymake-create-temp-with-folder-structure nil nil
   (file-name-nondirectory buffer-file-name)
   'flymake-get-Haskell-cmdline))

(defun flymake-get-Haskell-cmdline (source base-dir)
  (list "flycheck_haskell.pl"
        (list source base-dir)))

(push '(".+\\.hs$" flymake-Haskell-init flymake-simple-java-cleanup)
      flymake-allowed-file-name-masks)
(push '(".+\\.lhs$" flymake-Haskell-init flymake-simple-java-cleanup)
      flymake-allowed-file-name-masks)
(push
 '("^\\(\.+\.hs\\|\.lhs\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)"
   1 2 3 4) flymake-err-line-patterns)

(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; (add-to-list 'load-path "/usr/local/src/haskell/structured-haskell-mode/elisp")
;; (require 'shm)
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;;
;; (set-face-background 'shm-current-face "#eee8d5")
;; (set-face-background 'shm-quarantine-face "lemonchiffon")


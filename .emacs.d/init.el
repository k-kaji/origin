;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
     (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
             (normal-top-level-add-subdirs-to-load-path))))))

;; ディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elpa" "conf" "elisp")

;;elpa以下のzenburn-theme.elを読込
(load "zenburn-theme")

;;conf以下のcommon.elを読込
(load "common")
;;(load "org")

(require 'undo-tree)

;;--------------------------------------------------------------------------

;;helmの設定
(require 'helm-config)
(helm-mode 1)

;;C-hで前の文字削除
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;;tabとC-zを入れ替える
;;helmではtabでの補完ができないため
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

;;キーバインド
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)

;;--------------------------------------------------------------------------

;;カスタムファイルを別ファイルにする
(setq custom-file (locate-user-emacs-file "custom.el"))
;;カスタムファイルが存在しない場合作成する
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
;;カスタムファイルを読み込む
(load custom-file)

;;--------------------------------------------------------------------------

;package.elを有効化
(require 'package)
;;パケージリポジトリにMarmaladeとMELPAを追加
(add-to-list
 'package-archives
 '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
;;インストール済のElispを読み込む
(package-initialize)

;;-------------------------------------------------------------------------

;; カレントディレクトリをホームディレクトリに設定
;; ""内は任意のディレクトリを指定可能
(cd "~/")

;;reload
(global-set-key
 [f12] 'eval-buffer)
;;
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

(add-hook 'mozc-mode-hook
  (lambda()
    (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))

;;-------------------------------------------------------------------------

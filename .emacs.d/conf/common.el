;;--------------------------------------------------
;; バックアップファイルを作る
;; 「nil」を「t」にするとバックアップファイルを作らない
(setq backup-inhibited t)

;;表示に関する設定
;;--------------------------------------------------

;;対応する括弧を強調表示
(show-paren-mode t)

;;カーソル行をハイライト
(global-hl-line-mode t)

;; スペース、タブなどを可視化する
(global-whitespace-mode 1)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)

;;メニューバーを消す
(menu-bar-mode -1)

;;ツールバーを消す
(tool-bar-mode -1)

;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
        (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; 列数を表示する
(column-number-mode t)

;; 行数を表示する
(global-linum-mode t)

;;時間も表示
(display-time)
;;--------------------------------------------------

;;バッファ系
;; テンポラリバッファを作成し、それをウィンドウに表示します。
(defun create-temporary-buffer ()
  "テンポラリバッファを作成し、それをウィンドウに表示します。"
  (interactive)
  ;; *temp* なバッファを作成し、それをウィンドウに表示します。
  (switch-to-buffer (generate-new-buffer "*temp*"))
  ;; セーブが必要ないことを示します？
  (setq buffer-offer-save nil))
;; C-c t でテンポラリバッファを作成します。
(global-set-key "\C-ct" 'create-temporary-buffer)

;;--------------------------------------------------

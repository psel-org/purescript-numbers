;; -*- lexical-binding: t; -*-

(defvar Data.Number.nan 0.0e+NaN)

(defvar Data.Number.isNaN
  (symbol-function 'isnan))

(defvar Data.Number.infinity 1.0e+INF)

(defvar Data.Number.isFinite
  (lambda (x)
    (and (not (= x 1.0e+INF))
         (not (= x -1.0e+INF))
         (not (isnan x)))))

;; string-to-numberが厄介なのがパースに失敗した場合 0を返すこと。
;; つまり本当に0なのかパースに失敗した結果での0なのか区別できない。
;; 本当に0の場合 /^[ \t]*(-|+)?0/ の正規表現に合致するはず。
;; また "123" はfloatではなくintegerとしてパースされているので
;; floatに変換する必要がある。
(defvar Data.Number.fromStringImpl
  (lambda (str is-finite just nothing)
    (let* ((v (string-to-number str))
           (f (float v)))
      (if (and (funcall is-finite f)
               (or (not (= v 0))
                   (string-match "^[ \t]*[-+]?0" str)))
          (funcall just f)
        nothing))))

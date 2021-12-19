;; -*- lexical-binding: t; -*-

(require 'psel)

(defvar Data.Number.Format.toPrecisionNative
  (lambda (i)
    (lambda (v)
      (psel/unrecoverable-error "Data.Number.Format.toPrecisionNative not supported"))))

(defvar Data.Number.Format.toFixedNative
  (lambda (i)
    (lambda (v)
      (format (concat "%." (number-to-string i) "f") v))))

(defvar Data.Number.Format.toExponentialNative
  (lambda (i)
    (lambda (v)
      (format (concat "%." (number-to-string i) "e") v))))

(defvar Data.Number.Format.toString
  (symbol-function 'number-to-string))

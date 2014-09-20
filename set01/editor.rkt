;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname editor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)
(require "extras.rkt")
(require 2htdp/universe)


#; (provide
    edit
    )

; DATA DEFINITIONS
; A KeyEvent is one of:
; - a single-character string(length = 1)
; - "left"
; - "right"

(define-struct editor( pre post))
; a editor is  a (make-editor String String)

; INTERPRETATION
; It will take a String post and append it to the String pre and
; move cursor accordingly.


; CONTRACTS and PURPOSE STATEMENTS
; edit:    Editor KeyEvent -> Editor
; GIVEN:   a Editor ed(consists 2 strings) and a KeyEvent ke
; RETURNS: a single-character KeyEvent ke is added to the end of the
;          pre field of ed.If ke denotes backspace ("\b") key delete
;          the character to the left of cursor

(define (edit e ke)
  (make-editor
   (editor-pre e)
   (check-event e ke)))


(define (check-event e ke)
  (cond
    [(= (string-length ke) 1) (check-add? e ke)]
    ))



(define (check-add? e ke)
  (cond
    [( key=? ke "\t" ) (editor-post e)]
    [(key=? ke "\u007F") (editor-post e)]
;    [(key=? ke "\b") (delete-letter e)]
    [else (add-to-pre e ke ) ]))



(define (add-to-pre e ke)
  ( make-editor (+ (editor-pre e)(editor-post e))
                ""))


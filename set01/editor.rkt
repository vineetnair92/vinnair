;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname editor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)
(require "extras.rkt")
(require 2htdp/universe)


 (provide
    edit
    make-editor
    editor-pre
    editor-post)

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
  ;(make-editor
   (check-event e ke))
   ;(editor-post e)))

(begin-for-test
  ( check-equal? (edit (make-editor "qwe" "as") "R") (make-editor "qweR" "as"))
  (check-equal? (edit (make-editor "qwe" "srt") "left") (make-editor "qw" "esrt")) 
  (check-equal? (edit (make-editor "qwe" "ter") "right") (make-editor "qwet" "er"))
(check-equal? (edit (make-editor "qwe" "ter") "\b") (make-editor "qw" "ter"))
(check-equal? (edit (make-editor "qwe" "ter") "\t") (make-editor "qwe" "ter"))
(check-equal? (edit (make-editor "qwe" "ter") "\u007F") (make-editor "qwe" "ter")))


         
         
(define (check-event e ke)
  (cond
    [(= (string-length ke) 1) (check-add? e ke)]
    [(string=? "left" ke)(move-left e ke) ]
    [(string=? "right" ke)(move-right e ke)]))



(define (check-add? e ke)
  (cond
    [( key=? ke "\t" ) (make-editor (editor-pre e)(editor-post e))]
    [(key=? ke "\u007F") (make-editor (editor-pre e)(editor-post e))]
    [(key=? ke "\b") (delete-letter e ke)]
    [else (add-to-pre e ke ) ]))


(define (add-to-pre e ke)
  (make-editor
(string-append(editor-pre e) ke)
   (editor-post e)))             

(define (delete-letter e ke)
  (cond
    [(= (string-length (editor-pre e))0 )"No elements to delete" ]
   ( else(make-editor  (string-rest e ke) (editor-post e)))))


(define (move-left e ke)
  (cond
    [(= (string-length (editor-pre e)) 0 )"Cannot move further as cursor is at first" ]
    (else (make-editor(string-rest e ke) (string-append (string-last e ke)(editor-post e)))))
  )

 (define (move-right e ke)
  (cond
    [(= (string-length (editor-pre e))0 )"Cannot move right as no cursor is at last" ]
    (else (make-editor (string-append (editor-pre e)(string-first e ke)) (string-rest e ke)))
  ))
 
 (define (string-last e ke)
   (string-ith (editor-pre e) (-(string-length (editor-pre e))1 )))
 
 (define (string-first e ke)
   (string-ith (editor-post e) 0))
 
 (define(string-rest e ke)
   (cond
     [(key=? ke "left") (substring (editor-pre e) 0 (-(string-length (editor-pre e)) 1))]
     [(key=? ke "right") (substring (editor-post e) 1 (string-length (editor-post e)))]
   (else  (substring (editor-pre e) 0 (-(string-length (editor-pre e)) 1)))))
 
 


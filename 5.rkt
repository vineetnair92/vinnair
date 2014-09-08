;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; sq: Square of a Number -> Number
; Given: Any real number 
; Returns: Square of that number
; Examples:
; (sq 6) => 36
; (sq 9) => 81

(define (sq n)
  (* n n))

( sq 9)
( sq 4.5)
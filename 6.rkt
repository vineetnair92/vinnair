;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;quadratic-root : Numbers -> Number
;Given :'a','b' and 'c' values
;Returns: root of quadratic equation
;Examples: 
;(quadratic-root 1 2 1) -> -1
;(quadratic-root 5 -10 5)-> 1

( define (quadratic-root a b c)
   (/ (+ (* b -1) (sqrt (- (* b b) (*(* 4 a) c)))) (* 2 a))
   )

(quadratic-root 5 -10 5)
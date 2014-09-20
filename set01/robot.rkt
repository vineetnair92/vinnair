;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)
(require "extras.rkt")

(provide
  initial-robot
  robot-left )
;  robot-right)
;  robot-forward
;  robot-north? 
;  robot-south? 
;  robot-east? 
;  robot-west?) 


; DATA DEFINITIONS

; A Direction is one of
; -- "north"
; -- "south"
; -- "east"
; -- "west"

(define north-dir "north")
(define south-dir "south")
(define east-dir "east")
(define west-dir "west")

;;TEMPLATE
;; dir-fn : Robot -> ??
;; (define (dir-fn r)
;;  (cond
;;    [(string=? r "north")...]
;;   [(string=?  r  "south")...]
;;   [(string=?  r  "east")...]
;;    [(string=? r "west")...]))

; x and y are scalar data representing the coordinates of the robot
; len and breadth are scalar data representing the coordinates of the room
; radius is the radius of robot(which is in the shape of the circle). 

 (define rad 15)
 (define-struct robot ( x y direction radius))
 (define-struct room-size ( len breadth))


;  A robot is a 
;   (make-robot Real Real String PosInt)
 
;   INTERPRETATION:
;   x is the x-coordinate of the current position of the robot
;   y is the y-co-ordinate of the current position of the robot
;   direction is the direction in which the robot is currently facing
;   radius is the radius of the robot 
 
; TEMPLATE
; robot-fn : robot -> ??
; (define (robot-fn r)
;   (...
;    (robot-x r)
;    (robot-y r)
;    (robot-direction r)
;    )
;   )
  
 
; A room-size is a (make-room PosReal PosReal)
; INTERPRETATION:
; len is the lenght of the room
; breadth is the breadth of the room
 
 
;; room-fn : room-size -> ??
;; (define (room-size-fn rs)
;;   (...
;;    (room-size-len rs)
;;    (room-size-breadth rs)))
 
 
; CONTRACT and PURPOSE STATEMENTS
 
; initial-robot : Real Real -> Robot
; GIVEN: a set of (x,y) coordinates
; RETURNS: a robot with its center at those coordinates,facing north

; EXAMPLE: (initial-robot 50 20) -> Robot at 50,20 position.

; STRATEGY:
; Function Composition

 (define (initial-robot x y)
   ( make-robot
      x
      y
     "north"
      rad))

 (begin-for-test
   (check-equal? (initial-robot 50 60) (make-robot 50 60 "north" 15)))

 

; robot-left: Robot -> Robot
; robot-right: Robot -> Robot
; GIVEN: a robot
; RETURNS: a robot like the original,but turned 90 degrees
; either left or right
 
; STRATEGY:
; STRUCTURAL DECOMPOSITION
; Helper Function
 
 (define (dir-left dir)
   (cond
     [(string=? (robot-direction dir) "south")"east"]
     [(string=? (robot-direction dir) "north")"west"]
     [(string=? (robot-direction dir) "east")"south"]
     [(string=? (robot-direction dir) "west")"north"]))
  

 (define (robot-left r)
   ( make-robot
     (robot-x r)
     (robot-y r )
     (dir-left r)
    ( robot-radius r)))
     
 
 (begin-for-test
  ( check-equal? (robot-left (make-robot 10 20 "south" 15)) (make-robot 10 20 "east" 15))
  ( check-equal? (robot-left (make-robot 10 20 "north" 15)) (make-robot 10 20 "west" 15))
  ( check-equal? (robot-left (make-robot 10 20 "west" 15)) (make-robot 10 20 "north" 15))
  ( check-equal? (robot-left (make-robot 10 20 "east" 15)) (make-robot 10 20 "south" 15)))

 
 
  (define(dir-right dir)
    (cond
      [(string=? (robot-direction dir) "south")"west"]
      [(string=? (robot-direction dir) "north")"east"]
      [(string=? (robot-direction dir) "east")"north"]
      [(string=? (robot-direction dir) "west")"south"]))
 

  (define (robot-right r)
       (make-robot
        (robot-x r)
        (robot-y r)
        (dir-right r)
        (robot-radius r)))
 
 (begin-for-test
  ( check-equal? (robot-right (make-robot 10 20 "south" 15)) (make-robot 10 20 "west" 15))
  ( check-equal? (robot-right (make-robot 10 20 "north" 15)) (make-robot 10 20 "east" 15))
  ( check-equal? (robot-right (make-robot 10 20 "west" 15)) (make-robot 10 20 "south" 15))
  ( check-equal? (robot-right (make-robot 10 20 "east" 15)) (make-robot 10 20 "north" 15)))

 
; robot-forward : Robot PosInt -> Robot
; GIVEN: a robot and a distance
; RETURNS: a robot like the given one, but moved forward by the
; specified distance.  If moving forward the specified distance 
; would cause the robot to move from being entirely inside
; the room to being even partially outside the canvas,
; then the robot should stop at the wall.

  #;  (define (robot-forward r dist)
       (make-robot
        r
        r
        r
        r)
      (if(= (dir-check r-x r-y dist) true)(change-dir r-x r-y dist)))
    
   #; (define (dir-check r-x r-y dist)
      
        (if(< r-x 400) (and (< r-y 200))(going-outside? r-x r-y dist) (coming-inside? r-x r-y dist)))
   
   
    
    
       
;              
; robot-north? : Robot -> Boolean
; robot-south? : Robot -> Boolean
; robot-east? : Robot -> Boolean
; robot-west? : Robot -> Boolean
; GIVEN: a robot
; ANSWERS: whether the robot is facing in the specified direction.
  
  ;(define (robot-north? r)
  ;  (make-robot
  ;   r
  ;   r
  ;   (if (= r "north")true false)
  ;   r))
 
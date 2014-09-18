;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)
(require "extras.rkt")

(provide
  initial-robot
  robot-left 
  robot-right
  robot-forward
  robot-north? 
  robot-south? 
  robot-east? 
  robot-west?) 

(define radius 15)

;
; A Direction is one of
; -- "north"
; -- "south"
; -- "east"
; -- "west"
;
; direction-fn : Direction -> ??
 (define (direction-fn d)
  (cond
    [(string=? d "north")...]
    [(string=? d "south")...]
    [(string=? d "east")...]
    [(string=? d "west")...]))

 ; x and y are scalar data
 ; l and b are scalar data
 
 (define-struct robot ( x, y, direction))
 (define-struct room-size ( l,b))
   
;  A robot is a 
;   (make-robot Real Real String)
 
;   INTERPRETATION:
;   x is the x-coordinate of the current position of the robot
;   y is the y-co-ordinate of the current position of the robot
;   direction is the direction in which the robot is currently facing
 
; robot-fn : robot -> ??
 (define (robot-fn r)
   (...
    (robot-x r)
    (robot-y r)
    (robot-direction r)
    )
   )
  
 
; A room-size is a (make-room PosReal PosReal)
; INTERPRETATION:
; l is the lenght of the room
; b is the breadth of the room
 
; room-fn : room-size -> ??
 (define (room-size-fn rs)
   (...
    (room-size-l rs)
    (room-size-b rs)
    )
   )
 
 
   

 
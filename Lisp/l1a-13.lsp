;a
;A linear list is given. Eliminate from the list all elements from N to N steps, N-given.

(defun funct (l n c)
    (cond
        ((null l) nil)
        ((= c n) (funct (Cdr l) n 1))
        (t (cons (Car l) (funct (Cdr l) n (+ c 1))))
    )
)

(defun main (l n) (funct l n 1))

(print (main `(1 2 3 4 5 6 7 8 9) 2))




;d
;Write a function that deletes from a linear list of all occurrences of the maximum element.

(defun maxEl (l e)
    (cond
        ((null l) e)
        ((and (listp (car  l)) (< e (maxEl (car l) -1))) (maxEl (cdr l) (maxEl (car l) -1)))
        ((and (numberp (CAr l)) (< e (Car l))) (maxEl (Cdr l) (Car l)))
        (t (maxEl (cdr l) e))
    )
)

(defun funct (l e)
    (cond
        ((null l) nil)
        ((listp (Car l)) (cons (funct (Car l) e) (funct (cdr l ) e)))
        ((and (numberp (car l)) (= (Car l) e)) (funct (cdr l) e))
        (t (cons (car l) (funct (cdr l) e)))
    )
)

(defun main (l) (funct l (maxEl l -1)))

(print (main '(1 5 2 (3 (a) 5 (5 3)) 4 5)))

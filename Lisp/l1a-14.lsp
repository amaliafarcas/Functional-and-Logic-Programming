;c
;Write a function to sort a linear list with keeping the double values.

(defun insCorPos (l e)
    (cond
        ((null l) (list e))
        ( (or (= (car l) e) (> (car l) e)) (cons e l))
        (t (cons (car l) (insCorPos (cdr l) e)))
    )
)


(defun funct (l)
    (cond
        ((null l) nil)
        (t (insCorPos (funct (cdr l)) (Car l) ))
    )
)

(print (funct '(1 3 2 5 6 7 7 3 9)))

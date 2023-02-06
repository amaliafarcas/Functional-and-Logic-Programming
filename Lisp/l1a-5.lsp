;a
;Write twice the n-th element of a linear list.
(defun wTwice (l c)
    (cond
        ((null l) nil)
        ( (= c 1) (append (list (car l)) (append (list(car l)) (cdr l))))
        (T (append (list (car l)) (wTwice (cdr l) (- c 1))))
    )
)

(print (wTwice `(1 2 3 4 5) 4))





;b
;Write a function to return an association list with the two lists given as parameters
(defun assocL (l1 l2)
    (cond
        ((or (null l1) (null l2)) nil)
        ( T (cons (list (car l1) (car l2)) (assocL (cdr l1) (cdr l2))))
    )
)

(print (assocL `(1 2 3 4 5) `(1 2 3 4 5)))




;c
;nr of sublists
(defun nrSubl (l n)
    (cond
        ((null l) n)
        ( (listp (car l)) (nrSubl (cdr l) (+ n (+ 1 (nrSubl (car l) 0)))))
        ( t (nrSubl (cdr l) n))
    )
)

(print (nrSubl `(1 2 (3 (4 5) (6 7)) 8 (9 10)) 1))





;d
;number of all numerical atoms in a list at superficial level
(defun nrNumAt (l n)
    (cond
        ((null l) n)
        ( (numberp (car l)) (nrNumAt (cdr l) (+ n 1)))
        ( t (nrNumAt (cdr l) n))
    )
)

(print (nrNumAt `(1 2 (1 2 3) N (a 1) 4) 0))
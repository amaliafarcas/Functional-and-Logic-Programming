;a
;sum of 2 vectors
(defun sum (l1 l2)
    (cond
        ( (and (null l2) (null l1) ) nil)
        ( t (cons (+ (car l1) (car l2)) (sum (cdr l1) (cdr l2))))
    )
)

(print (sum `(1 2 3) `(1 2 3)))




;b
;get all atoms in a linear list
(defun sum (l)
    (cond
        ( (null l)  nil)
        ( (listp (Car l)) (append (sum (car l)) (sum (cdr l))))
        ( t (append (list (car l)) (sum (cdr l))))
    )
)

(print (sum `(1 (2 (2)) 3)))




;c
;revers all cont atoms in a non-linear list
(defun my_reverse (l)
    (if (null l)
        nil
        (append (my_reverse (cdr l)) (list (car l)))
    )        
)

(defun inv_list (l aux)
    (cond
        ((null l) (my_reverse aux))
        ((listp (car l)) (append (my_reverse aux) (cons (inv_list (car l) nil) (inv_list (cdr l) nil))))
        (T (inv_list (cdr l) (append aux (list (car l)))))
    )
)

(print (inv_list `(1 (2 (2 3)) 3 4) nil))




;d
;max value of non-linear list at a sup lvl
(defun maxNr (l m)
    (cond
        ((null l) m)
        ((listp (car l)) (maxNr (cdr l) m))
        ( (< m (Car l)) (maxNr (cdr l) (car l)))
        (T (maxNr (cdr l) m))
    )
)

(print (maxNr `(1 (2 (2 5)) 3 4) 0))

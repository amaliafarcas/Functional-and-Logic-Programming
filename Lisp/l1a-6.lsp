;a
;test if a list is linear
(defun isLin (l)
    (cond
        ((null l) t)
        ( (listp (car l)) nil)
        ( t (isLin (cdr l)))
    )
)

(print (isLin `(1 2 (1 2 3) N (a 1) 4)))
(print (isLin `(1 2 4)))



;b
;replace the first occ of an el with an el O
(defun replaceEl (l e o)
    (cond
        ((null l) nil)
        ( (= (Car l) e) (cons o (cdr l)))
        ( t (cons (car l) (replaceEl (cdr l) e o)))
    )
)

(print (replaceEl `(1 2 4 2) 2 0))





;c
;replace each sublist of a list with its last element.
(defun getLast (l)
    (cond
        ((and (listp (car l)) (null (cdr l))) (getLast (car l)))
        ((null (cdr l)) (car l))
        ( t (getLast (cdr l)))
    )
)

(defun replaceSub (l)
    (cond
        ((null l) nil)
        ( (listp (Car l)) (cons (getLast (car l)) (replaceSub(cdr l))))
        ( t (cons (car l) (replaceSub (cdr l))))
    )
)

(print (replaceSub `(1 (2 (4 2 3 (5))) 2)))





;d
;merge 2 sorted lists without keeping the double values

(defun mergeLists (l1 l2)
    (cond
        ((and (null l2) (null l1)) nil)
        ((null l1) l2)
        ((null l2) l1)
        ( (= (car l1) (car l2)) (cons (car l1) (mergeLists (cdr l1) (Cdr l2))))
        ( (< (car l1) (car l2)) (cons (car l1) (mergeLists (cdr l1) l2)))
        ( (> (car l1) (car l2)) (cons (car l2) (mergeLists l1 (Cdr l2))))
    )
)

(print (mergeLists `(1 2 4 5 7) `(1 2 3 6 7 8)))
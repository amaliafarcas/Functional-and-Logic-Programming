;a
;Write a function to return the differene of two sets
(defun setsDiff (s1 s2)
    (cond
        ((and (null s2) (null s1)) nil)
        ((null s1) s2)
        ((null s2) s1)
        ((= (Car s1) (car s2)) (setsDiff (cdr s1) (cdr s2)))
        ((< (Car s1) (car s2)) (cons (car s1) (setsDiff (cdr s1) s2)))
        ((> (Car s1) (car s2)) (cons (car s2) (setsDiff s1 (Cdr s2))))
        (t nil)
    )
)

(print (setsDiff '(1 2 4) `(2 3 4 5)))





;b
;Write a function to reverse a list with its all sublists, on all levels.
(defun revList (l)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (revList (cdr l)) (list (revList (car l)))))
        (t (append (revList (cdr l)) (list (car l))))
    )
)

(print (revList '(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))




;c
;Write a function to return the list of the first elements of all list elements of a given list with an odd number of elements at superficial level
(defun nrEl (l)
    (cond
        ((null l) 0)
        (t (+ 1 (nrEl (cdr l))))
    )
)

(defun getFirst (l)
    (cond 
        ((listp (car l)) (getFirst (Car l)))
        (t (Car l))
    )
)


(defun funct (l)
    (cond
        ((null l) nil)
        ((and (listp (car l)) (= (mod (nrEl (car l)) 2) 1)) (append (list(getFirst (Car l))) (append (funct (car l)) (funct (cdr l)))))
        ((listp (car l))  (append (funct (car l)) (funct (cdr l))))
        (t (funct (cdr l)))
    )
)

(defun main(l) 
    (cond 
        ((= (mod (nrEl l) 2) 1) (append (list(getFirst l)) (funct l)))
        (t (funct l))
    )
)

(print (main `(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))




;d
;Write a function to return the sum of all numerical atoms in a list at superficial level.

(defun funct (l)
    (cond
        ((null l) 0)
        ((numberp (car l))  (+ (car l) (funct (cdr l))))
        (t (funct (cdr l)))
    )
)

(print (funct `(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))

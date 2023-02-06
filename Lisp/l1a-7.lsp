;b
;Write a function to determine the successor of a number represented digit by digit as a list, without transforming the representation of the number from list to number. Example: (1 9 3 5 9 9) --> (1 9 3 6 0 0)

(defun carry (n)
    (cond
        ((> (- n (mod n 10)) 9) (/ (- n (mod n 10)) 10))
        (T (- n (mod n 10)))
    )
)



(defun digit (n)
    (mod n 10)
)

(defun increaseNb (l)
    (cond
        ((null (cdr l)) (list (carry (+ 1 (car l))) (list (digit (+ 1 (car l))))))
        (T ((lambda (r)
                    (list (carry (+ (car l) (car r))) (cons (digit (+ (car l) (car r))) (cadr r)))
             ) (increaseNb (cdr l))
           )
        )
     )
)

(defun succesorNb (l)
    ((lambda (r) 
         (cond
            ((= (car r) 1) (cons 1 (cadr r)))
            (T (cadr r))
         ))
            (increaseNb l)
    )
)

(print (succesorNb '(1 9 3 5 9 9)))
(print (succesorNb '(9 9)))





;c
;Write a function to return the set of all the atoms of a list.

(defun lin (l)
    (cond
        ((null l) nil)
        ((listp (Car l)) (append (lin (car l)) (lin (cdr l))))
        (t (append (list (car l)) (lin (Cdr l))))
    )
)

;(print (lin `(1 (2 (1 3 (2 4) 3) 1) (1 4))))

(defun insertCorPos (l e)
    (cond
        ((null l) (list e))
        ((> (car l) e) (cons e l))
        ((= (car l) e) l)
        (t (cons (car l) (insertCorPos (Cdr l) e)))
    )
)

;(print (insertCorPos `(1 2 3 7) 3))

(defun funct (l)
    (cond
        ((null l) nil)
        (t (insertCorPos (funct (cdr l)) (car l)))
    )
)

(print (funct (lin `(1 (2 (1 3 (2 4) 3) 1) (1 4)))))





;d
;Write a function to return the set of all the atoms of a list.
(defun isUnique (l n)
    (cond
        ((null l) t)
        ((= (car l) n) nil)
        (T (isUnique (cdr l) n))
    )
)

(defun isSet (l)
    (cond
        ((null l) t)
        ((isUnique (cdr l) (car l)) (isSet (cdr l)))
        (t nil)
    )
)

(print (isSet '(1 2 3 4)))

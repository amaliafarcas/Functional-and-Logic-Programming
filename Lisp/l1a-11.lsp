;a
;Determine the least common multiple of the numerical values of a nonlinear list.

(defun cmmdc (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((= a b) a)
        ((< a b) (cmmdc a (- b a)))
        ((> a b) (cmmdc (- a b) b))
    )
)

(defun cmmmc (a b) 
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        (t (/ (* a b) (cmmdc a b)))
    )
)
    

(defun funct (l)
    (cond 
        ((and (atom (Car l)) (null (cdr l))) (Car l))
        ((listp (car l)) (cmmmc (funct (car l)) (funct (cdr l))))
        ((numberp (Car l)) (cmmmc (car l) (funct (Cdr l))))
        (t (funct (cdr l)))
    )
)

(print (funct '(24 ( 16 (12 A B)) 72)))




;b
;Write a function to test if a linear list of numbers has a "mountain" aspect (a list has a "mountain" aspect if the items increase to a certain point and then decreases. 

(defun funct (l c prev)
    (cond
        ((and (null l) (= c 1)) t)
        ((and (null l) (not (= c 1))) nil)
        ((and (= c -1) (< prev (car l))) (funct (Cdr l) 0 (Car l)))
        ((and (= c 0) (< prev (car l))) (funct (Cdr l) c (Car l)))
        ((and (= c 0) (> prev (car l))) (funct (Cdr l) 1 (Car l)))
        ((and (= c 1) (> prev (car l))) (funct (Cdr l) c (Car l)))
        (t nil)
    )
)

(defun main (l) 
    (cond
        ((< (list-length l) 3) nil)
        (t (funct (cdr l) -1 (car l)))
    )        
)

(print (main `(1 2 3)))



;d
;Write a function which returns the product of numerical even atoms from a list, to any level

(defun funct (l p)
    (cond
        ((null l) p)
        ((listp (Car l)) (funct (Cdr l) (* p (funct (Car l) 1))))
        ((and (numberp (CAr l)) (= (mod (car l) 2) 0)) (funct (Cdr l) (* p (car l))))
        (t (funct (cdr l) p))
    )
)

(defun main (l) (funct l 1))

(print (main '(1 2 3 (4 5 (6)) (7))))

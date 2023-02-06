;c
;Write a function to compute the result of an arithmetic expression memorised in preorder on a stack.

(defun _expression (op a b)
	(cond
		((string= op "+") (+ a b))
		((string= op "-") (- a b))
		((string= op "*") (* a b))
		((string= op "/") (floor a b))
	)
)

(defun expression (l)
    (cond
        ((null l) nil)
        ((and (and (numberp (cadr l)) (numberp (caddr l))) (atom (car l))) (cons (_expression (car l) (cadr l) (caddr l)) (expression (cdddr l))))
        (T (cons (car l) (expression (cdr l))))
    )
)

(defun solve (l)
    (cond
        ((null (cdr l)) (car l))
        (T (solve (expression l)))
    )
)

(print (solve '(+ * 2 4 - 5 * 2 2)))




;d
;Write a function to produce the list of pairs (atom n), where atom appears for n times in the parameter list.

(defun nrEl (l e)
    (cond
        ((null l) 0)
        ((equal (car l) e) (+ 1 (nrEl (Cdr l) e)))
        ( t (nrEl (cdr l) e))
    )
)


(defun del (l e)
   (cond
        ((null l) nil)
        ((equal (car l) e) (del (Cdr l) e))
        ( t (cons (car l) (del (cdr l) e)))
    ) 
)


(defun funct (l)
    (cond 
        ((null l) nil)
        (t (cons (list (car l) (nrEl l (Car l))) (funct (del l (Car l)))))
    )
)

(print (funct `(A B A B A C A)))

;c
;Write a function to return the set of all sublists of a given linear list. 

(defun funct (l)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (list (car l)) (append (funct (car l)) (funct (cdr l)))))
        (t (funct (cdr l)))
    )
)

(print (funct '((1 2 3) ((4 5) 6))))




;d
;Write a function to return the set of all sublists of a given linear list. 

(defun funct (s1 s2)
    (cond
        ((and (null s2) (null s1)) t)
        ((= (CAr s1) (car s2)) (funct (cdr s1) (cdr s2)))
        (t nil)
    )
)

(print (funct '(1 2 7 3) '(1 2 7 3)))

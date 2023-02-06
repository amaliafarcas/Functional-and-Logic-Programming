;Write a function to check if an atom is member ofa list (the list is non-liniar)

(defun funct (x e)
    (cond
        ((and (atom x) (= x e)) 1)
        ((listp x) (apply #'+(mapcar #'(lambda(a) (funct a e)) x)))
        (t 0)
    )
)

(defun main (x e) 
    (if (> (funct x e) 0) T nil)
)

(print (main `(1 2 3) 2))
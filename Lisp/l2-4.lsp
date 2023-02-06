;Write a function that returns the product of numeric atoms in a list,at any level.

(defun funct (x)
    (cond
        ((numberp x) x)
        ((listp x) (apply #'* (mapcar #'(lambda(a) (funct a)) x)))
        (t 1)
    )
)


(print (funct `(7 (#\A) 3)))
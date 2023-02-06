;Write a function that returns the sum of numeric atoms in a list, at any level.

(defun funct (x)
    (cond
        ((numberp x) x)
        ((listp x) (apply #'+ (mapcar #'(lambda(a) (funct a)) x)))
        (t 0)
    )
)

(print (funct `(1 2 3)))
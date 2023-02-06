;Write a function that computes the sum of even numbers and the decreasethe sum ofodd numbers, at any level of a list.

(defun funct (x)
    (cond
        ((and (numberp x) (= (mod x 2) 0)) x)
        ((and (numberp x) (= (mod x 2) 1)) (- 0 x))
        ((listp x) (apply #'+ (mapcar #'(lambda(a) (funct a)) x)))
        (t 0)
    )
)


(print (funct `(7 (#\A) 3 10)))
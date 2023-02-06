;Write a function that removes all occurrences of an atom from any level of a list.

(defun funct (x e)
    (cond
        ((and (numberp x) (= x e)) nil)
        ((listp x) (mapcar #'(lambda(a) (funct a e)) x))
        (t x)
    )
)


(print (funct `(7 11 (#\A) 3 10) 11))
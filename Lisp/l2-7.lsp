;Write a function that substitutes an elementE withall elements of alist L1 at alllevels of a given list L.

;main x l e = l, x==e
;             main x1 l e, x - list
;             x, oth

(defun main (x e l)
    (cond 
        ((and (numberp x) (= x e)) l)
        ((listp x) (mapcar #'(lambda(a) (main a e l)) x))
        (t x)
    )
)

(print (main  `(1 2 (1 2 (1) 5 (1 5))) 1 `(0 0)))
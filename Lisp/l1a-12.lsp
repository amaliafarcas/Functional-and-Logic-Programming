;d
;Write a function to return T if a list has an even number of elements on the first level, and NIL on the contrary case, without counting the elements of the list.

(defun funct (l c)
    (cond
        ((and (null (cdr l)) (= c 1)) nil)
        ((and (null (Cdr l)) (= c 0)) t)
        ((= c 1)) (funct (Cdr l) 0)
        ((= c 0)) (funct (Cdr l) 1)
    )
)

(defun main (l) (funct (cdr l) 1))

(print (main `(1 2 3)))

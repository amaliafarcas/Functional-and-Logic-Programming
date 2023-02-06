; . Write a function that produces the linear list of all atoms of a given list, from all levels, and written in the same order. 
(defun funct (l)
	(cond
		((atom l) (list l))
		((listp l) (mapcan #'(lambda(a) (funct a)) l))
	)
)

(print (funct '(1 (2 3) (4 ( 5 6)))))


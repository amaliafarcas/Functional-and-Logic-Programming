;nth element of a list
(defun NthElem (l n)
    (cond
        ( (null l) nil)
        ( (= n 1) (car l))
        ( t (NthElem (cdr l) (- n 1)))
    )
)

(print (NthElem `(1 2 3 5 4) 4))


;atom is member
(defun isMember (l e)
    (cond
        ( (null l) nil)
        ( (listp (Car l)) (isMember (car l) e))
        ( (= e (car l)) e)
        ( t (isMember (cdr l) e))
    )
)

(print (isMember `(1 (2 3) 5 7) 4))



;list of all sublists
(defun listOfSubl (l)
    (cond
        ( (atom l) nil)
        ( t (apply 'append (list l) (mapcar 'listOfSubl l)))
    )
)

(print (listOfSubl `(1 2 (3 (4 5)(6 7)) 8 (9 10))))



;linear list into set
(defun isInList (l e)
    (cond
        ( (null l) nil)
        ( (= (car l) e) e)
        ( t (isInList (cdr l) e))
    )
)


(defun ListToSet (l)
    (cond
        ( (null l) nil)
        ( (null (isInList (cdr l) (car l))) (cons (Car l) (ListToSet (cdr l))))
        ( t (ListToSet (cdr l)))
    )
)

(print (ListToSet `(1 1 1 5 2 8 4  5 4  5 5)))

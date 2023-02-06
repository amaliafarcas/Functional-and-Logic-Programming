;a
;dotProd(l1 ... ln, p1 ... pn) = 0 , n == 0 or k == 0
;				l1*p1 + dotProd(l2 ... ln, p2 ... pn), oth


(defun dotProd (l1 l2)
    (cond
        ( (and (null l1) (null l2) 0))
        ( t (+ (* (car l1) (car l2)) (dotProd (cdr l1) (cdr l2)
                                    )
            )
        )
    )
)

(print(dotProd `(2 2) `(2 1)))





;b
;depthList(l1 .. ln) = 1 , n == 0
;		       max( depthList(l1) + 1, depthList(l2 ... ln)) , l1 -list
;		       depthList(l2 ... ln), oth


(defun depthList(l)
    (cond
        ( (null l) 1)
        ( (listp (car l))  (max (+ 1(depthList (car l))) (depthList (cdr l))
                            )
        )
        (t (depthList (cdr l)))
    )
)

(print(depthList `(1 (2 (2)) 2)
        )
)




;c
;insertCorrectPos(l1 ... ln, e) = {e} , n == 0
;				  l, l1 == e
;				  l1 U insertCorrectPos(l2 ... ln, e), oth

(defun insertCorrectPos (l e)
    (cond
        ((null l) (list e))
        ((equal (car l) e) l)
        ((< e (car l)) (cons e l))
        (T (cons (car l) (insertCorrectPos (cdr l) e)))
    )
)


;sortList(l1 ... ln) = null, n == 0
;		       insertCorrectPos (sortList(l2 ... ln), l1), oth

(defun sortList (l)
    (cond
        ((null l) nil)
        (T (insertCorrectPos (sortList (cdr l)) (car l)))
    )
)

(print (sortList '(1 3 2 5 6 7 7 3 9)))





;d
;contains(l1 ... ln, e) = false, n==0
;			  true, l1 == e
;			  contains(l2 ... ln, e)


(defun contains (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) T)
        (T (contains (cdr l) e))
     )
)

;intersectionSets(l1 ... ln, p1 ... pk) = null, n == 0 or k == 0
;					  l1 U intersectionSets(l2 ... ln, p1 ... pk), l1 in p
;					  intersectionSets(l2 ... ln, p1 ... pk), oth

(defun intersectionSets (l p)
    (cond
        ((or (null l) (null p)) nil)
        ((contains p (car l)) (cons (car l) (intersectionSets (cdr l) p)))
        (T (intersectionSets (cdr l) p))
    )
)

(print (intersectionSets '(1 2 3 4 5) '(1 5 6 7 9)))
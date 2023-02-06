;a
;insert into a linear list
(defun insert_el (l e p)
    (cond
        ((null l) nil)
        ((equal (mod p 2) 0) (cons (car l) (cons e (insert_el (cdr l) e (+ p 1)))))
        (T (cons (car l) (insert_el (cdr l) e (+ p 1))))
    )
)

(defun main (l e) (insert_el l e 1))

(print (main `(1 2 3 4 5 6) 0))




;b
;insert into a linear list

(defun revList (l)
    (cond
        ((null l) nil)
        ( (listp (car l)) (append (revList (cdr l)) (revList (car l))))
        (T (append (revList (cdr l)) (list (car l))))
    )
)

(print (revList `(1 (2 3) 4 (5 6))))




;c
;cmmdc non-linear list

(defun cmmdc (x1 x2)
    (cond
        ((= x1 x2) x1)
        ((< x1 x2) (cmmdc x1 (- x2 x1)))
        ( t ( cmmdc (- x1 x2) x2))
    )
)

(defun cmmdcL (l)
    (cond
        ((and (atom (car l)) (null (cdr l))) (car l))
        ( (listp (car l)) (cmmdc (cmmdcL (car l)) (cmmdcL (cdr l))  ))
        (T (cmmdc (car l) (cmmdcL (cdr l))))
    )
)

(print (cmmdcL `(2 (8 6) (20 44) 100 30)))




;d
;nr of occ non-linear list

(defun nrOcc (l e c)
    (cond
        ( (null l) c)
        ((listp (car l)) (nrOcc (cdr l) e (+ c (nrOcc (car l) e 0))))
        ( (= (car l) e) (nrOcc (cdr l) e (+ c 1)))
        ( t (nrOcc (cdr l) e c))
    )
)

(defun main (l e) (nrOcc l e 0)
)

(print (main `(2 (8 6) (2 44) 100 2) 2))
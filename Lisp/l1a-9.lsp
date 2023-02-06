;a
;Write a function that merges two sorted linear lists and keeps double values.

(defun funct (l1 l2)
    (cond
        ((and (null l1) (null l2)) nil)
        ((null l1) l2)
        ((null l2) l1)
        ((= (Car l1) (Car l2))  (append (list (car l1)) (append (list (car l2)) (funct (cdr l1) (cdr l2)))))
        ((< (Car l1) (Car l2)) (append (list (car l1)) (funct (cdr l1) l2)))
        ((> (Car l1) (Car l2)) (append (list (car l2)) (funct l1 (cdr l2))))
    )
)

(print (funct `(1 2 4 5 6) `(1 2 3 4 7 8)))




;b
;Write a function to replace an element E by all elements of a list L1 at all levels of a given list L.

(defun funct (l e s)
    (cond
        ((null l) nil)
        ((listp (Car l))  (append (list(funct (Car l) e s)) (funct (cdr l) e s)))
        ((= (Car l) e) (append s (funct (cdr l) e s)))
        (t (append (list (car l)) (funct (cdr l) e s)))
    )
)

(print (funct '(1 2 3 (3 4 5) ((3) 3)) 3 '(0 0)))





;c
;Write  a  function  to  determines  the  sum  of  two  numbers  in  list  representation,  and  returns  the corresponding  decimal  number, without  transforming  the  representation  of  the  number  from  list  to number.

(defun digit (l k c)
    (cond
        ((null l) (mod (+ k c) 10))
        ((null k) (mod (+ l c) 10))
        (T (mod (+ l k c) 10))
    )
)

(print (digit nil 9 1))
;=> 0

(defun carry (l k c)
    (cond
        ((null l) (if (> (- (+ k c) (mod (+ k c) 10)) 9) 
                      (/ (- (+ k c) (mod (+ k c) 10)) 10) 
                      (mod (+ k c) 10)
                  )
        )
        ((null k) (if (> (- (+ l c) (mod (+ l c) 10)) 9)
                      (/ (- (+ l c) (mod (+ l c) 10)) 10) 
                      (mod (+ l c) 10)
                  )
        )
        (T (if (> (- (+ l k c) (mod (+ l k c) 10)) 9)
                      (/ (- (+ l k c) (mod (+ l k c) 10)) 10) 
                      (mod (+ l k c) 10)
                  )
        )
    )
)

(print (carry 9 nil 1))
;=> 1

(defun my_append (l k)
    (if (null l) 
        k
        (cons (car l) (my_append (cdr l) k))
    )
)

(defun my_reverse (l)
    (cond
        ((null l) nil)
        ((listp (car l)) (my_append (my_reverse (cdr l)) (list (my_reverse (car l)))))
        (T (my_append (my_reverse (cdr l)) (list (car l))))
    )
)

(defun sumList (l k c)
    (cond
        ((and (null l) (null k)) (if (= 1 c) (list 1) nil))
        (T (my_append (sumList (cdr l) (cdr k) (carry (car l) (car k) c)) (list (digit (car l) (car k) c))))        
    )
)

(defun solve (l k)
    (sumList (my_reverse l) (my_reverse k) 0)
)

(print (solve '(9 9) '(1 2)))


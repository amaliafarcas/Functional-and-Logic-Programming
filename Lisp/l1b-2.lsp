; 2. Return the list of nodes on the k-th level of a tree of type (1).

;A binary tree of type(1) is memorised in the following way:
;    (node no-subtrees list-subtree-1 list-subtree-2 ...)

;As an example, the tree
;      A
;    / \
;   B  C
;      / \
;     D   E
;  is represented as follows:
;    (A 2 B 0 C 2 D 0 E 0)  (1)


;function to traverse the left subtree
;traverse_left(l1..ln, nrVertices, nrEgdes)=0, l is empty
;                                          0, nrVertices=nrEdges+1
;                                          l1+l2+traverse_left(l3..ln,                                                nrVertices+1, nrEdges+l2), otherwise

(defun traverse_left(arb nrVertices nrEdges)
   (cond
       ((null arb) nil)
       ((= nrVertices (+ 1 nrEdges)) nil)
       (T (cons (car arb) (cons (cadr arb) (traverse_left (cddr arb) ( + 1 nrVertices) (+ (cadr arb) nrEdges)) )))
   )
)

(defun left (arb)
    (traverse_left(cddr arb) 0 0)
)


;function to traverse the right subtree
;traverse_right(l1...ln,nrVertices, nrEdges) = 0, l is empty
;                                             l, nrVertices=nrEdges+1
;                                             traverse_right(l3...ln, nrVertices+1, nrEdges+l2), otherwise


(defun traverse_right(arb nrVertices nrEdges)
    (cond
        ((null arb ) nil)
        ((= nrVertices (+ 1 nrEdges)) arb)
        (T (traverse_right (cddr arb) (+ 1 nrVertices) (+(cadr arb) nrEdges)))
    )
)

(defun right(arb)
    (traverse_right(cddr arb) 0 0)
)


;my_append(l1...ln, a1...am)=a1...am, if l=[]
;                            l1 + my_append(l2..ln, a1...am), otherwise


(defun my_append (list1 list2)
   (cond
       ((null list1) list2)
       (T (cons (car list1) (my_append (cdr list1) list2)))
   )
)


;kthLevel(l1..ln, level, k) = nil, tree is empty
;                           l1, level=k
;                           kthLevel(left(l1...ln),level+1,k) + kthLevel(right(l1..ln), level+1, k), otherwise


(defun kthLevel (tree level k)
   (cond
       ((null tree) nil)
       ((equal level k) (list (car tree)))
       (T (my_append (kthLevel (left tree) (+ 1 level) k) (kthLevel (right tree) (+ 1 level) k) ))
   )
)

(print (kthLevel '(A 2 B 2 D 2 G 0 H 0 E 1 I 0 C 1 F 2 J 1 L 0 K 0) 0 3)) 

; Write a function to determine the depth of a list.

(defun searching (l level)
    (cond
        ((atom l) level)
        ((listp l) (apply #'max (mapcar #'(lambda(s) (searching s (+ level 1))) l)))
    )
)


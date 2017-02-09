;; taken from http://d.hatena.ne.jp/satosystems/20120705/1341492063
;; read S-expression and extract if function

(define extract-sexp
  (lambda (filename)
	(with-input-from-file filename
	  (lambda ()
		(let loop ((buff '()) (s (read)))
		  (if (eof-object? s)
			  (reverse buff)
			  (loop (cons s buff) (read))))))))

(define extract-if
  (lambda (lst)
	(let ((buff '()))
	  (if (null? lst)
		  '()
		  (let loop ((head (car lst)) (tail (cdr lst)))
			(if (and (not (null? head)) (list? head))
				(if (equal? (car head) 'if)
					(begin
					  (set! buff (cons head buff))
					  (loop (car head) (cdr head))
					  (if (not (null? tail))
						  (loop (car tail) (cdr tail))))

					(loop (car head) (cdr head))))
			(if (null? tail)
				(reverse buff)
				(loop (car tail) (cdr tail))))))))

; Data format:
; (latin-name "")
; (common-name "")
; (image "")
; (wiki-link "")
; (habitat "")
; (thornsp "")
; (firp "")

;'habitat' is ill-defined at the moment:
; upland/downland/forest/scrub/

; I could probably use a macro here:
(defun make-hash (&rest lis)
  "Takes in lists of '(key value) and returns a hash table with them inserted"
  (if (not lis)
      nil
      (let ((hash (make-hash-table)))
        (map nil
          #'(lambda (l)
              (setf (gethash (car l) hash)
                    (car (cdr l))))
          lis)
      hash)))

(defun make-hash-list (name &rest value-list) ; this reserves the right /not/ to work
  "Returns a list of hashes each init'd to the keys/vals in the input lists"
  (let ((return-value (list nil)))
    (map nil
      #'(lambda (l)
          (print l))
          ; (setf return-value
          ;       (append return-value
          ;               (make-hash l))))
      value-list)
    (defvar name return-value)))

(make-hash-list *plants-hash*
                '((latin-name   "Atropa Belladonna")
                  (common-name  "deadly nightshade")
                  (image        "https://upload.wikimedia.org/wikipedia/commons/b/b7/Atropa_belladonna_-_K%C3%B6hler%E2%80%93s_Medizinal-Pflanzen-018.jpg")
                  (wiki-link    "https://en.wikipedia.org/wiki/Atropa_belladonna")
                  (habitat      "scrub")
                  (thornsp      "no")
                  (firp         "no"))

                '((latin-name   "Chelidonium majus")
                  (common-name  "greater celandine")
                  (image        "https://en.wikipedia.org/wiki/Chelidonium#/media/File:Chelidonium_majus_-_K%C3%B6hler%E2%80%93s_Medizinal-Pflanzen-033.jpg")
                  (wiki-link    "https://en.wikipedia.org/wiki/Chelidonium")
                  (habitat      "upland")
                  (thornsp      "no")
                  (firp         "no")))

; (make-hash-list '*test* '((foo 22) (bar 33)) '((foo 1) (bar 2)))

(defun search-hash-list (lis key val)
  

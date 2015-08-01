; (load "data.lisp")
(defvar *dummy-response* "{{\"latin-name\": \"Atropa Belladonna\", \"common-name\": \"deadly nightshade\", \"image\": \"http://foo.com/img.png\", \"wiki-link\": \"http://wiki.foo/nightshade.html\", \"habitat\": ~a, \"thornsp\": ~a, \"firp\": ~a}}")

(defun boolean-to-json (var)
  (if var
      "true"
      "false"))

(hunchentoot:define-easy-handler (dummy :uri "/dummy")
                                 (habitat thornsp firp common-name)
  0
  (setf (hunchentoot:content-type*) "text/plain")
  (setf thornsp (boolean-to-json thornsp))
  (setf firp (boolean-to-json firp))
  (if (not habitat)
      (setf habitat "\"\""))
  (format nil *dummy-response* habitat thornsp firp))

(hunchentoot:define-easy-handler (say-hello :uri "/index")
                                 (habitat thornsp firp common-name)
  0
  (setf (hunchentoot:content-type*) "text/plain")
  (format nil "~A ~B ~C ~D" habitat thornsp firp common-name))

(defun 

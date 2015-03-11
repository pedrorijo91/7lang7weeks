(defmacro unless [test body else-body]
	(list 'if (list 'not test) body else-body))

(defprotocol Proto
	(funct [x]))

(defrecord Rec [y]
	Proto
	(funct [_] (println (str "Y is " y))))

(defn test2 []
  (println "testing day 2 @ Clojure")
  (unless (> 3 4) (println "right ans") (println "wrong ans"))
  (unless true (println "wrong ans") (println "right ans"))
  (unless false (println "right ans") (println "wrong ans"))
  (def rrrr (Rec. 4))
  (funct rrrr))
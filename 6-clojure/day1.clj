(defn big [st n] 
	(> (count st) n))

(defn collection-type [col]
	(cond
		(list? col) :list
    	(vector? col) :vector
    	(set? col) :set
    	(map? col) :map))

(defn test1 []
  (println "testing day 1 @ Clojure")
  (println (big "Helloo, World!" 2))
  (println (big "Helloo, World!" 20))
  (println (collection-type '()))
  (println (collection-type []))
  (println (collection-type #{}))
  (println (collection-type {})))
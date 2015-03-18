(def accounts (ref []))         ; Vector of accounts.
 
(defn open-account [init]
  "Add a new account to our vector with starting value [init]."
	(dosync 
		(alter accounts conj init))); Alter a ref inside (dosync). Alter a ref directly with alter.

(defn debit [account ammount]
  "Remove [amount] from [account]. [account] is the index in accounts."
	(dosync 
    ; Uses a macro to define an anonymous function to subtract [amount] from the proper [account].
    ; `#` starts the macro and %1 is the second argument to the function.
		(alter accounts 
      #(assoc %1 account (- (get %1 account) ammount)))))
(defn credit [account ammount] 
  "Add [amount] to [account]. [account] is the index in accounts."
	(dosync 
		(alter accounts 
      ; Similar to debt. Uses an anonymous function (macro) to add [amount] to the [account].
      #(assoc %1 account (+ ammount (get %1 account))))))

(defn test3 []
  (open-account 6) (open-account 5)     ; Open two accounts, then do a couple transactions while double
  (println "[6 5] ?=" @accounts)        ; checking the account balances.
  (debit 0 2) (debit 1 2)
  (println "[4 3] ?=" @accounts)
  (credit 0 -2) (credit 1 -2)
  (println "[2 1] ?=" @accounts))

     
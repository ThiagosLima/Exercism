(ns bob)

(defn question?
  "Take a string, if it is a question return true, otherwise false"
  [string]
  (= \? (last (clojure.string/trim string))))

(defn phrase?
  "Take a string, return if it is a valid phrase"
  [string]
  (seq (filter #(Character/isLetter %) string)))

(defn yell?
  "Take a string, if it is an yell return true, otherwise false"
  [string]
  (if-let [validated-string (phrase? string)]
    (every? #(Character/isUpperCase %) validated-string)
    false))

(defn response-for
  "Exercism - Bob"
  [string]
  (cond
    (clojure.string/blank? string) "Fine. Be that way!"
    (and (question? string) (yell? string)) "Calm down, I know what I'm doing!"
    (yell? string) "Whoa, chill out!"
    (question? string) "Sure."
    :else "Whatever."))

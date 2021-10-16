(ns cars-assemble)

(def base-production 221)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (cond 
    (=  speed 0) 0.0
    (<= speed 4) (* base-production speed 1.0)
    (<= speed 8) (* base-production speed 0.9)
    (=  speed 9) (* base-production speed 0.8)
    (= speed 10) (* base-production speed 0.77)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))

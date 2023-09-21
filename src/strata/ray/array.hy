(import strata.ray.applicative :as sra)
(require hyrule.anaphoric [ap-reduce])
(require hyrule.collections [s])

(defclass Array []
  "A class representing an array of data slices operated with help from an applicative functor"

  (defn __init__ [self app xs]
    (do
      (setv self.app app)
      (setv self.shapefn (.pure self.app (fn [arr] arr.shape)))
      (setv self.reduce-shape-fn (fn [it acc]))
      (setv self.data (lfor x xs y (.pure self.app x) y))))


  (defn shape [self]
    "Returns the shape of the array"
    (.ap self.app self.shapefn self.data)))

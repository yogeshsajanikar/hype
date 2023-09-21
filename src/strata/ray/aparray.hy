(import strata.ray.applicative :as sra)
(require hyrule [ap-reduce ncut])

(defn compare-shapes [x y]
  (do
    (setv lx (len x) ly (len y))
    (if (= lx ly)
      (if (> lx 0)
          (do
            (setv xr (ncut x 1:) yr (ncut y 1:) xp (. x [0]) yp (. y [0]))
            (if (= xp yp) (compare-shapes xr yr) False))
          True)
      False)))

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

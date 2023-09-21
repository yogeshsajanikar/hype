(import hype.types :as ht)
(import ray)



(defclass RayFunctor [ht.Functor]
  "A functor that takes a ray object and returns an another ray object."

  (defn __init__ [self]
    (do
      (.__init__ (super))
      None))


  (defn fmap [self f r]
    (do
      (setv fr (.remote ray f))
      (.remote fr r))))


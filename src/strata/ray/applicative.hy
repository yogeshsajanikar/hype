(import hype.types :as ht
        strata.ray.functor :as hrf
        ray)

(defclass RayApplicative [hrf.RayFunctor ht.Applicative]
  "An applicative built over ray object ref"

  (defn pure [self x]
    (if (callable x)
      (.remote ray x)
      (.put ray x)))

  (defn ap [self fab fa]
    "Applies the function in `fab` to the value in the ray object-ref `fa`"
    (.remote fab fa)))

;; An applicative where a list of object refs are inducted into the applicative functor.
;; This is semantically similar to List of numpy arrays
(defclass ListRayApplicative [ht.Applicative]

  (defn __init__ [self]
    (do
      (setv self.lstA (ht.ListApplicative))
      (setv self.rayA (RayApplicative))))

  (defn pure [self x]
    (.pure self.lstA (.pure self.rayA x)))

  (defn ap [self fabs fas]
    "Applies the function in `fab` to the value in the ray object-ref `fa`"
    (lfor
     fab fabs
     fa fas
     (.ap self.rayA fab fa))))

;; List of numpy arrays embedded in an applicative functor
(defclass ListNumpyApplicative [ht.Applicative]
  (defn __init__ [self]
    (do
      (setv self.lstA (ht.ListApplicative))))

  (defn pure [self x]
    (.pure self.lstA x))

  (defn ap [self fabs fas]
    "Applies the function in `fab` to the value in the ray object-ref `fa`"
    (.ap self.lstA fabs fas)))

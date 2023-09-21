(import hype.types :as ht
        hype.ray.functor :as hrf
        ray)


(defclass RayApplicative [hrf.RayFunctor ht.Applicative]

  (defn pure [self x]
    (if (callable x)
      (.remote ray x)
      (.put ray x)))

  (defn ap [self fab fa]
    "Applies the function in `fab` to the value in the ray object-ref `fa`"
    (.remote fab fa)))


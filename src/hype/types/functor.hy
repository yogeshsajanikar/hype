

(defclass Functor []
  "A Functor is a type that can be mapped over."

  (defn __init__ [self]
    "Initialize a Functor.")

  (defn fmap [self f d]
    "Map a function `f` over a Functor with input `d`."
    (raise NotImplementedError)))



(defclass ListFunctor [Functor]
  "A ListFunctor is a Functor that is a list."

  (defn __init__ [self])

  (defn fmap [self f d]
    (lfor x d (f x))))


(defclass GFunctor [Functor]
  "A GFunctor is a Functor that is a generator."

  (defn __init__ [self])

  (defn fmap [self f d]
    (gfor x d (f x))))


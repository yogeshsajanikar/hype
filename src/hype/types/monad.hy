(import 
 hype.types.functor :as f 
 hype.types.applicative :as a)



(defclass Monad [a.Applicative]
  "Monads are functors that support bind and return."
  (defn __init__ [self]
    (.__init__ (super) ))
  
  (defn mreturn [self a]
    "Return a value in a monad."
    (self.pure a)
    )

  (defn mbind [self m f]
    "Bind a monadic value to a function."
    )
  
)


(defclass ListMonad [a.ListApplicative Monad]

  (defn __init__ [self]
    (.__init__ (super) (f.ListFunctor)))


  (defn mreturn [self a] (self.pure a))

  (defn mbind [self m f]
    (lfor 
     x m 
     y (f x)
     y ))
)


(defclass GMonad [a.GApplicative Monad]

  (defn __init__ [self]
    (.__init__ (super)))
  

    (defn mreturn [self a] (self.pure a))
  

    (defn mbind [self m f]
        (gfor 
         x m 
         y (f x)
         y))
        
  )

   
;   (return [a] -> (m a))
;   (bind [a b] -> (m a) -> (a -> (m b)) -> (m b)))
;   
;   
;   (m/do* )
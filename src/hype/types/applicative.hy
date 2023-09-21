(import hype.types.functor :as f)
(require hyrule.anaphoric [ap-reduce])

(defclass Applicative [f.Functor]
  "Applicative Functor"

  (defn __init__ [self] (.__init__ (super)))


  (defn pure [self x]
    "pure :: a -> f a")


  (defn ap [self f m]
    " ap :: f (a -> b) -> f a -> f b"))



(defclass ListApplicative [f.ListFunctor Applicative]
  "List Applicative Functor"

  (defn __init__ [self]
    (.__init__ (super)))

  (defn pure [self x]  [x])


  (defn ap [self fs ms]
    " ap :: f (a -> b) -> f a -> f b"
    (lfor
     f fs
     m ms
     (f m))))


(defclass GApplicative [f.GFunctor Applicative]
  "GApplicative Functor"

  (defn __init__ [self]
    (.__init__ (super)))

  (defn pure [self x] (gfor y [x] y))

  (defn ap [self fs ms]
    " ap :: f (a -> b) -> f a -> f b"
    (gfor
     f fs
     m ms
     (f m))))


(defclass ApplicativeStack [Applicative]

  (defn __init__ [self apps]
    (setv self.apps apps))


  (defn pure [self x]
    (ap-reduce (it.pure acc) self.apps x))


  (defn ap [self f m]
    " ap :: f (a -> b) -> f a -> f b"
    (.ap (. self.apps [-1]) m)))


;; Suppose I have a list of remote functions and I have to apply it on top of a list of remote values
;; I can use the applicative stack to do that. How do I apply it. 
;; 
;; (defn ap [fn1 fn2] [x1 x2 x3]) ==>
;; (defn ap [fn1 x1 fn1 x2 fn1 x3 fn2 x1 fn2 x2 fn2 x3]) <== This is a result of applying top applicative
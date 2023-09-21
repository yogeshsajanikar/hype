"""
The ray module contains the type classes and instances for the Ray. 
"""

from .functor import RayFunctor
from .applicative import RayApplicative


__all__ = [RayFunctor, RayApplicative]

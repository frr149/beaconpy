"""
beaconpy - A Python Observer Pattern Implementation

This module provides a Beacon class that implements the observer pattern,
allowing objects to register callbacks that will be notified when the state changes.
"""

from .beacon import (
    Beacon,
    BaseCallbackWrapper,
    FunctionalCallbackWrapper,
    ClassMethodWrapper,
    InstanceMethodWrapper,
    ErrorMessages
)

__version__ = "0.1.0"
__all__ = [
    "Beacon",
    "BaseCallbackWrapper",
    "FunctionalCallbackWrapper",
    "ClassMethodWrapper",
    "InstanceMethodWrapper",
    "ErrorMessages"
] 
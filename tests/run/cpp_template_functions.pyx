# tag: cpp

from libcpp.pair cimport pair

cdef extern from "cpp_template_functions_helper.h":
    cdef T one_param[T](T)
    cdef pair[T, U] two_params[T, U](T, U)
    cdef cppclass A[T]:
        pair[T, U] method[U](T, U)

def test_one_param(int x):
    """
    >>> test_one_param(3)
    (3, 3.0)
    """
    return one_param[int](x), one_param[double](x)

def test_two_params(int x, int y):
    """
    >>> test_two_params(1, 2)
    (1, 2.0)
    """
    return two_params[int, double](x, y)

def test_method(int x, int y):
    """
    >>> test_method(5, 10)
    ((5, 10.0), (5.0, 10))
    """
    cdef A[int] a_int
    cdef A[double] a_double
    return a_int.method[float](x, y), a_double.method[int](x, y)
#    return a_int.method[double](x, y), a_double.method[int](x, y)
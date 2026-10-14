# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the once procedure `f` is a once-per-object. So it will be executed
each time the creation procedure `make` is used to create an object. Therefore
the attribute `b` of attached type, with is set in `f`, is initialized before the
end of the creation procedure of class `AA`. In this test `VEVI` is not violated.

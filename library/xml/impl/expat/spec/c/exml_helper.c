#include "exml_helper.h"


EIF_POINTER ptr_contents (EIF_POINTER ptr)
{
  return *((void**)ptr);
}

EIF_POINTER ptr_move (EIF_POINTER ptr, EIF_INTEGER pos)
{
  return ( (void*) (((int*)ptr) + pos));
}

class
   XT_NAMESPACE
inherit
   XI_NAMESPACE
   XT_NODE
   C_STRING_HELPER
creation
   make_from_c

feature {NONE} -- Initialisation
   make_from_c (prefix_ptr, uri_ptr: POINTER) is
      require
	 prefix_ptr_not_void prefix_ptr /= Void
	 uri_ptr_not_void: uri_ptr /= Void
      do
	 !! ns_prefix.make_from_utf8 (make_string_from_c_zero_terminated_string (prefix_ptr))
	 !! uri.make_from_utf8 (make_string_from_c_zero_terminated_string (uri_ptr))
      end

feature {ANY} -- Access   
   ns_prefix: UC_STRING
   uri: UC_STRING
      
end
   
   

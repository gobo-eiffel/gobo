deferred class
   XI_NAMESPACE
inherit
   DP_IMPLEMENTATION
feature
   ns_prefix: UC_STRING is
      deferred
      end
   
   uri: UC_STRING is
      deferred
      end
invariant
   either_uri_not_void_or_prefix: (uri = Void implies ns_prefix /= Void) and (ns_prefix = Void implies uri /= Void)
end
	 

deferred class
   XM_POSITION
inherit
   ANY
      redefine
	 out
      end
feature {ANY}
   source: XM_SOURCE is
      deferred
      end
   out: STRING is
      do
	 Result := clone (source.out)
      end
invariant
   source_not_void: source /= Void
end

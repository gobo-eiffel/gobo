
indexing

	description: 
	
		"Source of XML document type definiton event callbacks"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_DTD_CALLBACKS_SOURCE

feature

	set_dtd_callbacks (a: XM_DTD_CALLBACKS) is
			-- Client will receive callbacks to.
		require
			not_void: a /= Void
		deferred
		end

end

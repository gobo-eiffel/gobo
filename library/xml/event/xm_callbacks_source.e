
indexing

	description: 
	
		"Source of XML event callbacks"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_CALLBACKS_SOURCE

feature

	set_callbacks (a: XM_CALLBACKS) is
			-- Client will receive callbacks to.
		require
			not_void: a /= Void
		deferred
		end

end

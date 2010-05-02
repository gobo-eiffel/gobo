note

	description:

		"Source of XML event callbacks"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_CALLBACKS_SOURCE

feature

	set_callbacks (a_callback: XM_CALLBACKS)
			-- Client will receive callbacks to.
		require
			a_callback_not_void: a_callback /= Void
		deferred
		end

end

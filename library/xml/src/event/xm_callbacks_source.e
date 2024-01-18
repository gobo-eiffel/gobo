note

	description:

		"Source of XML event callbacks"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"

deferred class XM_CALLBACKS_SOURCE

feature -- Setting

	set_callbacks (a_callback: XM_CALLBACKS)
			-- Client will receive callbacks to.
		require
			a_callback_not_void: a_callback /= Void
		deferred
		end

feature {NONE} -- Implementation

	null_callbacks: XM_CALLBACKS_NULL
			-- Null callbacks
		do
			create Result.make
		ensure
			null_callbacks_not_void: Result /= Void
		end

end

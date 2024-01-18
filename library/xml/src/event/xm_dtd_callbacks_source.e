note

	description:

		"Source of XML document type definiton event callbacks"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"

deferred class XM_DTD_CALLBACKS_SOURCE

feature -- Setting

	set_dtd_callbacks (a_callback: XM_DTD_CALLBACKS)
			-- Client will receive callbacks to.
		require
			a_callback_not_void: a_callback /= Void
		deferred
		end

feature {NONE} -- Implementation

	null_dtd_callbacks: XM_DTD_CALLBACKS_NULL
			-- Null DTD callbacks
		do
			create Result.make
		ensure
			null_dtd_callbacks_not_void: Result /= Void
		end

end

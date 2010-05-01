note
	description: "[
		Ancestor of all exception classes.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	EXCEPTION

feature -- Raise

	raise
			-- Raise current exception
		do
-- TODO
		end

feature -- Access

	code: INTEGER
			-- Code of the exception.
		do
		end

	message: ?STRING
			-- Message(Tag) of current exception

	exception_trace: STRING is
			-- String representation of current exception trace
		do
-- TODO
			Result := ""
		end

	frozen original: EXCEPTION
			-- The original exception directly triggered current exception
		do
-- TODO
			Result := Current
		ensure
			original_not_void: Result /= Void
		end

feature -- Status settings

	set_message (a_message: like message)
			-- Set `message' with `a_message'.
		do
-- TODO
		end

feature {NONE} -- Implementation

	internal_meaning: STRING
			-- Internal `meaning'
		once
			Result := "General exception."
		end

end

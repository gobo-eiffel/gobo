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

	tag: IMMUTABLE_STRING_32
			-- A short message describing what current exception is
		once
			create Result.make_from_string_8 ("General exception")
		end

	message: detachable STRING
			-- Message of current exception
		do
		end


	description: detachable READABLE_STRING_GENERAL
			-- Detailed description of current exception
		do
		end

	exception_trace: detachable STRING
			-- String representation of current exception trace
		do
-- TODO
			Result := ""
		end

	code: INTEGER
			-- Code of the exception.
		do
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

	set_description (a_description: detachable READABLE_STRING_GENERAL)
			-- Set `description' with `a_description'.
		do
-- TODO
		end

end

indexing

	description:

		"Interface for exception handling"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_EXCEPTIONS

feature -- Status report

	exception_trace: STRING is
			-- String representation of the exception trace;
			-- Note that the string may be Void or always return
			-- the same object depending on the implementation.
		deferred
		end

	is_developer_exception_of_name (name: STRING): BOOLEAN is
			-- Is the last exception originally due to a developer
			-- exception of name `name'?
		deferred
		end

feature -- Status setting

	raise (a_name: STRING) is
			-- Raise a developer exception of name `a_name'.
		deferred
		end

	die (a_code: INTEGER) is
			-- Terminate execution with exit status `a_code',
			-- without triggering an exception.
		deferred
		end

end

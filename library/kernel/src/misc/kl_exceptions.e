note

	description:

		"Exception handling"

	usage: "[
		This class should not be used directly through
		inheritance and client/supplier relationship.
		Inherit from KL_SHARED_EXCEPTIONS instead.
	]"
	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_EXCEPTIONS

inherit

	KI_EXCEPTIONS

	EXCEPTIONS
		rename
			die as exceptions_die
		export
			{NONE} all
		end

feature -- Status setting

	die (a_code: INTEGER)
			-- Terminate execution with exit status `a_code',
			-- without triggering an exception.
		do
			exceptions_die (a_code)
		end

end

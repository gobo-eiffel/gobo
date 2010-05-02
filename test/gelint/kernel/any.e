note

	description:

		"Dummy class ANY used by gelint tests."

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "MIT License"
	date:       "$Date$"
	revision:   "$Revision$"

class ANY

inherit

	GENERAL

feature -- Access

	generating_type: STRING
		do
		end

	generator: STRING
		do
		end

feature -- Output

	print (an_object: ANY)
		do
		end

end -- class ANY

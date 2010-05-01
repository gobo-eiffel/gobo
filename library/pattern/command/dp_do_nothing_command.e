note

	description:

		"Commands that do nothing"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DP_DO_NOTHING_COMMAND

inherit

	DP_COMMAND

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new command.
		do
		end

feature -- Execution

	execute is
			-- Execute current command.
		do
				-- Do nothing.
		end

end

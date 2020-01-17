note

	description:

		"ECF error handlers with agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_AGENT_ERROR_HANDLER

inherit

	ET_ECF_ERROR_HANDLER
		redefine
			make_standard, make_null,
			report_error_message
		end

create

	make_standard, make_null

feature {NONE} -- Initialization

	make_standard
			-- Create a new error handler using the standard
			-- error file for error and warning reporting
			-- and the standard output file for info messages.
		do
			Precursor
			create error_message_actions
		end

	make_null
			-- Create a new error handler ignoring
			-- all error, warning and info messages.
		do
			Precursor
			create error_message_actions
		end

feature -- Error messages

	report_error_message (a_error: STRING)
			-- Report `an_error'.
		do
			error_count := error_count + 1
			error_message_actions.call ([a_error])
		end

	error_message_actions: ACTION_SEQUENCE [TUPLE [STRING]]
			-- Actions to be executed when `report_error_message'
			-- is called

invariant

	error_message_actions_not_void: error_message_actions /= Void

end

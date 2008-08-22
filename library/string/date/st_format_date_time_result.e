indexing

	description:

		"[
        Results from {ST_XSLT_FORMAT_DATE_TIME}.format_date_time .
        Either a formatted string or an error.
       ]"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_FORMAT_DATE_TIME_RESULT

create

	make, make_error

feature {NONE} -- Initialization

	make (a_value: STRING) is
			-- Initialize `Current' with formatted value.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			no_error: not is_error
			value_set: value = a_value
		end

	make_error (a_message, a_code: STRING) is
			-- Initialize `Current' with error.
		require
			a_code_not_void: a_code /= Void
			a_message_not_void: a_message /= Void
		do
			code := a_code
			message := a_message
			is_error := True
		ensure
			error_status_set: is_error
			code_set: code = a_code
			message_set: message = a_message
		end

feature -- Access

	value: STRING
			-- Formatted value

	message: STRING
			-- Error message

	code: STRING
			-- XSLT error code

feature -- Status report

	is_error: BOOLEAN
			-- Does `Current' represent an error message?

invariant

	code_not_void_on_error: is_error implies code /= Void
	message_not_void_on_error: is_error implies message /= Void
	no_error_implies_value_not_void: not is_error implies value /= Void
	error_implies_void_value: is_error implies value = Void
	no_error_implies_void_code_and_message: not is_error implies (message = Void and code = Void)

end

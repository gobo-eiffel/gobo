indexing

	description:

		"Objects that represent an entry on the local stack"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_STACK_FRAME_ENTRY

creation

	make, make_parameter_set

feature {NONE} -- Initialization

	make_parameter_set (a_parameter_set: XM_XSLT_PARAMETER_SET) is
			-- Create a parameter set entry.
		require
			parameter_set_not_void: a_parameter_set /= Void
		do
			parameter_set := a_parameter_set
			is_parameter_set := True
		ensure
			parameter_set_set: parameter_set = a_parameter_set
		end

	make (a_value: XM_XPATH_VALUE) is
			-- Create a value entry.
		require
			value_not_void: a_value /= Void
		do
			value := a_value
			is_value := True
		ensure
			value_set: value = a_value
		end

feature -- Access

	parameter_set: XM_XSLT_PARAMETER_SET
			-- Parameter set

	value: XM_XPATH_VALUE

feature -- Status report

	is_parameter_set: BOOLEAN
			-- Is `Current' a wrapper for a parameter set?

	is_value: BOOLEAN
			-- Is `Current' a wrapper for a value?

invariant

	only_one_type: is_parameter_set xor is_value
	value: is_value implies value /= Void and then parameter_set = Void
	parameter_set: is_parameter_set implies value = Void and then parameter_set /= Void

end

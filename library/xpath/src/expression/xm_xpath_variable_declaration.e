note

	description:

	"Variable declarations in the static context of an XPath expression."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_VARIABLE_DECLARATION

feature -- Access

	variable_name: STRING
			-- Name of variable;
			-- For use in diagnostics - lexically, a QName
		deferred
		ensure
			name_not_void: Result /= Void
		end

	variable_fingerprint: INTEGER
			-- Fingerprint of variable name from name pool
		deferred
		end

feature -- Element change

	register_reference (a_reference: XM_XPATH_VARIABLE_REFERENCE)
			-- Register `ref' as a reference to this variable for fix-up.
			-- This routine is called by the XPath parser when
			-- each reference to the variable is enountered.
			-- At some time after parsing and before execution of the expression,
			-- `Current' is responsible for calling the two routines set_static_type
			-- and fixup on each xm_xpath_binding_reference that has been registered with it.
		require
			reference_not_void: a_reference /= Void
		deferred
		end

end


indexing

	description:

	"Objects representing an XPath variable for use in the standalone XPath API.%
	%Only be createble by calling {XMXPATH_STAND_ALONE_CONTEXT}declare_variable"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VARIABLE

inherit

	XM_XPATH_VARIABLE_DECLARATION

feature -- Access

	name: STRING
			-- Name of variable

	fingerprint: INTEGER is
			-- Fingerprint of variable name from name pool;
			-- Not used.
		do
			Result := -1
		end

feature -- Element change

	register_reference (a_reference: XM_XPATH_BINDING_REFERENCE) is
			-- Register `a_reference' as a reference to this variable for fix-up.
		local
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
		do
			create a_sequence_type.make_any_sequence
			a_reference.set_static_type (a_sequence_type, Void, Void, Void, Void)
		end

end

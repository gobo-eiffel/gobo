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

	register_reference (ref: XM_XPATH_BINDING_REFERENCE) is
			-- Register `ref' as a reference to this variable for fix-up.
		local
			seq: XM_XPATH_SEQUENCE_TYPE
		do
			create seq.make_any_sequence
			ref.set_static_type (seq, Void, 0)
		end

end

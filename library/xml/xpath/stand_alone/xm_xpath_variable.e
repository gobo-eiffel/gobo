indexing

	description:

	"Objects representing an XPath variable for use in the standalone XPath API.%
	%Only create by calling {XM_XPATH_STAND_ALONE_CONTEXT}declare_variable"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VARIABLE

inherit

	XM_XPATH_VARIABLE_DECLARATION

	XM_UNICODE_CHARACTERS_1_1

creation {XM_XPATH_STAND_ALONE_CONTEXT}

	make

feature {NONE} -- Initialization

	make (a_qname: STRING; an_initial_value: XM_XPATH_VALUE) is
			-- Establish invariant.
		require
			valid_name: a_qname /= Void and then is_qname (a_qname)
		do
			name := a_qname
			if an_initial_value /= Void then
				value := an_initial_value
			else
				create {XM_XPATH_EMPTY_SEQUENCE} value.make
			end
		ensure
			name_set: name = a_qname
			value_set: an_initial_value /= Void implies value = an_initial_value
		end

feature -- Access

	name: STRING
			-- Name

	value: XM_XPATH_VALUE
			-- Value;
			-- This value may be changed between successive evaluations of
			-- a compiled XPath expression that references the variable.

	fingerprint: INTEGER is
			-- Fingerprint of variable name from name pool;
			-- Not used.
		do
			Result := -1
		end

feature -- Evaluation

		evaluate_variable (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Evaluate `Current' as a single item
		do
			Result := value
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

	set_value (a_value: XM_XPATH_VALUE) is
			-- Set `value'.
		require
			value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

invariant

	valid_name: name /= Void and then is_qname (name)
	valid_value: value /= Void

end

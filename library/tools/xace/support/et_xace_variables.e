indexing

	description:

		"Xace defined variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_VARIABLES

inherit

	KL_VALUES [STRING, STRING]

	UC_SHARED_STRING_EQUALITY_TESTER
	
	UT_SHARED_TEMPLATE_EXPANDER
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new defined variables.
		do
			create defined_values.make_map (Initial_defined_values_capacity)
			defined_values.set_key_equality_tester (string_equality_tester)
		end

feature -- Status report

	is_defined (a_name: STRING): BOOLEAN is
			-- Is `a_name' defined?
		require
			a_name_not_void: a_name/= Void
		do
			Result := defined_values.has (a_name)
		end

feature -- Access

	item (a_name: STRING): STRING is
			-- Value associated with `a_name'
		require
			a_name_not_void: a_name/= Void
			a_name_defined: is_defined (a_name)
		do
			Result := defined_values.item (a_name)
		ensure
			value_not_void: Result /= Void
		end

	value (a_name: STRING): STRING is
			-- Value associated with `a_name';
			-- Return Void if no such value
		do
			if is_defined (a_name) then
				Result := defined_values.item (a_name)
			end
		end

feature -- Element change

	define_value (a_name: STRING; a_value: STRING) is
			-- Define `a_name' with `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		do
			defined_values.force (a_value, a_name)
		ensure
			a_name_defined: is_defined (a_name)
			value_set: value (a_name) = a_value
		end

	undefine_value (a_name: STRING) is
			-- Undefine `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			defined_values.remove (a_name)
		ensure
			a_name_undefined: not is_defined (a_name)
		end

feature -- Basic operations

	expanded_variables (s: STRING): STRING is
			-- Expand variables in `s'
			-- (Do not alter `s'.)
		require
			s_not_void: s /= Void
		do
			if not defined_values.is_empty then
				Result := template_expander.expand_from_hash_table (s, defined_values)
			else
				Result := s
			end
		ensure
			expanded_variables_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	defined_values: DS_HASH_TABLE [STRING, STRING]
			-- Defined values

feature {NONE} -- Constants

	Initial_defined_values_capacity: INTEGER is 100
			-- Initial capacity for `defined_values'

invariant

	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_item (Void)
	no_void_defined_name: not defined_values.has (Void)

end

indexing

	description:

		"Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE

inherit

	ET_TYPE_ITEM
		redefine
			base_type
		end

	ET_DECLARED_TYPE

	ET_CREATION_TYPE

	ET_STATIC_TYPE

	ET_AGENT_TYPE

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	type: ET_TYPE is
			-- Type
		do
			Result := Current
		end

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		require
			other_not_void: other /= Void
		deferred
		end

	syntactically_conforms_to (other: ET_TYPE; a_class: ET_CLASS): BOOLEAN is
			-- Does current type syntactically conforms
			-- to `other' when it appears in `a_class'
			-- (e.g. do not try to resolve anchored types)?
		require
			other_not_void: other /= Void
			a_class_not_void: a_class /= Void
		do
			-- Result := False
		end

feature -- Validity

	check_parent_validity (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Report errors if not valid.
		require
			an_heir_not_void: an_heir /= Void
		deferred
		end

	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_PARAMETER]): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of the formal generic
			-- parameter `a_formal' in class `a_class'.
			-- `a_sorter' is used to find possible cycle in
			-- formal generic parameter declaration.
			-- Report errors if not valid.
		require
			a_formal_not_void: a_formal /= Void
			a_class_not_void: a_class /= Void
			a_sorter_not_void: a_sorter /= Void
		deferred
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current type.
		do
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): BOOLEAN is
			-- Does current type contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
			-- parameter?
		require
			actual_parameters_not_void: actual_parameters /= Void
		do
			-- Result := False
		end

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): ET_TYPE is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		do
			Result := Current
		end

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENT_LIST; a_class: ET_CLASS): ET_TYPE is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of `a_feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types. Set
			-- `a_class.has_flatten_error' to true if an error occurs.
			-- (Warning: this is a side-effect function.)
		do
			Result := Current
		end

	resolved_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY): ET_TYPE is
			-- Replace in current type unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current type appears in the source code.
			-- (Warning: this is a side-effect function.)
		do
			Result := Current
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p.198)
		deferred
		end

feature -- Output

	to_text: STRING is
			-- Textual representation of current type
			-- (Create a new string at each call.)
		do
			Result := STRING_.make (15)
			append_to_string (Result)
		ensure
			to_text_not_void: Result /= Void
		end

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

end

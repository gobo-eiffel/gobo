indexing

	description:

		"Eiffel types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_TYPE

inherit

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	position: ET_POSITION is
			-- Position of current type in source code
		deferred
		ensure
			position_not_void: position /= Void
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

	check_parent_validity1 (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Do not check conformance to generic
			-- constraints. Report errors if not valid.
		require
			an_heir_not_void: an_heir /= Void
		deferred
		end

	check_parent_validity2 (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Check conformance to generic constraints.
			-- Report errors if not valid.
		require
			an_heir_not_void: an_heir /= Void
		do
			Result := check_parent_validity1 (an_heir)
		end

	check_constraint_validity (a_class: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of a formal generic
			-- parameter of class `a_class'. Report errors
			-- if not valid.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current type.
		do
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): BOOLEAN is
			-- Does current type contain formal generic parameter
			-- types of index 'i' such that 'actual_parameters.item (i)'
			-- is not void?
		require
			actual_parameters_not_void: actual_parameters /= Void
		do
			Result := False
		end

	resolved_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): ET_TYPE is
			-- Replace in current type the formal generic parameter
			-- types of index 'i' by 'actual_parameters.item (i)'
			-- when these new parameters are not void.
			-- (Warning: this is a side-effect function.)
		require
			actual_parameters_not_void: actual_parameters /= Void
		do
			Result := Current
		ensure
			resolved_type_not_void: Result /= Void
		end

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS;
		a_flattener: ET_FEATURE_FLATTENER): ET_TYPE is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of `a_feature' by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types.
			-- (Warning: this is a side-effect function.)
		require
			a_feature_not_void: a_feature /= Void
			a_flattener_not_void: a_flattener /= Void
			immediate_or_redeclared: a_feature.implementation_class = a_flattener.current_class
		do
			Result := Current
		ensure
			resolved_type_not_void: Result /= Void
		end

feature -- Conversion

	actual_type (a_feature: ET_FEATURE; a_base_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_base_type',
			-- only made up of class names and generic formal parameters
			-- when `a_base_type' in a generic type not fully derived
		require
			a_feature_not_void: a_feature /= Void
			a_base_type_not_void: a_base_type /= Void
			flattened: a_base_type.base_class.is_flattened
			no_flatten_error: not a_base_type.base_class.has_flatten_error
		deferred
		ensure
			actual_type_not_void: Result /= Void
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			Result := clone (Current)
		ensure
			type_not_void: Result /= Void
		end

feature -- Output

	to_string: STRING is
			-- Textual representation of current type
		do
			Result := STRING_.make (15)
			append_to_string (Result)
		ensure
			to_string_not_void: Result /= Void
		end

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

end -- class ET_TYPE

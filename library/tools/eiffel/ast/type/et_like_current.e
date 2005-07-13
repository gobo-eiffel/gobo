indexing

	description:

		"Eiffel 'like Current' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIKE_CURRENT

inherit

	ET_LIKE_TYPE
		redefine
			named_type,
			named_type_has_class,
			has_formal_type,
			has_formal_types,
			same_syntactical_like_current,
			same_named_bit_type,
			same_named_class_type,
			same_named_formal_parameter_type,
			same_named_tuple_type,
			same_base_bit_type,
			same_base_class_type,
			same_base_formal_parameter_type,
			same_base_tuple_type,
			conforms_from_bit_type,
			conforms_from_class_type,
			conforms_from_formal_parameter_type,
			conforms_from_tuple_type,
			reference_conforms_from_bit_type,
			reference_conforms_from_class_type,
			reference_conforms_from_formal_parameter_type,
			reference_conforms_from_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new 'like Current' type.
		do
			like_keyword := tokens.like_keyword
			current_keyword := tokens.current_keyword
		end

feature -- Access

	like_keyword: ET_KEYWORD
			-- 'like' keyword

	current_keyword: ET_CURRENT
			-- 'current' keyword

	base_class (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current type when it appears in `a_context'
			-- in `a_universe' (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		do
			Result := a_context.base_class (a_universe)
		end

	base_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context'
			-- in `a_universe', only made up of class names and generic
			-- formal parameters when the root type of `a_context' is a
			-- generic type not fully derived (Definition of base type in
			-- ETL2 p.198). Replace by "*UNKNOWN*" any unresolved identifier
			-- type, or unmatched formal generic parameter if this parameter
			-- is current type.
		do
			Result := a_context.base_type (a_universe)
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		do
			Result := a_context.base_type_actual (i, a_universe)
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		do
			Result := a_context.base_type_actual_parameter (i, a_universe)
		end

	named_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- Same as `base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		do
			Result := a_context.named_type (a_universe)
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := 1
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := like_keyword.position
			if Result.is_null then
				Result := current_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := like_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := current_keyword
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := current_keyword.break
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): INTEGER is
			-- Number of actual generic parameters of the base type of current type
		do
			Result := a_context.base_type_actual_count (a_universe)
		end

feature -- Setting

	set_like_keyword (a_like: like like_keyword) is
			-- Set `like_keyword' to `a_like'.
		require
			a_like_not_void: a_like /= Void
		do
			like_keyword := a_like
		ensure
			like_keyword_set: like_keyword = a_like
		end

	set_current_keyword (a_current: like current_keyword) is
			-- Set `current_keyword' to `a_current'.
		require
			a_current_not_void: a_current /= Void
		do
			current_keyword := a_current
		ensure
			current_keyword_set: current_keyword = a_current
		end

feature -- Status report

	is_type_expanded (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type expanded when viewed from
			-- `a_context' in `a_universe'?
		do
			Result := a_context.base_class (a_universe).is_expanded
		end

	has_formal_type (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain the formal generic parameter
			-- with index `i' when viewed from `a_context' in `a_universe'?
		do
			Result := a_context.has_formal_type (i, a_universe)
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain a formal generic parameter
			-- when viewed from `a_context' in `a_universe'?
		do
			Result := a_context.has_formal_types (a_universe)
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context' in `a_universe'?
		do
				Result := a_context.base_type_has_class (a_class, a_universe)
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context' in `a_universe'?
		do
				Result := a_context.named_type_has_class (a_class, a_universe)
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			if other = Current then
				Result := True
			else
				Result := other.same_syntactical_like_current (Current, a_context, other_context, a_universe)
			end
		end

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				Result := a_context.same_named_type (other, other_context, a_universe)
			end
		end

	same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				Result := a_context.same_base_type (other, other_context, a_universe)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_like_current (other: ET_LIKE_CURRENT;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			Result := True
		end

	same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			Result := a_context.same_named_bit_type (other, other_context, a_universe)
		end

	same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			Result := a_context.same_named_class_type (other, other_context, a_universe)
		end

	same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			Result := a_context.same_named_formal_parameter_type (other, other_context, a_universe)
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			Result := a_context.same_named_tuple_type (other, other_context, a_universe)
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			Result := a_context.same_base_bit_type (other, other_context, a_universe)
		end

	same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			Result := a_context.same_base_class_type (other, other_context, a_universe)
		end

	same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			Result := a_context.same_base_formal_parameter_type (other, other_context, a_universe)
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			Result := a_context.same_base_tuple_type (other, other_context, a_universe)
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				Result := a_context.conforms_to_type (other, other_context, a_universe)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.conforms_from_bit_type (other, other_context, a_universe)
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.conforms_from_class_type (other, other_context, a_universe)
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.conforms_from_formal_parameter_type (other, other_context, a_universe)
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.conforms_from_tuple_type (other, other_context, a_universe)
		end

feature -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of current type appearing in `a_context'
			-- conform to the reference version `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				Result := a_context.reference_conforms_to_type (other, other_context, a_universe)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.reference_conforms_from_bit_type (other, other_context, a_universe)
		end

	reference_conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.reference_conforms_from_class_type (other, other_context, a_universe)
		end

	reference_conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.reference_conforms_from_formal_parameter_type (other, other_context, a_universe)
		end

	reference_conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		do
			Result := a_context.reference_conforms_from_tuple_type (other, other_context, a_universe)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_space_current)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_like_current (Current)
		end

feature {NONE} -- Constants

	like_space_current: STRING is "like Current"
			-- Eiffel keywords

invariant

	current_keyword_not_void: current_keyword /= Void

end

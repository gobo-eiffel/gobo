indexing

	description:

		"Eiffel TUPLE types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TUPLE_TYPE

inherit

	ET_BASE_TYPE
		rename
			name as tuple_keyword
		redefine
			has_qualified_type,
			same_syntactical_tuple_type,
			same_named_tuple_type,
			same_base_tuple_type,
			conforms_from_class_type,
			conforms_from_tuple_type,
			tuple_keyword, actual_parameters,
			is_named_type, is_base_type,
			resolved_formal_parameters
		end

creation

	make

feature {NONE} -- Initialization

	make (a_parameters: like actual_parameters) is
			-- Create a new TUPLE type.
		do
			tuple_keyword := tokens.tuple_keyword
			actual_parameters := a_parameters
		ensure
			actual_parameters_set: actual_parameters = a_parameters
		end

feature -- Access

	tuple_keyword: ET_IDENTIFIER
			-- 'TUPLE' keyword

	actual_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters

	direct_base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Class on which current type is directly based
			-- (e.g. a Class_type, a Tuple_type or a Bit_type);
			-- Return Void if not directly based on a class
			-- (e.g. Anchored_type). `a_universe' is the
			-- surrounding universe holding all classes.
		do
			Result := a_universe.tuple_class
		end

	base_class (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current type when it appears in `a_context'
			-- in `a_universe' (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		do
			Result := a_universe.tuple_class
		end

	base_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_TUPLE_TYPE is
			-- Base type of current type, when it appears in `a_context'
			-- in `a_universe', only made up of class names and generic
			-- formal parameters when the root type of `a_context' is a
			-- generic type not fully derived (Definition of base type in
			-- ETL2 p.198). Replace by "*UNKNOWN*" any unresolved identifier
			-- type, or unmatched formal generic parameter if this parameter
			-- is current type.
		local
			an_actual_parameters: like actual_parameters
			a_named_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			Result := Current
			an_actual_parameters := actual_parameters
			if an_actual_parameters /= Void then
				a_named_parameters := an_actual_parameters.named_types (a_context, a_universe)
				if a_named_parameters /= an_actual_parameters then
					create Result.make (a_named_parameters)
					Result.set_tuple_keyword (tuple_keyword)
				end
			end
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := tuple_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if actual_parameters /= Void then
				Result := actual_parameters.break
			else
				Result := tuple_keyword.break
			end
		end

feature -- Setting

	set_tuple_keyword (a_tuple: like tuple_keyword) is
			-- Set `tuple_keyword' to `a_tuple'.
		require
			a_tuple_not_void: a_tuple /= Void
		do
			tuple_keyword := a_tuple
		ensure
			tuple_keyword_set: tuple_keyword = a_tuple
		end

feature -- Status report

	is_named_type: BOOLEAN is
			-- Is current type only made up of named types?
		local
			a_parameters: like actual_parameters
			i, nb: INTEGER
		do
			Result := True
			a_parameters := actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					if not a_parameters.type (i).is_named_type then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	is_base_type: BOOLEAN is
			-- Is current type only made up of base types?
		local
			a_parameters: like actual_parameters
			i, nb: INTEGER
		do
			Result := True
			a_parameters := actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					if not a_parameters.type (i).is_base_type then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	is_expanded_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type expanded when viewed from
			-- `a_context' in `a_universe'?
		do
			Result := a_universe.tuple_class.is_expanded
		end

	has_qualified_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type a qualified anchored type (other than of
			-- the form 'like Current.b') when viewed from `a_context',
			-- or do its actual generic parameters (recursively)
			-- contain qualified types?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.has_qualified_types (a_context, a_universe)
			end
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
			if other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.same_syntactical_tuple_type (Current, a_context, other_context, a_universe)
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
				Result := other.same_named_tuple_type (Current, a_context, other_context, a_universe)
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
				Result := other.same_base_tuple_type (Current, a_context, other_context, a_universe)
			end
		end

feature {ET_TYPE} -- Comparison

	same_syntactical_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				other_parameters := other.actual_parameters
				if other_parameters = Void then
					Result := actual_parameters = Void or else actual_parameters.is_empty
				elseif actual_parameters = Void then
					Result := other_parameters.is_empty
				else
					Result := actual_parameters.same_syntactical_types (other_parameters, other_context, a_context, a_universe)
				end
			end
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				other_parameters := other.actual_parameters
				if other_parameters = Void then
					Result := actual_parameters = Void or else actual_parameters.is_empty
				elseif actual_parameters = Void then
					Result := other_parameters.is_empty
				else
					Result := actual_parameters.same_named_types (other_parameters, other_context, a_context, a_universe)
				end
			end
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				other_parameters := other.actual_parameters
				if other_parameters = Void then
					Result := actual_parameters = Void or else actual_parameters.is_empty
				elseif actual_parameters = Void then
					Result := other_parameters.is_empty
				else
					Result := actual_parameters.same_named_types (other_parameters, other_context, a_context, a_universe)
				end
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.conforms_from_tuple_type (Current, a_context, other_context, a_universe)
			end
		end

feature {ET_TYPE} -- Conformance

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			other_base_class: ET_CLASS
		do
			other_base_class := other.direct_base_class (a_universe)
			if other_base_class = a_universe.none_class then
					-- "NONE" conforms to any tuple type since it is a reference type.
				Result := True
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			a_parameters: like actual_parameters
			other_parameters: ET_ACTUAL_PARAMETER_LIST
			a_type, other_type: ET_TYPE
			i, nb: INTEGER
		do
			if other = Current and other_context = a_context then
				Result := True
			else
				a_parameters := actual_parameters
				other_parameters := other.actual_parameters
				if a_parameters = Void then
					Result := True
				elseif other_parameters = Void then
					Result := a_parameters.is_empty
				else
					nb := a_parameters.count
					if nb <= other_parameters.count then
						Result := True
						from i := 1 until i > nb loop
							other_type := other_parameters.type (i)
							a_type := a_parameters.type (i)
							if not other_type.conforms_to_type (a_type, a_context, other_context, a_universe) then
								Result := False
								i := nb + 1 -- Jump out of the loop.
							else
								i := i + 1
							end
						end
					end
				end
			end
		end

feature -- Convertibility

	convertible_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type appearing in `a_context' convertible
			-- to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		do
			-- Result := False
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_TUPLE_TYPE is
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		local
			an_actual_parameters: like actual_parameters
			a_resolved_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			Result := Current
			an_actual_parameters := actual_parameters
			if an_actual_parameters /= Void then
				a_resolved_parameters := an_actual_parameters.resolved_formal_parameters (a_parameters)
				if a_resolved_parameters /= an_actual_parameters then
					create Result.make (a_resolved_parameters)
					Result.set_tuple_keyword (tuple_keyword)
				end
			end
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		local
			a_parameters: like actual_parameters
		do
			a_string.append_string (tuple_string)
			a_parameters := actual_parameters
			if a_parameters /= Void and then not a_parameters.is_empty then
				a_string.append_character (' ')
				a_parameters.append_to_string (a_string)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_tuple_type (Current)
		end

feature {NONE} -- Constants

	tuple_string: STRING is "TUPLE"
			-- Eiffel keywords

invariant

	tuple_keyword_not_void: tuple_keyword /= Void

end

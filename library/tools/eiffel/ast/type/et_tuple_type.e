note

	description:

		"Eiffel TUPLE types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TUPLE_TYPE

inherit

	ET_BASE_TYPE
		rename
			name as tuple_keyword
		redefine
			same_syntactical_tuple_type,
			same_named_tuple_type,
			same_base_tuple_type,
			conforms_from_class_type,
			conforms_from_tuple_type,
			tuple_keyword, actual_parameters,
			resolved_formal_parameters,
			append_unaliased_to_string
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_parameters: like actual_parameters; a_named_base_class: like named_base_class) is
			-- Create a new TUPLE type.
		require
			a_named_base_class_not_void: a_named_base_class /= Void
		do
			type_mark := a_type_mark
			tuple_keyword := tokens.tuple_keyword
			actual_parameters := a_parameters
			named_base_class := a_named_base_class
		ensure
			type_mark_set: type_mark = a_type_mark
			actual_parameters_set: actual_parameters = a_parameters
			named_base_class_set: named_base_class = a_named_base_class
		end

feature -- Access

	type_mark: ET_TYPE_MARK
			-- 'attached' or 'detachable' keyword,
			-- or '!' or '?' symbol

	tuple_keyword: ET_IDENTIFIER
			-- 'TUPLE' keyword

	actual_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters

	base_type (a_context: ET_TYPE_CONTEXT): ET_TUPLE_TYPE is
			-- Base type of current type, when it appears in `a_context',
			-- only made up of class names and generic formal parameters
			-- when the root type of `a_context' is a generic type not
			-- fully derived (Definition of base type in ETL2 p.198).
			-- Replace by "*UNKNOWN*" any unresolved identifier type, or
			-- unmatched formal generic parameter if this parameter
			-- is current type.
		local
			an_actual_parameters: like actual_parameters
			a_named_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if a_context = Current then
					-- The current type is its own context,
					-- therefore it is its own a base type.
				Result := Current
			else
				Result := Current
				an_actual_parameters := actual_parameters
				if an_actual_parameters /= Void then
					a_named_parameters := an_actual_parameters.named_types (a_context)
					if a_named_parameters /= an_actual_parameters then
						create Result.make (type_mark, a_named_parameters, named_base_class)
						Result.set_tuple_keyword (tuple_keyword)
					end
				end
			end
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if type_mark /= Void then
				Result := type_mark.position
			end
			if Result = Void or else Result.is_null then
				Result := tuple_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if type_mark /= Void then
				Result := type_mark
			else
				Result := tuple_keyword
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if actual_parameters /= Void then
				Result := actual_parameters.last_leaf
			else
				Result := tuple_keyword
			end
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

	is_expanded: BOOLEAN is False
			-- Is current type expanded?

	is_type_expanded (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type expanded when viewed from `a_context'?
		do
			Result := False
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			an_actual_parameters: like actual_parameters
		do
			if a_class = base_class then
				Result := True
			else
				an_actual_parameters := actual_parameters
				if an_actual_parameters /= Void then
					Result := an_actual_parameters.named_types_have_class (a_class, a_context)
				end
			end
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_syntactical_tuple_type (Current, a_context, other_context)
			end
		end

	same_named_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_named_tuple_type (Current, a_context, other_context)
			end
		end

	same_base_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_base_tuple_type (Current, a_context, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				other_parameters := other.actual_parameters
				if other_parameters = Void then
					Result := actual_parameters = Void or else actual_parameters.is_empty
				elseif actual_parameters = Void then
					Result := other_parameters.is_empty
				else
					Result := actual_parameters.same_syntactical_types (other_parameters, other_context, a_context)
				end
			end
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				other_parameters := other.actual_parameters
				if other_parameters = Void then
					Result := actual_parameters = Void or else actual_parameters.is_empty
				elseif actual_parameters = Void then
					Result := other_parameters.is_empty
				else
					Result := actual_parameters.same_named_types (other_parameters, other_context, a_context)
				end
			end
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				other_parameters := other.actual_parameters
				if other_parameters = Void then
					Result := actual_parameters = Void or else actual_parameters.is_empty
				elseif actual_parameters = Void then
					Result := other_parameters.is_empty
				else
					Result := actual_parameters.same_named_types (other_parameters, other_context, a_context)
				end
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.conforms_from_tuple_type (Current, a_context, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			other_base_class: ET_CLASS
		do
			other_base_class := other.base_class
			if other_base_class.is_none then
					-- "NONE" conforms to any tuple type since it is a reference type.
				Result := True
			elseif other_base_class = base_class and then not is_generic then
					-- Class type "TUPLE" conforms to Tuple_type "TUPLE".
				Result := True
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_parameters: like actual_parameters
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				a_parameters := actual_parameters
				other_parameters := other.actual_parameters
				if a_parameters = Void then
					Result := True
				elseif other_parameters = Void then
					Result := a_parameters.is_empty
				else
					Result := other_parameters.tuple_conforms_to_types (a_parameters, a_context, other_context)
				end
			end
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
					create Result.make (type_mark, a_resolved_parameters, named_base_class)
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

	append_unaliased_to_string (a_string: STRING) is
			-- Append textual representation of unaliased
			-- version of current type to `a_string'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		local
			a_parameters: like actual_parameters
		do
			a_string.append_string (tuple_string)
			a_parameters := actual_parameters
			if a_parameters /= Void and then not a_parameters.is_empty then
				a_string.append_character (' ')
				a_parameters.append_unaliased_to_string (a_string)
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

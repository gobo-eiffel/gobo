indexing

	description:

		"Eiffel lists of actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACTUAL_PARAMETER_LIST

inherit

	ET_TYPE_LIST
		redefine
			make, make_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create an empty actual generic parameter list.
		do
			left_bracket := tokens.left_bracket_symbol
			right_bracket := tokens.right_bracket_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create an empty actual generic parameter list with capacity `nb'.
		do
			left_bracket := tokens.left_bracket_symbol
			right_bracket := tokens.right_bracket_symbol
			precursor (nb)
		end

feature -- Access

	left_bracket: ET_SYMBOL
			-- Left bracket

	right_bracket: ET_SYMBOL
			-- Right bracket

	named_types (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER_LIST is
			-- Base types of current types, when they appear in `a_context'
			-- in `a_universe', only made up of class names and generic
			-- formal parameters when the root type of `a_context' is a
			-- generic type not fully derived (Definition of base type in
			-- ETL2 p.198). Replace by "*UNKNOWN*" any unresolved identifier
			-- type, anchored type involved in a cycle.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
		local
			i, j: INTEGER
			a_type: ET_TYPE
			a_named_type: ET_NAMED_TYPE
		do
			Result := Current
			from i := count until i < 1 loop
				a_type := type (i)
				a_named_type := a_type.named_type (a_context, a_universe)
				if Result /= Current then
					Result.put_first (a_named_type)
				elseif a_type /= a_named_type then
					create Result.make_with_capacity (count)
					Result.set_left_bracket (left_bracket)
					Result.set_right_bracket (right_bracket)
					from j := count until j <= i loop
						Result.put_first (item (j))
						j := j - 1
					end
					Result.put_first (a_named_type)
				end
				i := i - 1
			end
		ensure
			named_types_not_void: Result /= Void
			same_count: Result.count = count
			-- types_named: forall i in 1..count, Result.type (i).is_named_type
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_bracket.position
			if Result.is_null and not is_empty then
				Result := item (1).position
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_bracket.break
		end

feature -- Status report

	has_anchored_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does one current types contain an anchored type
			-- when viewed from `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).has_anchored_type (a_context, a_universe) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_formal_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does one current types contain a formal generic parameter
			-- when viewed from `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).has_formal_type (a_context, a_universe) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_qualified_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is one of current types a qualified type (other than of
			-- the form 'like Current.b') when viewed from `a_context',
			-- or do their actual generic parameters (recursively)
			-- contain qualified types?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).has_qualified_type (a_context, a_universe) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Comparison

	same_syntactical_types (other: ET_ACTUAL_PARAMETER_LIST; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current types appearing in `a_context' and `other'
			-- types appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					if not type (i).same_syntactical_type (other.type (i), other_context, a_context, a_universe) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	same_named_types (other: ET_ACTUAL_PARAMETER_LIST; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current types appearing in `a_context' and `other' types
			-- appearing in `other_context' have the same named types?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					if not type (i).same_named_type (other.type (i), other_context, a_context, a_universe) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature -- Conformance

	conforms_to_types (other: ET_ACTUAL_PARAMETER_LIST; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current types appearing in `a_context' conform
			-- to `other' types appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_type_resolver' is
			-- used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					if not type (i).conforms_to_type (other.type (i), other_context, a_context, a_universe) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature -- Type processing

	has_derived_parameters: BOOLEAN is
			-- Are there actual parameters which are different
			-- from their corresponding formal parameters because
			-- of the generic derivation?
		local
			i, nb: INTEGER
			a_formal: ET_FORMAL_PARAMETER_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				a_formal ?= type (i)
				if a_formal = Void or else a_formal.index /= i then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER_LIST is
			-- Version of current types where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, j: INTEGER
			a_type, a_resolved_type: ET_TYPE_ITEM
		do
			Result := Current
			from i := count until i < 1 loop
				a_type := item (i)
				a_resolved_type := a_type.resolved_formal_parameters (a_parameters)
				if Result /= Current then
					Result.put_first (a_resolved_type)
				elseif a_type /= a_resolved_type then
					create Result.make_with_capacity (count)
					Result.set_left_bracket (left_bracket)
					Result.set_right_bracket (right_bracket)
					from j := count until j <= i loop
						Result.put_first (item (j))
						j := j - 1
					end
					Result.put_first (a_resolved_type)
				end
				i := i - 1
			end
		ensure
			resolved_parameters_not_void: Result /= Void
			same_count: Result.count = count
		end

feature -- Setting

	set_left_bracket (l: like left_bracket) is
			-- Set `left_bracket' to `l'.
		require
			l_not_void: l /= Void
		do
			left_bracket := l
		ensure
			left_bracket_set: left_bracket = l
		end

	set_right_bracket (r: like right_bracket) is
			-- Set `right_bracket' to `r'.
		require
			r_not_void: r /= Void
		do
			right_bracket := r
		ensure
			right_bracket_set: right_bracket = r
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			a_string.append_character ('[')
			nb := count
			if nb >= 1 then
				a_type := type (1)
				a_type.append_to_string (a_string)
				from i := 2 until i > nb loop
					a_string.append_string (", ")
					a_type := type (i)
					a_type.append_to_string (a_string)
					i := i + 1
				end
			end
			a_string.append_character (']')
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_actual_parameter_list (Current)
		end

invariant

	left_bracket_not_void: left_bracket /= Void
	right_bracket_not_void: right_bracket /= Void

end

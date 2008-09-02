indexing

	description:

		"Eiffel lists of actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACTUAL_PARAMETER_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_ACTUAL_PARAMETER_ITEM]
		export
			{ET_ACTUAL_PARAMETER_LIST} storage
		redefine
			make, make_with_capacity
		end

create

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

feature -- Initialization

	reset is
			-- Reset actual parameters as they were when they were first parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).type.reset
				i := i + 1
			end
		end

	reset_qualified_anchored_types is
			-- Reset qualified anchored types contained in current actual parameters
			-- as they were just after they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).type.reset_qualified_anchored_types
				i := i + 1
			end
		end

feature -- Access

	actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER is
			-- Actual parameter of `i'-th item in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).actual_parameter
		ensure
			actual_parameter_not_void: Result /= Void
		end

	type (i: INTEGER): ET_TYPE is
			-- Type of `i'-th item in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).type
		ensure
			type_not_void: Result /= Void
		end

	left_bracket: ET_SYMBOL
			-- Left bracket

	right_bracket: ET_SYMBOL
			-- Right bracket

	named_types (a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER_LIST is
			-- Named types of current parameters, when they appear in `a_context',
			-- only made up of class names and generic formal parameters when the
			-- root type of `a_context' is a generic type not fully derived
			-- (Definition of base type in  ETL2 p.198). Replace by "*UNKNOWN*"
			-- any unresolved identifier type, anchored type involved in a cycle.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, j, nb: INTEGER
			a_parameter: ET_ACTUAL_PARAMETER
			a_named_parameter: ET_ACTUAL_PARAMETER
			l_type, l_other_type: ET_TYPE
			l_named_type: ET_NAMED_TYPE
		do
			Result := Current
			nb := count - 1
			from i := 0 until i > nb loop
				a_parameter := storage.item (i).actual_parameter
				l_type := a_parameter.type
				if l_type /= l_other_type then
					l_named_type := l_type.named_type (a_context)
					l_other_type := l_type
				end
				a_named_parameter := a_parameter.named_parameter_with_type (l_named_type)
				if Result /= Current then
					Result.put_first (a_named_parameter)
				elseif a_parameter /= a_named_parameter then
					create Result.make_with_capacity (count)
					Result.set_left_bracket (left_bracket)
					Result.set_right_bracket (right_bracket)
					from j := 0 until j >= i loop
						Result.put_first (storage.item (j).actual_parameter)
						j := j + 1
					end
					Result.put_first (a_named_parameter)
				end
				i := i + 1
			end
		ensure
			named_types_not_void: Result /= Void
			same_count: Result.count = count
			-- types_named: forall i in 1..count, Result.type (i).is_named_type
		end

	index_of_label (a_label: ET_IDENTIFIER): INTEGER is
			-- Index of actual generic parameter with label `a_label';
			-- 0 if it does not exist
		require
			a_label_not_void: a_label /= Void
		local
			l_actual_label: ET_IDENTIFIER
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_actual_label := storage.item (i).label
				if l_actual_label /= Void and then a_label.same_identifier (l_actual_label) then
					Result := count - i
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
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

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := left_bracket
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := right_bracket
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_bracket.break
		end

feature -- Status report

	has_anchored_type (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does one current types contain an anchored type
			-- when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).type.has_anchored_type (a_context) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	named_types_have_formal_type (i: INTEGER; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the named type of one of current types contain the formal generic
			-- parameter with index `i' when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			j, nb: INTEGER
		do
			nb := count - 1
			from j := 0 until j > nb loop
				if storage.item (j).type.named_type_has_formal_type (i, a_context) then
					Result := True
					j := nb + 1 -- Jump out of the loop.
				else
					j := j + 1
				end
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does one of the current types contain a formal generic
			-- parameter when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).type.has_formal_types (a_context) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	named_types_have_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the named type of one of the current types contain a formal generic
			-- parameter when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).type.named_type_has_formal_types (a_context) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	named_types_have_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does one of the named types of current parameters contain
			-- `a_class' when it appears in `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			a_parameter: ET_ACTUAL_PARAMETER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				a_parameter := storage.item (i).actual_parameter
				if a_parameter.named_parameter_has_class (a_class, a_context) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Comparison

	same_syntactical_types (other: ET_ACTUAL_PARAMETER_LIST; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
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
		local
			i, nb: INTEGER
			other_storage: SPECIAL [ET_ACTUAL_PARAMETER_ITEM]
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				other_storage := other.storage
				nb := count - 1
				from i := 0 until i > nb loop
					if not storage.item (i).type.same_syntactical_type (other_storage.item (i).type, other_context, a_context) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	same_named_types (other: ET_ACTUAL_PARAMETER_LIST; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current types appearing in `a_context' and `other' types
			-- appearing in `other_context' have the same named types?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i, nb: INTEGER
			other_storage: SPECIAL [ET_ACTUAL_PARAMETER_ITEM]
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				other_storage := other.storage
				nb := count - 1
				from i := 0 until i > nb loop
					if not storage.item (i).type.same_named_type (other_storage.item (i).type, other_context, a_context) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature -- Conformance

	conforms_to_types (other: ET_ACTUAL_PARAMETER_LIST; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current actual parameters appearing in `a_context' conform
			-- to `other' actual parameters appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i, nb: INTEGER
			other_storage: SPECIAL [ET_ACTUAL_PARAMETER_ITEM]
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				other_storage := other.storage
				nb := count - 1
				from i := 0 until i > nb loop
					if not storage.item (i).type.conforms_to_type (other_storage.item (i).type, other_context, a_context) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	agent_conforms_to_types (other: ET_ACTUAL_PARAMETER_LIST; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current actual parameters (of an Agent type) appearing in `a_context'
			-- conform to `other' actual parameters appearing in `other_context'?
			-- Use SmartEiffel agent type conformance semantics, where the conformance
			-- of the second actual generic parameter is checked in the reverse order.
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i, j, nb: INTEGER
			other_storage: SPECIAL [ET_ACTUAL_PARAMETER_ITEM]
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				other_storage := other.storage
				nb := count - 1
				j := count - 2
				from i := 0 until i > nb loop
					if i = j then
							-- Reverse conformance for the argument parameter.
						if not other_storage.item (i).type.conforms_to_type (storage.item (i).type, a_context, other_context) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					else
						if not storage.item (i).type.conforms_to_type (other_storage.item (i).type, other_context, a_context) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	tuple_conforms_to_types (other: ET_ACTUAL_PARAMETER_LIST; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current actual parameters (of a Tuple_type) appearing in `a_context'
			-- conform to `other' actual parameters appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				nb := other.count
				if nb <= count then
					Result := True
					from i := 1 until i > nb loop
						if not type (i).conforms_to_type (other.type (i), other_context, a_context) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				else
					Result := False
				end
			end
		end

feature -- Type processing

	has_derived_parameters: BOOLEAN is
			-- Are there actual parameters which are different
			-- from their corresponding formal parameters because
			-- of the generic derivation?
		local
			i, j, nb: INTEGER
			a_formal: ET_FORMAL_PARAMETER_TYPE
		do
			nb := count - 1
			j := count
			from i := 0 until i > nb loop
				a_formal ?= storage.item (i).type
				if a_formal = Void or else a_formal.index /= j then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
					j := j - 1
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
			i, j, nb: INTEGER
			a_parameter, a_resolved_parameter: ET_ACTUAL_PARAMETER_ITEM
			l_type, l_other_type: ET_TYPE
			l_resolved_type: ET_TYPE
		do
			Result := Current
			nb := count - 1
			from i := 0 until i > nb loop
				a_parameter := storage.item (i)
				l_type := a_parameter.type
				if l_type /= l_other_type then
					l_resolved_type := l_type.resolved_formal_parameters (a_parameters)
					l_other_type := l_type
				end
				a_resolved_parameter := a_parameter.resolved_formal_parameters_with_type (l_resolved_type)
				if Result /= Current then
					Result.put_first (a_resolved_parameter)
				elseif a_parameter /= a_resolved_parameter then
					create Result.make_with_capacity (count)
					Result.set_left_bracket (left_bracket)
					Result.set_right_bracket (right_bracket)
					from j := 0 until j >= i loop
						Result.put_first (storage.item (j))
						j := j + 1
					end
					Result.put_first (a_resolved_parameter)
				end
				i := i + 1
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
			-- current actual parameters to `a_string'.
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

	append_unaliased_to_string (a_string: STRING) is
			-- Append textual representation of unaliased
			-- version of current actual parameters to `a_string'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
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
				a_type.append_unaliased_to_string (a_string)
				from i := 2 until i > nb loop
					a_string.append_string (", ")
					a_type := type (i)
					a_type.append_unaliased_to_string (a_string)
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

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_bracket_not_void: left_bracket /= Void
	right_bracket_not_void: right_bracket /= Void

end

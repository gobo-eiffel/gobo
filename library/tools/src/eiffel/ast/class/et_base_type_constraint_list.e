note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to several types, which
		are base types. An empty list is equivalent to '{detachable ANY}'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BASE_TYPE_CONSTRAINT_LIST

inherit

	ET_CONSTRAINT_BASE_TYPES

	ET_HEAD_LIST [ET_BASE_TYPE_CONSTRAINT]
		rename
			make as make_empty,
			make_with_capacity as make_empty_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_type_constraint: like type_constraint)
			-- Create a new type constraint list with
			-- one item `a_type_constraint'.
		require
			a_type_constraint_not_void: a_type_constraint /= Void
		do
			make_with_capacity (a_type_constraint, 1)
		ensure
			count_set: count = 1
			capacity_set: capacity = 1
			type_constraint: first = a_type_constraint
		end

	make_with_capacity (a_type_constraint: like type_constraint; nb: INTEGER)
			-- Create a new empty type constraint list with capacity `nb',
			-- and with  one item `a_type_constraint'.
		require
			a_type_constraint_not_void: a_type_constraint /= Void
			nb_positive: nb >= 1
		do
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
			make_empty_with_capacity (nb)
			put_first (a_type_constraint)
		ensure
			count_set: count = 1
			capacity_set: capacity = nb
			type_constraint: first = a_type_constraint
		end

feature -- Initialization

	reset
			-- Reset constraint as it was just after it was last parsed.
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				storage.item (i).reset
				i := i - 1
			end
		end

feature -- Access

	type_constraint (i: INTEGER): ET_BASE_TYPE_CONSTRAINT
			-- `i'-th type constraint
		do
			Result := item (i)
		end

	left_brace: ET_SYMBOL
			-- '{' symbol

	right_brace: ET_SYMBOL
			-- '}' symbol

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_brace.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_brace
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_brace
		end

feature -- Setting

	set_left_brace (l: like left_brace)
			-- Set `left_brace' to `l'.
		require
			l_not_void: l /= Void
		do
			left_brace := l
		ensure
			left_brace_set: left_brace = l
		end

	set_right_brace (r: like right_brace)
			-- Set `right_brace' to `r'.
		require
			r_not_void: r /= Void
		do
			right_brace := r
		ensure
			right_brace_set: right_brace = r
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of the types
			-- in current constraint and `other' is overridden by `a_type_mark' and
			-- `other_type_mark', if not Void
		local
			i: INTEGER
		do
			if count = 0 then
				Result := a_context.base_class.universe.detachable_any_type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context, a_system_processor)
			else
				from
					i := count - 1
				until
					i < 0
				loop
					if storage.item (i).type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context, a_system_processor) then
						Result := True
						i := 0 -- Jump out of loop.
					end
					i := i - 1
				end
			end
		end

feature -- Output

	append_types_to_string (a_string: STRING)
			-- Append to `a_string' the textual representation
			-- of the types in current constraint.
		local
			i: INTEGER
			l_not_first: BOOLEAN
		do
			a_string.append_character ('{')
			from
				i := count - 1
			until
				i < 0
			loop
				if l_not_first then
					a_string.append_character (',')
					a_string.append_character (' ')
				else
					l_not_first := True
				end
				storage.item (i).type.append_to_string (a_string)
				i := i - 1
			end
			a_string.append_character ('}')
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_base_type_constraint_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_BASE_TYPE_CONSTRAINT]
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end

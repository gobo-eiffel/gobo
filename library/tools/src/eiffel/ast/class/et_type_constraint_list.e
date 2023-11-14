note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to several types.
		An empty list is equivalent to '{detachable ANY}'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TYPE_CONSTRAINT_LIST

inherit

	ET_CONSTRAINT
		redefine
			has_formal_parameter,
			reset_renames
		end

	ET_HEAD_LIST [ET_TYPE_CONSTRAINT_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty type constraint list.
		do
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty type constraint list with capacity `nb'.
		do
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
			precursor (nb)
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
				storage.item (i).type_constraint.reset
				i := i - 1
			end
		end

	reset_renames
			-- Reset renames of type constraints as they were just
			-- after they were last parsed.
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				storage.item (i).type_constraint.reset_renames
				i := i - 1
			end
		end

feature -- Access

	type_constraint (i: INTEGER): ET_TYPE_CONSTRAINT
			-- `i'-th type constraint
		do
			Result := item (i).type_constraint
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

feature -- Status report

	has_formal_parameter (i: INTEGER): BOOLEAN
			-- Is one of the constraint types the `i'-th formal generic parameter of the enclosing class?
		local
			j: INTEGER
		do
			from
				j := count - 1
			until
				j < 0
			loop
				if storage.item (j).type_constraint.is_formal_parameter (i) then
					Result := True
					j := 0 -- Jump out of the loop.
				end
				j := j - 1
			end
		end

	are_named_types: BOOLEAN
			-- Are all types named types (only made up of named types)?
		local
			j: INTEGER
		do
			Result := True
			from
				j := count - 1
			until
				j < 0
			loop
				if not storage.item (j).type_constraint.is_named_type then
					Result := False
					j := 0 -- Jump out of the loop.
				end
				j := j - 1
			end
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
				Result := a_context.base_class.universe.detachable_separate_any_type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context, a_system_processor)
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
			a_processor.process_type_constraint_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_TYPE_CONSTRAINT_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end

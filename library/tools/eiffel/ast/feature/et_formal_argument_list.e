note

	description:

		"Eiffel lists of formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_ARGUMENT_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_FORMAL_ARGUMENT_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new formal argument list.
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new formal argument list with capacity `nb'.
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset formal arguments as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).formal_argument.reset
				i := i + 1
			end
		end

	reset_qualified_anchored_types
			-- Reset qualified anchored types contained in the types of
			-- formal arguments as they were just after they were last parsed.
		local
			i, nb: INTEGER
			l_type, l_previous_type: ET_TYPE
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_type := storage.item (i).formal_argument.type
				if l_type /= l_previous_type then
					l_type.reset_qualified_anchored_types
					l_previous_type := l_type
				end
				i := i + 1
			end
		end

feature -- Status report

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does at least one type of current formal arguments contain
			-- a formal generic parameter when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
			l_type, l_previous_type: ET_TYPE
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_type := storage.item (i).formal_argument.type
				if l_type /= l_previous_type then
					if l_type.has_formal_types (a_context) then
						Result := True
						i := nb + 1 -- Jump out of the loop
					end
					l_previous_type := l_type
				end
				i := i + 1
			end
		end

feature -- Access

	formal_argument (i: INTEGER): ET_FORMAL_ARGUMENT
			-- Formal argument at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).formal_argument
		ensure
			formal_argument_not_void: Result /= Void
		end

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis

	right_parenthesis: ET_SYMBOL
			-- Right parenthesis

	index_of (a_name: ET_IDENTIFIER): INTEGER
			-- Index of formal argument `a_name';
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).formal_argument.name.same_identifier (a_name) then
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

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_parenthesis
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_left_parenthesis (a_left: like left_parenthesis)
			-- Set `left_parenthesis' to `a_left'.
		require
			a_left_not_void: a_left /= Void
		do
			left_parenthesis := a_left
		ensure
			left_parenthesis_set: left_parenthesis = a_left
		end

	set_right_parenthesis (a_right: like right_parenthesis)
			-- Set `right_parenthesis' to `a_right'.
		require
			a_right_not_void: a_right /= Void
		do
			right_parenthesis := a_right
		ensure
			right_parenthesis_set: right_parenthesis = a_right
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_formal_argument_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_FORMAL_ARGUMENT_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis_not_void: right_parenthesis /= Void

end

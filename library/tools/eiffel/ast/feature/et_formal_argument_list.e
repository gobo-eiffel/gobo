indexing

	description:

		"Eiffel lists of formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make is
			-- Create a new formal argument list.
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new formal argument list with capacity `nb'.
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor (nb)
		end

feature -- Initialization

	reset is
			-- Reset formal arguments as they were when they were first parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).formal_argument.reset
				i := i + 1
			end
		end

feature -- Access

	formal_argument (i: INTEGER): ET_FORMAL_ARGUMENT is
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

	index_of (a_name: ET_IDENTIFIER): INTEGER is
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

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := left_parenthesis
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_left_parenthesis (a_left: like left_parenthesis) is
			-- Set `left_parenthesis' to `a_left'.
		require
			a_left_not_void: a_left /= Void
		do
			left_parenthesis := a_left
		ensure
			left_parenthesis_set: left_parenthesis = a_left
		end

	set_right_parenthesis (a_right: like right_parenthesis) is
			-- Set `right_parenthesis' to `a_right'.
		require
			a_right_not_void: a_right /= Void
		do
			right_parenthesis := a_right
		ensure
			right_parenthesis_set: right_parenthesis = a_right
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): like Current is
			-- Version of current arguments where the formal generic
			-- parameter types of the declared types have been replaced
			-- by their actual counterparts in `a_parameters'
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, j, nb: INTEGER
			arg, new_arg: ET_FORMAL_ARGUMENT
			a_type, new_type: ET_DECLARED_TYPE
		do
			Result := Current
			nb := count - 1
			from i := 0 until i > nb loop
				arg := storage.item (i).formal_argument
				if arg.declared_type = a_type then
						-- This argument shares the same
						-- type as the previous argument.
				else
					a_type := arg.declared_type
					new_type := a_type.resolved_formal_parameters (a_parameters)
				end
				if a_type /= new_type then
					new_arg := arg.cloned_argument
					new_arg.set_declared_type (new_type)
				else
					new_arg := arg
				end
				if Result /= Current then
					Result.put_first (new_arg)
				elseif arg /= new_arg then
					create Result.make_with_capacity (count)
					Result.set_left_parenthesis (left_parenthesis)
					Result.set_right_parenthesis (right_parenthesis)
					from j := 0 until j >= i loop
						Result.put_first (storage.item (j))
						j := j + 1
					end
					Result.put_first (new_arg)
				end
				i := i + 1
			end
		ensure
			inherited_arguments_not_void: Result /= Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_argument_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_FORMAL_ARGUMENT_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis_not_void: right_parenthesis /= Void

end

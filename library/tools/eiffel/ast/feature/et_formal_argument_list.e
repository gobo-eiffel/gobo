indexing

	description:

		"Eiffel lists of formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_ARGUMENT_LIST

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_FORMAL_ARGUMENT_ITEM]
		redefine
			make, make_with_capacity
		end

creation

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
			nb := count
			from i := 1 until i > nb loop
				if formal_argument (i).name.same_identifier (a_name) then
					Result := i
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

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current formal arguments.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				formal_argument (i).type.add_to_system
				i := i + 1
			end
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): BOOLEAN is
			-- Do types of current arguments contain formal
			-- generic parameter types whose corresponding
			-- actual parameter in `actual_parameters' is
			-- different from the formal parameter?
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if formal_argument (i).type.has_formal_parameters (actual_parameters) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	resolve_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST) is
			-- Replace in types of current arguments the formal
			-- generic parameter types by those of `actual_parameters'
			-- when the corresponding actual parameter is different
			-- from the formal parameter.
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i: INTEGER
			arg: ET_FORMAL_ARGUMENT
			a_type, new_type: ET_DECLARED_TYPE
		do
			i := count
			from until i < 1 loop
				arg := formal_argument (i)
				if arg.declared_type = a_type then
						-- This argument shares the same
						-- type as the previous argument.
					arg.set_declared_type (new_type)
				else
					a_type := arg.declared_type
					if a_type.type.has_formal_parameters (actual_parameters) then
						new_type := a_type.deep_cloned_type
						new_type := new_type.resolved_formal_parameters (actual_parameters)
						arg.set_declared_type (new_type)
					else
						new_type := a_type
					end
				end
				i := i - 1
			end
		end

	resolve_identifier_types (a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of `a_feature' in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types and check validity
			-- of arguments' name. Set `a_class.has_flatten_error' to
			-- true if an error occurs.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			immediate_or_redeclared: a_feature.implementation_class = a_class
		local
			i, nb: INTEGER
		do
-- TODO: check arguments' names.
			nb := count
			from i := 1 until i > nb loop
				formal_argument (i).resolve_identifier_types (a_feature, Current, a_class)
				i := i + 1
			end
-- TODO: check cycles in 'like argument'.
		end

feature -- Duplication

	cloned_arguments: like Current is
			-- Cloned formal arguments;
			-- Do not recursively clone the types
		local
			i: INTEGER
		do
			i := count
			create Result.make_with_capacity (i)
			Result.set_left_parenthesis (left_parenthesis)
			Result.set_right_parenthesis (right_parenthesis)
			from until i < 1 loop
				Result.put_first (item (i).cloned_argument)
				i := i - 1
			end
		ensure
			arguments_not_void: Result /= Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_argument_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_FORMAL_ARGUMENT_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis_not_void: right_parenthesis /= Void

end

indexing

	description:

		"Eiffel formal argument lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_ARGUMENTS

creation

	make

feature {NONE} -- Initialization

	make (a_name: ET_IDENTIFIER; a_type: ET_TYPE) is
			-- Create a new formal argument list with initially
			-- one argument `a_name' of type `a_type'.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			!! arguments.make (a_name, a_type)
			count := count + 1
		ensure
			name_set: arguments.name = a_name
			type_set: arguments.type = a_type
		end

feature -- Access

	item (i: INTEGER): ET_FORMAL_ARGUMENT is
			-- `i'-th formal argument
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		local
			j: INTEGER
			arg: ET_FORMAL_ARGUMENT
		do
			from
				arg := arguments
				j := 1
			until
				j = i
			loop
				arg := arg.next
				j := j + 1
			end
			Result := arg
		ensure
			item_not_void: Result /= Void
		end

	index_of (a_name: ET_IDENTIFIER): INTEGER is
			-- Index of formal argument `a_name';
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			arg: ET_FORMAL_ARGUMENT
			i: INTEGER
		do
			from arg := arguments until arg = Void loop
				i := i + 1
				if arg.name.same_identifier (a_name) then
					Result := i
					arg := Void -- Jump out of the loop.
				else
					arg := arg.next
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
		end

	arguments: ET_FORMAL_ARGUMENT
			-- Arguments

feature -- Measurement

	count: INTEGER
			-- Number of formal arguments

feature -- Element change

	put_first (a_name: ET_IDENTIFIER; a_type: ET_TYPE) is
			-- Add formal argument `a_name' with type
			-- `a_type' to argument list.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		local
			an_argument: like arguments
		do
			!! an_argument.make (a_name, a_type)
			an_argument.set_next (arguments)
			arguments := an_argument
			count := count + 1
		ensure
			one_more: arguments.next = old arguments
			name_set: arguments.name = a_name
			type_set: arguments.type = a_type
		end

	put_name_first (a_name: ET_IDENTIFIER) is
			-- Add formal argument `a_name' to argument list
			-- with same type as previously inserted argument.
		require
			a_name_not_void: a_name /= Void
		local
			an_argument: like arguments
			a_type: ET_TYPE
		do
			a_type := arguments.type
			!! an_argument.make (a_name, a_type)
			an_argument.set_next (arguments)
			arguments := an_argument
			count := count + 1
		ensure
			one_more: arguments.next = old arguments
			name_set: arguments.name = a_name
			type_set: arguments.type = (old arguments).type
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current formal arguments.
		local
			arg: like arguments
		do
			from arg := arguments until arg = Void loop
				arg.type.add_to_system
				arg := arg.next
			end
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): BOOLEAN is
			-- Do types of current arguments contain formal
			-- generic parameter types of index 'i' such that
			-- 'actual_parameters.item (i)' is not void?
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			arg: like arguments
		do
			from arg := arguments until arg = Void loop
				if arg.type.has_formal_parameters (actual_parameters) then
					Result := True
					arg := Void -- Jump out of the loop.
				else
					arg := arg.next
				end
			end
		end

	resolve_formal_parameters (actual_parameters: ARRAY [ET_TYPE]) is
			-- Replace in types of current arguments the formal
			-- generic parameter types of index 'i' by
			-- 'actual_parameters.item (i)' when these
			-- new parameters are not void.
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			arg: like arguments
			a_type, new_type: ET_TYPE
		do
			from arg := arguments until arg = Void loop
				if arg.type = a_type then
						-- This argument shares the same
						-- type as the previous argument.
					arg.set_type (new_type)
				else
					a_type := arg.type
					if a_type.has_formal_parameters (actual_parameters) then
						new_type := a_type.deep_cloned_type
						new_type := new_type.resolved_formal_parameters (actual_parameters)
						arg.set_type (new_type)
					else
						new_type := a_type
					end
				end
				arg := arg.next
			end
		end

	resolve_identifier_types (a_feature: ET_FEATURE; a_flattener: ET_FEATURE_FLATTENER) is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of `a_feature' by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types and check
			-- validity of arguments' name.
		require
			a_feature_not_void: a_feature /= Void
			a_flattener_not_void: a_flattener /= Void
			immediate_or_redeclared: a_feature.implementation_class = a_flattener.current_class
		local
			arg: like arguments
		do
-- TODO: check arguments' names.
			from arg := arguments until arg = Void loop
				arg.resolve_identifier_types (a_feature, Current, a_flattener)
				arg := arg.next
			end
-- TODO: check cycles in 'like argument'.
		end

feature -- Duplication

	cloned_arguments: like Current is
			-- Cloned formal arguments;
			-- Do not recursively clone the types
		local
			arg: ET_FORMAL_ARGUMENT
			args: ARRAY [ET_FORMAL_ARGUMENT]
			i, nb: INTEGER
		do
			nb := count
			!! args.make (1, nb)
			from arg := arguments until arg = Void loop
				i := i + 1
				args.put (arg, i)
				arg := arg.next
			end
			arg := args.item (nb)
			!! Result.make (arg.name, arg.type)
			from i := nb - 1 until i < 1 loop
				arg := args.item (i)
				Result.put_first (arg.name, arg.type)
				i := i - 1
			end
		ensure
			arguments_not_void: Result /= Void
		end

invariant

	arguments_not_void: arguments /= Void
	count_positive: count >= 1

end -- class ET_FORMAL_ARGUMENTS

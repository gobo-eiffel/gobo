indexing

	description:

		"Eiffel feature signatures"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_SIGNATURE

inherit

	KL_IMPORTED_ARRAY_ROUTINES

creation

	make, make_from_array

feature {NONE} -- Initialization

	make (args: ET_FORMAL_ARGUMENTS; a_result: like result_type) is
			-- Create a new signature.
		local
			i, nb: INTEGER
		do
			result_type := a_result
			if args = Void then
				!! arguments.make (1, 0)
			else
				nb := args.count
				!! arguments.make (1, nb)
				from i := 1 until i > nb loop
					arguments.put (args.formal_argument (i).type, i)
					i := i + 1
				end
			end
		ensure
			result_type_set: result_type = a_result
		end

	make_from_array (args: like arguments; a_result: like result_type) is
			-- Create a new signature.
		require
			args_not_void: args /= Void
			no_void_arg: not ANY_ARRAY_.has (args, Void)
			args_lower: args.lower = 1
		do
			arguments := args
			result_type := a_result
		ensure
			arguments_set: arguments = args
			result_type_set: result_type = a_result
		end

feature -- Access

	arguments: ARRAY [ET_TYPE]
			-- Arguments type

	result_type: ET_TYPE
			-- Result type

feature -- Status report

	same_signature (other: ET_SIGNATURE): BOOLEAN is
			-- Is current signature the same signature as `other'?
		require
			other_not_void: other /= Void
		do
			Result := same_result_type (other) and
				same_arguments (other)
		end

	same_result_type (other: ET_SIGNATURE): BOOLEAN is
			-- Are the result types of current signature and
			-- `other' the same types?
		require
			other_not_void: other /= Void
		local
			other_type: ET_TYPE
		do
			other_type := other.result_type
			if result_type = Void then
				Result := other_type = Void
			elseif other_type = Void then
				Result := False
			else
				Result := result_type.same_syntactical_type (other_type)
			end
		end

	same_arguments (other: ET_SIGNATURE): BOOLEAN is
			-- Are the arguments of current signature and
			-- `other' the same?
		require
			other_not_void: other /= Void
		do
			if arguments.count /= other.arguments.count then
				Result := False
			else
					-- TODO
				Result := True
			end
		end

	signature_conforms_to (other: ET_SIGNATURE): BOOLEAN is
			-- Does current signature conform to `other'?
		require
			other_not_void: other /= Void
		do
			Result := result_type_conforms_to (other) and
				arguments_conform_to (other)
		end

	result_type_conforms_to (other: ET_SIGNATURE): BOOLEAN is
			-- Does the result type of current signature
			-- conform to the result type of `other'?
		require
			other_not_void: other /= Void
		do
			if result_type = Void then
				Result := other.result_type = Void
			elseif other.result_type = Void then
				Result := False
			else
					-- TODO: Test type.
				Result := True
			end
		end

	arguments_conform_to (other: ET_SIGNATURE): BOOLEAN is
			-- Do the arguments of current signature
			-- conform to the arguments of `other'?
		require
			other_not_void: other /= Void
		do
			if arguments.count /= other.arguments.count then
				Result := False
			else
					-- TODO
				Result := True
			end
		end

feature -- Type processing

	resolve_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS) is
			-- Replace in current signature the formal generic
			-- parameter types by those of `actual_parameters'
			-- when the corresponding actual parameter is different
			-- from the formal parameter. (Warning: this is a
			-- side-effect function.)
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			if result_type /= Void then
				result_type := result_type.resolved_formal_parameters (actual_parameters)
			end
			nb := arguments.count
			from i := 1 until i > nb loop
				a_type := arguments.item (i)
				arguments.put (a_type.resolved_formal_parameters (actual_parameters), i)
				i := i + 1
			end
		end

feature -- Duplication

	duplicate_types is
			-- Recursively duplicate all types
			-- in `arguments' and `result_type'.
		local
			i, nb: INTEGER
		do
			if result_type /= Void then
				result_type := result_type.deep_cloned_type
			end
			nb := arguments.count
			from i := 1 until i > nb loop
				arguments.put (arguments.item (i).deep_cloned_type, i)
				i := i + 1
			end
		end

invariant

	arguments_not_void: arguments /= Void
	no_void_argument: not ANY_ARRAY_.has (arguments, Void)
	arguments_lower: arguments.lower = 1

end -- class ET_SIGNATURE

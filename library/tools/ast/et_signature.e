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

	make (args: ET_FORMAL_ARGUMENTS; a_type: like type) is
			-- Create a new signature.
		local
			i: INTEGER
			arg: ET_FORMAL_ARGUMENT
		do
			type := a_type
			if args = Void then
				!! arguments.make (1, 0)
			else
				from arg := args.arguments until arg = Void loop
					i := i + 1
					arg := arg.next
				end
				!! arguments.make (1, i)
				i := 1
				from arg := args.arguments until arg = Void loop
					arguments.put (arg.type, i)
					i := i + 1
					arg := arg.next
				end
			end
		ensure
			type_set: type = a_type
		end

	make_from_array (args: like arguments; a_type: like type) is
			-- Create a new signature.
		require
			args_not_void: args /= Void
			no_void_arg: not ANY_ARRAY_.has (args, Void)
			args_lower: args.lower = 1
		do
			arguments := args
			type := a_type
		ensure
			arguments_set: arguments = args
			type_set: type = a_type
		end

feature -- Access

	arguments: ARRAY [ET_TYPE]
			-- Arguments type

	type: ET_TYPE
			-- Result type

feature -- Status report

	same_syntactical_signature (other: ET_SIGNATURE): BOOLEAN is
			-- Is current signature syntactically the
			-- same signature as `other' (e.g. do not
			-- try to resolve anchored types)?
		require
			other_not_void: other /= Void
		do
			Result := same_syntactical_type (other) and
				same_syntactical_arguments (other)
		end

	same_syntactical_type (other: ET_SIGNATURE): BOOLEAN is
			-- Are the types of current signature and
			-- `other' syntactically the same types (e.g.
			-- do not try to resolve anchored types)?
		require
			other_not_void: other /= Void
		local
			other_type: ET_TYPE
		do
			other_type := other.type
			if type = Void then
				Result := other_type = Void
			elseif other_type = Void then
				Result := False
			else
				Result := type.same_syntactical_type (other_type)
			end
		end

	same_syntactical_arguments (other: ET_SIGNATURE): BOOLEAN is
			-- Are the arguments of current signature and
			-- `other' syntactically the same (e.g. do not
			-- try to resolve anchored types)?
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
			Result := type_conforms_to (other) and
				arguments_conform_to (other)
		end

	type_conforms_to (other: ET_SIGNATURE): BOOLEAN is
			-- Does the type of current signature
			-- conform to the type of `other'?
		require
			other_not_void: other /= Void
		do
			if type = Void then
				Result := other.type = Void
			elseif other.type = Void then
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

	resolve_formal_parameters (actual_parameters: ARRAY [ET_TYPE]) is
			-- Replace in current signature the formal generic parameter
			-- types of index 'i' by 'actual_parameters.item (i)'
			-- when these new parameters are not void.
			-- (Warning: this is a side-effect function.)
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			if type /= Void then
				type := type.resolved_formal_parameters (actual_parameters)
			end
			nb := arguments.count
			from i := 1 until i > nb loop
				a_type := arguments.item (i)
				a_type := a_type.resolved_formal_parameters (actual_parameters)
				arguments.put (a_type, i)
				i := i + 1
			end
		end

feature -- Duplication

	duplicate_types is
			-- Recursively duplicate all types
			-- in `arguments' and `type'.
		local
			i, nb: INTEGER
		do
			type := clone (type)
			nb := arguments.count
			from i := 1 until i > nb loop
				arguments.put (clone (arguments.item (i)), i)
				i := i + 1
			end
		end

invariant

	arguments_not_void: arguments /= Void
	no_void_argument: not ANY_ARRAY_.has (arguments, Void)
	arguments_lower: arguments.lower = 1

end -- class ET_SIGNATURE

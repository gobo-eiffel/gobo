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

	make

feature {NONE} -- Initialization

	make (args: like arguments; a_type: like type) is
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

	same_signature (other: ET_SIGNATURE): BOOLEAN is
			-- Is current signature the same as `other'?
		require
			other_not_void: other /= Void
		do
			Result := same_type (other) and
				same_arguments (other)
		end

	signature_conforms_to (other: ET_SIGNATURE): BOOLEAN is
			-- Does current signature conform to `other'?
		require
			other_not_void: other /= Void
		do
			Result := type_conforms_to (other) and
				arguments_conform_to (other)
		end

	same_type (other: ET_SIGNATURE): BOOLEAN is
			-- Are the types of current signature and
			-- `other' the same?
		require
			other_not_void: other /= Void
		do
			if type = Void then
				Result := other.type = Void
			elseif other.type = Void then
				Result := False
			else
					-- TODO
				Result := True
			end
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

invariant

	arguments_not_void: arguments /= Void
	no_void_argument: not ANY_ARRAY_.has (arguments, Void)
	arguments_lower: arguments.lower = 1

end -- class ET_SIGNATURE

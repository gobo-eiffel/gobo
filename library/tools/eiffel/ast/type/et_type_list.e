indexing

	description:

		"Eiffel comma-separated lists of types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_TYPE_ITEM]

feature -- Initialization

	reset is
			-- Reset types as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).type.reset
				i := i + 1
			end
		end

feature -- Access

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

feature -- Status report

	has_named_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does one of current types appearing in `a_context' and `other'
			-- type appearing in `other_context' have the same named type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).type.same_named_type (other, other_context, a_context) then
					Result := True
					i := nb + 1 -- Jump out o fthe loop.
				else
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_TYPE_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

end

note

	description:

		"Eiffel lists of indexing terms"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_TERM_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_INDEXING_TERM_ITEM]

create

	make, make_with_capacity

feature -- Access

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not is_empty then
				Result := first.position
			else
				Result := tokens.null_position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if not is_empty then
				Result := first.first_leaf
			else
				Result := tokens.null_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			else
				Result := tokens.null_leaf
			end
		end

feature -- Status report

	has_indexing_term_value (a_value: STRING): BOOLEAN
			-- Does current indexing term list contain one
			-- which has value `a_value'?
			-- (case-insensitive comparison)
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				if storage.item (i).has_indexing_term_value (a_value) then
					Result := True
						-- Jump out of the loop.
					i := 0
				end
				i := i - 1
			end
		end

feature -- Basic operations

	append_indexing_terms_to_list (a_list: DS_ARRAYED_LIST [ET_INDEXING_TERM])
			-- Append indexing terms to `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				a_list.force_last (storage.item (i).indexing_term)
				i := i - 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_indexing_term_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_INDEXING_TERM_ITEM]
			-- Fixed array routines
		once
			create Result
		end

end

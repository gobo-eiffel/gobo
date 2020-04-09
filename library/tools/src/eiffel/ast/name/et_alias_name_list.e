note

	description:

		"Eiffel lists of alias feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIAS_NAME_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_ALIAS_NAME]

create

	make, make_with_capacity

feature -- Initialization

	reset
			-- Reset alias names as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).reset
				i := i + 1
			end
		end

feature -- Access

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if is_empty then
				Result := tokens.null_position
			else
				Result := first.position
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

	has_alias_name (a_name: ET_ALIAS_NAME): BOOLEAN
			-- Is `a_name' listed in current list?
		require
			a_name_not_void: a_name /= Void
		do
			Result := head_has_alias_name (a_name, count)
		end

	head_has_alias_name (a_name: ET_ALIAS_NAME; nb: INTEGER): BOOLEAN
			-- Is `a_name' listed in the first `nb' items of current list?
		require
			a_name_not_void: a_name /= Void
			nb_large_enough: nb >= 0
			nb_small_enough: nb <= count
		local
			i, nb2: INTEGER
		do
			nb2 := count - 1
			from i := count - nb until i > nb2 loop
				if a_name.same_alias_name (storage.item (i)) then
					Result := True
					i := nb2 + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_call_name (a_call_name: ET_CALL_NAME): BOOLEAN
			-- Is `a_call_name' the same call name as
			-- an alias name listed in current list?
		require
			a_call_name_not_void: a_call_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).same_call_name (a_call_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	same_alias_names (other: ET_ALIAS_NAME_LIST): BOOLEAN
			-- Do `other' contain the same alias names as current list?
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
		do
			if other.count = count and then count = 1 then
				Result := first.same_alias_name (other.first)
			else
				Result := True
				nb := count - 1
				from i := 0 until i > nb loop
					if not other.has_alias_name (storage.item (i)) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result then
						-- Run the loop on both sides to take into
						-- account the case where we have:
						--   'alias "+" alias "+"'
						-- and:
						--   'alias "+" alias "-"'
						-- with the same count, but duplicates.
					nb := other.count
					from i := 1 until i > nb loop
						if not has_alias_name (other.item (i)) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_alias_name_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ALIAS_NAME]
			-- Fixed array routines
		once
			create Result
		end

end

indexing

	description:

		"Eiffel debug instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_DEBUG_INSTRUCTION

inherit

	ET_INSTRUCTION
		undefine
			add_to_system
		end

	ET_COMPOUND
		rename
			make as make_compound,
			make_with_capacity as make_compound_with_capacity,
			keyword as debug_keyword,
			set_keyword as set_debug_keyword
		redefine
			break
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_debug: like debug_keyword; a_keys: like keys; an_end: like end_keyword) is
			-- Create a new debug instruction.
		require
			a_debug_not_void: a_debug /= Void
			an_end_not_void: an_end /= Void
		do
			keys := a_keys
			end_keyword := an_end
			make_compound (a_debug)
		ensure
			debug_keyword_set: debug_keyword = a_debug
			keys_set: keys = a_keys
			end_keyword_set: end_keyword = an_end
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_debug: like debug_keyword; a_keys: like keys;
		an_end: like end_keyword; nb: INTEGER) is
			-- Create a new debug instruction with capacity `nb'.
		require
			a_debug_not_void: a_debug /= Void
			an_end_not_void: an_end /= Void
			nb_positive: nb >= 0
		do
			keys := a_keys
			end_keyword := an_end
			make_compound_with_capacity (a_debug, nb)
		ensure
			debug_keyword_set: debug_keyword = a_debug
			keys_set: keys = a_keys
			end_keyword_set: end_keyword = an_end
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	end_keyword: ET_TOKEN
			-- 'end' keywords

	keys: ET_DEBUG_KEYS
			-- Debug keys

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Setting

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

	set_keys (a_keys: like keys) is
			-- Set `keys' to `a_keys'.
		do
			keys := a_keys
		ensure
			keys_set: keys = a_keys
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end -- class ET_DEBUG_INSTRUCTION

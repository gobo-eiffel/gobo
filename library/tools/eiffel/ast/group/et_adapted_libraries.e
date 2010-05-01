note

	description:

		"Eiffel adapted class library lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ADAPTED_LIBRARIES

inherit

	ANY

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_library: like library) is
			-- Create a new adapted library list with initially
			-- one library `a_library'.
		require
			a_library_not_void: a_library /= Void
		do
			create libraries.make (Initial_libraries_capacity)
			libraries.put_last (a_library)
		ensure
			one_library: libraries.count = 1
			libraries_set: libraries.last = a_library
		end

	make_empty is
			-- Create a new empty adapted library list.
		do
			create libraries.make (Initial_libraries_capacity)
		ensure
			is_empty: libraries.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is the list of libraries empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	library (i: INTEGER): ET_ADAPTED_LIBRARY is
			-- `i'-th library
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := libraries.item (i)
		ensure
			library_not_void: Result /= Void
		end

	adapted_library (a_library: ET_LIBRARY): ET_ADAPTED_LIBRARY is
			-- Adapted library corresponding to `a_library' in current list
			--  if any, Void otherwise
			--
			-- Note that `a_library' may appear twice by the current
			-- list. Return one of them in that case.
		require
			a_library_not_void: a_library /= Void
		local
			i, nb: INTEGER
			l_adapted_library: ET_ADAPTED_LIBRARY
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				l_adapted_library := libraries.item (i)
				if l_adapted_library.library = a_library then
					Result := l_adapted_library
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		ensure
			consistent: Result /= Void implies Result.library = a_library
		end

	libraries: DS_ARRAYED_LIST [like library]
			-- Adapted libraries

feature -- Measurement

	count: INTEGER is
			-- Number of libraries
		do
			Result := libraries.count
		ensure
			count_not_negative: Result >= 0
		end

feature -- Element change

	put_last (a_library: like library) is
			-- Add `a_library' to the list of libraries.
		require
			a_library_not_void: a_library /= Void
		do
			libraries.force_last (a_library)
		ensure
			one_more: libraries.count = old libraries.count + 1
			library_added: libraries.last = a_library
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [ET_LIBRARY]]) is
			-- Apply `an_action' to every library, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				an_action.call ([libraries.item (i).library])
				i := i + 1
			end
		end

	universes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]) is
			-- Apply `an_action' to every library (viewed as a universe), from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				an_action.call ([libraries.item (i).library])
				i := i + 1
			end
		end

	universes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN]) is
			-- Apply `an_action' to every library (viewed as a universe) that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i, nb: INTEGER
			l_library: ET_LIBRARY
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				l_library := libraries.item (i).library
				if a_test.item ([l_library]) then
					an_action.call ([l_library])
				end
				i := i + 1
			end
		end

	do_adapted (an_action: PROCEDURE [ANY, TUPLE [ET_ADAPTED_LIBRARY]]) is
			-- Apply `an_action' to every library, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		do
			libraries.do_all (an_action)
		end

	do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_LIBRARY]]) is
			-- Apply `an_action' to every library,
			-- and to all libraries reachable from them.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_LIBRARY]
		do
			create l_visited.make (10)
			do_all (agent {ET_LIBRARY}.add_library_recursive (l_visited))
			l_visited.do_all (an_action)
		end

feature {NONE} -- Constants

	Initial_libraries_capacity: INTEGER is 50
			-- Initial capacity for `libraries'

invariant

	libraries_not_void: libraries /= Void
	no_void_library: not libraries.has_void

end

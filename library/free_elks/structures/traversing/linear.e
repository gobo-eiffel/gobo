indexing

	description:
		"Structures whose items may be accessed sequentially, one-way"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: sequential, traversing;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class LINEAR [G] inherit

	TRAVERSABLE [G]
		redefine
			do_all, do_if, there_exists, for_all
		end

feature -- Access

	has (v: like item): BOOLEAN is
			-- Does structure include an occurrence of `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			start
			if not off then
				search (v)
			end
			Result := not exhausted
		end

	index_of (v: like item; i: INTEGER): INTEGER is
			-- Index of `i'-th occurrence of `v'.
			-- 0 if none.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		require
			positive_occurrences: i > 0
		local
			occur, pos: INTEGER
		do
			if object_comparison and v /= Void then
				from
					start
					pos := 1
				until
					exhausted or (occur = i)
				loop
					if {w: like item} item and then v.is_equal (w) then
						occur := occur + 1
					end
					forth
					pos := pos + 1
				end
			else
				from
					start
					pos := 1
				until
					exhausted or (occur = i)
				loop
					if item = v then
						occur := occur + 1
					end
					forth
					pos := pos + 1
				end
			end
			if occur = i then
				Result := pos - 1
			end
		ensure
			non_negative_result: Result >= 0
		end

	search (v: like item) is
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
			-- If no such position ensure that `exhausted' will be true.
		do
			if object_comparison and v /= Void then
				from
				until
					exhausted or else ({i: like item} item and then v.is_equal (i))
				loop
					forth
				end
			else
				from
				until
					exhausted or else v = item
				loop
					forth
				end
			end
		ensure
			object_found: (not exhausted and object_comparison)
				 implies equal (v, item)
			item_found: (not exhausted and not object_comparison)
				 implies v = item
		end

	index: INTEGER is
			-- Index of current position
		deferred
		end

	occurrences (v: like item): INTEGER is
			-- Number of times `v' appears.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			from
				start
				search (v)
			until
				exhausted
			loop
				Result := Result + 1
				forth
				search (v)
			end
		end

	item_for_iteration: G is
			-- Item at current position
		require
			not_off: not off
		do
			Result := item
		end

feature -- Status report

	exhausted: BOOLEAN is
			-- Has structure been completely explored?
		do
			Result := off
		ensure
			exhausted_when_off: off implies Result
		end

	after: BOOLEAN is
			-- Is there no valid position to the right of current one?
		deferred
		end

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := is_empty or after
		end

feature -- Cursor movement

	finish is
			-- Move to last position.
		deferred
		end

	forth is
			-- Move to next position; if no next position,
			-- ensure that `exhausted' will be true.
		require
			not_after: not after
		deferred
		ensure
			-- moved_forth_before_end: (not after) implies index = old index + 1
		end

feature -- Iteration

	do_all (action: PROCEDURE [ANY, TUPLE [G]]) is
			-- Apply `action' to every item.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			t: TUPLE [G]
			c: ?CURSOR
		do
			if {acs: CURSOR_STRUCTURE [G]} Current then
				c := acs.cursor
			end

			create t
			from
				start
			until
				after
			loop
				t.put (item, 1)
				action.call (t)
				forth
			end

			if c /= Void and then {cs: CURSOR_STRUCTURE [G]} Current and then {ac: CURSOR} c then
				cs.go_to (ac)
			end
		end

	do_if (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item that satisfies `test'.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			t: TUPLE [G]
			c: ?CURSOR
		do
			if {acs: CURSOR_STRUCTURE [G]} Current then
				c := acs.cursor
			end

			create t
			from
				start
			until
				after
			loop
				t.put (item, 1)
				if test.item (t) then
					action.call (t)
				end
				forth
			end

			if c /= Void and then {cs: CURSOR_STRUCTURE [G]} Current and then {ac: CURSOR} c then
				cs.go_to (ac)
			end
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for at least one item?
			-- Semantics not guaranteed if `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			c: ?CURSOR
			t: TUPLE [G]
		do
			create t

			if {acs: CURSOR_STRUCTURE [G]} Current then
				c := acs.cursor
			end

			from
				start
			until
				after or Result
			loop
				t.put (item, 1)
				Result := test.item (t)
				forth
			end

			if c /= Void and then {cs: CURSOR_STRUCTURE [G]} Current and then {ac: CURSOR} c then
				cs.go_to (ac)
			end
		end

	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for all items?
			-- Semantics not guaranteed if `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			c: ?CURSOR
			t: TUPLE [G]
		do
			create t

			if {acs: CURSOR_STRUCTURE [G]} Current then
				c := acs.cursor
			end

			from
				start
				Result := True
			until
				after or not Result
			loop
				t.put (item, 1)
				Result := test.item (t)
				forth
			end

			if c /= Void and then {cs: CURSOR_STRUCTURE [G]} Current and then {ac: CURSOR} c then
				cs.go_to (ac)
			end
		ensure then
			empty: is_empty implies Result
		end

feature -- Conversion

	linear_representation: LINEAR [G] is
			-- Representation as a linear structure
		do
			Result := Current
		end

invariant

	after_constraint: after implies off

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2008, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class LINEAR




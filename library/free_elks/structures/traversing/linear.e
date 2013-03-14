note
	description: "Structures whose items may be accessed sequentially, one-way"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: sequential, traversing;
	access: membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class LINEAR [G] inherit

	TRAVERSABLE [G]
		redefine
			do_all, do_if, there_exists, for_all
		end

feature -- Access

	has (v: like item): BOOLEAN
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

	index_of (v: like item; i: INTEGER): INTEGER
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
					if item ~ v then
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

	search (v: like item)
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
			-- If no such position ensure that `exhausted' will be true.
		do
			if object_comparison then
				from
				until
					exhausted or else v ~ item
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
				 implies v ~ item
			item_found: (not exhausted and not object_comparison)
				 implies v = item
		end

	index: INTEGER
			-- Index of current position
		deferred
		end

	occurrences (v: like item): INTEGER
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

	item_for_iteration: G
			-- Item at current position
		require
			not_off: not off
		do
			Result := item
		end

feature -- Status report

	exhausted: BOOLEAN
			-- Has structure been completely explored?
		do
			Result := off
		ensure
			exhausted_when_off: off implies Result
		end

	after: BOOLEAN
			-- Is there no valid position to the right of current one?
		deferred
		end

	off: BOOLEAN
			-- Is there no current item?
		do
			Result := is_empty or after
		end

feature -- Cursor movement

	finish
			-- Move to last position.
		deferred
		end

	forth
			-- Move to next position; if no next position,
			-- ensure that `exhausted' will be true.
		require
			not_after: not after
		deferred
		ensure
			-- moved_forth_before_end: (not after) implies index = old index + 1
		end

feature -- Iteration

	do_all (action: PROCEDURE [ANY, TUPLE [G]])
			-- Apply `action' to every item.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			c: detachable CURSOR
			cs: detachable CURSOR_STRUCTURE [G]
		do
			if attached {CURSOR_STRUCTURE [G]} Current as acs then
				cs := acs
				c := acs.cursor
			end

			from
				start
			until
				after
			loop
				action.call ([item])
				forth
			end

			if cs /= Void and c /= Void then
				cs.go_to (c)
			end
		end

	do_if (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item that satisfies `test'.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			c: detachable CURSOR
			cs: detachable CURSOR_STRUCTURE [G]
		do
			if attached {CURSOR_STRUCTURE [G]} Current as acs then
				cs := acs
				c := acs.cursor
			end

			from
				start
			until
				after
			loop
				if test.item ([item]) then
					action.call ([item])
				end
				forth
			end

			if cs /= Void and c /= Void then
				cs.go_to (c)
			end
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `test' true for at least one item?
			-- Semantics not guaranteed if `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			c: detachable CURSOR
			cs: detachable  CURSOR_STRUCTURE [G]
		do
			if attached {CURSOR_STRUCTURE [G]} Current as acs then
				cs := acs
				c := acs.cursor
			end

			from
				start
			until
				after or Result
			loop
				Result := test.item ([item])
				forth
			end

			if cs /= Void and c /=Void then
				cs.go_to (c)
			end
		end

	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `test' true for all items?
			-- Semantics not guaranteed if `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		local
			c: detachable CURSOR
			cs: detachable  CURSOR_STRUCTURE [G]
		do
			if attached {CURSOR_STRUCTURE [G]} Current as acs then
				cs := acs
				c := acs.cursor
			end

			from
				start
				Result := True
			until
				after or not Result
			loop
				Result := test.item ([item])
				forth
			end

			if cs /= Void and c /= Void then
				cs.go_to (c)
			end
		ensure then
			empty: is_empty implies Result
		end

feature -- Conversion

	linear_representation: LINEAR [G]
			-- Representation as a linear structure
		do
			Result := Current
		end

invariant

	after_constraint: after implies off

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end

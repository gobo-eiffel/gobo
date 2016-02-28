note
	description: "Sequential lists, without commitment to a particular representation"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: list, sequence;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class LIST [G] inherit

	CHAIN [G]
		export
			{ANY} remove
		redefine
			forth, is_equal
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Does `other' contain the same elements?
		do
			if Current = other then
				Result := True
			else
				Result := (is_empty = other.is_empty) and
						(object_comparison = other.object_comparison) and
						(count = other.count)
				if Result and not is_empty then
					if
						attached {CURSOR} cursor as c1 and then
						attached {CURSOR} other.cursor as c2
					then
						from
							start
							other.start
						until
							after or not Result
						loop
							if object_comparison then
								Result := item ~ other.item
							else
								Result := item = other.item
							end
							forth
							other.forth
						end
						go_to (c1)
						other.go_to (c2)
					else
						check
							cursors_exist: False
								-- Because every list contains a cursor object
						end
					end
				elseif is_empty and other.is_empty and
					object_comparison = other.object_comparison then
					Result := True
				end
			end
		ensure then
			indices_unchanged:
				index = old index and other.index = old other.index
			true_implies_same_size: Result implies count = other.count
		end

feature -- Status report

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?
		do
			Result := (index = count + 1)
		end

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?
		do
			Result := (index = 0)
		end

feature -- Cursor movement

	forth
			-- Move to next position; if no next position,
			-- ensure that `exhausted' will be true.
		deferred
		ensure then
			moved_forth: index = old index + 1
		end

invariant

	before_definition: before = (index = 0)
	after_definition: after = (index = count + 1)

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

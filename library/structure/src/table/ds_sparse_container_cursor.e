note

	description:

		"Cursors for sparse container traversals"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_SPARSE_CONTAINER_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			next_cursor,
			off
		end

	MISMATCH_CORRECTOR
		export
			{NONE} all
		undefine
			copy, is_equal
		redefine
			correct_mismatch
		end

create

	make

feature {NONE} -- Initialization

	make (a_container: like container)
			-- Create a new cursor for `a_container'.
		require
			a_container_not_void: a_container /= Void
		do
			container := a_container
			position := before_position
		ensure
			container_set: container = a_container
			before: before
		end

feature -- Access

	container: DS_SPARSE_CONTAINER [G, K]
			-- Container traversed

feature -- Status report

	after: BOOLEAN
			-- Is there no valid position to right of cursor?
		do
			Result := (position = after_position)
		end

	before: BOOLEAN
			-- Is there no valid position to left of cursor?
		do
			Result := (position = before_position)
		end

	off: BOOLEAN
			-- Is there no item at cursor position?
		do
			Result := position < 0
		end

feature {DS_SPARSE_CONTAINER, DS_SPARSE_CONTAINER_CURSOR} -- Implementation

	position: INTEGER
			-- Internal position in container

feature {DS_SPARSE_CONTAINER} -- Implementation

	set_position (p: INTEGER)
			-- Set `position' to `p'.
		require
			valid_p: valid_position (p)
		do
			position := p
		ensure
			position_set: position = p
		end

	set_after
			-- Set `position' to after position
		do
			position := after_position
		ensure
			after: after
		end

	set_before
			-- Set `position' to before position
		do
			position := before_position
		ensure
			before: before
		end

	valid_position (p: INTEGER): BOOLEAN
			-- Is `p' a valid value for `position'?
		do
			Result := (p = before_position or p = after_position) or
				(container.valid_position (p) and then container.valid_slot (p))
		ensure
			not_off: (container.valid_position (p) and then container.valid_slot (p)) implies Result
			before: (p = before_position) implies Result
			after: (p = after_position) implies Result
			valid_slot: (Result and container.valid_position (p)) implies container.valid_slot (p)
		end

	before_position: INTEGER = -2
			-- Special value for before cursor position

	after_position: INTEGER = -3
			-- Special values for after cursor position

feature {DS_SPARSE_CONTAINER} -- Implementation

	next_cursor: detachable DS_SPARSE_CONTAINER_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

feature {NONE} -- Storable mismatch

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			l_stored_version_number: INTEGER
		do
			if not attached mismatch_information.stored_version as l_stored_version or else l_stored_version.is_empty then
				correct_mismatch_20130823
			elseif l_stored_version.is_integer then
				l_stored_version_number := l_stored_version.to_integer
				if l_stored_version_number < 20130823 then
					correct_mismatch_20130823
				else
					precursor
				end
			else
				precursor
			end
		end

	correct_mismatch_20130823
			-- Correct storable mismatch introducted in version "20130823".
		do
			position := position - 1
		end

invariant

		-- The following assertion is commented out because
		-- some Eiffel compilers check invariants even when the
		-- execution of the creation procedure is not completed.
		-- (In this case, this is `container' which is not fully
		-- created yet, breaking its invariant.)
--	valid_position: valid_position (position)

end

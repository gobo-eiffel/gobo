note

	description:

		"Cursors for sparse container traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_SPARSE_CONTAINER_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			next_cursor
		end

create

	make

feature {NONE} -- Initialization

	make (a_container: like container) is
			-- Create a new cursor for `a_container'.
		require
			a_container_not_void: a_container /= Void
		do
			container := a_container
			position := container.before_position
		ensure
			container_set: container = a_container
			before: before
		end

feature -- Access

	container: DS_SPARSE_CONTAINER [G, K]
			-- Container traversed

feature {DS_SPARSE_CONTAINER, DS_SPARSE_CONTAINER_CURSOR} -- Implementation

	position: INTEGER
			-- Internal position in container

feature {DS_SPARSE_CONTAINER} -- Implementation

	set_position (p: INTEGER) is
			-- Set `position' to `p'.
		require
			valid_p: valid_position (p)
		do
			position := p
		ensure
			position_set: position = p
		end

	set_after is
			-- Set `position' to after position
		do
			position := container.after_position
		ensure
			after: after
		end

	set_before is
			-- Set `position' to before position
		do
			position := container.before_position
		ensure
			before: before
		end

	valid_position (p: INTEGER): BOOLEAN is
			-- Is `p' a valid value for `position'?
		do
			Result := (p = container.before_position or p = container.after_position) or
				(container.valid_position (p) and then container.valid_slot (p))
		ensure
			not_off: (container.valid_position (p) and then container.valid_slot (p)) implies Result
			before: (p = container.before_position) implies Result
			after: (p = container.after_position) implies Result
			valid_slot: (Result and container.valid_position (p)) implies container.valid_slot (p)
		end

feature {DS_SPARSE_CONTAINER} -- Implementation

	next_cursor: DS_SPARSE_CONTAINER_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

		-- The following assertion is commented out because
		-- some Eiffel compilers check invariants even when the
		-- execution of the creation procedure is not completed.
		-- (In this case, this is `container' which is not fully
		-- created yet, breaking its invariant.)
--	valid_position: valid_position (position)

end

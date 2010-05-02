note

	description:

		"Linked list with a routine called before adding an object"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"


deferred class XM_LINKED_LIST [G]

inherit

	DS_LINKED_LIST [G]
		redefine
			append, append_first, append_last,
			append_right_cursor, append_left_cursor,
			extend, extend_first, extend_last,
			extend_right_cursor, extend_left_cursor,
			force, force_first, force_last,
			force_right_cursor, force_left_cursor,
			put, put_first, put_last,
			put_right_cursor, put_left_cursor,
			replace, replace_at, replace_at_cursor
		end

feature {NONE} -- Preprocessing

	before_addition (a_node: G)
			-- Called before an item is added to this container.
		deferred
		end

	before_addition_list (a_list: DS_LINEAR [G])
			-- Call `before_addition' on all items.
		require
			a_list_not_void: a_list /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [G]
		do
			from
				a_cursor := a_list.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				before_addition (a_cursor.item)
				a_cursor.forth
			end
		end

feature -- Element change

	append (other: DS_LINEAR [G]; i: INTEGER)
			-- `append' with parent processing.
		do
			before_addition_list (other)
			Precursor (other, i)
		end

	append_first (other: DS_LINEAR [G])
			-- `append_first' with parent processing.
		do
			before_addition_list (other)
			Precursor (other)
		end

	append_last (other: DS_LINEAR [G])
			-- `append_last' with parent processing.
		do
			before_addition_list (other)
			Precursor (other)
		end

	append_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- `append_left_cursor' with parent processing.
		do
			before_addition_list (other)
			Precursor (other, a_cursor)
		end

	append_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- `append_right_cursor' with parent processing.
		do
			before_addition_list (other)
			Precursor (other, a_cursor)
		end

	extend (other: DS_LINEAR [G]; i: INTEGER)
			-- `extend' with parent processing.
		do
			before_addition_list (other)
			Precursor (other, i)
		end

	extend_first (other: DS_LINEAR [G])
			-- `extend_first' with parent processing.
		do
			before_addition_list (other)
			Precursor (other)
		end

	extend_last (other: DS_LINEAR [G])
			-- `extend_last' with parent processing.
		do
			before_addition_list (other)
			Precursor (other)
		end

	extend_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- `extend_left_cursor' with parent processing.
		do
			before_addition_list (other)
			Precursor (other, a_cursor)
		end

	extend_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- `extend_right_cursor' with parent processing.
		do
			before_addition_list (other)
			Precursor (other, a_cursor)
		end

	force (v: G; i: INTEGER)
			-- `force' with parent processing.
		do
			before_addition (v)
			Precursor (v, i)
		end

	force_first (v: G)
			-- `force_first' with parent processing.
		do
			before_addition (v)
			Precursor (v)
		end

	force_last (v: G)
			-- `force_last' with parent processing.
		do
			before_addition (v)
			Precursor (v)
		end

	force_left_cursor (v: G; a_cursor: like new_cursor)
			-- `force_left_cursor' with parent processing.
		do
			before_addition (v)
			Precursor (v, a_cursor)
		end

	force_right_cursor (v: G; a_cursor: like new_cursor)
			-- `force_right_cursor' with parent processing.
		do
			before_addition (v)
			Precursor (v, a_cursor)
		end

	put (v: G; i: INTEGER)
			-- `put' with parent processing.
		do
			before_addition (v)
			Precursor (v, i)
		end

	put_first (v: G)
			-- `put_first' with parent processing.
		do
			before_addition (v)
			Precursor (v)
		end

	put_last (v: G)
			-- `put_last' with parent processing.
		do
			before_addition (v)
			Precursor (v)
		end

	put_left_cursor (v: G; a_cursor: like new_cursor)
			-- `put_left_cursor' with parent processing.
		do
			before_addition (v)
			Precursor (v, a_cursor)
		end

	put_right_cursor (v: G; a_cursor: like new_cursor)
			-- `put_right_cursor' with parent processing.
		do
			before_addition (v)
			Precursor (v, a_cursor)
		end

	replace (v: G; i: INTEGER)
			-- `replace' with parent processing.
		do
			before_addition (v)
			Precursor (v, i)
		end

	replace_at (v: G)
			-- `replace_at' with parent processing.
		do
			before_addition (v)
			Precursor (v)
		end

	replace_at_cursor (v: G; a_cursor: like new_cursor)
			-- `replace_at_cursor' with parent processing.
		do
			before_addition (v)
			Precursor (v, a_cursor)
		end

end

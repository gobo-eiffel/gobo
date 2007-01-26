indexing

	description:

		"LACE exclude clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_EXCLUDE

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new exclude clause.
		do
			create identifiers.make (identifiers_initial_capacity)
		end

feature -- Status report

	has (a_name: STRING): BOOLEAN is
			-- Does current exclude clause list `a_name'?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := identifiers.count
			from i := 1 until i > nb loop
				if STRING_.same_string (identifiers.item (i).name, a_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_case_insensitive (a_name: STRING): BOOLEAN is
			-- Does current exclude clause list `a_name'?
			-- Case-insensitive version.
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := identifiers.count
			from i := 1 until i > nb loop
				if STRING_.same_case_insensitive (identifiers.item (i).name, a_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Access

	item (i: INTEGER): ET_IDENTIFIER is
			-- `i'-th identifier in current exclude clause
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := identifiers.item (i)
		ensure
			item_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER is
			-- Number of identifers in current exclude clause
		do
			Result := identifiers.count
		ensure
			count_positive: Result >= 0
		end

feature -- Element change

	put_last (an_item: like item) is
			-- Add `an_item' to the end of current exclude clause.
		require
			an_item_not_void: an_item /= Void
		do
			identifiers.force_last (an_item)
		ensure
			one_more: count = old count + 1
			inserted: item (count) = an_item
		end

feature {NONE} -- Implementation

	identifiers: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Identifiers listed in exclude clause

feature {NONE} -- Constants

	identifiers_initial_capacity: INTEGER is 4
			-- Initial capacity for `identifiers'

invariant

	identifiers_not_void: identifiers /= Void
	no_void_identifier: not identifiers.has (Void)

end

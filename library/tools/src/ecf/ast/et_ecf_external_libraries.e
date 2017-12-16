note

	description:

		"ECF external library lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_LIBRARIES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_external_library: like external_library)
			-- Create a new external library list with initially one library `a_external_library'.
		require
			a_external_library_not_void: a_external_library /= Void
		do
			create external_libraries.make (Initial_external_libraries_capacity)
			external_libraries.put_last (a_external_library)
		ensure
			one_external_library: external_libraries.count = 1
			external_library_set: external_libraries.last = a_external_library
		end

	make_empty
			-- Create a new empty external library list.
		do
			create external_libraries.make (Initial_external_libraries_capacity)
		ensure
			is_empty: external_libraries.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is the list of external libraries empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	external_library (i: INTEGER): ET_ECF_EXTERNAL_LIBRARY
			-- `i'-th external library
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := external_libraries.item (i)
		ensure
			external_library_not_void: Result /= Void
		end

	external_libraries: DS_ARRAYED_LIST [like external_library]
			-- External libraries

feature -- Measurement

	count: INTEGER
			-- Number of external libraries
		do
			Result := external_libraries.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = external_libraries.count
		end

feature -- Element change

	put_last (a_external_library: like external_library)
			-- Add `a_external_library' to the list of external libraries.
		require
			a_external_library_not_void: a_external_library /= Void
		do
			external_libraries.force_last (a_external_library)
		ensure
			one_more: external_libraries.count = old external_libraries.count + 1
			external_library_added: external_libraries.last = a_external_library
		end

	fill_external_libraries (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Add to `a_universe.current_system' the current external libraries
			-- whose conditions satisfy `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		do
			external_libraries.do_all (agent {ET_ECF_EXTERNAL_LIBRARY}.fill_external_libraries (a_universe, a_state))
		end

feature {NONE} -- Constants

	Initial_external_libraries_capacity: INTEGER = 50
			-- Initial capacity for `external_libraries'

invariant

	external_libraries_not_void: external_libraries /= Void
	no_void_external_library: not external_libraries.has_void

end

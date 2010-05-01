note

	description:

		"ECF external library lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_LIBRARIES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_external_library: like external_library) is
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

	make_empty is
			-- Create a new empty external library list.
		do
			create external_libraries.make (Initial_external_libraries_capacity)
		ensure
			is_empty: external_libraries.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN is
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

	count: INTEGER is
			-- Number of external libraries
		do
			Result := external_libraries.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = external_libraries.count
		end

feature -- Element change

	put_last (a_external_library: like external_library) is
			-- Add `a_external_library' to the list of external libraries.
		require
			a_external_library_not_void: a_external_library /= Void
		do
			external_libraries.force_last (a_external_library)
		ensure
			one_more: external_libraries.count = old external_libraries.count + 1
			external_library_added: external_libraries.last = a_external_library
		end

	fill_external_libraries (a_system: ET_SYSTEM; a_state: ET_ECF_STATE) is
			-- Add to `a_system' the current external libraries
			-- whose conditions satisfy `a_state'.
		require
			a_system_not_void: a_system /= Void
			a_state_not_void: a_state /= Void
		do
			external_libraries.do_all (agent {ET_ECF_EXTERNAL_LIBRARY}.fill_external_libraries (a_system, a_state))
		end

feature {NONE} -- Constants

	Initial_external_libraries_capacity: INTEGER is 50
			-- Initial capacity for `external_libraries'

invariant

	external_libraries_not_void: external_libraries /= Void
	no_void_external_library: not external_libraries.has_void

end

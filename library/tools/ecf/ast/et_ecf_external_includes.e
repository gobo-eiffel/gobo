indexing

	description:

		"ECF external include lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_INCLUDES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_external_include: like external_include) is
			-- Create a new external include list with initially one include `a_external_include'.
		require
			a_external_include_not_void: a_external_include /= Void
		do
			create external_includes.make (Initial_external_includes_capacity)
			external_includes.put_last (a_external_include)
		ensure
			one_external_include: external_includes.count = 1
			external_include_set: external_includes.last = a_external_include
		end

	make_empty is
			-- Create a new empty external include list.
		do
			create external_includes.make (Initial_external_includes_capacity)
		ensure
			is_empty: external_includes.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is the list of external includes empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	external_include (i: INTEGER): ET_ECF_EXTERNAL_INCLUDE is
			-- `i'-th external include
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := external_includes.item (i)
		ensure
			external_include_not_void: Result /= Void
		end

	external_includes: DS_ARRAYED_LIST [like external_include]
			-- External includes

feature -- Measurement

	count: INTEGER is
			-- Number of external includes
		do
			Result := external_includes.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = external_includes.count
		end

feature -- Element change

	put_last (a_external_include: like external_include) is
			-- Add `a_external_include' to the list of external includes.
		require
			a_external_include_not_void: a_external_include /= Void
		do
			external_includes.force_last (a_external_include)
		ensure
			one_more: external_includes.count = old external_includes.count + 1
			external_include_added: external_includes.last = a_external_include
		end

	fill_external_includes (a_system: ET_SYSTEM; a_state: ET_ECF_STATE) is
			-- Add to `a_system' the current external includes
			-- whose conditions satisfy `a_state'.
		require
			a_system_not_void: a_system /= Void
			a_state_not_void: a_state /= Void
		do
			external_includes.do_all (agent {ET_ECF_EXTERNAL_INCLUDE}.fill_external_includes (a_system, a_state))
		end

feature {NONE} -- Constants

	Initial_external_includes_capacity: INTEGER is 50
			-- Initial capacity for `external_includes'

invariant

	external_includes_not_void: external_includes /= Void
	no_void_external_include: not external_includes.has (Void)

end

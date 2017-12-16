note

	description:

		"ECF external object lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_OBJECTS

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_external_object: like external_object)
			-- Create a new external object list with initially one object `a_external_object'.
		require
			a_external_object_not_void: a_external_object /= Void
		do
			create external_objects.make (Initial_external_objects_capacity)
			external_objects.put_last (a_external_object)
		ensure
			one_external_object: external_objects.count = 1
			external_object_set: external_objects.last = a_external_object
		end

	make_empty
			-- Create a new empty external object list.
		do
			create external_objects.make (Initial_external_objects_capacity)
		ensure
			is_empty: external_objects.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is the list of external objects empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	external_object (i: INTEGER): ET_ECF_EXTERNAL_OBJECT
			-- `i'-th external object
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := external_objects.item (i)
		ensure
			external_object_not_void: Result /= Void
		end

	external_objects: DS_ARRAYED_LIST [like external_object]
			-- External objects

feature -- Measurement

	count: INTEGER
			-- Number of external objects
		do
			Result := external_objects.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = external_objects.count
		end

feature -- Element change

	put_last (a_external_object: like external_object)
			-- Add `a_external_object' to the list of external objects.
		require
			a_external_object_not_void: a_external_object /= Void
		do
			external_objects.force_last (a_external_object)
		ensure
			one_more: external_objects.count = old external_objects.count + 1
			external_object_added: external_objects.last = a_external_object
		end

	fill_external_objects (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Add to `a_universe.current_system' the current external objects
			-- whose conditions satisfy `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		do
			external_objects.do_all (agent {ET_ECF_EXTERNAL_OBJECT}.fill_external_objects (a_universe, a_state))
		end

feature {NONE} -- Constants

	Initial_external_objects_capacity: INTEGER = 50
			-- Initial capacity for `external_objects'

invariant

	external_objects_not_void: external_objects /= Void
	no_void_external_object: not external_objects.has_void

end

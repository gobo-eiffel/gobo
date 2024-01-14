note

	description:

		"Eiffel lists of queries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2023, Eric Bezault and others"
	license: "MIT License"

class ET_QUERY_LIST

inherit

	ET_FEATURE_LIST
		redefine
			item, fixed_array
		end

create

	make, make_with_capacity

feature -- Access

	item (i: INTEGER): ET_QUERY
			-- Query at index `i' in list
		do
			Result := storage.item (count - i)
		end

feature -- Measurement

	attribute_count: INTEGER
			-- Number of attributes in the corresponding class
			-- (includes the attributes inherited)

	declared_attribute_count: INTEGER
			-- Number of attributes declared in the corresponding class
			-- (i.e. appearing in one of its feature clauses).

feature -- Setting

	set_attribute_count (a_count: INTEGER)
			-- Set `attribute_count' to `a_count'.
		require
			a_count_large_enough: a_count >= declared_attribute_count
			a_count_small_enough: a_count <= count
		do
			attribute_count := a_count
		ensure
			attribute_count_set: attribute_count = a_count
		end

	set_declared_attribute_count (a_count: INTEGER)
			-- Set `declared_attribute_count' to `a_count'.
		require
			a_count_large_enough: a_count >= 0
			a_count_small_enough_1: a_count <= attribute_count
			a_count_small_enough_2: a_count <= declared_count
		do
			declared_attribute_count := a_count
		ensure
			declared_attribute_count_set: declared_attribute_count = a_count
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_QUERY]
			-- Fixed array routines
		once
			create Result
		end

invariant

	declared_attribute_count_large_enough: declared_attribute_count >= 0
	declared_attribute_count_small_enough_1: declared_attribute_count <= attribute_count
	declared_attribute_count_small_enough_2: declared_attribute_count <= declared_count
	attribute_count_small_enough: attribute_count <= count

end

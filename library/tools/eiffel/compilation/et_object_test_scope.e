indexing

	description:

	"[
		Eiffel object-test scopes, to determine whether a given occurrence
		of an object-test local appears in its scope or not.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_OBJECT_TEST_SCOPE

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new object-test scope.
		do
			create object_tests.make (50)
		end

feature -- Status report

	has_local (a_local: ET_IDENTIFIER): BOOLEAN is
			-- Are we currently in the scope of `a_local'?
		require
			a_local_not_void: a_local /= Void
			a_object_test_local: a_local.is_object_test_local
		local
			i: INTEGER
		do
			i := object_tests.count
			from until i < 1 loop
				if object_tests.item (i).name.same_identifier (a_local) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

feature -- Access

	object_test (a_local: ET_IDENTIFIER): ET_OBJECT_TEST is
			-- If we are currently in the scope of `a_local', then
			-- return its associated object-test, otherwise Void
		require
			a_local_not_void: a_local /= Void
			a_object_test_local: a_local.is_object_test_local
		local
			i: INTEGER
			l_object_test: ET_OBJECT_TEST
		do
			i := object_tests.count
			from until i < 1 loop
				l_object_test := object_tests.item (i)
				if l_object_test.name.same_identifier (a_local) then
					Result := l_object_test
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			object_test_not_void: has_local (a_local) = (Result /= Void)
		end

	object_tests: DS_ARRAYED_LIST [ET_OBJECT_TEST]
			-- Object-tests for which we are currently
			-- within scope their locals

feature -- Measurement

	count: INTEGER is
			-- Number of object-tests for which we are currently
			-- within scope of their locals
		do
			Result := object_tests.count
		ensure
			count_not_negative: Result >= 0
		end

feature -- Element change

	add_object_test (a_object_test: ET_OBJECT_TEST) is
			-- Indicate that we are currently within the scope
			-- of the local of `a_object_test'.
		require
			a_object_test_not_void: a_object_test /= Void
		do
			object_tests.force_last (a_object_test)
		end

	remove_object_tests (n: INTEGER) is
			-- Indicate that we are not in the scope of
			-- the last `n' object-test locals.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
		do
			object_tests.prune_last (n)
		end

	keep_object_tests (n: INTEGER) is
			-- Indicate that we are now in the scope of
			-- only the first `n' object-test locals.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
		do
			object_tests.keep_first (n)
		end

invariant

	object_tests_not_void: object_tests /= Void
	no_void_object_test: not object_tests.has (Void)

end

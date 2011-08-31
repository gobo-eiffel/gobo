note

	description:

	"[
		Eiffel object-test scopes, to determine whether a given occurrence
		of an object-test local appears in its scope or not.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_OBJECT_TEST_SCOPE

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new object-test scope.
		do
			hidden_count := 0
			create object_tests.make (50)
		ensure
			count_set: count = 0
			hidden_count_set: hidden_count = 0
		end

feature -- Status report

	has_local (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of object-test local `a_name'?
			-- (Ignore hidden object-test locals.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			i := object_tests.count
			nb := hidden_count + 1
			from until i < nb loop
				if object_tests.item (i).name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

	has_hidden_local (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of object-test local `a_name', although it has been hidden?
			-- (We are probably currently analyzing an inline agent and `a_name' has
			-- been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			i := hidden_count
			from until i < 1 loop
				if object_tests.item (i).name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

feature -- Access

	object_test (a_name: ET_IDENTIFIER): ET_NAMED_OBJECT_TEST
			-- If we are currently in the scope of object-test local `a_name',
			-- then return its associated object-test, otherwise Void
			-- (Ignore hidden object-test locals.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			l_object_test: ET_NAMED_OBJECT_TEST
		do
			i := object_tests.count
			nb := hidden_count + 1
			from until i < nb loop
				l_object_test := object_tests.item (i)
				if l_object_test.name.same_identifier (a_name) then
					Result := l_object_test
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			object_test_not_void: has_local (a_name) = (Result /= Void)
		end

	hidden_object_test (a_name: ET_IDENTIFIER): ET_NAMED_OBJECT_TEST
			-- If we are currently in the scope of object-test local `a_name' although
			-- it has been hidden, then return its associated object-test, otherwise Void
			-- (We are probably currently analyzing an inline agent and `a_name'
			-- has been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_object_test: ET_NAMED_OBJECT_TEST
		do
			i := hidden_count
			from until i < 1 loop
				l_object_test := object_tests.item (i)
				if l_object_test.name.same_identifier (a_name) then
					Result := l_object_test
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			object_test_not_void: has_hidden_local (a_name) = (Result /= Void)
		end

	object_tests: DS_ARRAYED_LIST [ET_NAMED_OBJECT_TEST]
			-- Object-tests for which we are currently within scope their locals
			-- (Hidden object-tests are stored between indexes 1 and `hidden_count'.)

feature -- Measurement

	count: INTEGER
			-- Number of object-tests for which we are currently within scope of their locals
			-- (Hidden object-tests are counted.)
		do
			Result := object_tests.count
		ensure
			count_not_negative: Result >= 0
		end

	hidden_count: INTEGER
			-- Number of object-tests for which we consider that
			-- we are not currently within the scope of their
			-- locals. Useful when analyzing inline agents: we
			-- should not use object-test locals declared in the
			-- enclosing feature or inline agent.

feature -- Element change

	add_object_test (a_object_test: ET_NAMED_OBJECT_TEST)
			-- Indicate that we are currently within the scope
			-- of the local of `a_object_test'.
		require
			a_object_test_not_void: a_object_test /= Void
		do
			object_tests.force_last (a_object_test)
		ensure
			one_more: count = old count + 1
		end

	remove_object_tests (n: INTEGER)
			-- Indicate that we are not in the scope of
			-- the last `n' object-test locals.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n <= count - hidden_count
		do
			object_tests.prune_last (n)
		ensure
			removed: count = old count - n
		end

	keep_object_tests (n: INTEGER)
			-- Indicate that we are now in the scope of
			-- only the first `n' object-test locals.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n >= hidden_count
		do
			object_tests.keep_first (n)
		ensure
			kept: count = n
		end

	hide_object_tests (n: INTEGER)
			-- Indicate that from now on we consider that we
			-- are not in the scope of the first `n' object-test
			-- locals. Useful when analyzing inline agents: we
			-- should not use object-test locals declared in the
			-- enclosing feature or inline agent.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
		do
			hidden_count := n
		ensure
			hidden: hidden_count = n
			same_count: count = old count
		end

	wipe_out
			-- Indicate that we are in the scope of no object-test local anymore.
		do
			hidden_count := 0
			object_tests.wipe_out
		ensure
			wiped_out: count = 0
			no_hidden: hidden_count = 0
		end

invariant

	object_tests_not_void: object_tests /= Void
	no_void_object_test: not object_tests.has_void
	hidden_count_not_negative: hidden_count >= 0
	hidden_count_small_enough: hidden_count <= count

end

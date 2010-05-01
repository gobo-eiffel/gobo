note

	description:

		"Eiffel object-tests appearing in a given expression"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_OBJECT_TESTS

inherit

	ANY

	ET_SHARED_IDENTIFIER_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_expression: like expression) is
			-- Create a new empty list object-tests appearing in `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			expression := a_expression
			create object_tests.make_map (50)
			object_tests.set_key_equality_tester (identifier_tester)
		ensure
			expression_set: expression = a_expression
		end

feature -- Initialization

	reset (a_expression: like expression) is
			-- Reset an empty list of object-tests appearing in `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			wipe_out
			expression := a_expression
		ensure
			expression_set: expression = a_expression
		end

feature -- Status report

	has_object_test (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Does an object-test with local name `a_name' already appears in `expression'?
		require
			a_name_not_void: a_name /= Void
		do
			Result := object_tests.has (a_name)
		end

feature -- Access

	expression: ET_EXPRESSION
				-- Expression where object-tests appear

	object_test (a_name: ET_IDENTIFIER): ET_NAMED_OBJECT_TEST is
			-- Object-test with local name `a_name'
		require
			a_name_not_void: a_name /= Void
			has_object_test: has_object_test (a_name)
		do
			Result := object_tests.item (a_name)
		ensure
			object_test_not_void: Result /= Void
		end

	object_tests: DS_HASH_TABLE [ET_NAMED_OBJECT_TEST, ET_IDENTIFIER]
			-- Object-tests indexed by object-test local names

feature -- Element change

	add_object_test (a_object_test: ET_NAMED_OBJECT_TEST) is
			-- Indicate that `a_object_test' appears in `expression'.
		require
			a_object_test_not_void: a_object_test /= Void
			not_has_object_test: not has_object_test (a_object_test.name)
		do
			object_tests.force_last (a_object_test, a_object_test.name)
		ensure
			has_object_test: has_object_test (a_object_test.name)
		end

	wipe_out is
			-- Indiciate that no object-test appears in `expression'.
		do
			object_tests.wipe_out
		end

invariant

	expression_not_void: expression /= Void
	object_tests_not_void: object_tests /= Void
	no_void_object_test: not object_tests.has_void_item

end

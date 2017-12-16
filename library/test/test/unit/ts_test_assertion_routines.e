note

	description:

		"Test features of class TS_ASSERTION_ROUTINES"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_TEST_ASSERTION_ROUTINES

inherit

	TS_TEST_CASE

	TS_TEST_HANDLER

create

	make_default

feature -- Test

	test_assert_true
			-- Test feature `assert_true'.
		local
			l_test: like Current
		do
			create l_test.make_default
			assert_no_exception ("assert_true", agent l_test.assert_true ("do_assert_true_1", True))
			assert_false ("no_error_reported", l_test.assertions.error_reported)
			create l_test.make_default
			assert_developer_exception_with_name ("assert_false", Assertion_failure, agent l_test.assert_true ("do_assert_true_2", False))
			assert_true ("error_reported", l_test.assertions.error_reported)
		end

	test_assert_no_exception
			-- Test feature `assert_no_exception'.
		local
			l_test: like Current
			l_exception_name: STRING
		do
			l_exception_name := "My Gobo Exception"
			create l_test.make_default
			assert_no_exception ("assert_no_exception", agent l_test.assert_no_exception ("do_assert_no_exception_1", agent do_nothing))
			assert_false ("no_error_reported", l_test.assertions.error_reported)
			create l_test.make_default
			assert_developer_exception_with_name ("assert_exception", Assertion_failure, agent l_test.assert_no_exception ("do_assert_no_exception_2", agent raise_exception (l_exception_name)))
			assert_true ("error_reported", l_test.assertions.error_reported)
		end

	test_assert_developer_exception_with_name
			-- Test feature `assert_developer_exception_with_name'.
		local
			l_test: like Current
			l_exception_name: STRING
			l_wrong_name: STRING
		do
			l_exception_name := "My Gobo Exception"
			create l_test.make_default
			assert_no_exception ("assert_developer_exception_with_name", agent l_test.assert_developer_exception_with_name ("do_assert_developer_exception_with_name_1", l_exception_name, agent raise_exception (l_exception_name)))
			assert_false ("no_error_reported", l_test.assertions.error_reported)
			create l_test.make_default
			assert_developer_exception_with_name ("assert_no_developer_exception_with_name", Assertion_failure, agent l_test.assert_developer_exception_with_name ("do_assert_developer_exception_with_name_2", l_exception_name, agent do_nothing))
			assert_true ("error_reported_1", l_test.assertions.error_reported)
			l_wrong_name := "Wrong name"
			create l_test.make_default
			assert_developer_exception_with_name ("assert_developer_exception_with_wrong_name", Assertion_failure, agent l_test.assert_developer_exception_with_name ("do_assert_developer_exception_with_name_3", l_exception_name, agent raise_exception (l_wrong_name)))
			assert_true ("error_reported_2", l_test.assertions.error_reported)
		end
		
feature {NONE} -- Implementation

	raise_exception (a_name: STRING)
			-- Raise a developer exception with name `a_name'.
		require
			a_name_not_void: a_name /= Void
		local
			l_exception: DEVELOPER_EXCEPTION
		do
			create l_exception
			l_exception.set_description (a_name)
			l_exception.raise
		end
		
feature {NONE} -- Constants

	Assertion_failure: STRING = "Gobo_assertion"
			-- Developer exception message
			
end

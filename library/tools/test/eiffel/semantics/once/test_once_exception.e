note

	description:

		"Test semantics of exception in once routines"

	remark: "[
		ECMA 367-2, section 8.23.22 p.124: "Semantics: Once Routine Execution Semantics",
		says that if first execution of a once routine triggered an exception, and 
		subsequent executions should trigger again an identical exception.
	]"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ONCE_EXCEPTION

inherit

	TS_TEST_CASE

	EXCEPTION_MANAGER_FACTORY
		export {NONE} all end

create

	make_default

feature -- Test

	test_once_exception
			-- Test once function with exception.
		local
			l_first_exception: detachable EXCEPTION
			l_second_exception: detachable EXCEPTION
		do
			l_first_exception := f_exception (1)
			l_second_exception := f_exception (2)
			assert_true ("has_exception", l_first_exception /= Void)
			assert_same ("same_exception", l_first_exception, l_second_exception)
		end

feature -- Once routines

	f (i: INTEGER): INTEGER
			-- Once function raising an exception when `i' is 1
		local
			l_exception: DEVELOPER_EXCEPTION
		once
			Result := i
			if i = 1 then
				create l_exception
				l_exception.set_description ("My Gobo exception")
				l_exception.raise
			end
		end

	f_exception (i: INTEGER): detachable EXCEPTION
			-- Exception raised when calling `f', if any
		local
			l_retried: BOOLEAN
			j: INTEGER
		do
			if not l_retried then
				j := f (i)
			else
				Result := exception_manager.last_exception
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

end

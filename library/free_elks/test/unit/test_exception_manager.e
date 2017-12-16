note

	description:

		"Test features of class EXCEPTION_MANAGER"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_EXCEPTION_MANAGER

inherit

	TS_TEST_CASE

	EXCEPTION_MANAGER_FACTORY
		export {NONE} all end
	
create

	make_default

feature -- Test

	test_last_exception
			-- Test feature 'last_exception'.
		local
			d: DOUBLE
			l_retried: BOOLEAN
		do
			if not l_retried then
				check False then end
			else
				if not attached exception_manager.last_exception as l_last_exception then
					assert ("last_exception_not_void", exception_manager.last_exception /= Void)
				else
					assert_integers_equal ("check_instruction", {EXCEP_CONST}.Check_instruction, l_last_exception.code)
				end
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

end

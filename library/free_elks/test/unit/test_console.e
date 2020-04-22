note

	description:

		"Test features of class CONSOLE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_CONSOLE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_put_string_32
			-- Test feature 'put_string_32'.
		do
			if attached {CONSOLE} io.output as l_console then
-- Not available in official releases of ISE Eiffel.
--				l_console.put_string_32 ({STRING_32} "∀aé%N")
			end
		end

end

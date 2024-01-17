note

	description:

		"Test features of KL_PART_COMPARATOR"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2017, Eric Bezult and others"
	license: "MIT License"

class KL_TEST_PART_COMPARATOR

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_detachable_less_than
			-- Test feature `detachable_less_than'.
		local
			l_comparator: KL_PART_COMPARATOR [STRING]
		do
			create {KL_COMPARABLE_COMPARATOR [STRING]} l_comparator.make
			assert_true ("void_less_than_gobo", l_comparator.detachable_less_than (Void, "gobo"))
			assert_false ("gobo_not_less_than_void", l_comparator.detachable_less_than ("gobo", Void))
			assert_false ("void_not_less_than_void", l_comparator.detachable_less_than (Void, Void))
			assert_true ("eiffel_less_than_gobo", l_comparator.detachable_less_than ("eiffel", "gobo"))
			assert_false ("gobo_not_less_than_eiffel", l_comparator.detachable_less_than ("gobo", "eiffel"))
			assert_false ("gobo_not_less_than_gobo", l_comparator.detachable_less_than ("gobo", "gobo"))
		end

end

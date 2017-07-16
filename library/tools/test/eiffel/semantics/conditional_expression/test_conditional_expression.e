note

	description:

		"Test semantics of conditional expression"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_CONDITIONAL_EXPRESSION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_detachable_local
			-- Check that the type of the conditional expression
			-- is considered as attached, even though it involves
			-- a local variable declared as detachable.
		local
			s: detachable STRING
		do
			assert_true ("attached_string_1", ([if s /= Void then s else "gobo" end]).generating_type = {TUPLE [STRING]})
			s := "gobo"
			assert_true ("attached_string_2", ([if True then s else "bar" end]).generating_type = {TUPLE [STRING]})
		end

	test_non_conforming_types
			-- Check that the type of the conditional expression
			-- is ANY when none of the types conforms to the others.
		do
			assert_true ("any_1", ([if True then "gobo" else Current end]).generating_type = {TUPLE [ANY]})
			assert_true ("any_2", ([if True then "gobo" else Current end]).generating_type = {TUPLE [ANY]})
		end

	test_detachable_non_conforming_types
			-- Check that the type of the conditional expression
			-- is 'detachable ANY' when none of the types conforms to the others.
		local
			s: detachable STRING
		do
			assert_true ("detachable_any_1", ([if True then True else Void end]).generating_type = {TUPLE [detachable ANY]})
			assert_true ("detachable_any_2", ([if True then s else Current end]).generating_type = {TUPLE [detachable ANY]})
		end
		
	test_elseif_conforming_types
			-- Check that the type of the conditional expression
			-- with elseif clauses.
		local
			a: ANY
		do
			a := "foo"
			assert_true ("any_1", ([if True then "gobo" elseif True then Current else a end]).generating_type = {TUPLE [ANY]})
		end
		
end

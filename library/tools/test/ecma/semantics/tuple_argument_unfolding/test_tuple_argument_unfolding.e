note

	description:

		"Test semantics of Tuple-argument-unfolding"

	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_TUPLE_ARGUMENT_UNFOLDING

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_no_argument
			-- Test when no argument is passed.
		do
			assert_true ("no_argument", f0)
		end
	
	test_one_argument
			-- Test when one argument is passed.
		do
			assert_true ("one_argument", f1 (True))
		end
		
	test_two_arguments
			-- Test when two arguments are passed.
		do
			assert_integers_equal ("two_arguments", 5, f2 (2, 3))
		end
	
	test_missing_argument
			-- Test when an argument is missing.
		do
			assert_integers_equal ("missing_argument_1", 6, f3a (2, 3))
			assert_integers_equal ("missing_argument_2", 12, f3b (3, 4))
			assert_integers_equal ("missing_argument_3", 20, f3c (4, 5))
		end

	test_too_many_arguments
			-- Test when too arguments are passed.
		do
			assert_integers_equal ("too_many_arguments_1", 25, f4a (2, 3, 4, 5))
			assert_integers_equal ("too_many_arguments_2", 17, f4b (2, 3, 4, 5))
			assert_integers_equal ("too_many_arguments_3", 15, f4c (2, 3, 4, 5))
		end
		
feature {NONE} -- Implementation

	f0 (t: TUPLE): BOOLEAN
		do
			Result := True
		end
	
	f1 (t: TUPLE [b: BOOLEAN]): BOOLEAN
		do
			Result := t.b
		end
		
	f2 (t: TUPLE [i, j: INTEGER]): INTEGER
		do
			Result := t.i + t.j
		end

	f3a (t: TUPLE; a, b: INTEGER): INTEGER
		do
			Result := a * b
		end

	f3b (a: INTEGER; t: TUPLE; b: INTEGER): INTEGER
		do
			Result := a * b
		end

	f3c (a, b: INTEGER; t: TUPLE): INTEGER
		do
			Result := a * b
		end
		
	f4a (t: TUPLE [i, j: INTEGER]; a, b: INTEGER): INTEGER
		do
			Result := a * b + t.i + t.j
		end

	f4b (a: INTEGER; t: TUPLE [i, j: INTEGER]; b: INTEGER): INTEGER
		do
			Result := a * b + t.i + t.j
		end

	f4c (a, b: INTEGER; t: TUPLE [i, j: INTEGER]): INTEGER
		do
			Result := a * b + t.i + t.j
		end
		
end

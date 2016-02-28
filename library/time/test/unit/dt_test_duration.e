note

	description:

		"Test features of class DT_DURATION"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_DURATION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_date_duration1
			-- Test features of DT_DURATION using DT_DATE_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_DURATION} d1.make (4, 11, 4)
			create {DT_DATE_DURATION} d2.make (4, 11, 4)
			create {DT_DATE} t1.make (2000, 4, 8)
			create {DT_DATE} t2.make (2005, 3, 12)
			assert_equal ("absolute_time", t2, d1.absolute_time (t1))
			create {DT_DATE_DURATION} d3.make (8, 22, 8)
			assert_equal ("infix_plus1", d3, d1 + d1)
			assert_equal ("infix_plus2", d3, d1 + d2)
			create {DT_DATE_DURATION} d3.make (0, 0, 0)
			assert_equal ("infix_minus1", d3, d1 - d1)
			assert_equal ("infix_minus2", d3, d1 - d2)
			create {DT_DATE_DURATION} d3.make (4, 11, 4)
			assert_equal ("prefix_plus", d3, + d1)
			create {DT_DATE_DURATION} d3.make (-4, -11, -4)
			assert_equal ("prefix_minus", d3, - d1)
			assert ("infix_less1", not (d1 < d1))
			assert ("infix_less2", not (d1 < d2))
		end

	test_date_duration2
			-- Test features of DT_DURATION using DT_DATE_DURATION.
		local
			d1, d2: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_DURATION} d1.make (4, 11, 4)
			create {DT_DATE_DURATION} d2.make (4, 11, 12)
			create {DT_DATE} t1.make (2000, 4, 8)
			create {DT_DATE} t2.make (2005, 3, 20)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			assert ("infix_less1", d1 < d2)
			assert ("infix_less2", not (d2 < d1))
		end

	test_date_duration3
			-- Test features of DT_DURATION using DT_DATE_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_DURATION} d1.make (4, 11, 4)
			create {DT_DATE_DURATION} d2.make (2, 8, 12)
			create {DT_DATE} t1.make (2000, 4, 8)
			create {DT_DATE} t2.make (2002, 12, 20)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			create {DT_DATE_DURATION} d3.make (6, 19, 16)
			assert_equal ("infix_plus", d3, d1 + d2)
			create {DT_DATE_DURATION} d3.make (2, 3, -8)
			assert_equal ("infix_minus", d3, d1 - d2)
			create {DT_DATE_DURATION} d3.make (2, 8, 12)
			assert_equal ("prefix_plus", d3, + d2)
			create {DT_DATE_DURATION} d3.make (-2, -8, -12)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", not (d2 < d1))
		end

	test_date_duration4
			-- Test features of DT_DURATION using DT_DATE_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_DURATION} d1.make (4, 11, 4)
			create {DT_DATE_DURATION} d2.make (-12, 8, -23)
			create {DT_DATE} t1.make (2000, 4, 8)
			create {DT_DATE} t2.make (1988, 11, 15)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			create {DT_DATE_DURATION} d3.make (-8, 19, -19)
			assert_equal ("infix_plus", d3, d1 + d2)
			create {DT_DATE_DURATION} d3.make (16, 3, 27)
			assert_equal ("infix_minus", d3, d1 - d2)
			create {DT_DATE_DURATION} d3.make (-12, 8, -23)
			assert_equal ("prefix_plus", d3, + d2)
			create {DT_DATE_DURATION} d3.make (12, -8, 23)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", d2 < d1)
		end

	test_time_duration1
			-- Test features of DT_DURATION using DT_TIME_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_TIME_DURATION} d1.make_precise (4, 11, 4, 543)
			create {DT_TIME_DURATION} d2.make_precise (4, 11, 4, 543)
			create {DT_TIME} t1.make (16, 30, 5)
			create {DT_TIME} t2.make_precise (20, 41, 9, 543)
			assert_equal ("absolute_time", t2, d1.absolute_time (t1))
			create {DT_TIME_DURATION} d3.make_precise (8, 22, 8, 1086)
			assert_equal ("infix_plus1", d3, d1 + d1)
			assert_equal ("infix_plus2", d3, d1 + d2)
			create {DT_TIME_DURATION} d3.make (0, 0, 0)
			assert_equal ("infix_minus1", d3, d1 - d1)
			assert_equal ("infix_minus2", d3, d1 - d2)
			create {DT_TIME_DURATION} d3.make_precise (4, 11, 4, 543)
			assert_equal ("prefix_plus", d3, + d1)
			create {DT_TIME_DURATION} d3.make_precise (-4, -11, -4, -543)
			assert_equal ("prefix_minus", d3, - d1)
			assert ("infix_less1", not (d1 < d1))
			assert ("infix_less2", not (d1 < d2))
		end

	test_time_duration2
			-- Test features of DT_DURATION using DT_TIME_DURATION.
		local
			d1, d2: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_TIME_DURATION} d1.make_precise (4, 11, 4, 543)
			create {DT_TIME_DURATION} d2.make_precise (4, 11, 12, 754)
			create {DT_TIME} t1.make (16, 30, 5)
			create {DT_TIME} t2.make_precise (20, 41, 17, 754)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			assert ("infix_less1", d1 < d2)
			assert ("infix_less2", not (d2 < d1))
		end

	test_time_duration3
			-- Test features of DT_DURATION using DT_TIME_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_TIME_DURATION} d1.make_precise (4, 11, 4, 543)
			create {DT_TIME_DURATION} d2.make_precise (2, 8, 12, 0)
			create {DT_TIME} t1.make (16, 30, 5)
			create {DT_TIME} t2.make (18, 38, 17)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			create {DT_TIME_DURATION} d3.make_precise (6, 19, 16, 543)
			assert_equal ("infix_plus", d3, d1 + d2)
			create {DT_TIME_DURATION} d3.make_precise (2, 3, -8, 543)
			assert_equal ("infix_minus", d3, d1 - d2)
			create {DT_TIME_DURATION} d3.make (2, 8, 12)
			assert_equal ("prefix_plus", d3, + d2)
			create {DT_TIME_DURATION} d3.make (-2, -8, -12)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", d2 < d1)
		end

	test_time_duration4
			-- Test features of DT_DURATION using DT_TIME_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_TIME_DURATION} d1.make_precise (4, 11, 4, 543)
			create {DT_TIME_DURATION} d2.make_precise (-12, 8, -23, 2)
			create {DT_TIME} t1.make (16, 30, 5)
			create {DT_TIME} t2.make_precise (4, 37, 42, 2)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			create {DT_TIME_DURATION} d3.make_precise (-8, 19, -19, 545)
			assert_equal ("infix_plus", d3, d1 + d2)
			create {DT_TIME_DURATION} d3.make_precise (16, 3, 27, 541)
			assert_equal ("infix_minus", d3, d1 - d2)
			create {DT_TIME_DURATION} d3.make_precise (-12, 8, -23, 2)
			assert_equal ("prefix_plus", d3, + d2)
			create {DT_TIME_DURATION} d3.make_precise (12, -8, 23, -2)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", d2 < d1)
		end

	test_date_time_duration1
			-- Test features of DT_DURATION using DT_DATE_TIME_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_TIME_DURATION} d1.make_precise (2, 10, 14, 4, 11, 4, 543)
			create {DT_DATE_TIME_DURATION} d2.make_precise (2, 10, 14, 4, 11, 4, 543)
			create {DT_DATE_TIME} t1.make_precise (2000, 2, 29, 6, 25, 34, 472)
			create {DT_DATE_TIME} t2.make_precise (2003, 1, 12, 10, 36, 39, 15)
			assert_equal ("absolute_time", t2, d1.absolute_time (t1))
			create {DT_DATE_TIME_DURATION} d3.make_precise (4, 20, 28, 8, 22, 8, 1086)
			assert_equal ("infix_plus1", d3, d1 + d1)
			assert_equal ("infix_plus2", d3, d1 + d2)
			create {DT_DATE_TIME_DURATION} d3.make (0, 0, 0, 0, 0, 0)
			assert_equal ("infix_minus1", d3, d1 - d1)
			assert_equal ("infix_minus2", d3, d1 - d2)
			create {DT_DATE_TIME_DURATION} d3.make_precise (2, 10, 14, 4, 11, 4, 543)
			assert_equal ("prefix_plus", d3, + d1)
			create {DT_DATE_TIME_DURATION} d3.make_precise (-2, -10, -14, -4, -11, -4, -543)
			assert_equal ("prefix_minus", d3, - d1)
			assert ("infix_less1", not (d1 < d1))
			assert ("infix_less2", not (d1 < d2))
		end

	test_date_time_duration2
			-- Test features of DT_DURATION using DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_TIME_DURATION} d1.make_precise (2, 10, 14, 4, 11, 4, 543)
			create {DT_DATE_TIME_DURATION} d2.make_precise (2, 10, 14, 4, 11, 12, 754)
			create {DT_DATE_TIME} t1.make_precise (2000, 2, 29, 6, 25, 34, 472)
			create {DT_DATE_TIME} t2.make_precise (2003, 1, 12, 10, 36, 47, 226)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			assert ("infix_less1", d1 < d2)
			assert ("infix_less2", not (d2 < d1))
		end

	test_date_time_duration3
			-- Test features of DT_DURATION using DT_DATE_TIME_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_TIME_DURATION} d1.make_precise (2, 10, 14, 4, 11, 4, 543)
			create {DT_DATE_TIME_DURATION} d2.make_precise (8, 7, 6, 2, 8, 12, 0)
			create {DT_DATE_TIME} t1.make_precise (2000, 2, 29, 6, 25, 34, 472)
			create {DT_DATE_TIME} t2.make_precise (2008, 10, 5, 8, 33, 46, 472)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			create {DT_DATE_TIME_DURATION} d3.make_precise (10, 17, 20, 6, 19, 16, 543)
			assert_equal ("infix_plus", d3, d1 + d2)
			create {DT_DATE_TIME_DURATION} d3.make_precise (-6, 3, 8, 2, 3, -8, 543)
			assert_equal ("infix_minus", d3, d1 - d2)
			create {DT_DATE_TIME_DURATION} d3.make (8, 7, 6, 2, 8, 12)
			assert_equal ("prefix_plus", d3, + d2)
			create {DT_DATE_TIME_DURATION} d3.make (-8, -7, -6, -2, -8, -12)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", not (d2 < d1))
		end

	test_date_time_duration4
			-- Test features of DT_DURATION using DT_DATE_TIME_DURATION.
		local
			d1, d2, d3: DT_DURATION
			t1, t2: DT_ABSOLUTE_TIME
		do
			create {DT_DATE_TIME_DURATION} d1.make_precise (2, 10, 14, 4, 11, 4, 543)
			create {DT_DATE_TIME_DURATION} d2.make_precise (-4, 4, -28, -12, 8, -23, 2)
			create {DT_DATE_TIME} t1.make_precise (2000, 2, 29, 6, 25, 34, 472)
			create {DT_DATE_TIME} t2.make_precise (1996, 5, 31, 18, 33, 11, 474)
			assert_equal ("absolute_time", t2, d2.absolute_time (t1))
			create {DT_DATE_TIME_DURATION} d3.make_precise (-2, 14, -14, -8, 19, -19, 545)
			assert_equal ("infix_plus", d3, d1 + d2)
			create {DT_DATE_TIME_DURATION} d3.make_precise (6, 6, 42, 16, 3, 27, 541)
			assert_equal ("infix_minus", d3, d1 - d2)
			create {DT_DATE_TIME_DURATION} d3.make_precise (-4, 4, -28, -12, 8, -23, 2)
			assert_equal ("prefix_plus", d3, + d2)
			create {DT_DATE_TIME_DURATION} d3.make_precise (4, -4, 28, 12, -8, 23, -2)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", d2 < d1)
		end

end

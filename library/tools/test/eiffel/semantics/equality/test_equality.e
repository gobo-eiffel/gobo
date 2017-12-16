note

	description:

		"Test semantics of equality ('=' and '/=')"

	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_EQUALITY

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_integer
			-- Test equality with integers.
		local
			a, b: ANY
		do
			assert ("equal1", 1 = 1)
			assert ("not_equal1", 1 /= 2)
			a := 1
			b := 1
			assert ("equal2", a = b)
		end

	test_string
			-- Test equality with strings.
		local
			s1, s2: STRING
		do
			assert ("not_equal1", "gobo" /= "gobo")
			assert ("not_equal2", "foo" /= "bar")
			s1 := "toto"
			s2 := "toto"
			assert ("equal1", s1 = s1)
			assert ("not_equal3", s1 /= s2)
		end

	test_void
			-- Test equality with Void.
		local
			a: ANY
		do
			assert ("equal1", Void = Void)
			assert ("not_equal1", Void /= 2)
			assert ("not_equal2", "gobo" /= Void)
			assert ("equal2", a = Void)
			assert ("not_equal3", 2 /= a)
			assert ("not_equal4", a /= "gobo")
		end

	test_polymorphic
			-- Test equality with polymorphic operands.
		local
			a, b: ANY
			c: ANY
			d: STRING
			x, y: ANY
		do
			a := "gobo"
			a := 2
			b := 2
			assert ("equal1", a = b)
			b := "gobo"
			assert ("not_equal1", a /= b)
			a := "gobo"
			assert ("not_equal2", a /= b)
			a := b
			assert ("equal2", a = b)
			assert ("not_equal3", a /= c)
			assert ("not_equal4", c /= b)
			d := "gobo"
			assert ("not_equal5", a /= d)
			assert ("not_equal6", d /= b)
			assert ("not_equal7", a /= "gobo")
			assert ("not_equal8", "gobo" /= b)
			a := 'a'
			b := 'a'
			assert ("equal2", a = b)
			x := 'a'
			x := 2
			y := 'a'
			y := 2
			y := 3.4
			assert ("not_equal9", x /= y)
		end

	test_conversion
			-- Test equality with conversion of operands.
		do
				-- With conversion.
			assert ("equal1", {NATURAL_16} 2 = {INTEGER_32} 2)
			assert ("equal2", 3 = 3.0)
			assert ("equal3", {INTEGER_8} 4 = {REAL_32} 4.0)
				-- Without conversion.
			assert ("not_equal1", {INTEGER_8} 1 /= {NATURAL_8} 1)
				-- Conversion in both directions.
				-- Convert the right operand in that case.
			assert ("equal4", {REAL_32} 6.5 = {REAL_64} 6.5)
			assert ("equal5", {REAL_64} 3.0 = {REAL_32} 3.0)
		end

end

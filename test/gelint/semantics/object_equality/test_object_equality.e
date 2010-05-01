note

	description:

		"Test semantics of object-equality ('~' and '/~')"

	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_OBJECT_EQUALITY

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_integer is
			-- Test object equality with integers.
		local
			a, b: ANY
		do
			assert ("equal1", 1 ~ 1)
			assert ("not_equal1", 1 /~ 2)
			a := 1
			b := 1
			assert ("equal2", a ~ b)
		end

	test_string is
			-- Test object equality with strings.
		local
			s1, s2: STRING
		do
			assert ("equal1", "gobo" ~ "gobo")
			assert ("not_equal1", "foo" /~ "bar")
			s1 := "toto"
			s2 := "toto"
			assert ("equal2", s1 ~ s2)
		end

	test_void is
			-- Test object equality with Void.
		local
			a: ANY
			s1, s2: STRING
		do
			assert ("equal1", Void ~ Void)
			assert ("not_equal1", Void /~ 2)
			assert ("not_equal2", "gobo" /~ Void)
			assert ("equal2", a ~ Void)
			assert ("not_equal3", 2 /~ a)
			assert ("not_equal4", a /~ "gobo")
			s1 := Void
			s1 := "gobo"
			s2 := "gobo"
			s2 := Void
			assert ("not_equal5", s1 /~ s2)
			assert ("not_equal6", s2 /~ s1)
		end

	test_polymorphic is
			-- Test object equality with polymorphic operands.
		local
			a, b: ANY
			c: ANY
			d: STRING
		do
			a := "gobo"
			a := 2
			b := 2
			assert ("equal1", a ~ b)
			b := "gobo"
			assert ("not_equal1", a /~ b)
			a := "gobo"
			assert ("equal2", a ~ b)
			assert ("not_equal2", a /~ c)
			assert ("not_equal3", c /~ b)
			d := "gobo"
			assert ("equal3", a ~ d)
			assert ("equal4", d ~ b)
			assert ("equal5", a ~ "gobo")
			assert ("equal6", "gobo" ~ b)
		end

	test_conversion is
			-- Test object equality with conversion of operands.
		do
				-- With conversion.
			assert ("equal1", {NATURAL_16} 2 ~ {INTEGER_32} 2)
			assert ("equal2", 3 ~ 3.0)
			assert ("equal3", {INTEGER_8} 4 ~ {REAL_32} 4.0)
				-- Without conversion.
			assert ("not_equal1", {INTEGER_8} 1 /~ {NATURAL_8} 1)
				-- Conversion in both directions.
				-- Convert the right operand in that case.
			assert ("equal4", {REAL_32} 5.4 ~ {REAL_64} 5.4)
			assert ("equal5", {REAL_64} 6.5 ~ {REAL_32} 6.5)
		end

	test_no_explicit_is_equal_call is
			-- Test object equality when feature 'is_equal' is not
			-- explicitly called otherwise in the system with
			-- one of the dynamic types of the left operand as
			-- target type.
		local
			l: ANY
		do
			assert ("equal1", l ~ l)
			l := Current
		end

end

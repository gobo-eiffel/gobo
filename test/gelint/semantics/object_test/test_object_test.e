note

	description:

		"Test semantics of object-tests"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_OBJECT_TEST

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_and_then
			-- Test scope of object-test local when part of a semi-strict term of
			-- a conjunctive expression. ECMA-367-2, 8.24.5-1.
		local
			s: detachable STRING
		do
			s := "gobo"
			assert ("and_then1", attached {STRING} s as x1 and then x1.count = 4)
			assert ("and_then2", attached s as x2 and then x2.count = 4)
			assert ("and_then3", attached {STRING} s as x3 and then 1 /= 2 and then not x3.is_empty)
			assert ("and_then4", attached s as x4 and then 1 /= 2 and then not x4.is_empty)
			assert ("and_then5", (attached {STRING} s as x5 and 1 = 1) and then not x5.is_empty)
			assert ("and_then6", (attached s as x6 and 1 = 1) and then not x6.is_empty)
			assert ("and_then7", not (not attached {STRING} s as x7 or 1 /= 1) and then not x7.is_empty)
			assert ("and_then8", not (not attached s as x8 or 1 /= 1) and then not x8.is_empty)
		end

	test_implies
			-- Test scope of object-test local when part of a term of
			-- an implicative expression. ECMA-367-2, 8.24.5-2.
		local
			s: detachable STRING
		do
			s := "gobo"
			assert ("implies1", attached {STRING} s as x1 implies x1.count = 4)
			assert ("implies2", attached s as x2 implies x2.count = 4)
			assert ("implies3", attached {STRING} s as x3 implies 1 /= 2 and not x3.is_empty)
			assert ("implies4", attached s as x4 implies 1 /= 2 and not x4.is_empty)
			assert ("implies5", (attached {STRING} s as x5 and 1 = 1) implies not x5.is_empty)
			assert ("implies6", (attached s as x6 and 1 = 1) implies not x6.is_empty)
			assert ("implies7", not (not attached {STRING} s as x7 or 1 /= 1) implies not x7.is_empty)
			assert ("implies8", not (not attached s as x8 or 1 /= 1) implies not x8.is_empty)
		end

	test_or_else
			-- Test scope of object-test local when part of a semi-strict term of
			-- a disjunctive expression. ECMA-367-2, 8.24.5-3.
		local
			s: detachable STRING
		do
			s := "gobo"
			assert ("or_else1", not attached {STRING} s as x1 or else x1.count = 4)
			assert ("or_else2", not attached s as x2 or else x2.count = 4)
			assert ("or_else3", not attached {STRING} s as x3 or else 1 = 2 or else not x3.is_empty)
			assert ("or_else4", not attached s as x4 or else 1 = 2 or else not x4.is_empty)
			assert ("or_else5", not (attached {STRING} s as x5 and 1 = 1) or else not x5.is_empty)
			assert ("or_else6", not (attached s as x6 and 1 = 1) or else not x6.is_empty)
			assert ("or_else7", (not attached {STRING} s as x7 or 1 /= 1) or else not x7.is_empty)
			assert ("or_else8", (not attached s as x8 or 1 /= 1) or else not x8.is_empty)
		end

	test_if
			-- Test scope of object-test local when part of conditional of if instruction.
			-- ECMA-367-2, 8.24.5-4 and 8.24.5-5.
		local
			s: detachable STRING
		do
			s := "foo"
			if attached {STRING} s as x1 then
				assert ("if1", x1.count = 3)
			else
				assert ("if2", False)
			end
			if attached s as x2 then
				assert ("if3", x2.count = 3)
			else
				assert ("if4", False)
			end
			s := "gobo"
			if not attached {STRING} s as x3 then
				assert ("if5", False)
			else
				assert ("if6", x3.count = 4)
			end
			if not attached s as x4 then
				assert ("if7", False)
			else
				assert ("if8", x4.count = 4)
			end
		end

	test_elseif
			-- Test scope of object-test local when part of conditional of elseif branches.
			-- ECMA-367-2, 8.24.5-4 and 8.24.5-5.
		local
			s1, s2, s3: detachable STRING
		do
			s1 := "foo"
			s2 := "barbar"
			s3 := "gobo"
			if not attached {STRING} s1 as x1 then
				assert ("elseif1", False)
			elseif not attached {STRING} s2 as x2 then
				assert ("elseif2", False)
			elseif attached {STRING} s3 as x3 then
				assert ("elseif3", x1.count = 3)
				assert ("elseif4", x2.count = 6)
				assert ("elseif5", x3.count = 4)
			else
				assert ("elseif6", False)
			end
			if not attached s1 as x11 then
				assert ("elseif11", False)
			elseif not attached s2 as x12 then
				assert ("elseif12", False)
			elseif attached s3 as x13 then
				assert ("elseif13", x11.count = 3)
				assert ("elseif14", x12.count = 6)
				assert ("elseif15", x13.count = 4)
			else
				assert ("elseif16", False)
			end
			if not attached {STRING} s1 as x4 then
				assert ("elseif7", False)
			elseif not attached {STRING} s2 as x5 then
				assert ("elseif8", False)
			else
				assert ("elseif9", x4.count = 3)
				assert ("elseif10", x5.count = 6)
			end
			if not attached s1 as x14 then
				assert ("elseif17", False)
			elseif not attached s2 as x15 then
				assert ("elseif18", False)
			else
				assert ("elseif19", x14.count = 3)
				assert ("elseif20", x15.count = 6)
			end
		end

	test_loop
			-- Test scope of object-test local when part of exit clause of loop instruction.
			-- ECMA-367-2, 8.24.5-6.
		local
			s, f: detachable STRING
		do
			s := "gobo"
			from
				f := "foo"
			until
				not attached {STRING} f as x1 or not attached {STRING} s as x2
			loop
				assert ("loop1", x1.count = 3)
				assert ("loop2", x2.count = 4)
				f := Void
			end
			from
				f := "foo"
			until
				not attached f as x11 or not attached s as x12
			loop
				assert ("loop11", x11.count = 3)
				assert ("loop12", x12.count = 4)
				f := Void
			end
			from
				f := "foo"
			until
				not (attached {STRING} f as x3 and attached {STRING} s as x4)
			loop
				assert ("loop3", x3.count = 3)
				assert ("loop4", x4.count = 4)
				f := Void
			end
			from
				f := "foo"
			until
				not (attached f as x13 and attached s as x14)
			loop
				assert ("loop13", x13.count = 3)
				assert ("loop14", x14.count = 4)
				f := Void
			end
		end

	test_precondition
			-- Test scope of object-test local when in a precondition.
			-- The scope should cover the following assertions in the
			-- same precondition clause.
		do
			assert ("precondition1", my_feature1 ("gobo"))
		end

feature {NONE} -- Implementation

	my_feature1 (a_string: detachable STRING): BOOLEAN
			-- Feature with a precondition containing an object-test
			-- whose local is used on the following assertions.
		require
			first: attached a_string as s and (1 = 1)
			second: s.count = 4
		do
			Result := True
		end

end

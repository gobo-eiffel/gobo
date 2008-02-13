indexing

	description:

		"Test features of class MA_DECIMAL"

	library: "Gobo Eiffel Math Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
	
class MA_TEST_DECIMAL

inherit

	TS_TEST_CASE

	MA_DECIMAL_HANDLER

	MA_DECIMAL_CONTEXT_CONSTANTS
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

create

	make_default

feature -- Test

	test_new_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'new.decTest'.
		do
			run_dectest ("new.decTest")
		end

	test_abs_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'abs.decTest'.
		do
			run_dectest ("abs.decTest")
		end

	test_add_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'add.decTest'.
		do
			run_dectest ("add.decTest")
		end

	test_base_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'base.decTest'.
		do
			run_dectest ("base.decTest")
		end

	test_compare_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'compare.decTest'.
		do
			run_dectest ("compare.decTest")
		end

	test_divide_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'divide.decTest'.
		do
			run_dectest ("divide.decTest")
		end

	test_divideint_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'divideint.decTest'.
		do
			run_dectest ("divideint.decTest")
		end

	test_double_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'double.decTest'.
		do
			run_dectest ("double.decTest")
		end

	test_inexact_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'inexact.decTest'.
		do
			run_dectest ("inexact.decTest")
		end

	test_integer_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'integer.decTest'.
		do
			run_dectest ("integer.decTest")
		end

	test_max_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'max.decTest'.
		do
			run_dectest ("max.decTest")
		end

	test_min_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'min.decTest'.
		do
			run_dectest ("min.decTest")
		end

	test_minus_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'minus.decTest'.
		do
			run_dectest ("minus.decTest")
		end

	test_multiply_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'multiply.decTest'.
		do
			run_dectest ("multiply.decTest")
		end

	test_normalize_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'normalize.decTest'.
		do
			run_dectest ("normalize.decTest")
		end

	test_plus_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'plus.decTest'.
		do
			run_dectest ("plus.decTest")
		end

	test_randombound32_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'randomBound32.decTest'.
		do
			run_dectest ("randomBound32.decTest")
		end

	test_randomdouble_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'randomDouble.decTest'.
		do
			run_dectest ("randomDouble.decTest")
		end

	test_randoms_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'randoms.decTest'.
		do
			run_dectest ("randoms.decTest")
		end

	test_randomsingle_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'randomSingle.decTest'.
		do
			run_dectest ("randomSingle.decTest")
		end

	test_remainder_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'remainder.decTest'.
		do
			run_dectest ("remainder.decTest")
		end

	test_rescale_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'rescale.decTest'.
		do
			run_dectest ("rescale.decTest")
		end

	test_rounding_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'rounding.decTest'.
		do
			run_dectest ("rounding.decTest")
		end

	test_single_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'single.decTest'.
		do
			run_dectest ("single.decTest")
		end

	test_subtract_dectest is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test 'subtract.decTest'.
		do
			run_dectest ("subtract.decTest")
		end

feature {NONE} -- Implementation

	run_dectest (a_test_name: STRING) is
			-- Run testcases designed for testing implementations of the general
			-- purpose floating-point arithmetic defined in the General Decimal
			-- Arithmetic Specification version 1.08.
			-- Run test `a_test_name'.
		require
			a_test_name_not_void: a_test_name /= Void
			a_test_name_not_empty: not a_test_name.is_empty
		local
			l_filename: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_ctx: MA_DECIMAL_CONTEXT
			l_flags: ARRAY [BOOLEAN]
			l_tag: STRING
			l_line: STRING
			l_comment_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_directive_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_operand_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_directive: STRING
			l_value: STRING
			l_operation: STRING
			l_operand_a: STRING
			l_operand_b: STRING
			l_expected_result: STRING
			i: INTEGER
			a, b, c: MA_DECIMAL
			l_flag: STRING
			nb_line: INTEGER
			l_match_count: INTEGER
		do
			create l_ctx.make_default
			create l_flags.make (1, Signal_subnormal)
			create l_comment_regexp.make
			l_comment_regexp.compile ("^[ \t]*(\-\-.*)?$")
			create l_directive_regexp.make
			l_directive_regexp.compile ("^[ \t]*([a-zA-Z0-9_]+)[ \t]*:[ \t]*([-+.a-zA-Z0-9_]+)[ \t]*(\-\-.*)?$")
			l_filename := Execution_environment.interpreted_string (file_system.pathname (data_dirname, a_test_name))
			create l_operand_regexp.make
			l_operand_regexp.compile ("^[ \t]*([a-zA-Z0-9_.]+)[ \t]+([a-zA-Z0-9_]+)[ \t]+(\%"([^%"]|\%"\%")*\%"|\'([^']|\'\')*\'|[-+.#a-zA-Z0-9_]+)[ \t]+(\%"([^%"]|\%"\%")*\%"|\'([^']|\'\')*\'|[-+.#a-zA-Z0-9_]+)?[ \t]*\->[ \t]*(\%"([^%"]|\%"\%")*\%"|\'([^']|\'\')*\'|[-+.#a-zA-Z0-9_]+)([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?([ \t]+([a-zA-Z0-9_]+))?[ \t]*(\-\-.*)?$")
			create l_file.make (l_filename)
			l_file.open_read
			assert ("file_" + a_test_name + "_open_read", l_file.is_open_read)
			from l_file.read_line until l_file.end_of_file loop
				nb_line := nb_line + 1
				l_line := l_file.last_string
				if l_comment_regexp.recognizes (l_line) then
					-- Skip comments and empty lines.
				elseif l_directive_regexp.recognizes (l_line) then
						-- Execute directives.
					l_directive := l_directive_regexp.captured_substring (1).as_lower
					l_value := l_directive_regexp.captured_substring (2).as_lower
					if l_directive.is_equal ("extended") then
						if l_value.is_integer and then l_value.to_integer = 1 then
							l_ctx.set_extended
						else
							l_ctx.set_normal
						end
					elseif l_directive.is_equal ("precision") then
						if l_value.is_integer then
							l_ctx.set_digits (l_value.to_integer)
						else
							assert ("invalid_precision_directive_" + l_value, False)
						end
					elseif l_directive.is_equal ("rounding") then
						if l_value.is_equal ("down") then
							l_ctx.set_rounding_mode (Round_down)
						elseif l_value.is_equal ("up")  then
							l_ctx.set_rounding_mode (Round_up)
						elseif l_value.is_equal ("half_up")  then
							l_ctx.set_rounding_mode (Round_half_up)
						elseif l_value.is_equal ("half_down")  then
							l_ctx.set_rounding_mode (Round_half_down)
						elseif l_value.is_equal ("half_even")  then
							l_ctx.set_rounding_mode (Round_half_even)
						elseif l_value.is_equal ("floor")  then
							l_ctx.set_rounding_mode (Round_floor)
						elseif l_value.is_equal ("ceiling")  then
							l_ctx.set_rounding_mode (Round_ceiling)
						else
							assert ("invalid_rounding_directive_" + l_value, False)
						end
					elseif l_directive.is_equal ("maxexponent") then
						if l_value.is_integer then
							l_ctx.set_exponent_limit (l_value.to_integer)
						else
							assert ("invalid_maxexponent_directive_" + l_value, False)
						end
					elseif l_directive.is_equal ("version") then
						-- Do nothing.
					elseif l_directive.is_equal ("dectest") then
						-- Do nothing.
					else
						assert ("unknown_directive_" + l_directive, False)
					end
				elseif l_operand_regexp.recognizes (l_line) then
						-- Execute test.
					l_match_count := l_operand_regexp.match_count
					if l_match_count <= 9 then
						assert ("unknown_operands", False)
					end
					l_tag := l_operand_regexp.captured_substring (1)
					l_operation := l_operand_regexp.captured_substring (2).as_lower
					l_operand_a := unquoted_operand (l_operand_regexp.captured_substring (3))
					l_operand_b := unquoted_operand (l_operand_regexp.captured_substring (6))
					l_expected_result := unquoted_operand (l_operand_regexp.captured_substring (9))
					l_flags.clear_all
					from i := 13 until i > 31 or i >= l_match_count loop
						l_flag := l_operand_regexp.captured_substring (i).as_lower
						if l_flag.is_empty then
						elseif l_flag.is_equal ("inexact") then
							l_flags.put (True, Signal_inexact)
						elseif l_flag.is_equal ("lost_digits") then
							l_flags.put (True, Signal_lost_digits)
						elseif l_flag.is_equal ("rounded") then
							l_flags.put (True, Signal_rounded)
						elseif l_flag.is_equal ("overflow") then
							l_flags.put (True, Signal_overflow)
						elseif l_flag.is_equal ("subnormal") then
							l_flags.put (True, Signal_subnormal)
						elseif l_flag.is_equal ("underflow") then
							l_flags.put (True, Signal_underflow)
						elseif l_flag.is_equal ("invalid_operation") then
							l_flags.put (True, Signal_invalid_operation)
						elseif l_flag.is_equal ("invalid_context") then
							l_flags.put (True, Signal_invalid_operation)
						elseif l_flag.is_equal ("division_undefined") then
							l_flags.put (True, Signal_invalid_operation)
						elseif l_flag.is_equal ("division_impossible") then
							l_flags.put (True, Signal_invalid_operation)
						elseif l_flag.is_equal ("division_by_zero") then
							l_flags.put (True, Signal_division_by_zero)
						elseif l_flag.is_equal ("conversion_syntax") then
							-- Do nothing.
						elseif l_flag.is_equal ("insufficient_storage") then
							-- Do nothing.
						else
							assert ("unknown_flag_" + l_flag, False)
						end
						i := i + 2
					end
					if not (l_operand_a.is_equal ("#") or l_operand_b.is_equal ("#")) then
						a := new_operand (l_operand_a, l_ctx)
						if not l_operand_b.is_empty then
							b := new_operand (l_operand_b, l_ctx)
						end
						l_ctx.reset_flags
						a.set_shared_decimal_context (l_ctx)
						if l_operation.is_equal ("abs") then
							c := a.abs_ctx (l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("add") then
							c := a.add (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("compare") then
							c := a.compare (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
								-- Test hash codes of mathematically equal numbers or semantically equal values ([sq]NaN).
							if (l_expected_result.is_integer and then l_expected_result.to_integer = 0) or else (a.is_signaling_nan and b.is_signaling_nan) or else (a.is_quiet_nan and b.is_quiet_nan) then
								assert_integers_equal (l_tag + "_hash", a.hash_code, b.hash_code)
							end
						elseif l_operation.is_equal ("divide") then
							c := a.divide (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("divideint") then
							c := a.divide_integer (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("max") then
							c := a.max_ctx (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("min") then
							c := a.min_ctx (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("minus") then
							c := a.minus (l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("multiply") then
							c := a.multiply (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("normalize") then
							c := a.normalize
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("plus") then
							c := a.plus (l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("remainder") then
							c := a.remainder (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("rescale") then
							c := a.rescale_decimal (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("subtract") then
							c := a.subtract (b, l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("tosci") then
							l_ctx.reset_flags
							create a.make_from_string_ctx (l_operand_a, l_ctx)
							a.set_shared_decimal_context (l_ctx)
							c := a
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("toeng") then
							l_ctx.reset_flags
							create a.make_from_string_ctx (l_operand_a, l_ctx)
							a.set_shared_decimal_context (l_ctx)
							c := a
							assert_strings_equal (l_tag, l_expected_result, c.to_engineering_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("integer") then
							c := a.round_to_integer (l_ctx)
							assert_strings_equal (l_tag, l_expected_result, c.to_scientific_string)
							check_flags (l_tag, l_flags, l_ctx.flags)
						elseif l_operation.is_equal ("power") then
							-- Not supported.
						elseif l_operation.is_equal ("remaindernear") then
							-- Not supported.
						elseif l_operation.is_equal ("squareroot") then
							-- Not supported.
						elseif l_operation.is_equal ("trim") then
							-- Not supported.
						else
							assert ("unknown_operation_" + l_operation, False)
						end
					end
				else
					assert ("unrecognized_line_" + nb_line.out, False)
				end
				l_comment_regexp.wipe_out
				l_directive_regexp.wipe_out
				l_operand_regexp.wipe_out
				l_file.read_line
			end
			l_file.close
		end

	check_flags (a_tag: STRING; an_expected_flags, a_flags: ARRAY [BOOLEAN]) is
			-- Check flags.
		require
			a_tag_not_void: a_tag /= Void
			an_expected_flags_not_void: an_expected_flags /= Void
			an_expected_flags_lower: an_expected_flags.lower = 1
			an_expected_flags_upper: an_expected_flags.upper = Signal_subnormal
			a_flags_not_void: a_flags /= Void
			a_flags_lower: a_flags.lower = 1
			a_flags_upper: a_flags.upper = Signal_subnormal
		local
			i, nb: INTEGER
		do
			nb := Signal_subnormal
			from i := 1 until i > nb loop
				inspect i
				when Signal_division_by_zero then
					assert_booleans_equal (a_tag + "_division_by_zero", an_expected_flags.item (i), a_flags.item (i))
				when Signal_inexact then
					assert_booleans_equal (a_tag + "_inexact", an_expected_flags.item (i), a_flags.item (i))
				when Signal_invalid_operation then
					assert_booleans_equal (a_tag + "_invalid_operation", an_expected_flags.item (i), a_flags.item (i))
				when Signal_lost_digits then
					assert_booleans_equal (a_tag + "_lost_digits", an_expected_flags.item (i), a_flags.item (i))
				when Signal_overflow then
					assert_booleans_equal (a_tag + "_overflow", an_expected_flags.item (i), a_flags.item (i))
				when Signal_rounded then
					assert_booleans_equal (a_tag + "_rounded", an_expected_flags.item (i), a_flags.item (i))
				when Signal_underflow then
					assert_booleans_equal (a_tag + "_underflow", an_expected_flags.item (i), a_flags.item (i))
				when Signal_subnormal then
					assert_booleans_equal (a_tag + "_subnormal", an_expected_flags.item (i), a_flags.item (i))
				else
					assert_booleans_equal (a_tag + "_flag" + i.out, an_expected_flags.item (i), a_flags.item (i))
				end
				i := i + 1
			end
		end

	new_operand (s: STRING; a_ctx: MA_DECIMAL_CONTEXT): MA_DECIMAL is
			-- New operand from `s'
		require
			s_not_void: s /= Void
			a_ctx_not_void: a_ctx /= Void
		local
			conversion_ctx: MA_DECIMAL_CONTEXT
		do
			conversion_ctx := a_ctx.cloned_object
			conversion_ctx.set_digits (s.count + 1)
			conversion_ctx.set_rounding_mode (Round_half_up) 
			create Result.make_from_string_ctx (s, conversion_ctx)
			a_ctx.flags.copy (conversion_ctx.flags)
		ensure
			operand_not_void: Result /= Void
		end

	unquoted_operand (an_operand: STRING): STRING is
			-- Remove leading and trailing quotes
		require
			an_operand_not_void: an_operand /= Void
		do
			if
				an_operand.count >= 2 and then
				((an_operand.item (1) = '%'' and an_operand.item (an_operand.count) = '%'') or
				(an_operand.item (1) = '%"' and an_operand.item (an_operand.count) = '%"'))
			then
				Result := an_operand.substring (2, an_operand.count - 1)
			else
				Result := an_operand
			end
		ensure
			unquoted_operand_not_void: Result /= Void
		end

feature {NONE} -- Constants

	data_dirname: STRING is
			-- Full directory name of "$GOBO/test/math/decimal/data"
		once
			Result := file_system.nested_pathname ("$GOBO", <<"test", "math", "decimal", "acceptance", "data">>)
		ensure
			data_dirname_not_void: Result /= Void
		end

end

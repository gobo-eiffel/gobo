indexing

	description:

		"XML unicode character classes"

	implements: "Appendix B of XML 1.0 -- second edition"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_UNICODE_CHARACTERS_1_0

inherit

	XM_UNICODE_CHARACTERS

-- Code used to generate the initial version of the code below from the standard text
--
--inherit XF_CONVERSION_PRIVATE_ROUTINES
--...
--process_line (a: STRING) is
--		-- Process a line from the standard text with a char class production.
--	local
--		last_number: STRING
--		i: INTEGER
--		c: CHARACTER
--		in_group: BOOLEAN
--	do
--		from i := 1 until i > a.count loop
--			c := a.item (i)
--			if last_number /= Void then
--				inspect c
--				when '0'..'9','A'..'F' then last_number.append_character (a.item (i))
--				else io.put_string (string_to_code (last_number, 16).out) last_number := Void
--				end
--			end
--
--			inspect	c
--			when '=' then io.put_string ("(a: INTEGER): BOOLEAN is%N%T%Tdo%N%T%T%TResult :=")
--			when '[' then io.put_string ("(a >= ") in_group := True
--			when '-' then io.put_string (" and a <= ")
--			when ']' then io.put_string (")") in_group := False
--			when '|' then io.put_string ("or%N%T%T%T%T")
--			when '#' then -- ignore
--			when 'x' then
--				create last_number.make (0)
--				if not in_group then io.put_string ("a = ") end
--			when '0'..'9','A'..'F' then -- ignore
--			else io.put_character (c)
--			end
--			i := i + 1
--		end
--		if last_number /= Void then
--			io.put_string (string_to_code (last_number, 16).out)
--		end
--		io.put_string ("%N%T%Tend")
--		io.put_new_line
--	end

feature -- Valid characters (section 2.2)

	is_char (a: INTEGER): BOOLEAN is
			-- Valid content character?
		do
			Result := a = 9 or else
				a = 10 or else
				a = 13 or else
				(a >= 32 and a <= 55295) or else
				(a >= 57344 and a <= 65533) or else
				(a >= 65536 and a <= 1114111)
		end

	is_name_char (a: INTEGER): BOOLEAN is
			-- Character for name?
		do
			Result := is_name_first (a) or else
					a = ('.').code or a = ('-').code or else
					is_digit (a) or else
					is_combining_char (a) or else
					is_extender (a)
		end

	is_name_first (a: INTEGER): BOOLEAN is
			-- Valid first character of name?
		do
			Result := is_letter (a) or else a = ('_').code or else a = (':').code
		end

	is_space (a: INTEGER): BOOLEAN is
			-- Space character?
		do
			Result := a = 32 or else a = 9 or else a = 10 or else a = 13
		end

feature -- Character classes (appendix B)

	is_letter (a: INTEGER): BOOLEAN is
			-- Letter class.
		do
			Result := is_base_char (a) or else
				is_ideographic (a)
		end

	is_base_char (a: INTEGER): BOOLEAN is
			-- Base char class.
		do
				-- Use 'inspect' as a workaround for SE 1.0b6
				-- because otherwise the generated C code
				-- contains too many parentheses for MSVC 6.0.
			Result := True
			inspect a
			when 65 .. 90 then
			when 97 .. 122 then
			when 192 .. 214 then
			when 216 .. 246 then
			when 248 .. 255 then
			when 256 .. 305 then
			when 308 .. 318 then
			when 321 .. 328 then
			when 330 .. 382 then
			when 384 .. 451 then
			when 461 .. 496 then
			when 500 .. 501 then
			when 506 .. 535 then
			when 592 .. 680 then
			when 699 .. 705 then
			when 902 then
			when 904 .. 906 then
			when 908 then
			when 910 .. 929 then
			when 931 .. 974 then
			when 976 .. 982 then
			when 986 then
			when 988 then
			when 990 then
			when 992 then
			when 994 .. 1011 then
			when 1025 .. 1036 then
			when 1038 .. 1103 then
			when 1105 .. 1116 then
			when 1118 .. 1153 then
			when 1168 .. 1220 then
			when 1223 .. 1224 then
			when 1227 .. 1228 then
			when 1232 .. 1259 then
			when 1262 .. 1269 then
			when 1272 .. 1273 then
			when 1329 .. 1366 then
			when 1369 then
			when 1377 .. 1414 then
			when 1488 .. 1514 then
			when 1520 .. 1522 then
			when 1569 .. 1594 then
			when 1601 .. 1610 then
			when 1649 .. 1719 then
			when 1722 .. 1726 then
			when 1728 .. 1742 then
			when 1744 .. 1747 then
			when 1749 then
			when 1765 .. 1766 then
			when 2309 .. 2361 then
			when 2365 then
			when 2392 .. 2401 then
			when 2437 .. 2444 then
			when 2447 .. 2448 then
			when 2451 .. 2472 then
			when 2474 .. 2480 then
			when 2482 then
			when 2486 .. 2489 then
			when 2524 .. 2525 then
			when 2527 .. 2529 then
			when 2544 .. 2545 then
			when 2565 .. 2570 then
			when 2575 .. 2576 then
			when 2579 .. 2600 then
			when 2602 .. 2608 then
			when 2610 .. 2611 then
			when 2613 .. 2614 then
			when 2616 .. 2617 then
			when 2649 .. 2652 then
			when 2654 then
			when 2674 .. 2676 then
			when 2693 .. 2699 then
			when 2701 then
			when 2703 .. 2705 then
			when 2707 .. 2728 then
			when 2730 .. 2736 then
			when 2738 .. 2739 then
			when 2741 .. 2745 then
			when 2749 then
			when 2784 then
			when 2821 .. 2828 then
			when 2831 .. 2832 then
			when 2835 .. 2856 then
			when 2858 .. 2864 then
			when 2866 .. 2867 then
			when 2870 .. 2873 then
			when 2877 then
			when 2908 .. 2909 then
			when 2911 .. 2913 then
			when 2949 .. 2954 then
			when 2958 .. 2960 then
			when 2962 .. 2965 then
			when 2969 .. 2970 then
			when 2972 then
			when 2974 .. 2975 then
			when 2979 .. 2980 then
			when 2984 .. 2986 then
			when 2990 .. 2997 then
			when 2999 .. 3001 then
			when 3077 .. 3084 then
			when 3086 .. 3088 then
			when 3090 .. 3112 then
			when 3114 .. 3123 then
			when 3125 .. 3129 then
			when 3168 .. 3169 then
			when 3205 .. 3212 then
			when 3214 .. 3216 then
			when 3218 .. 3240 then
			when 3242 .. 3251 then
			when 3253 .. 3257 then
			when 3294 then
			when 3296 .. 3297 then
			when 3333 .. 3340 then
			when 3342 .. 3344 then
			when 3346 .. 3368 then
			when 3370 .. 3385 then
			when 3424 .. 3425 then
			when 3585 .. 3630 then
			when 3632 then
			when 3634 .. 3635 then
			when 3648 .. 3653 then
			when 3713 .. 3714 then
			when 3716 then
			when 3719 .. 3720 then
			when 3722 then
			when 3725 then
			when 3732 .. 3735 then
			when 3737 .. 3743 then
			when 3745 .. 3747 then
			when 3749 then
			when 3751 then
			when 3754 .. 3755 then
			when 3757 .. 3758 then
			when 3760 then
			when 3762 .. 3763 then
			when 3773 then
			when 3776 .. 3780 then
			when 3904 .. 3911 then
			when 3913 .. 3945 then
			when 4256 .. 4293 then
			when 4304 .. 4342 then
			when 4352 then
			when 4354 .. 4355 then
			when 4357 .. 4359 then
			when 4361 then
			when 4363 .. 4364 then
			when 4366 .. 4370 then
			when 4412 then
			when 4414 then
			when 4416 then
			when 4428 then
			when 4430 then
			when 4432 then
			when 4436 .. 4437 then
			when 4441 then
			when 4447 .. 4449 then
			when 4451 then
			when 4453 then
			when 4455 then
			when 4457 then
			when 4461 .. 4462 then
			when 4466 .. 4467 then
			when 4469 then
			when 4510 then
			when 4520 then
			when 4523 then
			when 4526 .. 4527 then
			when 4535 .. 4536 then
			when 4538 then
			when 4540 .. 4546 then
			when 4587 then
			when 4592 then
			when 4601 then
			when 7680 .. 7835 then
			when 7840 .. 7929 then
			when 7936 .. 7957 then
			when 7960 .. 7965 then
			when 7968 .. 8005 then
			when 8008 .. 8013 then
			when 8016 .. 8023 then
			when 8025 then
			when 8027 then
			when 8029 then
			when 8031 .. 8061 then
			when 8064 .. 8116 then
			when 8118 .. 8124 then
			when 8126 then
			when 8130 .. 8132 then
			when 8134 .. 8140 then
			when 8144 .. 8147 then
			when 8150 .. 8155 then
			when 8160 .. 8172 then
			when 8178 .. 8180 then
			when 8182 .. 8188 then
			when 8486 then
			when 8490 .. 8491 then
			when 8494 then
			when 8576 .. 8578 then
			when 12353 .. 12436 then
			when 12449 .. 12538 then
			when 12549 .. 12588 then
			when 44032 .. 55203 then
			else
				Result := False
			end
		end

	is_ideographic(a: INTEGER): BOOLEAN is
			-- Ideographic class.
		do
			Result := (a >= 19968 and a <= 40869) or
				a = 12295 or
				(a >= 12321 and a <= 12329)
		end

	is_combining_char(a: INTEGER): BOOLEAN is
			-- Combining char class.
		do
			Result := (a >= 768 and a <= 837) or
				(a >= 864 and a <= 865) or
				(a >= 1155 and a <= 1158) or
				(a >= 1425 and a <= 1441) or
				(a >= 1443 and a <= 1465) or
				(a >= 1467 and a <= 1469) or
				a = 1471 or
				(a >= 1473 and a <= 1474) or
				a = 1476 or
				(a >= 1611 and a <= 1618) or
				a = 1648 or
				(a >= 1750 and a <= 1756) or
				(a >= 1757 and a <= 1759) or
				(a >= 1760 and a <= 1764) or
				(a >= 1767 and a <= 1768) or
				(a >= 1770 and a <= 1773) or
				(a >= 2305 and a <= 2307) or
				a = 2364 or
				(a >= 2366 and a <= 2380) or
				a = 2381 or
				(a >= 2385 and a <= 2388) or
				(a >= 2402 and a <= 2403) or
				(a >= 2433 and a <= 2435) or
				a = 2492 or
				a = 2494 or
				a = 2495 or
				(a >= 2496 and a <= 2500) or
				(a >= 2503 and a <= 2504) or
				(a >= 2507 and a <= 2509) or
				a = 2519 or
				(a >= 2530 and a <= 2531) or
				a = 2562 or
				a = 2620 or
				a = 2622 or
				a = 2623 or
				(a >= 2624 and a <= 2626) or
				(a >= 2631 and a <= 2632) or
				(a >= 2635 and a <= 2637) or
				(a >= 2672 and a <= 2673) or
				(a >= 2689 and a <= 2691) or
				a = 2748 or
				(a >= 2750 and a <= 2757) or
				(a >= 2759 and a <= 2761) or
				(a >= 2763 and a <= 2765) or
				(a >= 2817 and a <= 2819) or
				a = 2876 or
				(a >= 2878 and a <= 2883) or
				(a >= 2887 and a <= 2888) or
				(a >= 2891 and a <= 2893) or
				(a >= 2902 and a <= 2903) or
				(a >= 2946 and a <= 2947) or
				(a >= 3006 and a <= 3010) or
				(a >= 3014 and a <= 3016) or
				(a >= 3018 and a <= 3021) or
				a = 3031 or
				(a >= 3073 and a <= 3075) or
				(a >= 3134 and a <= 3140) or
				(a >= 3142 and a <= 3144) or
				(a >= 3146 and a <= 3149) or
				(a >= 3157 and a <= 3158) or
				(a >= 3202 and a <= 3203) or
				(a >= 3262 and a <= 3268) or
				(a >= 3270 and a <= 3272) or
				(a >= 3274 and a <= 3277) or
				(a >= 3285 and a <= 3286) or
				(a >= 3330 and a <= 3331) or
				(a >= 3390 and a <= 3395) or
				(a >= 3398 and a <= 3400) or
				(a >= 3402 and a <= 3405) or
				a = 3415 or
				a = 3633 or
				(a >= 3636 and a <= 3642) or
				(a >= 3655 and a <= 3662) or
				a = 3761 or
				(a >= 3764 and a <= 3769) or
				(a >= 3771 and a <= 3772) or
				(a >= 3784 and a <= 3789) or
				(a >= 3864 and a <= 3865) or
				a = 3893 or
				a = 3895 or
				a = 3897 or
				a = 3902 or
				a = 3903 or
				(a >= 3953 and a <= 3972) or
				(a >= 3974 and a <= 3979) or
				(a >= 3984 and a <= 3989) or
				a = 3991 or
				(a >= 3993 and a <= 4013) or
				(a >= 4017 and a <= 4023) or
				a = 4025 or
				(a >= 8400 and a <= 8412) or
				a = 8417 or
				(a >= 12330 and a <= 12335) or
				a = 12441 or
				a = 12442
		end

	is_digit(a: INTEGER): BOOLEAN is
			-- Digit class.
		do
			Result := (a >= 48 and a <= 57) or
				(a >= 1632 and a <= 1641) or
				(a >= 1776 and a <= 1785) or
				(a >= 2406 and a <= 2415) or
				(a >= 2534 and a <= 2543) or
				(a >= 2662 and a <= 2671) or
				(a >= 2790 and a <= 2799) or
				(a >= 2918 and a <= 2927) or
				(a >= 3047 and a <= 3055) or
				(a >= 3174 and a <= 3183) or
				(a >= 3302 and a <= 3311) or
				(a >= 3430 and a <= 3439) or
				(a >= 3664 and a <= 3673) or
				(a >= 3792 and a <= 3801) or
				(a >= 3872 and a <= 3881)
		end

	is_extender(a: INTEGER): BOOLEAN is
			-- Extender class.
		do
			Result := a = 183 or
				a = 720 or
				a = 721 or
				a = 903 or
				a = 1600 or
				a = 3654 or
				a = 3782 or
				a = 12293 or
				(a >= 12337 and a <= 12341) or
				(a >= 12445 and a <= 12446) or
				(a >= 12540 and a <= 12542)
		end

end

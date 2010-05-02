note

	description:

		"XML unicode character classes"

	implements: "Appendix B of XML 1.0 -- second edition"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2007, Eric Bezault and others"
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
--process_line (a: STRING)
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
--			when '=' then io.put_string ("(a: INTEGER): BOOLEAN%N%T%Tdo%N%T%T%TResult :=")
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

	is_char (a: INTEGER): BOOLEAN
			-- Valid content character?
		do
			Result := a = 9 or else
				a = 10 or else
				a = 13 or else
				(a >= 32 and a <= 55295) or else
				(a >= 57344 and a <= 65533) or else
				(a >= 65536 and a <= 1114111)
		end

	is_name_char (a: INTEGER): BOOLEAN
			-- Character for name?
		do
			Result := is_name_first (a) or else
					a = ('.').code or a = ('-').code or else
					is_digit (a) or else
					is_combining_char (a) or else
					is_extender (a)
		end

	is_name_first (a: INTEGER): BOOLEAN
			-- Valid first character of name?
		do
			Result := is_letter (a) or else a = ('_').code or else a = (':').code
		end

	is_space (a: INTEGER): BOOLEAN
			-- Space character?
		do
			Result := a = 32 or else a = 9 or else a = 10 or else a = 13
		end

feature -- Character classes (appendix B)

	is_letter (a: INTEGER): BOOLEAN
			-- Letter class.
		do
			Result := is_base_char (a) or else
				is_ideographic (a)
		end

	is_base_char (a: INTEGER): BOOLEAN
			-- Base char class.
		do
				-- Do not use a big expression with 'or' because with SE 1.0b6
				-- the generated C code contains too many parentheses for MSVC 6.0.
				-- Do not use 'inspect' because with gec we reach a limitation
				-- when the back-end C compiler is lcc-win32.
				-- Use two 'if' instructions because otherwise with gec we reach
				-- a limitation when the back-end C compiler is MSVC 7.1.
			if (a >= 65 and a <= 90) then
				Result := True
			elseif (a >= 97 and a <= 122) then
				Result := True
			elseif (a >= 192 and a <= 214) then
				Result := True
			elseif (a >= 216 and a <= 246) then
				Result := True
			elseif (a >= 248 and a <= 255) then
				Result := True
			elseif (a >= 256 and a <= 305) then
				Result := True
			elseif (a >= 308 and a <= 318) then
				Result := True
			elseif (a >= 321 and a <= 328) then
				Result := True
			elseif (a >= 330 and a <= 382) then
				Result := True
			elseif (a >= 384 and a <= 451) then
				Result := True
			elseif (a >= 461 and a <= 496) then
				Result := True
			elseif (a >= 500 and a <= 501) then
				Result := True
			elseif (a >= 506 and a <= 535) then
				Result := True
			elseif (a >= 592 and a <= 680) then
				Result := True
			elseif (a >= 699 and a <= 705) then
				Result := True
			elseif a = 902 then
				Result := True
			elseif (a >= 904 and a <= 906) then
				Result := True
			elseif a = 908 then
				Result := True
			elseif (a >= 910 and a <= 929) then
				Result := True
			elseif (a >= 931 and a <= 974) then
				Result := True
			elseif (a >= 976 and a <= 982) then
				Result := True
			elseif a = 986 then
				Result := True
			elseif a = 988 then
				Result := True
			elseif a = 990 then
				Result := True
			elseif a = 992 then
				Result := True
			elseif (a >= 994 and a <= 1011) then
				Result := True
			elseif (a >= 1025 and a <= 1036) then
				Result := True
			elseif (a >= 1038 and a <= 1103) then
				Result := True
			elseif (a >= 1105 and a <= 1116) then
				Result := True
			elseif (a >= 1118 and a <= 1153) then
				Result := True
			elseif (a >= 1168 and a <= 1220) then
				Result := True
			elseif (a >= 1223 and a <= 1224) then
				Result := True
			elseif (a >= 1227 and a <= 1228) then
				Result := True
			elseif (a >= 1232 and a <= 1259) then
				Result := True
			elseif (a >= 1262 and a <= 1269) then
				Result := True
			elseif (a >= 1272 and a <= 1273) then
				Result := True
			elseif (a >= 1329 and a <= 1366) then
				Result := True
			elseif a = 1369 then
				Result := True
			elseif (a >= 1377 and a <= 1414) then
				Result := True
			elseif (a >= 1488 and a <= 1514) then
				Result := True
			elseif (a >= 1520 and a <= 1522) then
				Result := True
			elseif (a >= 1569 and a <= 1594) then
				Result := True
			elseif (a >= 1601 and a <= 1610) then
				Result := True
			elseif (a >= 1649 and a <= 1719) then
				Result := True
			elseif (a >= 1722 and a <= 1726) then
				Result := True
			elseif (a >= 1728 and a <= 1742) then
				Result := True
			elseif (a >= 1744 and a <= 1747) then
				Result := True
			elseif a = 1749 then
				Result := True
			elseif (a >= 1765 and a <= 1766) then
				Result := True
			elseif (a >= 2309 and a <= 2361) then
				Result := True
			elseif a = 2365 then
				Result := True
			elseif (a >= 2392 and a <= 2401) then
				Result := True
			elseif (a >= 2437 and a <= 2444) then
				Result := True
			elseif (a >= 2447 and a <= 2448) then
				Result := True
			elseif (a >= 2451 and a <= 2472) then
				Result := True
			elseif (a >= 2474 and a <= 2480) then
				Result := True
			elseif a = 2482 then
				Result := True
			elseif (a >= 2486 and a <= 2489) then
				Result := True
			elseif (a >= 2524 and a <= 2525) then
				Result := True
			elseif (a >= 2527 and a <= 2529) then
				Result := True
			elseif (a >= 2544 and a <= 2545) then
				Result := True
			elseif (a >= 2565 and a <= 2570) then
				Result := True
			elseif (a >= 2575 and a <= 2576) then
				Result := True
			elseif (a >= 2579 and a <= 2600) then
				Result := True
			elseif (a >= 2602 and a <= 2608) then
				Result := True
			elseif (a >= 2610 and a <= 2611) then
				Result := True
			elseif (a >= 2613 and a <= 2614) then
				Result := True
			elseif (a >= 2616 and a <= 2617) then
				Result := True
			elseif (a >= 2649 and a <= 2652) then
				Result := True
			elseif a = 2654 then
				Result := True
			elseif (a >= 2674 and a <= 2676) then
				Result := True
			elseif (a >= 2693 and a <= 2699) then
				Result := True
			elseif a = 2701 then
				Result := True
			elseif (a >= 2703 and a <= 2705) then
				Result := True
			elseif (a >= 2707 and a <= 2728) then
				Result := True
			elseif (a >= 2730 and a <= 2736) then
				Result := True
			elseif (a >= 2738 and a <= 2739) then
				Result := True
			elseif (a >= 2741 and a <= 2745) then
				Result := True
			elseif a = 2749 then
				Result := True
			elseif a = 2784 then
				Result := True
			elseif (a >= 2821 and a <= 2828) then
				Result := True
			elseif (a >= 2831 and a <= 2832) then
				Result := True
			elseif (a >= 2835 and a <= 2856) then
				Result := True
			elseif (a >= 2858 and a <= 2864) then
				Result := True
			elseif (a >= 2866 and a <= 2867) then
				Result := True
			elseif (a >= 2870 and a <= 2873) then
				Result := True
			elseif a = 2877 then
				Result := True
			elseif (a >= 2908 and a <= 2909) then
				Result := True
			elseif (a >= 2911 and a <= 2913) then
				Result := True
			elseif (a >= 2949 and a <= 2954) then
				Result := True
			elseif (a >= 2958 and a <= 2960) then
				Result := True
			elseif (a >= 2962 and a <= 2965) then
				Result := True
			elseif (a >= 2969 and a <= 2970) then
				Result := True
			elseif a = 2972 then
				Result := True
			elseif (a >= 2974 and a <= 2975) then
				Result := True
			elseif (a >= 2979 and a <= 2980) then
				Result := True
			elseif (a >= 2984 and a <= 2986) then
				Result := True
			elseif (a >= 2990 and a <= 2997) then
				Result := True
			elseif (a >= 2999 and a <= 3001) then
				Result := True
			elseif (a >= 3077 and a <= 3084) then
				Result := True
			elseif (a >= 3086 and a <= 3088) then
				Result := True
			end
			if Result then
				-- Already found.
			elseif (a >= 3090 and a <= 3112) then
				Result := True
			elseif (a >= 3114 and a <= 3123) then
				Result := True
			elseif (a >= 3125 and a <= 3129) then
				Result := True
			elseif (a >= 3168 and a <= 3169) then
				Result := True
			elseif (a >= 3205 and a <= 3212) then
				Result := True
			elseif (a >= 3214 and a <= 3216) then
				Result := True
			elseif (a >= 3218 and a <= 3240) then
				Result := True
			elseif (a >= 3242 and a <= 3251) then
				Result := True
			elseif (a >= 3253 and a <= 3257) then
				Result := True
			elseif a = 3294 then
				Result := True
			elseif (a >= 3296 and a <= 3297) then
				Result := True
			elseif (a >= 3333 and a <= 3340) then
				Result := True
			elseif (a >= 3342 and a <= 3344) then
				Result := True
			elseif (a >= 3346 and a <= 3368) then
				Result := True
			elseif (a >= 3370 and a <= 3385) then
				Result := True
			elseif (a >= 3424 and a <= 3425) then
				Result := True
			elseif (a >= 3585 and a <= 3630) then
				Result := True
			elseif a = 3632 then
				Result := True
			elseif (a >= 3634 and a <= 3635) then
				Result := True
			elseif (a >= 3648 and a <= 3653) then
				Result := True
			elseif (a >= 3713 and a <= 3714) then
				Result := True
			elseif a = 3716 then
				Result := True
			elseif (a >= 3719 and a <= 3720) then
				Result := True
			elseif a = 3722 then
				Result := True
			elseif a = 3725 then
				Result := True
			elseif (a >= 3732 and a <= 3735) then
				Result := True
			elseif (a >= 3737 and a <= 3743) then
				Result := True
			elseif (a >= 3745 and a <= 3747) then
				Result := True
			elseif a = 3749 then
				Result := True
			elseif a = 3751 then
				Result := True
			elseif (a >= 3754 and a <= 3755) then
				Result := True
			elseif (a >= 3757 and a <= 3758) then
				Result := True
			elseif a = 3760 then
				Result := True
			elseif (a >= 3762 and a <= 3763) then
				Result := True
			elseif a = 3773 then
				Result := True
			elseif (a >= 3776 and a <= 3780) then
				Result := True
			elseif (a >= 3904 and a <= 3911) then
				Result := True
			elseif (a >= 3913 and a <= 3945) then
				Result := True
			elseif (a >= 4256 and a <= 4293) then
				Result := True
			elseif (a >= 4304 and a <= 4342) then
				Result := True
			elseif a = 4352 then
				Result := True
			elseif (a >= 4354 and a <= 4355) then
				Result := True
			elseif (a >= 4357 and a <= 4359) then
				Result := True
			elseif a = 4361 then
				Result := True
			elseif (a >= 4363 and a <= 4364) then
				Result := True
			elseif (a >= 4366 and a <= 4370) then
				Result := True
			elseif a = 4412 then
				Result := True
			elseif a = 4414 then
				Result := True
			elseif a = 4416 then
				Result := True
			elseif a = 4428 then
				Result := True
			elseif a = 4430 then
				Result := True
			elseif a = 4432 then
				Result := True
			elseif (a >= 4436 and a <= 4437) then
				Result := True
			elseif a = 4441 then
				Result := True
			elseif (a >= 4447 and a <= 4449) then
				Result := True
			elseif a = 4451 then
				Result := True
			elseif a = 4453 then
				Result := True
			elseif a = 4455 then
				Result := True
			elseif a = 4457 then
				Result := True
			elseif (a >= 4461 and a <= 4462) then
				Result := True
			elseif (a >= 4466 and a <= 4467) then
				Result := True
			elseif a = 4469 then
				Result := True
			elseif a = 4510 then
				Result := True
			elseif a = 4520 then
				Result := True
			elseif a = 4523 then
				Result := True
			elseif (a >= 4526 and a <= 4527) then
				Result := True
			elseif (a >= 4535 and a <= 4536) then
				Result := True
			elseif a = 4538 then
				Result := True
			elseif (a >= 4540 and a <= 4546) then
				Result := True
			elseif a = 4587 then
				Result := True
			elseif a = 4592 then
				Result := True
			elseif a = 4601 then
				Result := True
			elseif (a >= 7680 and a <= 7835) then
				Result := True
			elseif (a >= 7840 and a <= 7929) then
				Result := True
			elseif (a >= 7936 and a <= 7957) then
				Result := True
			elseif (a >= 7960 and a <= 7965) then
				Result := True
			elseif (a >= 7968 and a <= 8005) then
				Result := True
			elseif (a >= 8008 and a <= 8013) then
				Result := True
			elseif (a >= 8016 and a <= 8023) then
				Result := True
			elseif a = 8025 then
				Result := True
			elseif a = 8027 then
				Result := True
			elseif a = 8029 then
				Result := True
			elseif (a >= 8031 and a <= 8061) then
				Result := True
			elseif (a >= 8064 and a <= 8116) then
				Result := True
			elseif (a >= 8118 and a <= 8124) then
				Result := True
			elseif a = 8126 then
				Result := True
			elseif (a >= 8130 and a <= 8132) then
				Result := True
			elseif (a >= 8134 and a <= 8140) then
				Result := True
			elseif (a >= 8144 and a <= 8147) then
				Result := True
			elseif (a >= 8150 and a <= 8155) then
				Result := True
			elseif (a >= 8160 and a <= 8172) then
				Result := True
			elseif (a >= 8178 and a <= 8180) then
				Result := True
			elseif (a >= 8182 and a <= 8188) then
				Result := True
			elseif a = 8486 then
				Result := True
			elseif (a >= 8490 and a <= 8491) then
				Result := True
			elseif a = 8494 then
				Result := True
			elseif (a >= 8576 and a <= 8578) then
				Result := True
			elseif (a >= 12353 and a <= 12436) then
				Result := True
			elseif (a >= 12449 and a <= 12538) then
				Result := True
			elseif (a >= 12549 and a <= 12588) then
				Result := True
			elseif (a >= 44032 and a <= 55203) then
				Result := True
			end
		end

	is_ideographic(a: INTEGER): BOOLEAN
			-- Ideographic class.
		do
			Result := (a >= 19968 and a <= 40869) or
				a = 12295 or
				(a >= 12321 and a <= 12329)
		end

	is_combining_char(a: INTEGER): BOOLEAN
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

	is_digit(a: INTEGER): BOOLEAN
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

	is_extender(a: INTEGER): BOOLEAN
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

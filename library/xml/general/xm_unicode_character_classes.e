indexing

	description: 
	
		"XML unicode character classes"

	library: "Gobo XML library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	implements: "Appendix B of XML1.0 -- second edition"
	
class XM_UNICODE_CHARACTER_CLASSES

-- Code used to generate the above from the standard
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
--		from i := 1	until i > a.count loop
--			c := a.item (i)
--			if last_number /= Void then
--				inspect	c
--				when '0'..'9','A'..'F' then	last_number.append_character (a.item(i))
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
--				!! last_number.make (0) 
--				if not in_group then io.put_string ("a = ")	end
--			when '0'..'9','A'..'F' then	-- ignore
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
			Result := a = 9 or
				 a = 10 or
				 a = 13 or
				 (a >= 32 and a <= 55295) or
				 (a >= 57344 and a <= 65533) or
				 (a >= 65536 and a <= 1114111)
		end
		
	is_name_char (a: INTEGER): BOOLEAN is
			-- Character for name?
		do
			Result := is_name_first (a) or 
					a = ('.').code or a = ('-').code or
					is_digit (a) or
					is_combining_char (a) or
					is_extender (a)
		end

	is_name_first (a: INTEGER): BOOLEAN is
			-- Valid first character of name?
		do
			Result := is_letter (a) or a = ('_').code or a = (':').code
		end
		
feature -- Character classes (appendix B)
		
	is_letter(a: INTEGER): BOOLEAN is
			-- Letter class.
		do
			Result := is_base_char (a) or
				 is_ideographic (a)
		end

	is_base_char (a: INTEGER): BOOLEAN is
			-- Base char class.
		do
			Result :=    (a >= 65 and a <= 90) or
				 (a >= 97 and a <= 122) or
				 (a >= 192 and a <= 214) or
				 (a >= 216 and a <= 246) or
				 (a >= 248 and a <= 255) or
				 (a >= 256 and a <= 305) or
				 (a >= 308 and a <= 318) or
				 (a >= 321 and a <= 328) or
				 (a >= 330 and a <= 382) or
				 (a >= 384 and a <= 451) or
				 (a >= 461 and a <= 496) or
				 (a >= 500 and a <= 501) or
				 (a >= 506 and a <= 535) or
				 (a >= 592 and a <= 680) or
				 (a >= 699 and a <= 705) or
				 a = 902 or
				 (a >= 904 and a <= 906) or
				 a = 908 or
				 (a >= 910 and a <= 929) or
				 (a >= 931 and a <= 974) or
				 (a >= 976 and a <= 982) or
				 a = 986 or
				 a = 988 or
				 a = 990 or
				 a = 992 or
				 (a >= 994 and a <= 1011) or
				 (a >= 1025 and a <= 1036) or
				 (a >= 1038 and a <= 1103) or
				 (a >= 1105 and a <= 1116) or
				 (a >= 1118 and a <= 1153) or
				 (a >= 1168 and a <= 1220) or
				 (a >= 1223 and a <= 1224) or
				 (a >= 1227 and a <= 1228) or
				 (a >= 1232 and a <= 1259) or
				 (a >= 1262 and a <= 1269) or
				 (a >= 1272 and a <= 1273) or
				 (a >= 1329 and a <= 1366) or
				 a = 1369 or
				 (a >= 1377 and a <= 1414) or
				 (a >= 1488 and a <= 1514) or
				 (a >= 1520 and a <= 1522) or
				 (a >= 1569 and a <= 1594) or
				 (a >= 1601 and a <= 1610) or
				 (a >= 1649 and a <= 1719) or
				 (a >= 1722 and a <= 1726) or
				 (a >= 1728 and a <= 1742) or
				 (a >= 1744 and a <= 1747) or
				 a = 1749 or
				 (a >= 1765 and a <= 1766) or
				 (a >= 2309 and a <= 2361) or
				 a = 2365 or
				 (a >= 2392 and a <= 2401) or
				 (a >= 2437 and a <= 2444) or
				 (a >= 2447 and a <= 2448) or
				 (a >= 2451 and a <= 2472) or
				 (a >= 2474 and a <= 2480) or
				 a = 2482 or
				 (a >= 2486 and a <= 2489) or
				 (a >= 2524 and a <= 2525) or
				 (a >= 2527 and a <= 2529) or
				 (a >= 2544 and a <= 2545) or
				 (a >= 2565 and a <= 2570) or
				 (a >= 2575 and a <= 2576) or
				 (a >= 2579 and a <= 2600) or
				 (a >= 2602 and a <= 2608) or
				 (a >= 2610 and a <= 2611) or
				 (a >= 2613 and a <= 2614) or
				 (a >= 2616 and a <= 2617) or
				 (a >= 2649 and a <= 2652) or
				 a = 2654 or
				 (a >= 2674 and a <= 2676) or
				 (a >= 2693 and a <= 2699) or
				 a = 2701 or
				 (a >= 2703 and a <= 2705) or
				 (a >= 2707 and a <= 2728) or
				 (a >= 2730 and a <= 2736) or
				 (a >= 2738 and a <= 2739) or
				 (a >= 2741 and a <= 2745) or
				 a = 2749 or
				 a = 2784 or
				 (a >= 2821 and a <= 2828) or
				 (a >= 2831 and a <= 2832) or
				 (a >= 2835 and a <= 2856) or
				 (a >= 2858 and a <= 2864) or
				 (a >= 2866 and a <= 2867) or
				 (a >= 2870 and a <= 2873) or
				 a = 2877 or
				 (a >= 2908 and a <= 2909) or
				 (a >= 2911 and a <= 2913) or
				 (a >= 2949 and a <= 2954) or
				 (a >= 2958 and a <= 2960) or
				 (a >= 2962 and a <= 2965) or
				 (a >= 2969 and a <= 2970) or
				 a = 2972 or
				 (a >= 2974 and a <= 2975) or
				 (a >= 2979 and a <= 2980) or
				 (a >= 2984 and a <= 2986) or
				 (a >= 2990 and a <= 2997) or
				 (a >= 2999 and a <= 3001) or
				 (a >= 3077 and a <= 3084) or
				 (a >= 3086 and a <= 3088) or
				 (a >= 3090 and a <= 3112) or
				 (a >= 3114 and a <= 3123) or
				 (a >= 3125 and a <= 3129) or
				 (a >= 3168 and a <= 3169) or
				 (a >= 3205 and a <= 3212) or
				 (a >= 3214 and a <= 3216) or
				 (a >= 3218 and a <= 3240) or
				 (a >= 3242 and a <= 3251) or
				 (a >= 3253 and a <= 3257) or
				 a = 3294 or
				 (a >= 3296 and a <= 3297) or
				 (a >= 3333 and a <= 3340) or
				 (a >= 3342 and a <= 3344) or
				 (a >= 3346 and a <= 3368) or
				 (a >= 3370 and a <= 3385) or
				 (a >= 3424 and a <= 3425) or
				 (a >= 3585 and a <= 3630) or
				 a = 3632 or
				 (a >= 3634 and a <= 3635) or
				 (a >= 3648 and a <= 3653) or
				 (a >= 3713 and a <= 3714) or
				 a = 3716 or
				 (a >= 3719 and a <= 3720) or
				 a = 3722 or
				 a = 3725 or
				 (a >= 3732 and a <= 3735) or
				 (a >= 3737 and a <= 3743) or
				 (a >= 3745 and a <= 3747) or
				 a = 3749 or
				 a = 3751 or
				 (a >= 3754 and a <= 3755) or
				 (a >= 3757 and a <= 3758) or
				 a = 3760 or
				 (a >= 3762 and a <= 3763) or
				 a = 3773 or
				 (a >= 3776 and a <= 3780) or
				 (a >= 3904 and a <= 3911) or
				 (a >= 3913 and a <= 3945) or
				 (a >= 4256 and a <= 4293) or
				 (a >= 4304 and a <= 4342) or
				 a = 4352 or
				 (a >= 4354 and a <= 4355) or
				 (a >= 4357 and a <= 4359) or
				 a = 4361 or
				 (a >= 4363 and a <= 4364) or
				 (a >= 4366 and a <= 4370) or
				 a = 4412 or
				 a = 4414 or
				 a = 4416 or
				 a = 4428 or
				 a = 4430 or
				 a = 4432 or
				 (a >= 4436 and a <= 4437) or
				 a = 4441 or
				 (a >= 4447 and a <= 4449) or
				 a = 4451 or
				 a = 4453 or
				 a = 4455 or
				 a = 4457 or
				 (a >= 4461 and a <= 4462) or
				 (a >= 4466 and a <= 4467) or
				 a = 4469 or
				 a = 4510 or
				 a = 4520 or
				 a = 4523 or
				 (a >= 4526 and a <= 4527) or
				 (a >= 4535 and a <= 4536) or
				 a = 4538 or
				 (a >= 4540 and a <= 4546) or
				 a = 4587 or
				 a = 4592 or
				 a = 4601 or
				 (a >= 7680 and a <= 7835) or
				 (a >= 7840 and a <= 7929) or
				 (a >= 7936 and a <= 7957) or
				 (a >= 7960 and a <= 7965) or
				 (a >= 7968 and a <= 8005) or
				 (a >= 8008 and a <= 8013) or
				 (a >= 8016 and a <= 8023) or
				 a = 8025 or
				 a = 8027 or
				 a = 8029 or
				 (a >= 8031 and a <= 8061) or
				 (a >= 8064 and a <= 8116) or
				 (a >= 8118 and a <= 8124) or
				 a = 8126 or
				 (a >= 8130 and a <= 8132) or
				 (a >= 8134 and a <= 8140) or
				 (a >= 8144 and a <= 8147) or
				 (a >= 8150 and a <= 8155) or
				 (a >= 8160 and a <= 8172) or
				 (a >= 8178 and a <= 8180) or
				 (a >= 8182 and a <= 8188) or
				 a = 8486 or
				 (a >= 8490 and a <= 8491) or
				 a = 8494 or
				 (a >= 8576 and a <= 8578) or
				 (a >= 12353 and a <= 12436) or
				 (a >= 12449 and a <= 12538) or
				 (a >= 12549 and a <= 12588) or
				 (a >= 44032 and a <= 55203)
		end

	is_ideographic(a: INTEGER): BOOLEAN	is
			-- Ideographic class.
		do
			Result :=    (a >= 19968 and a <= 40869) or
				 a = 12295 or
				 (a >= 12321 and a <= 12329)
		end

	is_combining_char(a: INTEGER): BOOLEAN is
			-- Combining char class.
		do
			Result :=    (a >= 768 and a <= 837) or
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


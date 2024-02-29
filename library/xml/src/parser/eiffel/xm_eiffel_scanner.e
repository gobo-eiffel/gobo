note

	description: 

		"Scanners for an XML parser"

	implements: "XML 1.0 Second Edition - W3C Recommendation 6 October 2000 (referred as 'XML1.0')"
	noncompliance_unicode: "UTF8 is assumed and all chars >255 are assumed to be LETTERS"

	library: "Gobo Eiffel XML library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

	-- TODO:
	-- system literal accepts non-CHAR
	-- use NOAPOSCHAR/NOQUOTCHAR for attribute value?

class XM_EIFFEL_SCANNER

inherit

	XM_EIFFEL_SCANNER_SKELETON

create

	make_scanner


feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= dtd_ignore)
		end

feature {NONE} -- Implementation

	yy_build_tables
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
	yy_column := yy_column + 4
	yy_position := yy_position + 4
--|#line 123 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 123")
end
 
			set_last_token (COMMENT_START)
			push_start_condition (comment_state)
		
when 2 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 131 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 131")
end

			set_last_token (COMMENT_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 3 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 140 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 140")
end
 
			set_last_token (COMMENT_DASHDASH) -- conformance error XML1.0:2.5
			last_value := text
		
when 4 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 145 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 145")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 5 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 150 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 150")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 6 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 155 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 155")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 7 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 160 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 160")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 8 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 171 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 171")
end

			set_last_token (XMLDECLARATION_START)
			push_start_condition (xmldeclaration)
		
when 9 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 176 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 176")
end

				-- "<?xml" matched by previous rule when allowed.
			set_last_token (PI_RESERVED)
		
when 10 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 180 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 180")
end

				-- <?xml caught by previous rules.
			set_last_token (PI_START)
			push_start_condition (processinginstruction)
		
when 11 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 189 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 189")
end

			set_last_token (XMLDECLARATION_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 12 then
	yy_column := yy_column + 7
	yy_position := yy_position + 7
--|#line 199 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 199")
end

			set_last_token (XMLDECLARATION_VERSION)
		
when 13 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 203 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 203")
end

			set_last_token (XMLDECLARATION_VERSION_10)
			last_value := text
		
when 14 then
	yy_column := yy_column + 10
	yy_position := yy_position + 10
--|#line 209 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 209")
end

			set_last_token (XMLDECLARATION_STANDALONE) 
		
when 15 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 213 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 213")
end

			set_last_token (XMLDECLARATION_STANDALONE_YES)
			last_value := text
		
when 16 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 218 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 218")
end

			set_last_token (XMLDECLARATION_STANDALONE_NO)
			last_value := text
		
when 17 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 224 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 224")
end

			set_last_token (XMLDECLARATION_ENCODING)
		
when 18 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 228 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 228")
end

			-- 'yes' 'no' '1.0' caught by previous rules
			set_last_token (XMLDECLARATION_ENCODING_VALUE)
			last_value := text
		
when 19 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 234 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 234")
end

			set_last_token (EQ)
		
when 20 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 238 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 238")
end

			set_last_token (APOS)
		
when 21 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 242 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 242")
end

			set_last_token (QUOT)
		
when 22 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 246 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 246")
end
 
			set_last_token (SPACE) 
		
when 23 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 253 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 253")
end

			set_last_token (PI_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 24 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 261 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 261")
end

			set_last_token (PI_TARGET)
			last_value := text
		
when 25 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 266 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 266")
end

			set_last_token (PI_TARGET_UTF8)
			last_value := text
		
when 26 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 271 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 271")
end

			set_last_token (SPACE)
			last_value := text
		
when 27 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 275 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 275")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 28 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 279 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 279")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 29 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 284 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 284")
end
 
			set_last_token (CHARDATA) 
			last_value := text
		
when 30 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 292 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 292")
end

	set_last_token (CDATA_START)
	push_start_condition (cdata)

when 31 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 299 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 299")
end
 
			set_last_token (CDATA_END) 
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 32 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 307 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 307")
end

				-- End of line handling XML1.0:2.11.
			set_last_token (CHARDATA)
			last_value := normalized_newline
		
when 33 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 313 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 313")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 34 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 317 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 317")
end

				-- Big chunks in `last_value'.
			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 35 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 323 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 323")
end
 
			set_last_token (CHARDATA) 
			last_value := text
		
when 36 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 329 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 329")
end

		set_last_token (DOCTYPE_START)
		push_start_condition (dtd_in)
	
when 37 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 336 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 336")
end
 set_last_token (DOCTYPE_REQUIRED) 
when 38 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 337 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 337")
end
 set_last_token (DOCTYPE_IMPLIED) 
when 39 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 338 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 338")
end
 set_last_token (DOCTYPE_FIXED) 
when 40 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 339 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 339")
end

			set_last_token (DOCTYPE_ATT_CDATA) 
			last_value := text
		
when 41 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 343 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 343")
end

			set_last_token (DOCTYPE_ATT_ID) 
			last_value := text
		
when 42 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 347 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 347")
end

			set_last_token (DOCTYPE_ATT_IDREF)
			last_value := text
		
when 43 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 351 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 351")
end

			set_last_token (DOCTYPE_ATT_IDREFS)
			last_value := text
		
when 44 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 355 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 355")
end

			set_last_token (DOCTYPE_ATT_ENTITY)
			last_value := text
		
when 45 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 359 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 359")
end

			set_last_token (DOCTYPE_ATT_ENTITIES) 
			last_value := text
		
when 46 then
	yy_column := yy_column + 7
	yy_position := yy_position + 7
--|#line 363 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 363")
end

			set_last_token (DOCTYPE_ATT_NMTOKEN) 
			last_value := text
		
when 47 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 367 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 367")
end

			set_last_token (DOCTYPE_ATT_NMTOKENS)
			last_value := text
		
when 48 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 371 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 371")
end

			set_last_token (DOCTYPE_ATT_NOTATION)
			last_value := text
		
when 49 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 375 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 375")
end

			set_last_token (VALUE_START)
			push_start_condition (attribute_value_single)
		
when 50 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 379 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 379")
end

			set_last_token (VALUE_START)
			push_start_condition (attribute_value_double)
		
when 51 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 387 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 387")
end

			set_last_token (DOCTYPE_DECLARATION_START)
			push_start_condition (doctype)
		
when 52 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 397 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 397")
end

			set_last_token (DOCTYPE_DECLARATION_START)
			push_start_condition (doctype) -- Same, but balances end.
		
when 53 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 402 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 402")
end

			set_last_token (DOCTYPE_DECLARATION_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 54 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 411 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 411")
end

			set_last_token (DOCTYPE_ELEMENT)
			push_start_condition (dtd_element)
		
when 55 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 415 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 415")
end

			set_last_token (DOCTYPE_ATTLIST)
			push_start_condition (dtd_attlist)
		
when 56 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 419 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 419")
end

			set_last_token (DOCTYPE_ENTITY)
			push_start_condition (dtd_entity)
		
when 57 then
	yy_column := yy_column + 10
	yy_position := yy_position + 10
--|#line 423 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 423")
end

			set_last_token (DOCTYPE_NOTATION)
			push_start_condition (dtd_notation)
		
when 58 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 428 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 428")
end

			set_last_token (DOCTYPE_IGNORE)
			last_value := text
		
when 59 then
	yy_column := yy_column + 7
	yy_position := yy_position + 7
--|#line 433 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 433")
end

			set_last_token (DOCTYPE_INCLUDE)
			last_value := text
		
when 60 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 438 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 438")
end

			set_last_token (DOCTYPE_CONDITIONAL_START)
		
when 61 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 442 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 442")
end

			set_last_token (DOCTYPE_CONDITIONAL_END)
		
when 62 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 449 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 449")
end

			set_last_token (DOCTYPE_CONDITIONAL_START)
			push_start_condition (dtd_ignore) -- Self, for exit.
		
when 63 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 454 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 454")
end

			set_last_token (DOCTYPE_CONDITIONAL_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 64 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 463 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 463")
end

			set_last_token (CHARDATA)
		
when 65 then
yy_set_line_column
	yy_position := yy_position + 1
--|#line 467 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 467")
end

			set_last_token (CHARDATA) 
		
when 66 then
	yy_column := yy_column + 7
	yy_position := yy_position + 7
--|#line 474 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 474")
end
 set_last_token (DOCTYPE_PCDATA) 
when 67 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 476 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 476")
end

			set_last_token (DOCTYPE_ELEMENT_EMPTY)
			last_value := text
		
when 68 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 481 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 481")
end

			set_last_token (DOCTYPE_ELEMENT_ANY)
			last_value := text
		
when 69 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 489 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 489")
end

			set_last_token (DOCTYPE_NDATA)
			last_value := text
		
when 70 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 497 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 497")
end
 
			set_last_token (DOCTYPE_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 71 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 506 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 506")
end
 
			set_last_token (NAME) 
			last_value := text
		
when 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 510 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 510")
end
 
			set_last_token (NAME_UTF8) 
			last_value := text
		
when 73 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 514 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 514")
end

			set_last_token (SPACE)
		
when 74 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 531 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 531")
end

			set_last_token (DOCTYPE_SYSTEM)
			last_value := system_literal_text
		
when 75 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 536 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 536")
end

			set_last_token (DOCTYPE_SYSTEM_UTF8)
			last_value := system_literal_text
		
when 76 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 541 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 541")
end

			set_last_token (DOCTYPE_PUBLIC)
			last_value := system_literal_text
			push_start_condition (public_system)
		
when 77 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 550 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 550")
end

				set_last_token (DOCTYPE_SYSTEM)
				last_value := system_literal_text
				if pushed_start_condition_count > 0 then
					pop_start_condition
				else
					-- Error, to be reported later in parser hopefully.
				end
			
when 78 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 560 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 560")
end

				set_last_token (DOCTYPE_SYSTEM_UTF8)
				last_value := system_literal_text
				if pushed_start_condition_count > 0 then
					pop_start_condition
				else
					-- Error, to be reported later in parser hopefully.
				end
			
when 79 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 574 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 574")
end

				set_last_token (DOCTYPE_END)
				if pushed_start_condition_count > 0 then
					pop_start_condition
				else
					-- Error, to be reported later in parser hopefully.
				end
				if pushed_start_condition_count > 0 then
					pop_start_condition -- go out of dtd_notation
				else
					-- Error, to be reported later in parser hopefully.
				end
			
when 80 then
	yy_line := yy_line + 1
	yy_column := 1
	yy_position := yy_position + 1
--|#line 588 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 588")
end

				-- the global INPUT_INVALID does not catch \n, which is caught
				-- explicitly under other start conditions.
			set_last_token (INPUT_INVALID)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 81 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 602 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 602")
end
 set_last_token (DOCTYPE_GROUP_OR) 
when 82 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 603 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 603")
end
 set_last_token (DOCTYPE_GROUP_SEQ) 
when 83 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 604 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 604")
end
 set_last_token (DOCTYPE_GROUP_START) 
when 84 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 605 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 605")
end
 set_last_token (DOCTYPE_GROUP_END) 
when 85 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 606 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 606")
end
 set_last_token (DOCTYPE_GROUP_ZEROONE) 
when 86 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 607 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 607")
end
 set_last_token (DOCTYPE_GROUP_ANY) 
when 87 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 608 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 608")
end
 set_last_token (DOCTYPE_GROUP_ONEMORE) 
when 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 610 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 610")
end

			set_last_token (NMTOKEN) 
			last_value := text
		
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 614 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 614")
end

			set_last_token (NMTOKEN_UTF8) 
			last_value := text
		
when 90 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 622 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 622")
end
 
			set_last_token (DOCTYPE_PERCENT) 
		
when 91 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 625 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 625")
end

			set_last_token (VALUE_START)
			push_start_condition (entity_value_single)
		
when 92 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 629 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 629")
end

			set_last_token (VALUE_START)
			push_start_condition (entity_value_double)
		
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 637 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 637")
end

			set_last_token (DOCTYPE_PEREFERENCE)
			last_value := text_substring (2, text_count - 1)
		
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 642 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 642")
end

			set_last_token (DOCTYPE_PEREFERENCE_UTF8)
			last_value := text_substring (2, text_count - 1)
		
when 95 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 646 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 646")
end

			set_last_token (ENTITY_INVALID)
		
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 653 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 653")
end

			set_last_token (ENTITYVALUE_PEREFERENCE)
			last_value := text_substring (2, text_count - 1)
		
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 657 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 657")
end

			set_last_token (ENTITYVALUE_PEREFERENCE_UTF8)
			last_value := text_substring (2, text_count - 1)
		
when 98 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 665 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 665")
end

			set_last_token (ENTITY_INVALID)
		
when 99 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 672 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 672")
end

	set_last_token (TAG_START_END)
	push_start_condition (tag)

when 100 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 677 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 677")
end

	set_last_token (TAG_START)
	push_start_condition (tag)

when 101 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 684 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 684")
end

			set_last_token (TAG_END_EMPTY)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 102 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 693 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 693")
end
 
			set_last_token (TAG_END) 
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 103 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 703 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 703")
end

			 set_last_token (TAG_NAME_COLON) 
		
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 706 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 706")
end
 
			set_last_token (TAG_NAME_FIRST)
			last_value := text
		
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 710 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 710")
end
 
			set_last_token (TAG_NAME_FIRST_UTF8)
			last_value := text
		
when 106 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 714 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 714")
end
 
			set_last_token (TAG_NAME_ATOM) 
			last_value := text
		
when 107 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 718 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 718")
end
 
			set_last_token (TAG_NAME_ATOM_UTF8) 
			last_value := text
		
when 108 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 722 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 722")
end

			set_last_token (SPACE) 
		
when 109 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 725 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 725")
end

			set_last_token (EQ) 
		
when 110 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 729 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 729")
end
 
			set_last_token (VALUE_START) 
			push_start_condition (attribute_value_single)
		
when 111 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 733 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 733")
end

			set_last_token (VALUE_START)
			push_start_condition (attribute_value_double)
		
when 112 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 746 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 746")
end

				set_last_token (CHARDATA)
				last_value := "%'"
			
when 113 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 750 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 750")
end

				set_last_token (CHARDATA)
				last_value := "%""
			
when 114 then
	yy_column := yy_column + 4
	yy_position := yy_position + 4
--|#line 754 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 754")
end

				set_last_token (CHARDATA)
				last_value := "<"
			
when 115 then
	yy_column := yy_column + 4
	yy_position := yy_position + 4
--|#line 758 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 758")
end

				set_last_token (CHARDATA)
				last_value := ">"
			
when 116 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 762 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 762")
end

				set_last_token (CHARDATA)
				last_value := "&"
			
when 117 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 770 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 770")
end
 
				set_last_token (CONTENT_ENTITY) 
				last_value := text_substring (2, text_count - 1)
			
when 118 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 774 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 774")
end
 
				set_last_token (CONTENT_ENTITY_UTF8) 
				last_value := text_substring (2, text_count - 1)
			
when 119 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 782 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 782")
end
 
				set_last_token (CHARDATA) -- Bypassed
				last_value := text
			
when 120 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 786 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 786")
end
 
				set_last_token (CHARDATA_UTF8) -- Bypassed
				last_value := text
			
when 121 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 793 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 793")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 122 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 801 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 801")
end
 
				set_last_token (ATTRIBUTE_ENTITY)
				last_value := text_substring (2, text_count - 1)
			
when 123 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 805 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 805")
end
 
				set_last_token (ATTRIBUTE_ENTITY_UTF8)
				last_value := text_substring (2, text_count - 1)
			
when 124 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 810 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 810")
end

			set_last_token (ATTRIBUTE_LT) -- Conformance error.
			last_value := text
		
when 125 then
	yy_line := yy_line + 1
	yy_column := 1
	yy_position := yy_position + 2
--|#line 814 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 814")
end

				-- XML1.0:3.3.3 Attribute value normalization.
			set_last_token (CHARDATA)
			if has_normalized_newline then
				last_value := two_normalized_spaces
			else
				last_value := normalized_space
			end
		
when 126 then
yy_set_line_column
	yy_position := yy_position + 1
--|#line 823 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 823")
end

				-- XML1.0:3.3.3 Attribute value normalization.
			set_last_token (CHARDATA)
			last_value := normalized_space
		
when 127 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 828 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 828")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 128 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 832 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 832")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 129 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 840 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 840")
end
 
			character_entity.from_decimal (text_substring (3, text_count - 1))
			if character_entity.is_valid then
				if character_entity.is_ascii then
					set_last_token (CHARDATA)
				else
					set_last_token (CHARDATA_UTF8)
				end
				last_value := character_entity.to_utf8
			else
				set_last_token (ENTITY_INVALID)
			end
		
when 130 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 854 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 854")
end

			character_entity.from_hexadecimal (text_substring (4, text_count - 1))
			if character_entity.is_valid then
				if character_entity.is_ascii then
					set_last_token (CHARDATA)
				else
					set_last_token (CHARDATA_UTF8)
				end
				last_value := character_entity.to_utf8
			else
				set_last_token (ENTITY_INVALID)
			end
		
when 131 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 869 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 869")
end

			set_last_token (ENTITY_INVALID)
			last_value := text
		
when 132 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 877 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 877")
end

				-- End of line handling XML1.0:2.11.
			set_last_token (CHARDATA)
			last_value := normalized_newline
		
when 133 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 882 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 882")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 134 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 886 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 886")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 135 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 890 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 890")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 136 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 898 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 898")
end
 
			set_last_token (VALUE_END) 
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 137 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 906 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 906")
end

			set_last_token (CHARDATA) 
			last_value := text
		
when 138 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 914 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 914")
end

			set_last_token (VALUE_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		
when 139 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 922 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 922")
end

			set_last_token (CHARDATA) 
			last_value := text
		
when 140 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 930 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 930")
end

		-- XML1.0:14 ]]> not allowed in markup.
	last_token := CONTENT_CONDITIONAL_END
	last_value := text

when 141 then
	yy_line := yy_line + 1
	yy_column := 1
	yy_position := yy_position + 2
--|#line 936 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 936")
end

		-- End of line handling XML1.0:2.11.
	set_last_token (SPACE)
	last_value := normalized_newline

when 142 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 942 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 942")
end
 
	set_last_token (SPACE) 
	last_value := normalized_newline

when 143 then
	yy_line := yy_line + 1
	yy_column := 1
	yy_position := yy_position + 1
--|#line 947 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 947")
end

	set_last_token (SPACE) 
	last_value := normalized_newline

when 144 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 952 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 952")
end

		-- Space not matched by newline normalization.
	set_last_token (SPACE)
	last_value := text

when 145 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 958 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 958")
end
 
	set_last_token (CHARDATA)
	last_value := text

when 146 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 963 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 963")
end
 
	set_last_token (CHARDATA_UTF8)
	last_value := text

when 147 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 968 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 968")
end

	set_last_token (CHARDATA)
	last_value := text

when 148 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 973 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 973")
end

		-- Default rule.
	set_last_token (INPUT_INVALID)
	last_value := text

when 149 then
yy_set_line_column
	yy_position := yy_position + 1
--|#line 0 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3951)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			yy_nxt_template_10 (an_array)
			yy_nxt_template_11 (an_array)
			yy_nxt_template_12 (an_array)
			yy_nxt_template_13 (an_array)
			yy_nxt_template_14 (an_array)
			yy_nxt_template_15 (an_array)
			yy_nxt_template_16 (an_array)
			yy_nxt_template_17 (an_array)
			yy_nxt_template_18 (an_array)
			yy_nxt_template_19 (an_array)
			yy_nxt_template_20 (an_array)
			an_array.area.fill_with (830, 3863, 3951)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   39,   40,   41,   39,  150,  151,  150,  150,  800,
			   43,  800,  150,  151,  150,  150,   38,   38,  211,  577,
			  192,   85,   86,  192,  627,  577,  192,   38,  358,  192,
			   44,  740,  212,  760,  778,  771,  152,   38,   38,  171,
			  172,   85,   86,  152,  173,  812,  213,   38,   38,  137,
			  137,  220,  220,  220,  220,  593,  213,  814,   45,  393,
			  137,  799,  394,  153,  153,   38,   38,  161,   38,  174,
			  395,  175,  813,  798,   38,  176,   38,   87,  593,  177,
			  137,   38,   38,   38,   46,   47,   48,   49,   50,   38,
			   39,   40,   41,   39,   38,  417,   38,   87,  418,   43,

			   38,   38,   38,   88,   89,   90,   91,   92,   38,  171,
			  172,  645,  178,  646,  173,  179,  430,  180,  821,   44,
			   38,   38,   38,   88,   89,   90,   91,   92,   38,  195,
			  196,  197,  198,  199,  218,  218,   38,  161,  593,  174,
			  431,  175,  232,  232,  200,  176,  685,   45,  137,  177,
			  251,  251,  181,  215,  215,  215,  217,  217,  217,  816,
			  178,  594,   38,  179,   38,  180,  219,  219,  219,  685,
			   38,   38,   38,   46,   47,   48,   49,   50,   38,   51,
			   52,   51,   53,  797,   38,  220,  220,  220,  220,  220,
			  220,  220,  221,  273,  273,   55,  137,  202,  295,  295, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  181,  796,  203,  795,  204,  830,  830,  830,  474,  205,
			   38,  475,   38,  229,  229,  229,  231,  231,  231,  317,
			  317,  206,  207,  208,  209,  210,  233,  233,  233,  234,
			  234,  234,  234,  234,  234,  234,  234,  236,  237,  238,
			  239,  240,  248,  248,  248,  250,  250,  250,  252,  252,
			  252,  253,  253,  253,  253,  253,  253,  253,  253,   38,
			   38,   38,   56,   57,   58,   59,   60,   38,   51,   52,
			   51,   53,  223,  224,  225,  226,  227,  263,  264,  265,
			  266,  267,  343,  343,   55,  270,  270,  270,  223,  224,
			  225,  226,  227,  272,  272,  272,  274,  274,  274,  275,

			  275,  275,  275,  275,  275,  275,  275,  280,  281,  282,
			  283,  284,  277,  277,  277,  277,  794,  276,  292,  292,
			  292,  276,  287,  288,  289,  290,  291,  367,  367,  277,
			  278,  391,  391,  277,  278,  294,  294,  294,  296,  296,
			  296,  299,  300,  301,  302,  303,  407,  407,   38,   38,
			   38,   56,   57,   58,   59,   60,   38,   61,   62,   61,
			   61,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   64,   63,   63,   63,   63,   65,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   63,   63,   63,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   63,   38,   38,   38,
			   66,   67,   68,   69,   70,   38,   71,   72,   71,   71,
			   38,   73,   38,   38,   38,   38,   74,   38,   38,   38,
			   38,   38,   75,   38,   38,   75,   76,   75,   75,   75,
			   75,   75,   75,   38,   38,   38,   77,   38,   78,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   38,   38,   38,   38,   75,   75,   75,   75,   79,
			   75,   75,   75,   75,   80,   75,   75,   75,   75,   81,
			   75,   75,   82,   75,   83,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   93,   94,   93,   93,   38,
			   95,   38,   38,   38,   38,   96,   38,   38,   38,   38,
			   38,   97,   97,   98,   97,   97,   97,   97,   97,   97,
			   97,   97,   99,   38,   38,  100,  101,   38,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			   38,   38,   38,  102,  102,  102,  102,  102,  102,  102, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,   38,   38,   38,   38,  103,  104,
			  105,  106,  107,   38,  108,  109,  110,  108,  790,  112,
			  314,  314,  314,  113,  114,  316,  316,  316,  318,  318,
			  318,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  320,  319,  319,  115,  322,  323,  324,  325,  326,  328,
			  329,  330,  331,  332,  789,  361,  200,  340,  340,  340,
			  784,  333,  342,  342,  342,  344,  344,  344,  345,  345,
			  345,  345,  345,  345,  345,  345,  347,  348,  349,  350,
			  351,  353,  354,  355,  356,  357,  353,  354,  355,  356,

			  357,  218,  218,  362,   38,   38,   38,  116,  117,  118,
			  119,  120,   38,  108,  109,  110,  108,  783,  112,  305,
			  782,  359,  113,  114,  306,  781,  307,  360,  364,  364,
			  364,  308,  353,  354,  355,  356,  357,  366,  366,  366,
			  425,  425,  115,  309,  310,  311,  312,  313,  335,  336,
			  337,  338,  339,  368,  368,  368,  375,  376,  377,  378,
			  379,  388,  388,  388,  780,  353,  354,  355,  356,  357,
			  381,  382,  383,  384,  385,  369,  369,  369,  369,  779,
			  370,  390,  390,  390,  777,  371,  386,  392,  392,  392,
			  396,  232,  232,   38,   38,   38,  116,  117,  118,  119, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  120,   38,  108,  109,  110,  108,  372,  121,  387,  441,
			  441,  113,  122,  369,  369,  369,  369,  397,  370,  398,
			  404,  404,  404,  371,  381,  382,  383,  384,  385,  401,
			  773,  115,  399,  772,  400,  445,  445,  381,  382,  383,
			  384,  385,  273,  273,  372,  460,  460,  381,  382,  383,
			  384,  385,  406,  406,  406,  381,  382,  383,  384,  385,
			  408,  408,  408,  215,  215,  215,  381,  382,  383,  384,
			  385,  381,  382,  383,  384,  385,  353,  354,  355,  356,
			  357,  767,   38,   38,   38,  116,  117,  118,  119,  120,
			   38,  108,  109,  110,  108,  766,  121,  217,  217,  217,

			  113,  122,  195,  196,  197,  198,  199,  219,  219,  219,
			  409,  409,  409,  409,  409,  409,  409,  409,  427,  765,
			  115,  422,  422,  422,  424,  424,  424,  426,  426,  426,
			  195,  196,  197,  198,  199,  215,  215,  215,  428,  215,
			  215,  215,  433,  433,  433,  434,  434,  434,  220,  220,
			  220,  220,  220,  220,  220,  221,  764,  429,  830,  830,
			  830,  229,  229,  229,  231,  231,  231,  763,  410,  464,
			  464,   38,   38,   38,  116,  117,  118,  119,  120,   38,
			  123,  124,  125,  123,  762,  112,  317,  317,  127,  128,
			  114,  233,  233,  233,  223,  224,  225,  226,  227,  229, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  229,  229,  229,  229,  229,  436,  436,  436,  437,  437,
			  437,  234,  234,  234,  234,  236,  237,  238,  239,  240,
			  438,  438,  438,  440,  440,  440,  442,  442,  442,  248,
			  248,  248,  444,  444,  444,  223,  224,  225,  226,  227,
			  761,  223,  224,  225,  226,  227,  446,  446,  446,  248,
			  248,  248,  248,  248,  248,  447,  447,  447,  482,  482,
			   38,   38,   38,  129,  130,  131,  132,  133,   38,  123,
			  124,  125,  123,  759,  112,  343,  343,  127,  128,  114,
			  448,  448,  448,  253,  253,  253,  253,  263,  264,  265,
			  266,  267,  270,  270,  270,  272,  272,  272,  274,  274,

			  274,  263,  264,  265,  266,  267,  270,  270,  270,  270,
			  270,  270,  455,  455,  455,  456,  456,  456,  277,  277,
			  277,  277,  280,  281,  282,  283,  284,  457,  457,  457,
			  459,  459,  459,  461,  461,  461,  287,  288,  289,  290,
			  291,  292,  292,  292,  275,  275,  275,  275,  758,   38,
			   38,   38,  129,  130,  131,  132,  133,   38,  123,  124,
			  125,  123,  276,  121,  495,  495,  127,  128,  122,  463,
			  463,  463,  508,  508,  277,  278,  465,  465,  465,  287,
			  288,  289,  290,  291,  292,  292,  292,  292,  292,  292,
			  466,  466,  466,  467,  467,  467,  299,  300,  301,  302, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  303,  314,  314,  314,  316,  316,  316,  318,  318,  318,
			  479,  479,  479,  481,  481,  481,  483,  483,  483,  299,
			  300,  301,  302,  303,  314,  314,  314,  314,  314,  314,
			  484,  484,  484,  485,  485,  485,  521,  521,   38,   38,
			   38,  129,  130,  131,  132,  133,   38,  123,  124,  125,
			  123,  752,  121,  525,  525,  127,  128,  122,  319,  319,
			  319,  319,  319,  319,  319,  319,  322,  323,  324,  325,
			  326,  340,  340,  340,  342,  342,  342,  344,  344,  344,
			  492,  492,  492,  494,  494,  494,  496,  496,  496,  505,
			  505,  505,  507,  507,  507,  509,  509,  509,  322,  323,

			  324,  325,  326,  340,  340,  340,  340,  340,  340,  510,
			  510,  510,  511,  511,  511,  345,  345,  345,  345,  518,
			  518,  518,  520,  520,  520,  553,  553,   38,   38,   38,
			  129,  130,  131,  132,  133,   38,  134,  135,  134,  134,
			   38,   38,   38,   38,  136,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,  137,   38,  138,   38,  139,   38,  137,
			  137,  137,  137,  137,  137,  137,  137,  140,  137,  137,
			  137,  137,  137,  141,  137,  137,  142,  137,  137,  137,
			  137,  143,   38,  144,  137,  137,  137,  137,  137,  137, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,   38,   38,   38,   38,  145,
			  146,  147,  148,  149,   38,  134,  135,  134,  134,   38,
			   38,  154,   38,  136,   38,   38,  155,  156,  157,  158,
			  159,  160,  160,   38,  160,  160,  160,  160,  160,  160,
			  160,  160,  161,   38,   38,   38,  139,  162,  163,  161,
			  161,  161,  164,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			   38,   38,   38,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,

			  161,  161,  161,  161,  165,   38,   38,   38,  166,  167,
			  168,  169,  170,   38,  182,  183,  182,  182,  409,  409,
			  409,  497,  409,  409,  409,  409,  522,  522,  522,  353,
			  354,  355,  356,  357,  364,  364,  364,  524,  524,  524,
			  526,  526,  526,  185,  427,  534,  531,  353,  354,  355,
			  356,  357,  364,  364,  364,  364,  364,  364,  538,  532,
			  751,  527,  750,  533,  749,  528,  536,  536,  536,  538,
			  744,  186,  743,  529,  557,  557,  498,  742,  353,  354,
			  355,  356,  357,  530,  353,  354,  355,  356,  357,  537,
			  537,  537,  580,  580,   38,   38,   38,  187,  188,  189, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  190,  191,   38,  182,  183,  182,  182,  353,  354,  355,
			  356,  357,  353,  354,  355,  356,  357,  369,  369,  369,
			  369,  741,  370,  550,  550,  550,  740,  371,  552,  552,
			  552,  739,  185,  554,  554,  554,  539,  540,  541,  542,
			  543,  559,  544,  545,  546,  547,  548,  738,  372,  375,
			  376,  377,  378,  379,  381,  382,  383,  384,  385,  685,
			  186,  388,  388,  388,  556,  556,  556,  558,  558,  558,
			  381,  382,  383,  384,  385,  560,  381,  382,  383,  384,
			  385,  566,  686,   38,   38,   38,  187,  188,  189,  190,
			  191,   38,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  567,  571,  235,  388,  388,  388,
			  737,  381,  382,  383,  384,  385,  235,  235,  235,  235,
			  388,  388,  388,  561,  561,  561,  562,  562,  562,  569,
			  736,  381,  382,  383,  384,  385,  381,  382,  383,  384,
			  385,  608,  608,  235,  235,  235,  568,  404,  404,  404,
			  404,  404,  404,  620,  620,  353,  354,  355,  356,  357,
			  735,  381,  382,  383,  384,  385,  731,  235,  570,  630,
			  630,  242,  243,  244,  245,  246,  830,  574,  574,  574,
			  381,  382,  383,  384,  385,  587,  201,  201,  730,  201,
			  201,  201,  201,  201,  201,  201,  201,  729,  411,  728, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  381,  382,  383,  384,  385,  575,  575,  575,  409,  409,
			  409,  409,  409,  409,  409,  409,  721,  576,  422,  422,
			  422,  579,  579,  579,  581,  581,  581,  422,  422,  422,
			  422,  422,  422,  588,  588,  588,  589,  589,  589,  720,
			  412,  413,  414,  415,  416,  215,  215,  215,  215,  215,
			  215,  637,  637,  412,  413,  414,  415,  416,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  655,  655,  235,  229,  229,  229,  229,  229,  229,  438,
			  438,  438,  235,  235,  235,  235,  236,  237,  238,  239,
			  240,  438,  438,  438,  595,  595,  595,  596,  596,  596,

			  248,  248,  248,  248,  248,  248,  597,  597,  597,  235,
			  235,  235,  598,  598,  598,  248,  248,  248,  248,  248,
			  248,  270,  270,  270,  270,  270,  270,  280,  281,  282,
			  283,  284,  719,  235,  457,  457,  457,  242,  243,  244,
			  245,  246,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  438,  615,  717,  438,  457,  457,  457,
			  602,  602,  602,  603,  603,  603,  438,  438,  438,  438,
			  292,  292,  292,  292,  292,  292,  604,  604,  604,  605,
			  605,  605,  292,  292,  292,  292,  292,  292,  479,  479,
			  479,  660,  660,  438,  438,  438,  607,  607,  607,  609, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  609,  609,  479,  479,  479,  479,  479,  479,  622,  469,
			  470,  471,  472,  473,  616,  616,  616,  438,  617,  617,
			  617,  242,  243,  244,  245,  246,  830,  314,  314,  314,
			  314,  314,  314,  492,  492,  492,  304,  304,  632,  304,
			  304,  304,  304,  304,  304,  304,  304,  707,  468,  619,
			  619,  619,  621,  621,  621,  492,  492,  492,  492,  492,
			  492,  818,  818,  487,  488,  489,  490,  491,  623,  623,
			  623,  624,  624,  624,  409,  409,  409,  409,  625,  409,
			  409,  626,  706,  576,  505,  505,  505,  629,  629,  629,
			  631,  631,  631,  500,  501,  502,  503,  504,  505,  505,

			  505,  639,  705,  469,  470,  471,  472,  473,  327,  327,
			  704,  327,  327,  327,  327,  327,  327,  327,  327,  694,
			  486,  505,  505,  505,  633,  633,  633,  634,  634,  634,
			  340,  340,  340,  340,  340,  340,  518,  518,  518,  636,
			  636,  636,  638,  638,  638,  518,  518,  518,  518,  518,
			  518,  640,  640,  640,  823,  823,  513,  514,  515,  516,
			  517,  641,  641,  641,  364,  364,  364,  364,  364,  364,
			  642,  642,  642,  648,  693,  487,  488,  489,  490,  491,
			  830,  643,  643,  643,  649,  651,  364,  364,  364,  650,
			  334,  334,  692,  334,  334,  334,  334,  334,  334,  334, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  334,  689,  499,  364,  364,  364,  652,  652,  652,  688,
			  353,  354,  355,  356,  357,  687,  684,  353,  354,  355,
			  356,  357,  683,  682,  353,  354,  355,  356,  357,  353,
			  354,  355,  356,  357,  654,  654,  654,  656,  656,  656,
			  657,  657,  657,  659,  659,  659,  661,  661,  661,  375,
			  376,  377,  378,  379,  550,  550,  550,  500,  501,  502,
			  503,  504,  346,  346,  681,  346,  346,  346,  346,  346,
			  346,  346,  346,  667,  512,  550,  550,  550,  663,  663,
			  663,  664,  664,  664,  388,  388,  388,  388,  388,  388,
			  665,  665,  665,  666,  666,  666,  381,  382,  383,  384,

			  385,  388,  388,  388,  671,  381,  382,  383,  384,  385,
			  388,  388,  388,  672,  673,  676,  404,  404,  404,  680,
			  675,  404,  404,  404,  422,  422,  422,  677,  674,  513,
			  514,  515,  516,  517,  670,  669,  381,  382,  383,  384,
			  385,  422,  422,  422,  678,  678,  678,  353,  354,  355,
			  356,  357,  679,  679,  679,  381,  382,  383,  384,  385,
			  381,  382,  383,  384,  385,  381,  382,  383,  384,  385,
			  381,  382,  383,  384,  385,  422,  422,  422,  422,  422,
			  422,  438,  438,  438,  438,  438,  438,  248,  248,  248,
			  248,  248,  248,  457,  457,  457,  457,  457,  457,  292, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  292,  292,  292,  292,  292,  479,  479,  479,  479,  479,
			  479,  690,  690,  690,  691,  691,  691,  479,  479,  479,
			  479,  479,  479,  492,  492,  492,  492,  492,  492,  695,
			  695,  695,  696,  696,  696,  492,  492,  492,  492,  492,
			  492,  409,  409,  409,  409,  409,  409,  409,  409,  712,
			  697,  409,  409,  409,  409,  409,  409,  409,  409,  698,
			  697,  712,  668,  699,  662,  658,  677,  505,  505,  505,
			  505,  505,  505,  700,  700,  700,  701,  701,  701,  505,
			  505,  505,  505,  505,  505,  518,  518,  518,  518,  518,
			  518,  702,  702,  702,  703,  703,  703,  518,  518,  518,

			  518,  518,  518,  364,  364,  364,  364,  364,  364,  708,
			  653,  710,  711,  652,  652,  652,  647,  709,  652,  652,
			  652,  713,  713,  713,  714,  714,  714,  539,  540,  541,
			  542,  543,  644,  635,  544,  545,  546,  547,  548,  657,
			  657,  657,  722,  353,  354,  355,  356,  357,  353,  354,
			  355,  356,  357,  353,  354,  355,  356,  357,  353,  354,
			  355,  356,  357,  657,  657,  657,  715,  715,  715,  716,
			  716,  716,  550,  550,  550,  550,  550,  550,  388,  388,
			  388,  388,  388,  388,  718,  724,  723,  422,  422,  422,
			  628,  726,  381,  382,  383,  384,  385,  725,  727,  422, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  422,  422,  618,  732,  732,  732,  732,  479,  479,  479,
			  479,  479,  479,  381,  382,  383,  384,  385,  381,  382,
			  383,  384,  385,  381,  382,  383,  384,  385,  614,  746,
			  381,  382,  383,  384,  385,  733,  745,  613,  381,  382,
			  383,  384,  385,  734,  734,  734,  734,  747,  353,  354,
			  355,  356,  357,  492,  492,  492,  492,  492,  492,  505,
			  505,  505,  505,  505,  505,  518,  518,  518,  518,  518,
			  518,  748,  652,  652,  652,  733,  353,  354,  355,  356,
			  357,  753,  353,  354,  355,  356,  357,  652,  652,  652,
			  657,  657,  657,  757,  754,  353,  354,  355,  356,  357,

			  657,  657,  657,  381,  382,  383,  384,  385,  755,  756,
			  353,  354,  355,  356,  357,  381,  382,  383,  384,  385,
			  768,  612,  611,  381,  382,  383,  384,  385,  353,  354,
			  355,  356,  357,  610,  774,  381,  382,  383,  384,  385,
			  606,  381,  382,  383,  384,  385,  732,  732,  732,  732,
			  734,  734,  734,  734,  601,  381,  382,  383,  384,  385,
			  353,  354,  355,  356,  357,  775,  353,  354,  355,  356,
			  357,  769,  769,  769,  769,  776,  770,  770,  770,  770,
			  381,  382,  383,  384,  385,  381,  382,  383,  384,  385,
			  381,  382,  383,  384,  385,  353,  354,  355,  356,  357, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  801,  791,  600,  381,  382,  383,  384,  385,  792,  793,
			  801,  599,  381,  382,  383,  384,  385,  769,  769,  769,
			  769,  592,  785,  770,  770,  770,  770,  786,  787,  815,
			  815,  815,  825,  788,  381,  382,  383,  384,  385,  591,
			  590,  381,  382,  383,  384,  385,  586,  381,  382,  383,
			  384,  385,  825,  585,  353,  354,  355,  356,  357,  353,
			  354,  355,  356,  357,  381,  382,  383,  384,  385,  381,
			  382,  383,  384,  385,  817,  817,  817,  584,  802,  803,
			  804,  805,  806,  807,  808,  809,  810,  811,  381,  382,
			  383,  384,  385,  819,  819,  819,  820,  820,  820,  822,

			  822,  822,  824,  824,  824,  815,  815,  815,  583,  582,
			  802,  803,  804,  805,  806,  815,  815,  815,  826,  826,
			  826,  827,  827,  827,  578,  807,  808,  809,  810,  811,
			  820,  820,  820,  820,  820,  820,  828,  828,  828,  829,
			  829,  829,  815,  815,  815,  815,  815,  815,  820,  820,
			  820,  820,  820,  820,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,  184,  184,  184,  184,  184,  184,  184,  184,

			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  194,  194,  194,  194,  573,
			  194,  194,  194,  194,  194,  194,  572,  194,  194,  194,
			  194,  201,  194,  194,  565,  564,  563,  555,  201,  551,
			  549,  535,  523,  201,  201,  519,  201,  201,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  506,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  493,  235,  235,  235,  235,  235,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  241,  241,  341,  241,  241,  241,  241,  241,  254,  480,
			  254,  478,  477,  476,  315,  462,  254,  254,  262,  458,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  285,  262,  262,
			  279,  279,  279,  454,  271,  286,  286,  286,  279,  279,
			  453,  279,  279,  286,  286,  452,  286,  286,  298,  451,
			  298,  298,  450,  449,  298,  298,  298,  298,  298,  443,
			  298,  298,  298,  298,  298,  298,  298,  304,  439,  435,
			  230,  432,  423,  421,  304,  420,  419,  216,  405,  304,
			  304,  403,  304,  304,  321,  402,  321,  389,  373,  365,

			  321,  321,  321,  321,  321,  321,  321,  321,  321,  321,
			  321,  321,  321,  327,  363,  341,  334,  315,  327,  327,
			  297,  327,  327,  334,  293,  285,  271,  269,  334,  334,
			  346,  334,  334,  268,  261,  346,  346,  260,  346,  346,
			  352,  352,  352,  352,  259,  258,  257,  256,  352,  352,
			  255,  352,  352,  374,  374,  374,  374,  249,  247,  230,
			  228,  374,  374,  216,  374,  374,  380,  380,  380,  380,
			  214,  193,  830,  830,  380,  380,  830,  380,  380,  215,
			  215,  215,  215,  830,  215,  215,  215,  215,  215,  215,
			  830,  215,  215,  215,  215,  830,  215,  215,  229,  229, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  229,  229,  229,  229,  229,  830,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  248,  248,
			  248,  248,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  830,  248,  248,  248,  248,  248,  270,  830,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  830,  270,  270,  292,
			  292,  292,  830,  830,  830,  830,  830,  292,  292,  830,
			  292,  292,  314,  830,  314,  314,  830,  830,  314,  314,
			  314,  314,  314,  830,  314,  314,  314,  314,  314,  314,
			  314,  340,  830,  340,  830,  830,  830,  340,  340,  340,

			  340,  340,  340,  340,  340,  340,  340,  340,  340,  340,
			  364,  364,  364,  364,  830,  830,  830,  830,  364,  364,
			  830,  364,  364,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  388,  388,  388,
			  388,  830,  830,  830,  830,  388,  388,  830,  388,  388,
			  422,  422,  422,  422,  422,  830,  830,  830,  422,  422,
			  830,  422,  422,  438,  438,  438,  438,  438,  438,  438, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  438,  438,  438,  438,  438,  438,  830,  438,  438,  438,
			  438,  438,  457,  457,  457,  830,  830,  830,  830,  830,
			  457,  457,  830,  457,  457,  479,  479,  479,  479,  479,
			  830,  830,  830,  479,  479,  830,  479,  479,  492,  492,
			  492,  492,  492,  830,  830,  830,  492,  492,  830,  492,
			  492,  505,  505,  505,  505,  505,  830,  830,  830,  505,
			  505,  830,  505,  505,  518,  518,  518,  518,  518,  830,
			  830,  830,  518,  518,  830,  518,  518,  550,  550,  550,
			  550,  830,  830,  830,  830,  550,  550,  830,  550,  550,
			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,

			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  785,  785,  785,  785,  785,  785,
			  830,  785,  785,  785,  785,  785,  785,  830,  830,  785,
			  785,  785,  830,  785,  786,  786,  786,  830,  786,  786,
			  830,  786,  786,  786,  786,  786,  786,  830,  830,  786,
			  786,  786,  830,  786,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  788,  788,  788,  788, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,   37, yy_Dummy>>,
			1, 63, 3800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3951)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (5, 357, 445)
			an_array.area.fill_with (7, 446, 534)
			an_array.area.fill_with (11, 535, 623)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			an_array.area.fill_with (21, 1336, 1424)
			an_array.area.fill_with (27, 1425, 1513)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			yy_chk_template_11 (an_array)
			yy_chk_template_12 (an_array)
			yy_chk_template_13 (an_array)
			yy_chk_template_14 (an_array)
			yy_chk_template_15 (an_array)
			yy_chk_template_16 (an_array)
			yy_chk_template_17 (an_array)
			yy_chk_template_18 (an_array)
			an_array.area.fill_with (830, 3862, 3951)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,   23,   23,   23,   23,  785,
			    1,  786,   24,   24,   24,   24,   25,   26,   44,  867,
			   39,    9,    9,   39,  498,  867,  192,   33,  138,  192,
			    1,  699,   44,  733,  759,  749,   23,   25,   26,   29,
			   29,   10,   10,   24,   29,  790,   44,   34,   33,   25,
			   26,   51,   51,   51,   51,  430,  138,  799,    1,  172,
			   33,  784,  172,   25,   26,   25,   26,   29,   34,   29,
			  172,   29,  796,  782,   33,   29,   33,    9,  430,   29,
			   34,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    2,    2,   34,  202,   34,   10,  202,    2,

			    9,    9,    9,    9,    9,    9,    9,    9,    9,   30,
			   30,  528,   31,  528,   30,   31,  213,   31,  808,    2,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   42,
			   42,   42,   42,   42,   49,   49,   31,   30,  431,   30,
			  213,   30,   59,   59,   43,   30,  593,    2,   31,   30,
			   69,   69,   31,   46,   46,   46,   48,   48,   48,  803,
			   32,  431,   31,   32,   31,   32,   50,   50,   50,  593,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    3,
			    3,    3,    3,  781,   32,   52,   52,   52,   52,   53,
			   53,   53,   53,   91,   91,    3,   32,   43,  106,  106, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   32,  780,   43,  778,   43,   54,   54,   54,  305,   43,
			   32,  305,   32,   56,   56,   56,   58,   58,   58,  119,
			  119,   43,   43,   43,   43,   43,   60,   60,   60,   61,
			   61,   61,   61,   62,   62,   62,   62,   63,   63,   63,
			   63,   63,   66,   66,   66,   68,   68,   68,   70,   70,
			   70,   71,   71,   71,   71,   72,   72,   72,   72,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    4,    4,
			    4,    4,   53,   53,   53,   53,   53,   84,   84,   84,
			   84,   84,  132,  132,    4,   88,   88,   88,   54,   54,
			   54,   54,   54,   90,   90,   90,   92,   92,   92,   93,

			   93,   93,   93,   94,   94,   94,   94,   97,   97,   97,
			   97,   97,  100,  100,  100,  100,  777,   93,  103,  103,
			  103,   94,  102,  102,  102,  102,  102,  148,  148,   93,
			   93,  169,  169,   94,   94,  105,  105,  105,  107,  107,
			  107,  111,  111,  111,  111,  111,  190,  190,    4,    4,
			    4,    4,    4,    4,    4,    4,    4, yy_Dummy>>,
			1, 157, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   13,   13,   13,   13,  773,   13,  116,  116,  116,   13,
			   13,  118,  118,  118,  120,  120,  120,  123,  123,  123,
			  123,  124,  124,  124,  124,  125,  125,  125,  125,   13,
			  126,  126,  126,  126,  126,  127,  127,  127,  127,  127,
			  772,  141,  113,  129,  129,  129,  767,  128,  131,  131,
			  131,  133,  133,  133,  134,  134,  134,  134,  135,  135,
			  135,  135,  136,  136,  136,  136,  136,  137,  137,  137,
			  137,  137,  141,  141,  141,  141,  141,  198,  198,  142,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   14,
			   14,   14,   14,  766,   14,  113,  765,  140,   14,   14,

			  113,  764,  113,  140,  145,  145,  145,  113,  142,  142,
			  142,  142,  142,  147,  147,  147,  209,  209,   14,  113,
			  113,  113,  113,  113,  128,  128,  128,  128,  128,  149,
			  149,  149,  160,  160,  160,  160,  160,  166,  166,  166,
			  762,  140,  140,  140,  140,  140,  161,  161,  161,  161,
			  161,  150,  150,  150,  150,  761,  150,  168,  168,  168,
			  758,  150,  163,  170,  170,  170,  174,  226,  226,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   15,   15,
			   15,   15,  150,   15,  164,  239,  239,   15,   15,  151,
			  151,  151,  151,  175,  151,  176,  187,  187,  187,  151, yy_Dummy>>,
			1, 200, 624)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  163,  163,  163,  163,  163,  181,  752,   15,  177,  751,
			  177,  245,  245,  174,  174,  174,  174,  174,  266,  266,
			  151,  283,  283,  164,  164,  164,  164,  164,  189,  189,
			  189,  175,  175,  175,  175,  175,  191,  191,  191,  195,
			  195,  195,  176,  176,  176,  176,  176,  177,  177,  177,
			  177,  177,  181,  181,  181,  181,  181,  744,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   16,   16,   16,
			   16,  743,   16,  197,  197,  197,   16,   16,  194,  194,
			  194,  194,  194,  199,  199,  199,  200,  200,  200,  200,
			  200,  200,  200,  200,  211,  742,   16,  206,  206,  206,

			  208,  208,  208,  210,  210,  210,  215,  215,  215,  215,
			  215,  216,  216,  216,  211,  217,  217,  217,  218,  218,
			  218,  219,  219,  219,  220,  220,  220,  220,  221,  221,
			  221,  221,  741,  211,  222,  222,  222,  223,  223,  223,
			  225,  225,  225,  737,  200,  290,  290,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   17,   17,   17,   17,
			  736,   17,  302,  302,   17,   17,   17,  227,  227,  227,
			  229,  229,  229,  229,  229,  230,  230,  230,  231,  231,
			  231,  232,  232,  232,  233,  233,  233,  234,  234,  234,
			  234,  235,  235,  235,  235,  235,  236,  236,  236,  238, yy_Dummy>>,
			1, 200, 824)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  238,  238,  240,  240,  240,  242,  242,  242,  244,  244,
			  244,  221,  221,  221,  221,  221,  735,  222,  222,  222,
			  222,  222,  246,  246,  246,  249,  249,  249,  250,  250,
			  250,  251,  251,  251,  312,  312,   17,   17,   17,   17,
			   17,   17,   17,   17,   17,   18,   18,   18,   18,  731,
			   18,  325,  325,   18,   18,   18,  252,  252,  252,  253,
			  253,  253,  253,  262,  262,  262,  262,  262,  263,  263,
			  263,  265,  265,  265,  267,  267,  267,  270,  270,  270,
			  270,  270,  271,  271,  271,  272,  272,  272,  273,  273,
			  273,  274,  274,  274,  277,  277,  277,  277,  279,  279,

			  279,  279,  279,  280,  280,  280,  282,  282,  282,  284,
			  284,  284,  286,  286,  286,  286,  286,  287,  287,  287,
			  275,  275,  275,  275,  730,   18,   18,   18,   18,   18,
			   18,   18,   18,   18,   19,   19,   19,   19,  275,   19,
			  331,  331,   19,   19,   19,  289,  289,  289,  338,  338,
			  275,  275,  291,  291,  291,  292,  292,  292,  292,  292,
			  293,  293,  293,  294,  294,  294,  295,  295,  295,  296,
			  296,  296,  298,  298,  298,  298,  298,  299,  299,  299,
			  301,  301,  301,  303,  303,  303,  309,  309,  309,  311,
			  311,  311,  313,  313,  313,  314,  314,  314,  314,  314, yy_Dummy>>,
			1, 200, 1024)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  315,  315,  315,  316,  316,  316,  317,  317,  317,  318,
			  318,  318,  350,  350,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   20,   20,   20,   20,  721,   20,  356,
			  356,   20,   20,   20,  319,  319,  319,  319,  320,  320,
			  320,  320,  321,  321,  321,  321,  321,  322,  322,  322,
			  324,  324,  324,  326,  326,  326,  328,  328,  328,  330,
			  330,  330,  332,  332,  332,  335,  335,  335,  337,  337,
			  337,  339,  339,  339,  340,  340,  340,  340,  340,  341,
			  341,  341,  342,  342,  342,  343,  343,  343,  344,  344,
			  344,  345,  345,  345,  345,  347,  347,  347,  349,  349,

			  349,  378,  378,   20,   20,   20,   20,   20,   20,   20,
			   20,   20, yy_Dummy>>,
			1, 112, 1224)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   35,   35,   35,   35,  333,  333,  333,  333,  333,  333,
			  333,  333,  351,  351,  351,  352,  352,  352,  352,  352,
			  353,  353,  353,  355,  355,  355,  357,  357,  357,   35,
			  358,  362,  359,  364,  364,  364,  364,  364,  365,  365,
			  365,  366,  366,  366,  370,  360,  720,  358,  719,  361,
			  717,  358,  367,  367,  367,  371,  707,   35,  706,  358,
			  384,  384,  333,  705,  362,  362,  362,  362,  362,  358,
			  359,  359,  359,  359,  359,  368,  368,  368,  415,  415,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   36,
			   36,   36,   36,  360,  360,  360,  360,  360,  361,  361,

			  361,  361,  361,  369,  369,  369,  369,  704,  369,  375,
			  375,  375,  698,  369,  377,  377,  377,  694,   36,  379,
			  379,  379,  370,  370,  370,  370,  370,  386,  371,  371,
			  371,  371,  371,  693,  369,  374,  374,  374,  374,  374,
			  380,  380,  380,  380,  380,  594,   36,  381,  381,  381,
			  383,  383,  383,  385,  385,  385,  386,  386,  386,  386,
			  386,  387,  388,  388,  388,  388,  388,  396,  594,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			  397,  401,   64,  389,  389,  389,  689,  387,  387,  387, yy_Dummy>>,
			1, 200, 1514)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  387,  387,   64,   64,   64,   64,  390,  390,  390,  391,
			  391,  391,  392,  392,  392,  399,  688,  396,  396,  396,
			  396,  396,  397,  397,  397,  397,  397,  472,  472,   64,
			   64,   64,  398,  405,  405,  405,  406,  406,  406,  490,
			  490,  401,  401,  401,  401,  401,  687,  399,  399,  399,
			  399,  399,  684,   64,  400,  503,  503,   64,   64,   64,
			   64,   64,  201,  407,  407,  407,  398,  398,  398,  398,
			  398,  422,  201,  201,  683,  201,  201,  201,  201,  201,
			  201,  201,  201,  682,  201,  681,  400,  400,  400,  400,
			  400,  408,  408,  408,  409,  409,  409,  409,  409,  409,

			  409,  409,  670,  409,  412,  412,  412,  414,  414,  414,
			  416,  416,  416,  423,  423,  423,  424,  424,  424,  425,
			  425,  425,  426,  426,  426,  669,  422,  422,  422,  422,
			  422,  433,  433,  433,  434,  434,  434,  516,  516,  201,
			  201,  201,  201,  201,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  542,  542,  241,  436,
			  436,  436,  437,  437,  437,  439,  439,  439,  241,  241,
			  241,  241,  438,  438,  438,  438,  438,  440,  440,  440,
			  441,  441,  441,  442,  442,  442,  443,  443,  443,  444,
			  444,  444,  445,  445,  445,  241,  241,  241,  446,  446, yy_Dummy>>,
			1, 200, 1714)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  446,  447,  447,  447,  448,  448,  448,  455,  455,  455,
			  456,  456,  456,  457,  457,  457,  457,  457,  668,  241,
			  458,  458,  458,  241,  241,  241,  241,  241,  248,  248,
			  248,  248,  248,  248,  248,  248,  248,  248,  248,  248,
			  479,  662,  248,  459,  459,  459,  460,  460,  460,  461,
			  461,  461,  248,  248,  248,  248,  462,  462,  462,  463,
			  463,  463,  464,  464,  464,  465,  465,  465,  466,  466,
			  466,  467,  467,  467,  469,  469,  469,  547,  547,  248,
			  248,  248,  471,  471,  471,  473,  473,  473,  480,  480,
			  480,  481,  481,  481,  492,  479,  479,  479,  479,  479,

			  482,  482,  482,  248,  483,  483,  483,  248,  248,  248,
			  248,  248,  304,  484,  484,  484,  485,  485,  485,  487,
			  487,  487,  304,  304,  505,  304,  304,  304,  304,  304,
			  304,  304,  304,  647,  304,  489,  489,  489,  491,  491,
			  491,  493,  493,  493,  494,  494,  494,  805,  805,  492,
			  492,  492,  492,  492,  495,  495,  495,  496,  496,  496,
			  497,  497,  497,  497,  497,  497,  497,  497,  646,  497,
			  500,  500,  500,  502,  502,  502,  504,  504,  504,  505,
			  505,  505,  505,  505,  506,  506,  506,  518,  645,  304,
			  304,  304,  304,  304,  327,  327,  644,  327,  327,  327, yy_Dummy>>,
			1, 200, 1914)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  327,  327,  327,  327,  327,  614,  327,  507,  507,  507,
			  508,  508,  508,  509,  509,  509,  510,  510,  510,  511,
			  511,  511,  513,  513,  513,  515,  515,  515,  517,  517,
			  517,  519,  519,  519,  520,  520,  520,  521,  521,  521,
			  810,  810,  518,  518,  518,  518,  518,  522,  522,  522,
			  523,  523,  523,  524,  524,  524,  525,  525,  525,  531,
			  611,  327,  327,  327,  327,  327,  334,  526,  526,  526,
			  532,  534,  536,  536,  536,  533,  334,  334,  610,  334,
			  334,  334,  334,  334,  334,  334,  334,  601,  334,  537,
			  537,  537,  539,  539,  539,  600,  531,  531,  531,  531,

			  531,  599,  592,  534,  534,  534,  534,  534,  591,  586,
			  532,  532,  532,  532,  532,  533,  533,  533,  533,  533,
			  541,  541,  541,  543,  543,  543,  544,  544,  544,  546,
			  546,  546,  548,  548,  548,  550,  550,  550,  550,  550,
			  551,  551,  551,  334,  334,  334,  334,  334,  346,  346,
			  583,  346,  346,  346,  346,  346,  346,  346,  346,  560,
			  346,  552,  552,  552,  553,  553,  553,  554,  554,  554,
			  555,  555,  555,  556,  556,  556,  557,  557,  557,  558,
			  558,  558,  559,  559,  559,  559,  559,  561,  561,  561,
			  566,  560,  560,  560,  560,  560,  562,  562,  562,  567, yy_Dummy>>,
			1, 200, 2114)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  568,  571,  574,  574,  574,  582,  570,  575,  575,  575,
			  578,  578,  578,  577,  569,  346,  346,  346,  346,  346,
			  565,  564,  566,  566,  566,  566,  566,  579,  579,  579,
			  580,  580,  580,  571,  571,  571,  571,  571,  581,  581,
			  581,  567,  567,  567,  567,  567,  568,  568,  568,  568,
			  568,  569,  569,  569,  569,  569,  570,  570,  570,  570,
			  570,  588,  588,  588,  589,  589,  589,  595,  595,  595,
			  596,  596,  596,  597,  597,  597,  598,  598,  598,  602,
			  602,  602,  603,  603,  603,  604,  604,  604,  605,  605,
			  605,  606,  606,  606,  607,  607,  607,  608,  608,  608,

			  609,  609,  609,  616,  616,  616,  617,  617,  617,  618,
			  618,  618,  619,  619,  619,  620,  620,  620,  621,  621,
			  621,  623,  623,  623,  624,  624,  624,  625,  625,  625,
			  625,  625,  625,  625,  625,  652,  625,  626,  626,  626,
			  626,  626,  626,  626,  626,  627,  626,  657,  563,  627,
			  549,  545,  627,  628,  628,  628,  629,  629,  629,  630,
			  630,  630,  631,  631,  631,  633,  633,  633,  634,  634,
			  634,  635,  635,  635,  636,  636,  636,  637,  637,  637,
			  638,  638,  638,  640,  640,  640,  641,  641,  641,  642,
			  642,  642,  643,  643,  643,  648,  540,  650,  651,  653, yy_Dummy>>,
			1, 200, 2314)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  653,  653,  529,  649,  654,  654,  654,  655,  655,  655,
			  656,  656,  656,  652,  652,  652,  652,  652,  527,  514,
			  657,  657,  657,  657,  657,  658,  658,  658,  671,  648,
			  648,  648,  648,  648,  649,  649,  649,  649,  649,  650,
			  650,  650,  650,  650,  651,  651,  651,  651,  651,  659,
			  659,  659,  660,  660,  660,  661,  661,  661,  663,  663,
			  663,  664,  664,  664,  665,  665,  665,  666,  666,  666,
			  667,  673,  672,  678,  678,  678,  501,  675,  671,  671,
			  671,  671,  671,  674,  676,  679,  679,  679,  488,  685,
			  685,  685,  685,  690,  690,  690,  691,  691,  691,  667,

			  667,  667,  667,  667,  672,  672,  672,  672,  672,  675,
			  675,  675,  675,  675,  478,  709,  673,  673,  673,  673,
			  673,  685,  708,  477,  674,  674,  674,  674,  674,  686,
			  686,  686,  686,  710,  676,  676,  676,  676,  676,  695,
			  695,  695,  696,  696,  696,  700,  700,  700,  701,  701,
			  701,  702,  702,  702,  703,  703,  703,  711,  713,  713,
			  713,  686,  709,  709,  709,  709,  709,  723,  708,  708,
			  708,  708,  708,  714,  714,  714,  715,  715,  715,  726,
			  723,  710,  710,  710,  710,  710,  716,  716,  716,  718,
			  718,  718,  718,  718,  724,  725,  711,  711,  711,  711, yy_Dummy>>,
			1, 200, 2514)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  711,  722,  722,  722,  722,  722,  746,  476,  475,  723,
			  723,  723,  723,  723,  727,  727,  727,  727,  727,  474,
			  753,  726,  726,  726,  726,  726,  470,  724,  724,  724,
			  724,  724,  732,  732,  732,  732,  734,  734,  734,  734,
			  452,  725,  725,  725,  725,  725,  745,  745,  745,  745,
			  745,  756,  746,  746,  746,  746,  746,  747,  747,  747,
			  747,  757,  748,  748,  748,  748,  753,  753,  753,  753,
			  753,  754,  754,  754,  754,  754,  755,  755,  755,  755,
			  755,  768,  768,  768,  768,  768,  787,  774,  451,  756,
			  756,  756,  756,  756,  775,  776,  788,  450,  757,  757,

			  757,  757,  757,  769,  769,  769,  769,  429,  769,  770,
			  770,  770,  770,  769,  770,  802,  802,  802,  815,  770,
			  774,  774,  774,  774,  774,  428,  427,  775,  775,  775,
			  775,  775,  421,  776,  776,  776,  776,  776,  820,  420,
			  747,  747,  747,  747,  747,  748,  748,  748,  748,  748,
			  791,  791,  791,  791,  791,  792,  792,  792,  792,  792,
			  804,  804,  804,  419,  787,  787,  787,  787,  787,  788,
			  788,  788,  788,  788,  793,  793,  793,  793,  793,  806,
			  806,  806,  807,  807,  807,  809,  809,  809,  811,  811,
			  811,  816,  816,  816,  418,  417,  815,  815,  815,  815, yy_Dummy>>,
			1, 200, 2714)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  815,  817,  817,  817,  818,  818,  818,  819,  819,  819,
			  413,  820,  820,  820,  820,  820,  821,  821,  821,  822,
			  822,  822,  823,  823,  823,  824,  824,  824,  826,  826,
			  826,  827,  827,  827,  828,  828,  828,  829,  829,  829,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,

			  833,  833,  833,  833,  833,  833,  833,  833,  833,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837, yy_Dummy>>,
			1, 200, 2914)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  837,  838,  838,  838,  838,  403,  838,  838,  838,  838,
			  838,  838,  402,  838,  838,  838,  838,  839,  838,  838,
			  395,  394,  393,  382,  839,  376,  373,  363,  354,  839,
			  839,  348,  839,  839,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  336,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  329,
			  841,  841,  841,  841,  841,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  323,  842,
			  842,  842,  842,  842,  843,  310,  843,  308,  307,  306,

			  300,  288,  843,  843,  844,  281,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  276,  844,  844,  845,  845,  845,  269,
			  264,  846,  846,  846,  845,  845,  261,  845,  845,  846,
			  846,  260,  846,  846,  847,  259,  847,  847,  257,  255,
			  847,  847,  847,  847,  847,  243,  847,  847,  847,  847,
			  847,  847,  847,  848,  237,  228,  224,  214,  207,  205,
			  848,  204,  203,  196,  188,  848,  848,  186,  848,  848,
			  849,  185,  849,  167,  154,  146,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  850, yy_Dummy>>,
			1, 200, 3114)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  144,  130,  851,  117,  850,  850,  110,  850,  850,  851,
			  104,   98,   89,   87,  851,  851,  852,  851,  851,   86,
			   83,  852,  852,   82,  852,  852,  853,  853,  853,  853,
			   81,   80,   79,   78,  853,  853,   76,  853,  853,  854,
			  854,  854,  854,   67,   65,   57,   55,  854,  854,   47,
			  854,  854,  855,  855,  855,  855,   45,   41,   37,    0,
			  855,  855,    0,  855,  855,  856,  856,  856,  856,    0,
			  856,  856,  856,  856,  856,  856,    0,  856,  856,  856,
			  856,    0,  856,  856,  857,  857,  857,  857,  857,  857,
			  857,    0,  857,  857,  857,  857,  857,  857,  857,  857,

			  857,  857,  857,  857,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  858,  858,    0,  858,  858,
			  858,  858,  858,  859,    0,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			  859,  859,    0,  859,  859,  860,  860,  860,    0,    0,
			    0,    0,    0,  860,  860,    0,  860,  860,  861,    0,
			  861,  861,    0,    0,  861,  861,  861,  861,  861,    0,
			  861,  861,  861,  861,  861,  861,  861,  862,    0,  862,
			    0,    0,    0,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  863,  863,  863,  863, yy_Dummy>>,
			1, 200, 3314)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,  863,  863,    0,  863,  863,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  866,  866,  866,  866,    0,    0,    0,
			    0,  866,  866,    0,  866,  866,  868,  868,  868,  868,
			  868,    0,    0,    0,  868,  868,    0,  868,  868,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,    0,  869,  869,  869,  869,  869,  870,  870,

			  870,    0,    0,    0,    0,    0,  870,  870,    0,  870,
			  870,  871,  871,  871,  871,  871,    0,    0,    0,  871,
			  871,    0,  871,  871,  872,  872,  872,  872,  872,    0,
			    0,    0,  872,  872,    0,  872,  872,  873,  873,  873,
			  873,  873,    0,    0,    0,  873,  873,    0,  873,  873,
			  874,  874,  874,  874,  874,    0,    0,    0,  874,  874,
			    0,  874,  874,  875,  875,  875,  875,    0,    0,    0,
			    0,  875,  875,    0,  875,  875,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  877,  877, yy_Dummy>>,
			1, 200, 3514)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  878,  878,  878,  878,  878,  878,    0,  878,  878,  878,
			  878,  878,  878,    0,    0,  878,  878,  878,    0,  878,
			  879,  879,  879,    0,  879,  879,    0,  879,  879,  879,
			  879,  879,  879,    0,    0,  879,  879,  879,    0,  879,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,

			  881,  881,  881,  881,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883, yy_Dummy>>,
			1, 148, 3714)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 883)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			yy_base_template_4 (an_array)
			yy_base_template_5 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   89,  178,  267,  356,    0,  445,    0,   19,
			   39,  534,    0,  623,  712,  801,  890,  979, 1068, 1157,
			 1246, 1335,    0,    4,   11,    7,    8, 1424,    0,   33,
			  103,  106,  154,   18,   38, 1513, 1602, 3372, 3862,   19,
			 3862, 3369,   45,  137,   13, 3312,   72, 3280,   75,   52,
			   85,   50,  184,  188,  204, 3343,  132, 3276,  135,   60,
			  145,  228,  232,  153, 1687, 3326,  161, 3274,  164,   68,
			  167,  250,  254, 3862, 3862,    0, 3332, 3862, 3315, 3277,
			 3275, 3269, 3273, 3270,  193, 3862, 3331, 3269,  204, 3243,
			  212,  111,  215,  298,  302, 3862, 3862,  223, 3293, 3862,

			  311, 3862,  238,  237, 3241,  254,  116,  257, 3862, 3862,
			 3318,  257, 3862,  659, 3862, 3862,  549, 3234,  554,  137,
			  557, 3862, 3862,  640,  644,  648,  570,  575,  664,  586,
			 3232,  591,  200,  594,  677,  681,  602,  607,   23, 3862,
			  681,  612,  648, 3862, 3256,  647, 3216,  656,  245,  672,
			  774,  812, 3862, 3862, 3250, 3862, 3862, 3862, 3862, 3862,
			  672,  686, 3862,  740,  763, 3862,  680, 3214,  700,  249,
			  706, 3862,   20, 3862,  753,  771,  782,  787, 3862, 3862,
			 3862,  792, 3862, 3862, 3862, 3290, 3233,  739, 3205,  771,
			  264,  779,   25, 3862,  818,  782, 3204,  816,  619,  826, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  890, 1769,   27, 3211, 3210, 3207,  840, 3199,  843,  658,
			  846,  901, 3862,   62, 3249,  846,  854,  858,  861,  864,
			  947,  951,  957,  880, 3197,  883,  709,  910, 3247,  910,
			  918,  921,  924,  927, 1010,  931,  939, 3195,  942,  727,
			  945, 1853,  948, 3186,  951,  753,  965, 3862, 1937,  968,
			  971,  974,  999, 1082,    0, 3243, 3862, 3200,    0, 3199,
			 3182, 3176, 1003, 1011, 3161, 1014,  760, 1017, 3862, 3211,
			 1017, 1025, 1028, 1031, 1034, 1143, 3205, 1117, 3862, 1038,
			 1046, 3136, 1049,  763, 1052, 3862, 1052, 1060, 3132, 1088,
			  887, 1095, 1095, 1103, 1106, 1109, 1112, 3862, 1112, 1120,

			 3131, 1123,  904, 1126, 2019,  140, 3138, 3137, 3135, 1129,
			 3126, 1132,  976, 1135, 1135, 1143, 1146, 1149, 1152, 1257,
			 1261, 1182, 1190, 3119, 1193,  993, 1196, 2091, 1199, 3100,
			 1202, 1082, 1205, 1498, 2173, 1208, 3074, 1211, 1090, 1214,
			 1214, 1222, 1225, 1228, 1231, 1314, 2245, 1238, 3062, 1241,
			 1154, 1445, 1445, 1453, 3059, 1456, 1171, 1459, 1527, 1500,
			 1523, 1528, 1494, 3109, 1463, 1471, 1474, 1485, 1508, 1616,
			 1552, 1558, 3862, 3104, 1565, 1542, 3056, 1547, 1243, 1552,
			 1570, 1580, 3054, 1583, 1492, 1586, 1586, 1627, 1592, 1626,
			 1639, 1642, 1645, 3094, 3090, 3096, 1647, 1652, 1696, 1677, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1716, 1671, 3070, 3087, 3862, 1666, 1669, 1696, 1724, 1788,
			    0, 3862, 1737, 2841, 1740, 1510, 1743, 2838, 2838, 2848,
			 2824, 2776, 1756, 1746, 1749, 1752, 1755, 2823, 2792, 2785,
			   10,   93, 3862, 1764, 1767, 3862, 1792, 1795, 1802, 1798,
			 1810, 1813, 1816, 1819, 1822, 1825, 1831, 1834, 1837, 3862,
			 2741, 2733, 2680,    0, 3862, 1840, 1843, 1843, 1853, 1876,
			 1879, 1882, 1889, 1892, 1895, 1898, 1901, 1904, 3862, 1907,
			 2657, 1915, 1659, 1918, 2662, 2652, 2692, 2608, 2558, 1925,
			 1921, 1924, 1933, 1937, 1946, 1949, 3862, 1952, 2519, 1968,
			 1671, 1971, 1979, 1974, 1977, 1987, 1990, 2054,    2, 3862,

			 2003, 2507, 2006, 1687, 2009, 2009, 2017, 2040, 2043, 2046,
			 2049, 2052, 3862, 2055, 2450, 2058, 1769, 2061, 2072, 2064,
			 2067, 2070, 2080, 2083, 2086, 2089, 2100, 2480,   67, 2469,
			 3862, 2126, 2140, 2145, 2133, 3862, 2105, 2122, 3862, 2125,
			 2427, 2153, 1788, 2156, 2159, 2382, 2162, 1909, 2165, 2427,
			 2165, 2173, 2194, 2197, 2200, 2203, 2206, 2209, 2212, 2212,
			 2221, 2220, 2229, 2408, 2287, 2285, 2252, 2271, 2276, 2281,
			 2286, 2263, 3862, 3862, 2235, 2240, 3862, 2298, 2243, 2260,
			 2263, 2271, 2290, 2190, 3862, 3862, 2148, 3862, 2294, 2297,
			 3862, 2186, 2179,  102, 1615, 2300, 2303, 2306, 2309, 2152, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2146, 2135, 2312, 2315, 2318, 2321, 2324, 2327, 2330, 2333,
			 2163, 2100, 3862, 3862, 2044, 3862, 2336, 2339, 2342, 2345,
			 2348, 2351, 3862, 2354, 2357, 2421, 2431, 2437, 2386, 2389,
			 2392, 2395, 3862, 2398, 2401, 2404, 2407, 2410, 2413, 3862,
			 2416, 2419, 2422, 2425, 2058, 2064, 2030, 1995, 2459, 2464,
			 2469, 2474, 2443, 2432, 2437, 2440, 2443, 2450, 2458, 2482,
			 2485, 2488, 1921, 2491, 2494, 2497, 2500, 2529, 1894, 1795,
			 1763, 2508, 2534, 2546, 2554, 2539, 2564, 3862, 2506, 2518,
			 3862, 1770, 1768, 1736, 1732, 2602, 2642, 1694, 1670, 1640,
			 2526, 2529, 3862, 1618, 1602, 2572, 2575, 3862, 1597,    2,

			 2578, 2581, 2584, 2587, 1577, 1532, 1530, 1536, 2598, 2592,
			 2611, 2626, 3862, 2591, 2606, 2609, 2619, 1512, 2619, 1525,
			 1518, 1209, 2631, 2639, 2657, 2671, 2651, 2644, 3862, 3862,
			 1093, 1021, 2745,    1, 2749,  971,  917,  898, 3862, 3862,
			 3862,  914,  881,  843,  829, 2676, 2682, 2770, 2775,    1,
			 3862,  795,  780, 2696, 2701, 2706, 2719, 2728,  736,    0,
			 3862,  714,  694,    0,  674,  674,  662,  628, 2711, 2816,
			 2822, 3862,  627,  590, 2750, 2757, 2763,  278,  147,    0,
			  132,  131,   21, 3862,   14,    3,    0, 2794, 2799, 3862,
			    8, 2780, 2785, 2804, 3862, 3862,    8, 3862, 3862,   11, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3862, 3862, 2748,   76, 2793, 1979, 2812, 2815,   35, 2818,
			 2072, 2821, 3862,    0, 3862, 2826, 2824, 2834, 2837, 2840,
			 2841, 2849, 2852, 2855, 2858, 3862, 2861, 2864, 2867, 2870,
			 3862, 2953, 2976, 2999, 3022, 3045, 3068, 3091, 3111, 3125,
			 3147, 3166, 3185, 3198, 3217, 3230, 3235, 3254, 3271, 3290,
			 3300, 3310, 3317, 3330, 3343, 3356, 3375, 3395, 3414, 3436,
			 3449, 3468, 3487, 3500, 3522, 3544, 3557,    7, 3570, 3589,
			 3602, 3615, 3628, 3641, 3654, 3667, 3689, 3711, 3732, 3752,
			 3773, 3795, 3817, 3839, yy_Dummy>>,
			1, 84, 800)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 883)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			yy_def_template_5 (an_array)
			an_array.area.fill_with (830, 831, 883)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  831,  831,  832,  832,  830,    5,  830,    7,  833,
			  833,  830,   11,  834,  834,  834,  834,  835,  835,  835,
			  835,  830,   21,  836,  836,   21,   21,  830,   27,   27,
			   27,   21,   21,   21,   21,  837,  837,  830,  830,  830,
			  830,  830,  838,  839,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  840,  840,  830,  830,  830,  830,  830,
			  830,  830,  830,  841,  842,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  843,  843,  830,  830,  843,
			  843,  843,  843,  843,  844,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  845,  830,  830,

			  830,  830,  846,  830,  830,  830,  830,  830,  830,  830,
			  830,  847,  830,  848,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  849,  850,  851,  830,
			  830,  830,  830,  830,  830,  830,  852,  853,  830,  830,
			  853,  853,  853,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  854,  855,  830,  855,  855,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  855,  855,  855,  855,  830,  830,
			  830,  853,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  838,  830,  830,  830,  830,  830, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  830,  839,  201,  201,  201,  201,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  856,  830,  830,  830,  830,
			  830,  840,  840,  830,  830,  830,  830,  830,  830,  857,
			  830,  830,  830,  830,  830,  841,  830,  830,  830,  830,
			  830,  842,  830,  830,  830,  830,  830,  830,  858,  830,
			  830,  830,  830,  830,  843,  830,  830,  843,  843,  843,
			  843,  843,  844,  830,  830,  830,  830,  830,  830,  830,
			  859,  830,  830,  830,  830,  830,  830,  830,  830,  845,
			  830,  830,  830,  830,  830,  830,  846,  830,  830,  830,
			  830,  830,  860,  830,  830,  830,  830,  830,  847,  830,

			  830,  830,  830,  830,  848,  304,  304,  304,  304,  830,
			  830,  830,  830,  830,  861,  830,  830,  830,  830,  830,
			  830,  849,  830,  830,  830,  830,  830,  850,  830,  830,
			  830,  830,  830,  830,  851,  830,  830,  830,  830,  830,
			  862,  830,  830,  830,  830,  830,  852,  830,  830,  830,
			  830,  830,  853,  830,  830,  830,  830,  830,  830,  853,
			  853,  853,  853,  830,  863,  830,  830,  830,  830,  830,
			  864,  865,  830,  830,  854,  830,  830,  830,  830,  830,
			  855,  830,  830,  830,  830,  830,  855,  855,  866,  830,
			  830,  830,  830,  830,  830,  830,  855,  855,  855,  855, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  855,  853,  830,  830,  830,  830,  830,  830,  830,  830,
			  867,  830,  830,  830,  830,  830,  830,  201,  201,  201,
			  201,  201,  868,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  869,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  843,  843,  843,  843,  830,  830,  830,  870,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  304,  304,  304,  304,  304,  871,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  872,  830,  830,  830,  830,  830,  867,  830,

			  830,  830,  830,  830,  830,  873,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  874,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  853,  853,  853,  853,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  875,  830,  830,  830,  830,  830,  830,  830,  830,  855,
			  855,  830,  830,  830,  830,  830,  855,  855,  855,  855,
			  855,  853,  830,  830,  830,  830,  830,  867,  830,  830,
			  830,  830,  201,  201,  830,  830,  201,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  843, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  843,  843,  830,  830,  830,  830,  830,  830,  830,  830,
			  304,  304,  830,  830,  304,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  867,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  853,  853,
			  853,  853,  876,  830,  830,  830,  830,  877,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  855,  830,  830,
			  830,  855,  855,  855,  855,  855,  853,  830,  830,  830,
			  830,  201,  201,  830,  830,  830,  830,  843,  843,  843,
			  830,  830,  830,  304,  304,  830,  830,  830,  867,  867,

			  830,  830,  830,  830,  830,  830,  830,  830,  853,  853,
			  853,  853,  830,  830,  830,  830,  830,  830,  855,  830,
			  830,  830,  855,  855,  855,  855,  855,  853,  830,  830,
			  830,  830,  830,  830,  830,  843,  843,  843,  830,  830,
			  830,  830,  830,  830,  830,  853,  853,  853,  853,  830,
			  830,  830,  830,  855,  855,  855,  855,  855,  830,  830,
			  830,  843,  843,  843,  830,  830,  830,  830,  853,  830,
			  830,  830,  830,  830,  855,  855,  855,  830,  830,  843,
			  843,  830,  830,  830,  830,  878,  879,  880,  881,  830,
			  830,  855,  855,  855,  830,  830,  843,  830,  830,  830, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  843,  830,  882,  830,  830,  830,  830,
			  883,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			    0, yy_Dummy>>,
			1, 31, 800)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (83, 160, 191)
			an_array.area.fill_with (89, 192, 193)
			an_array.area.fill_with (84, 194, 223)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   89,   89,   89,   89,   89,   89,   89,   89,    1,
			    2,   89,   89,    3,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,    4,    5,    6,    7,    8,    9,   10,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,   21,
			   22,   23,   24,   25,   25,   26,   25,   27,   28,   29,
			   30,   31,   32,   33,    8,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   41,   43,   44,   45,   46,   47,
			   48,   49,   50,   51,   52,   53,   41,   41,   54,   55,
			   41,   56,   57,   58,   57,   59,   57,   60,   61,   62,

			   63,   64,   61,   65,   41,   66,   41,   41,   67,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   41,
			   78,   79,   41,   57,   80,   57,   57,   57,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82, yy_Dummy>>,
			1, 160, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   85,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   87,   88,   88,   88,
			   88,   88,   88,   88,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    2,    3,    4,    5,    6,    4,    7,
			    8,    9,    4,    4,    4,    4,    4,   10,   11,    4,
			   12,   12,   12,   12,   12,   12,   12,   12,   13,   14,
			   15,    4,   16,   17,   18,   18,   18,   18,   18,   18,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   16,   16,   20,   21,
			   18,   18,   18,   18,   18,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   16,   23,   23,   23,   22,   22,   22,   22,   22,   23, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 830)
			an_array.area.fill_with (0, 0, 36)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			yy_accept_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  150,  148,  144,  143,  142,  145,  131,  100,  147,  148,
			  148,  148,  148,  148,    4,    4,    4,    5,    7,  148,
			  148,  148,  148,  148,   26,   26,   27,   24,   29,  148,
			  148,  148,  148,  148,   22,   22,   21,   20,   18,   18,
			   19,  148,   18,   18,   18,   18,   18,   33,   32,   32,
			   35,  148,  148,  148,  148,  148,  108,  108,  111,  110,
			  106,  148,  103,  109,  102,  104,  148,  148,  148,  148,
			  148,  126,  126,  126,  127,  137,  131,  136,  124,  148,
			  148,  148,  148,  148,  138,  139,  133,  132,  132,  134,
			   98,  131,  148,  148,  148,  148,  148,   73,   73,   95,

			   71,  148,   70,   71,   71,   71,   52,   53,  148,  148,
			  148,  148,  148,  148,   80,   79,   51,  148,   83,   84,
			   86,   87,   82,   88,   71,   85,   71,   71,   81,  148,
			  148,  148,  148,  148,   50,  148,   49,   71,   71,   71,
			   71,   92,   90,   91,   71,   65,   65,   64,   64,   64,
			  148,  148,  148,  148,  148,  144,  141,  145,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   99,   10,    0,  146,    0,
			    0,    0,    0,    4,    4,    5,    0,    0,    0,    0,
			    0,    3,    6,    0,    0,    0,    0,   26,   27,    0, yy_Dummy>>,
			1, 200, 37)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,   24,    0,    0,    0,    0,    0,
			   23,   25,    0,    0,    0,    0,   22,   18,    0,   11,
			   18,   16,   18,   18,   18,   33,    0,    0,    0,    0,
			    0,   32,    0,   34,    0,    0,    0,    0,  108,    0,
			  109,  102,  106,    0,    0,    0,    0,    0,  101,  104,
			    0,    0,    0,    0,    0,  105,    0,    0,    0,    0,
			  125,  127,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  128,    0,    0,
			    0,    0,  133,  132,  134,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,  135,    0,    0,    0,    0,   73,    0,
			    0,    0,    0,    0,    0,   71,    0,    0,    0,    0,
			    0,    0,   71,   71,   71,   71,    0,   72,    0,    0,
			    0,    0,    0,    0,    0,   79,    0,   88,    0,    0,
			    0,    0,    0,   71,    0,    0,    0,    0,    0,   71,
			   71,   72,    0,    0,    0,    0,    0,    0,    0,   71,
			   71,   41,   71,   71,   71,    0,    0,   64,    0,    0,
			    0,    0,    0,    0,  117,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  140,    0,    0,    2,    0, yy_Dummy>>,
			1, 200, 237)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,   28,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   13,   18,   18,   18,   15,   31,    0,    0,
			  107,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  122,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   96,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  119,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   93,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   60,   71,   71,   71,   71,   61,    0,

			    0,   77,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   89,    0,    0,    0,    0,    0,    0,
			    0,    0,   68,   71,    0,    0,    0,    0,    0,   71,
			   71,   71,   71,   71,   71,   62,   63,    0,    0,  129,
			    0,    0,    0,    0,    0,    0,    0,  115,  114,    0,
			  118,    0,    0,    1,    0,    0,    0,    0,    0,    0,
			    0,    0,   18,   18,   18,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  115,  114,    0,  123,    0,
			    0,    0,    0,    0,    0,   97,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  120,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 437)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   94,    0,    0,    0,    0,    0,    0,    0,
			    0,   71,   71,   71,   71,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   71,    0,    0,    0,   71,   71,   71,   71,   71,   71,
			  130,    0,    0,  116,    0,    0,    0,    0,    0,    0,
			   18,   18,   18,    0,    0,  116,    0,    0,    0,    0,
			  121,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   71,   71,   71,   71,   78,    0,    0,    0,    0,
			    0,   67,    0,    0,    0,   40,   71,   42,   71,   71,
			   69,  112,  113,    0,    0,    9,    0,    8,   18,   18,

			   18,  112,  113,  121,    0,    0,    0,    0,   58,   71,
			   71,   71,    0,   39,    0,    0,   71,   44,   43,   71,
			   71,    0,    0,    9,   18,   18,   12,    0,    0,    0,
			    0,   59,    0,    0,   66,    0,    0,   71,   46,   71,
			    0,    0,   17,   18,    0,    0,   56,    0,    0,    0,
			    0,    0,   38,    0,   45,   47,   48,   36,   30,   18,
			   55,   54,    0,   76,   74,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   37,   14,   57,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   75,    0,
			    0,    0,    0,    0, yy_Dummy>>,
			1, 194, 637)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 3862
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 830
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 831
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 89
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 149
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 150
			-- End of buffer rule code

	yyLine_used: BOOLEAN = true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = true
			-- Is `position' used?

	INITIAL: INTEGER = 0
	comment_state: INTEGER = 1
	processinginstruction: INTEGER = 2
	xmldeclaration: INTEGER = 3
	cdata: INTEGER = 4
	tag: INTEGER = 5
	attribute_value_single: INTEGER = 6
	attribute_value_double: INTEGER = 7
	entity_value_single: INTEGER = 8
	entity_value_double: INTEGER = 9
	doctype: INTEGER = 10
	public_system: INTEGER = 11
	dtd_in: INTEGER = 12
	dtd_element: INTEGER = 13
	dtd_attlist: INTEGER = 14
	dtd_entity: INTEGER = 15
	dtd_notation: INTEGER = 16
	dtd_ignore: INTEGER = 17
			-- Start condition codes

feature -- User-defined features



end

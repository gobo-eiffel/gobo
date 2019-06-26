note

	description: 

		"Scanners for an XML parser"

	implements: "XML 1.0 Second Edition - W3C Recommendation 6 October 2000 (referred as 'XML1.0')"
	noncompliance_unicode: "UTF8 is assumed and all chars >255 are assumed to be LETTERS"

	library: "Gobo Eiffel XML library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

	-- TODO:
	-- system literal accepts non-CHAR
	-- use NOAPOSCHAR/NOQUOTCHAR for attribute value?

class XM_EIFFEL_SCANNER

inherit

	XM_EIFFEL_SCANNER_SKELETON
		redefine
			read_token
		end

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
--|#line 128 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 128")
end
 
			set_last_token (COMMENT_START)
			push_start_condition (comment_state)
		
when 2 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 136 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 136")
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
--|#line 145 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 145")
end
 
			set_last_token (COMMENT_DASHDASH) -- conformance error XML1.0:2.5
			last_value := text
		
when 4 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 150 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 150")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 5 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 155 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 155")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 6 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 160 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 160")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 7 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 165 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 165")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 8 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 176 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 176")
end

			set_last_token (XMLDECLARATION_START)
			push_start_condition (xmldeclaration)
		
when 9 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 181 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 181")
end

				-- "<?xml" matched by previous rule when allowed.
			set_last_token (PI_RESERVED)
		
when 10 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 185 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 185")
end

				-- <?xml caught by previous rules.
			set_last_token (PI_START)
			push_start_condition (processinginstruction)
		
when 11 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 194 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 194")
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
--|#line 204 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 204")
end

			set_last_token (XMLDECLARATION_VERSION)
		
when 13 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 208 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 208")
end

			set_last_token (XMLDECLARATION_VERSION_10)
			last_value := text
		
when 14 then
	yy_column := yy_column + 10
	yy_position := yy_position + 10
--|#line 214 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 214")
end

			set_last_token (XMLDECLARATION_STANDALONE) 
		
when 15 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 218 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 218")
end

			set_last_token (XMLDECLARATION_STANDALONE_YES)
			last_value := text
		
when 16 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 223 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 223")
end

			set_last_token (XMLDECLARATION_STANDALONE_NO)
			last_value := text
		
when 17 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 229 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 229")
end

			set_last_token (XMLDECLARATION_ENCODING)
		
when 18 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 233 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 233")
end

			-- 'yes' 'no' '1.0' caught by previous rules
			set_last_token (XMLDECLARATION_ENCODING_VALUE)
			last_value := text
		
when 19 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 239 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 239")
end

			set_last_token (EQ)
		
when 20 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 243 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 243")
end

			set_last_token (APOS)
		
when 21 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 247 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 247")
end

			set_last_token (QUOT)
		
when 22 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 251 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 251")
end
 
			set_last_token (SPACE) 
		
when 23 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 258 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 258")
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
--|#line 266 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 266")
end

			set_last_token (PI_TARGET)
			last_value := text
		
when 25 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 271 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 271")
end

			set_last_token (PI_TARGET_UTF8)
			last_value := text
		
when 26 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 276 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 276")
end

			set_last_token (SPACE)
			last_value := text
		
when 27 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 280 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 280")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 28 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 284 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 284")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 29 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 289 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 289")
end
 
			set_last_token (CHARDATA) 
			last_value := text
		
when 30 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 297 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 297")
end

	set_last_token (CDATA_START)
	push_start_condition (cdata)

when 31 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 304 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 304")
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
--|#line 312 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 312")
end

				-- End of line handling XML1.0:2.11.
			set_last_token (CHARDATA)
			last_value := normalized_newline
		
when 33 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 318 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 318")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 34 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 322 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 322")
end

				-- Big chunks in `last_value'.
			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 35 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 328 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 328")
end
 
			set_last_token (CHARDATA) 
			last_value := text
		
when 36 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 334 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 334")
end

		set_last_token (DOCTYPE_START)
		push_start_condition (dtd_in)
	
when 37 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 341 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 341")
end
 set_last_token (DOCTYPE_REQUIRED) 
when 38 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 342 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 342")
end
 set_last_token (DOCTYPE_IMPLIED) 
when 39 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 343 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 343")
end
 set_last_token (DOCTYPE_FIXED) 
when 40 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 344 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 344")
end

			set_last_token (DOCTYPE_ATT_CDATA) 
			last_value := text
		
when 41 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 348 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 348")
end

			set_last_token (DOCTYPE_ATT_ID) 
			last_value := text
		
when 42 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 352 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 352")
end

			set_last_token (DOCTYPE_ATT_IDREF)
			last_value := text
		
when 43 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 356 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 356")
end

			set_last_token (DOCTYPE_ATT_IDREFS)
			last_value := text
		
when 44 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 360 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 360")
end

			set_last_token (DOCTYPE_ATT_ENTITY)
			last_value := text
		
when 45 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 364 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 364")
end

			set_last_token (DOCTYPE_ATT_ENTITIES) 
			last_value := text
		
when 46 then
	yy_column := yy_column + 7
	yy_position := yy_position + 7
--|#line 368 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 368")
end

			set_last_token (DOCTYPE_ATT_NMTOKEN) 
			last_value := text
		
when 47 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 372 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 372")
end

			set_last_token (DOCTYPE_ATT_NMTOKENS)
			last_value := text
		
when 48 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 376 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 376")
end

			set_last_token (DOCTYPE_ATT_NOTATION)
			last_value := text
		
when 49 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 380 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 380")
end

			set_last_token (VALUE_START)
			push_start_condition (attribute_value_single)
		
when 50 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 384 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 384")
end

			set_last_token (VALUE_START)
			push_start_condition (attribute_value_double)
		
when 51 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 392 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 392")
end

			set_last_token (DOCTYPE_DECLARATION_START)
			push_start_condition (doctype)
		
when 52 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 402 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 402")
end

			set_last_token (DOCTYPE_DECLARATION_START)
			push_start_condition (doctype) -- Same, but balances end.
		
when 53 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 407 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 407")
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
--|#line 416 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 416")
end

			set_last_token (DOCTYPE_ELEMENT)
			push_start_condition (dtd_element)
		
when 55 then
	yy_column := yy_column + 9
	yy_position := yy_position + 9
--|#line 420 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 420")
end

			set_last_token (DOCTYPE_ATTLIST)
			push_start_condition (dtd_attlist)
		
when 56 then
	yy_column := yy_column + 8
	yy_position := yy_position + 8
--|#line 424 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 424")
end

			set_last_token (DOCTYPE_ENTITY)
			push_start_condition (dtd_entity)
		
when 57 then
	yy_column := yy_column + 10
	yy_position := yy_position + 10
--|#line 428 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 428")
end

			set_last_token (DOCTYPE_NOTATION)
			push_start_condition (dtd_notation)
		
when 58 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 433 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 433")
end

			set_last_token (DOCTYPE_IGNORE)
			last_value := text
		
when 59 then
	yy_column := yy_column + 7
	yy_position := yy_position + 7
--|#line 438 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 438")
end

			set_last_token (DOCTYPE_INCLUDE)
			last_value := text
		
when 60 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 443 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 443")
end

			set_last_token (DOCTYPE_CONDITIONAL_START)
		
when 61 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 447 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 447")
end

			set_last_token (DOCTYPE_CONDITIONAL_END)
		
when 62 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 454 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 454")
end

			set_last_token (DOCTYPE_CONDITIONAL_START)
			push_start_condition (dtd_ignore) -- Self, for exit.
		
when 63 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 459 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 459")
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
--|#line 468 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 468")
end

			set_last_token (CHARDATA)
		
when 65 then
yy_set_line_column
	yy_position := yy_position + 1
--|#line 472 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 472")
end

			set_last_token (CHARDATA) 
		
when 66 then
	yy_column := yy_column + 7
	yy_position := yy_position + 7
--|#line 479 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 479")
end
 set_last_token (DOCTYPE_PCDATA) 
when 67 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 481 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 481")
end

			set_last_token (DOCTYPE_ELEMENT_EMPTY)
			last_value := text
		
when 68 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 486 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 486")
end

			set_last_token (DOCTYPE_ELEMENT_ANY)
			last_value := text
		
when 69 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 494 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 494")
end

			set_last_token (DOCTYPE_NDATA)
			last_value := text
		
when 70 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 502 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 502")
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
--|#line 511 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 511")
end
 
			set_last_token (NAME) 
			last_value := text
		
when 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 515 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 515")
end
 
			set_last_token (NAME_UTF8) 
			last_value := text
		
when 73 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 519 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 519")
end

			set_last_token (SPACE)
		
when 74 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 536 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 536")
end

			set_last_token (DOCTYPE_SYSTEM)
			last_value := system_literal_text
		
when 75 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 541 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 541")
end

			set_last_token (DOCTYPE_SYSTEM_UTF8)
			last_value := system_literal_text
		
when 76 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 546 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 546")
end

			set_last_token (DOCTYPE_PUBLIC)
			last_value := system_literal_text
			push_start_condition (public_system)
		
when 77 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 555 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 555")
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
--|#line 565 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 565")
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
--|#line 579 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 579")
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
--|#line 593 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 593")
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
--|#line 607 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 607")
end
 set_last_token (DOCTYPE_GROUP_OR) 
when 82 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 608 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 608")
end
 set_last_token (DOCTYPE_GROUP_SEQ) 
when 83 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 609 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 609")
end
 set_last_token (DOCTYPE_GROUP_START) 
when 84 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 610 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 610")
end
 set_last_token (DOCTYPE_GROUP_END) 
when 85 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 611 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 611")
end
 set_last_token (DOCTYPE_GROUP_ZEROONE) 
when 86 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 612 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 612")
end
 set_last_token (DOCTYPE_GROUP_ANY) 
when 87 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 613 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 613")
end
 set_last_token (DOCTYPE_GROUP_ONEMORE) 
when 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 615 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 615")
end

			set_last_token (NMTOKEN) 
			last_value := text
		
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 619 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 619")
end

			set_last_token (NMTOKEN_UTF8) 
			last_value := text
		
when 90 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 627 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 627")
end
 
			set_last_token (DOCTYPE_PERCENT) 
		
when 91 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 630 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 630")
end

			set_last_token (VALUE_START)
			push_start_condition (entity_value_single)
		
when 92 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 634 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 634")
end

			set_last_token (VALUE_START)
			push_start_condition (entity_value_double)
		
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 642 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 642")
end

			set_last_token (DOCTYPE_PEREFERENCE)
			last_value := text_substring (2, text_count - 1)
		
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 647 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 647")
end

			set_last_token (DOCTYPE_PEREFERENCE_UTF8)
			last_value := text_substring (2, text_count - 1)
		
when 95 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 651 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 651")
end

			set_last_token (ENTITY_INVALID)
		
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 658 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 658")
end

			set_last_token (ENTITYVALUE_PEREFERENCE)
			last_value := text_substring (2, text_count - 1)
		
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 662 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 662")
end

			set_last_token (ENTITYVALUE_PEREFERENCE_UTF8)
			last_value := text_substring (2, text_count - 1)
		
when 98 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 670 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 670")
end

			set_last_token (ENTITY_INVALID)
		
when 99 then
	yy_column := yy_column + 2
	yy_position := yy_position + 2
--|#line 677 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 677")
end

	set_last_token (TAG_START_END)
	push_start_condition (tag)

when 100 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 682 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 682")
end

	set_last_token (TAG_START)
	push_start_condition (tag)

when 101 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 689 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 689")
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
--|#line 698 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 698")
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
--|#line 708 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 708")
end

			 set_last_token (TAG_NAME_COLON) 
		
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 711 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 711")
end
 
			set_last_token (TAG_NAME_FIRST)
			last_value := text
		
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 715 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 715")
end
 
			set_last_token (TAG_NAME_FIRST_UTF8)
			last_value := text
		
when 106 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 719 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 719")
end
 
			set_last_token (TAG_NAME_ATOM) 
			last_value := text
		
when 107 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 723 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 723")
end
 
			set_last_token (TAG_NAME_ATOM_UTF8) 
			last_value := text
		
when 108 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 727 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 727")
end

			set_last_token (SPACE) 
		
when 109 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 730 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 730")
end

			set_last_token (EQ) 
		
when 110 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 734 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 734")
end
 
			set_last_token (VALUE_START) 
			push_start_condition (attribute_value_single)
		
when 111 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 738 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 738")
end

			set_last_token (VALUE_START)
			push_start_condition (attribute_value_double)
		
when 112 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 751 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 751")
end

				set_last_token (CHARDATA)
				last_value := "%'"
			
when 113 then
	yy_column := yy_column + 6
	yy_position := yy_position + 6
--|#line 755 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 755")
end

				set_last_token (CHARDATA)
				last_value := "%""
			
when 114 then
	yy_column := yy_column + 4
	yy_position := yy_position + 4
--|#line 759 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 759")
end

				set_last_token (CHARDATA)
				last_value := "<"
			
when 115 then
	yy_column := yy_column + 4
	yy_position := yy_position + 4
--|#line 763 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 763")
end

				set_last_token (CHARDATA)
				last_value := ">"
			
when 116 then
	yy_column := yy_column + 5
	yy_position := yy_position + 5
--|#line 767 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 767")
end

				set_last_token (CHARDATA)
				last_value := "&"
			
when 117 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 775 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 775")
end
 
				set_last_token (CONTENT_ENTITY) 
				last_value := text_substring (2, text_count - 1)
			
when 118 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 779 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 779")
end
 
				set_last_token (CONTENT_ENTITY_UTF8) 
				last_value := text_substring (2, text_count - 1)
			
when 119 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 787 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 787")
end
 
				set_last_token (CHARDATA) -- Bypassed
				last_value := text
			
when 120 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 791 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 791")
end
 
				set_last_token (CHARDATA_UTF8) -- Bypassed
				last_value := text
			
when 121 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 798 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 798")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 122 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 806 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 806")
end
 
				set_last_token (ATTRIBUTE_ENTITY)
				last_value := text_substring (2, text_count - 1)
			
when 123 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 810 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 810")
end
 
				set_last_token (ATTRIBUTE_ENTITY_UTF8)
				last_value := text_substring (2, text_count - 1)
			
when 124 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 815 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 815")
end

			set_last_token (ATTRIBUTE_LT) -- Conformance error.
			last_value := text
		
when 125 then
	yy_line := yy_line + 1
	yy_column := 1
	yy_position := yy_position + 2
--|#line 819 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 819")
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
--|#line 828 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 828")
end

				-- XML1.0:3.3.3 Attribute value normalization.
			set_last_token (CHARDATA)
			last_value := normalized_space
		
when 127 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 833 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 833")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 128 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 837 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 837")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 129 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 845 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 845")
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
--|#line 859 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 859")
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
--|#line 874 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 874")
end

			set_last_token (ENTITY_INVALID)
			last_value := text
		
when 132 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 882 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 882")
end

				-- End of line handling XML1.0:2.11.
			set_last_token (CHARDATA)
			last_value := normalized_newline
		
when 133 then
yy_set_line_column
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 887 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 887")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 134 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 891 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 891")
end

			set_last_token (CHARDATA)
			last_value := text
		
when 135 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 895 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 895")
end

			set_last_token (CHARDATA_UTF8)
			last_value := text
		
when 136 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 903 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 903")
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
--|#line 911 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 911")
end

			set_last_token (CHARDATA) 
			last_value := text
		
when 138 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 919 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 919")
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
--|#line 927 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 927")
end

			set_last_token (CHARDATA) 
			last_value := text
		
when 140 then
	yy_column := yy_column + 3
	yy_position := yy_position + 3
--|#line 935 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 935")
end

		-- XML1.0:14 ]]> not allowed in markup.
	last_token := CONTENT_CONDITIONAL_END
	last_value := text

when 141 then
	yy_line := yy_line + 1
	yy_column := 1
	yy_position := yy_position + 2
--|#line 941 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 941")
end

		-- End of line handling XML1.0:2.11.
	set_last_token (SPACE)
	last_value := normalized_newline

when 142 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 947 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 947")
end
 
	set_last_token (SPACE) 
	last_value := normalized_newline

when 143 then
	yy_line := yy_line + 1
	yy_column := 1
	yy_position := yy_position + 1
--|#line 952 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 952")
end

	set_last_token (SPACE) 
	last_value := normalized_newline

when 144 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 957 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 957")
end

		-- Space not matched by newline normalization.
	set_last_token (SPACE)
	last_value := text

when 145 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 963 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 963")
end
 
	set_last_token (CHARDATA)
	last_value := text

when 146 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 968 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 968")
end
 
	set_last_token (CHARDATA_UTF8)
	last_value := text

when 147 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 973 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 973")
end

	set_last_token (CHARDATA)
	last_value := text

when 148 then
	yy_column := yy_column + 1
	yy_position := yy_position + 1
--|#line 978 "xm_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'xm_eiffel_scanner.l' at line 978")
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
			create an_array.make_filled (0, 0, 3946)
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
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   38,   39,   40,   41,   39,  150,  151,  150,  150,
			  830,   43,  830,  150,  151,  150,  150,   38,   38,  211,
			   38,  178,   85,   86,  179,   38,  180,  192,  358,  192,
			  192,   44,  192,  212,  830,  577,  830,  152,   38,   38,
			   38,  577,   85,   86,  152,   38,   38,  213,   38,  830,
			  137,  137,  220,  220,  220,  220,  213,  137,  137,   45,
			  427,  181,  830,  830,  153,  153,   38,   38,  645,   38,
			  646,   38,   38,   38,   38,  830,  417,  830,   87,  418,
			  428,  137,   38,   38,   38,   46,   47,   48,   49,   50,
			   38,   39,   40,   41,   39,   38,  821,   38,   87,  429,

			   43,   38,   38,   38,   88,   89,   90,   91,   92,  171,
			  172,  215,  215,  215,  173,  195,  196,  197,  198,  199,
			   44,   38,   38,   38,   88,   89,   90,   91,   92,  171,
			  172,  217,  217,  217,  173,  218,  218,  161,  430,  174,
			  200,  175,  219,  219,  219,  176,  232,  232,   45,  177,
			  220,  220,  220,  220,  830,  830,  830,  161,  816,  174,
			  814,  175,  431,  178,  474,  176,  179,  475,  180,  177,
			  813,   38,   38,   38,   46,   47,   48,   49,   50,   38,
			   51,   52,   51,   53,  229,  229,  229,   38,  231,  231,
			  231,  251,  251,  202,  273,  273,   55,  812,  203,  137, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  204,  295,  295,  181,  800,  205,  220,  220,  220,  221,
			  233,  233,  233,   38,  800,   38,  799,  206,  207,  208,
			  209,  210,  234,  234,  234,  234,  234,  234,  234,  234,
			  236,  237,  238,  239,  240,  317,  317,  223,  224,  225,
			  226,  227,  248,  248,  248,  250,  250,  250,  252,  252,
			  252,  253,  253,  253,  253,  253,  253,  253,  253,  798,
			   38,   38,   38,   56,   57,   58,   59,   60,   38,   51,
			   52,   51,   53,  263,  264,  265,  266,  267,  270,  270,
			  270,  272,  272,  272,  797,   55,  274,  274,  274,  223,
			  224,  225,  226,  227,  275,  275,  275,  275,  275,  275,

			  275,  275,  280,  281,  282,  283,  284,  277,  277,  277,
			  277,  796,  276,  292,  292,  292,  276,  287,  288,  289,
			  290,  291,  343,  343,  277,  278,  367,  367,  277,  278,
			  294,  294,  294,  296,  296,  296,  299,  300,  301,  302,
			  303,  314,  314,  314,  316,  316,  316,  391,  391,   38,
			   38,   38,   56,   57,   58,   59,   60,   38,   61,   62,
			   61,   61,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   64,   63,   63,   63,   63,
			   65,   64,   64,   64,   64,   64,   64,   64,   64,   64, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   63,   63,   63,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   63,   38,   38,
			   38,   66,   67,   68,   69,   70,   38,   71,   72,   71,
			   71,   38,   73,   38,   38,   38,   38,   74,   38,   38,
			   38,   38,   38,   75,   38,   38,   75,   76,   75,   75,
			   75,   75,   75,   75,   38,   38,   38,   77,   38,   78,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   38,   38,   38,   38,   75,   75,   75,   75,
			   79,   75,   75,   75,   75,   80,   75,   75,   75,   75,
			   81,   75,   75,   82,   75,   83,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   93,   94,   93,   93,
			   38,   95,   38,   38,   38,   38,   96,   38,   38,   38,
			   38,   38,   97,   97,   98,   97,   97,   97,   97,   97,
			   97,   97,   97,   99,   38,   38,  100,  101,   38,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,   38,   38,   38,  102,  102,  102,  102,  102,  102, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,   38,   38,   38,   38,  103,
			  104,  105,  106,  107,   38,  108,  109,  110,  108,  795,
			  112,  318,  318,  318,  113,  114,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  320,  319,  319,  322,  323,
			  324,  325,  326,  794,  115,  328,  329,  330,  331,  332,
			  333,  340,  340,  340,  342,  342,  342,  200,  344,  344,
			  344,  345,  345,  345,  345,  345,  345,  345,  345,  347,
			  348,  349,  350,  351,  353,  354,  355,  356,  357,  364,
			  364,  364,  366,  366,  366,  368,  368,  368,  375,  376,

			  377,  378,  379,  407,  407,   38,   38,   38,  116,  117,
			  118,  119,  120,   38,  108,  109,  110,  108,  361,  112,
			  305,  790,  359,  113,  114,  306,  362,  307,  360,  388,
			  388,  388,  308,  386,  390,  390,  390,  335,  336,  337,
			  338,  339,  396,  115,  309,  310,  311,  312,  313,  353,
			  354,  355,  356,  357,  789,  353,  354,  355,  356,  357,
			  381,  382,  383,  384,  385,  784,  353,  354,  355,  356,
			  357,  381,  382,  383,  384,  385,  369,  369,  369,  369,
			  783,  370,  392,  392,  392,  782,  371,  387,  398,  381,
			  382,  383,  384,  385,   38,   38,   38,  116,  117,  118, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  119,  120,   38,  108,  109,  110,  108,  372,  121,  397,
			  401,  781,  113,  122,  369,  369,  369,  369,  780,  370,
			  393,  218,  218,  394,  371,  779,  381,  382,  383,  384,
			  385,  395,  115,  425,  425,  381,  382,  383,  384,  385,
			  404,  404,  404,  232,  232,  372,  778,  381,  382,  383,
			  384,  385,  406,  406,  406,  441,  441,  353,  354,  355,
			  356,  357,  445,  445,  399,  777,  400,  408,  408,  408,
			  195,  196,  197,  198,  199,  215,  215,  215,  217,  217,
			  217,  273,  273,   38,   38,   38,  116,  117,  118,  119,
			  120,   38,  108,  109,  110,  108,  773,  121,  219,  219,

			  219,  113,  122,  381,  382,  383,  384,  385,  409,  409,
			  409,  409,  409,  409,  409,  409,  422,  422,  422,  460,
			  460,  115,  424,  424,  424,  426,  426,  426,  195,  196,
			  197,  198,  199,  215,  215,  215,  215,  215,  215,  433,
			  433,  433,  434,  434,  434,  220,  220,  220,  220,  220,
			  220,  220,  221,  772,  830,  830,  830,  229,  229,  229,
			  231,  231,  231,  233,  233,  233,  410,  223,  224,  225,
			  226,  227,   38,   38,   38,  116,  117,  118,  119,  120,
			   38,  123,  124,  125,  123,  771,  112,  464,  464,  127,
			  128,  114,  229,  229,  229,  229,  229,  229,  436,  436, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  436,  437,  437,  437,  234,  234,  234,  234,  236,  237,
			  238,  239,  240,  438,  438,  438,  440,  440,  440,  442,
			  442,  442,  248,  248,  248,  444,  444,  444,  446,  446,
			  446,  767,  223,  224,  225,  226,  227,  223,  224,  225,
			  226,  227,  248,  248,  248,  248,  248,  248,  447,  447,
			  447,  448,  448,  448,  253,  253,  253,  253,  270,  270,
			  270,   38,   38,   38,  129,  130,  131,  132,  133,   38,
			  123,  124,  125,  123,  766,  112,  317,  317,  127,  128,
			  114,  263,  264,  265,  266,  267,  272,  272,  272,  274,
			  274,  274,  263,  264,  265,  266,  267,  270,  270,  270,

			  270,  270,  270,  455,  455,  455,  456,  456,  456,  275,
			  275,  275,  275,  277,  277,  277,  277,  280,  281,  282,
			  283,  284,  457,  457,  457,  482,  482,  276,  459,  459,
			  459,  461,  461,  461,  287,  288,  289,  290,  291,  277,
			  278,  292,  292,  292,  463,  463,  463,  465,  465,  465,
			   38,   38,   38,  129,  130,  131,  132,  133,   38,  123,
			  124,  125,  123,  765,  121,  343,  343,  127,  128,  122,
			  287,  288,  289,  290,  291,  292,  292,  292,  292,  292,
			  292,  466,  466,  466,  467,  467,  467,  299,  300,  301,
			  302,  303,  314,  314,  314,  316,  316,  316,  318,  318, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  318,  479,  479,  479,  481,  481,  481,  483,  483,  483,
			  299,  300,  301,  302,  303,  314,  314,  314,  314,  314,
			  314,  484,  484,  484,  485,  485,  485,  319,  319,  319,
			  319,  319,  319,  319,  319,  340,  340,  340,  764,   38,
			   38,   38,  129,  130,  131,  132,  133,   38,  123,  124,
			  125,  123,  763,  121,  495,  495,  127,  128,  122,  322,
			  323,  324,  325,  326,  342,  342,  342,  344,  344,  344,
			  492,  492,  492,  494,  494,  494,  496,  496,  496,  505,
			  505,  505,  507,  507,  507,  508,  508,  509,  509,  509,
			  322,  323,  324,  325,  326,  340,  340,  340,  340,  340,

			  340,  510,  510,  510,  511,  511,  511,  345,  345,  345,
			  345,  518,  518,  518,  520,  520,  520,  521,  521,  522,
			  522,  522,  353,  354,  355,  356,  357,  762,   38,   38,
			   38,  129,  130,  131,  132,  133,   38,  134,  135,  134,
			  134,   38,   38,   38,   38,  136,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,  137,   38,  138,   38,  139,   38,
			  137,  137,  137,  137,  137,  137,  137,  137,  140,  137,
			  137,  137,  137,  137,  141,  137,  137,  142,  137,  137,
			  137,  137,  143,   38,  144,  137,  137,  137,  137,  137, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,   38,   38,   38,   38,
			  145,  146,  147,  148,  149,   38,  134,  135,  134,  134,
			   38,   38,  154,   38,  136,   38,   38,  155,  156,  157,
			  158,  159,  160,  160,   38,  160,  160,  160,  160,  160,
			  160,  160,  160,  161,   38,   38,   38,  139,  162,  163,
			  161,  161,  161,  164,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,   38,   38,   38,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,

			  161,  161,  161,  161,  161,  165,   38,   38,   38,  166,
			  167,  168,  169,  170,   38,  182,  183,  182,  182,  409,
			  409,  409,  497,  409,  409,  409,  409,  364,  364,  364,
			  524,  524,  524,  525,  525,  526,  526,  526,  532,  427,
			  761,  531,  553,  553,  185,  353,  354,  355,  356,  357,
			  364,  364,  364,  364,  364,  364,  527,  538,  760,  533,
			  528,  536,  536,  536,  537,  537,  537,  538,  529,  550,
			  550,  550,  186,  552,  552,  552,  759,  498,  530,  353,
			  354,  355,  356,  357,  534,  758,  353,  354,  355,  356,
			  357,  554,  554,  554,  752,   38,   38,   38,  187,  188, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  189,  190,  191,   38,  182,  183,  182,  182,  353,  354,
			  355,  356,  357,  388,  388,  388,  751,  353,  354,  355,
			  356,  357,  369,  369,  369,  369,  750,  370,  556,  556,
			  556,  560,  371,  185,  749,  539,  540,  541,  542,  543,
			  544,  545,  546,  547,  548,  375,  376,  377,  378,  379,
			  557,  557,  744,  372,  381,  382,  383,  384,  385,  580,
			  580,  186,  558,  558,  558,  608,  608,  381,  382,  383,
			  384,  385,  381,  382,  383,  384,  385,  566,  559,  388,
			  388,  388,  593,  743,   38,   38,   38,  187,  188,  189,
			  190,  191,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  567,  593,  235,  381,  382,  383,
			  384,  385,  388,  388,  388,  568,  235,  235,  235,  235,
			  561,  561,  561,  562,  562,  562,  569,  381,  382,  383,
			  384,  385,  404,  404,  404,  742,  381,  382,  383,  384,
			  385,  620,  620,  235,  235,  235,  570,  630,  630,  381,
			  382,  383,  384,  385,  571,  404,  404,  404,  381,  382,
			  383,  384,  385,  574,  574,  574,  741,  235,  575,  575,
			  575,  242,  243,  244,  245,  246,  830,  587,  381,  382,
			  383,  384,  385,  422,  422,  422,  201,  201,  740,  201,
			  201,  201,  201,  201,  201,  201,  201,  740,  411,  579, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  579,  579,  637,  637,  353,  354,  355,  356,  357,  409,
			  409,  409,  409,  409,  409,  409,  409,  593,  576,  581,
			  581,  581,  422,  422,  422,  422,  422,  422,  588,  588,
			  588,  739,  412,  413,  414,  415,  416,  589,  589,  589,
			  594,  215,  215,  215,  215,  215,  215,  229,  229,  229,
			  229,  229,  229,  412,  413,  414,  415,  416,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  655,  655,  235,  236,  237,  238,  239,  240,  438,  438,
			  438,  738,  235,  235,  235,  235,  438,  438,  438,  595,
			  595,  595,  596,  596,  596,  248,  248,  248,  248,  248,

			  248,  597,  597,  597,  598,  598,  598,  660,  660,  235,
			  235,  235,  248,  248,  248,  248,  248,  248,  270,  270,
			  270,  270,  270,  270,  280,  281,  282,  283,  284,  457,
			  457,  457,  685,  235,  457,  457,  457,  242,  243,  244,
			  245,  246,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  438,  615,  685,  438,  602,  602,  602,
			  603,  603,  603,  292,  292,  292,  438,  438,  438,  438,
			  292,  292,  292,  604,  604,  604,  605,  605,  605,  292,
			  292,  292,  292,  292,  292,  479,  479,  479,  607,  607,
			  607,  818,  818,  438,  438,  438,  609,  609,  609,  479, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  479,  479,  479,  479,  479,  616,  616,  616,  622,  469,
			  470,  471,  472,  473,  617,  617,  617,  438,  314,  314,
			  314,  242,  243,  244,  245,  246,  830,  314,  314,  314,
			  492,  492,  492,  619,  619,  619,  304,  304,  632,  304,
			  304,  304,  304,  304,  304,  304,  304,  737,  468,  621,
			  621,  621,  492,  492,  492,  492,  492,  492,  623,  623,
			  623,  823,  823,  487,  488,  489,  490,  491,  624,  624,
			  624,  409,  409,  409,  409,  625,  409,  409,  626,  685,
			  576,  505,  505,  505,  629,  629,  629,  631,  631,  631,
			  505,  505,  505,  500,  501,  502,  503,  504,  505,  505,

			  505,  639,  686,  469,  470,  471,  472,  473,  327,  327,
			  736,  327,  327,  327,  327,  327,  327,  327,  327,  735,
			  486,  633,  633,  633,  634,  634,  634,  340,  340,  340,
			  340,  340,  340,  518,  518,  518,  636,  636,  636,  638,
			  638,  638,  518,  518,  518,  518,  518,  518,  640,  640,
			  640,  641,  641,  641,  731,  730,  513,  514,  515,  516,
			  517,  364,  364,  364,  364,  364,  364,  642,  642,  642,
			  643,  643,  643,  648,  729,  487,  488,  489,  490,  491,
			  830,  649,  728,  651,  721,  720,  650,  364,  364,  364,
			  334,  334,  719,  334,  334,  334,  334,  334,  334,  334, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  334,  717,  499,  364,  364,  364,  652,  652,  652,  707,
			  353,  354,  355,  356,  357,  353,  354,  355,  356,  357,
			  706,  353,  354,  355,  356,  357,  353,  354,  355,  356,
			  357,  654,  654,  654,  656,  656,  656,  657,  657,  657,
			  659,  659,  659,  661,  661,  661,  375,  376,  377,  378,
			  379,  550,  550,  550,  550,  550,  550,  500,  501,  502,
			  503,  504,  346,  346,  675,  346,  346,  346,  346,  346,
			  346,  346,  346,  667,  512,  663,  663,  663,  664,  664,
			  664,  388,  388,  388,  388,  388,  388,  665,  665,  665,
			  666,  666,  666,  381,  382,  383,  384,  385,  388,  388,

			  388,  388,  388,  388,  671,  381,  382,  383,  384,  385,
			  672,  673,  676,  705,  381,  382,  383,  384,  385,  404,
			  404,  404,  404,  404,  404,  674,  422,  422,  422,  513,
			  514,  515,  516,  517,  704,  694,  381,  382,  383,  384,
			  385,  422,  422,  422,  353,  354,  355,  356,  357,  678,
			  678,  678,  381,  382,  383,  384,  385,  381,  382,  383,
			  384,  385,  381,  382,  383,  384,  385,  679,  679,  679,
			  422,  422,  422,  422,  422,  422,  438,  438,  438,  438,
			  438,  438,  248,  248,  248,  248,  248,  248,  457,  457,
			  457,  457,  457,  457,  292,  292,  292,  292,  292,  292, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  479,  479,  479,  479,  479,  479,  690,  690,  690,  691,
			  691,  691,  479,  479,  479,  479,  479,  479,  492,  492,
			  492,  492,  492,  492,  695,  695,  695,  696,  696,  696,
			  492,  492,  492,  492,  492,  492,  409,  409,  409,  409,
			  409,  409,  409,  409,  712,  697,  409,  409,  409,  409,
			  409,  409,  409,  409,  698,  697,  712,  693,  699,  692,
			  689,  677,  505,  505,  505,  505,  505,  505,  700,  700,
			  700,  701,  701,  701,  505,  505,  505,  505,  505,  505,
			  518,  518,  518,  518,  518,  518,  702,  702,  702,  703,
			  703,  703,  518,  518,  518,  518,  518,  518,  364,  364,

			  364,  364,  364,  364,  708,  688,  710,  711,  652,  652,
			  652,  687,  709,  652,  652,  652,  713,  713,  713,  714,
			  714,  714,  539,  540,  541,  542,  543,  684,  683,  544,
			  545,  546,  547,  548,  657,  657,  657,  722,  353,  354,
			  355,  356,  357,  353,  354,  355,  356,  357,  353,  354,
			  355,  356,  357,  353,  354,  355,  356,  357,  657,  657,
			  657,  715,  715,  715,  716,  716,  716,  550,  550,  550,
			  550,  550,  550,  388,  388,  388,  388,  388,  388,  718,
			  724,  723,  422,  422,  422,  682,  726,  381,  382,  383,
			  384,  385,  725,  727,  422,  422,  422,  681,  732,  732, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  732,  732,  479,  479,  479,  479,  479,  479,  381,  382,
			  383,  384,  385,  381,  382,  383,  384,  385,  381,  382,
			  383,  384,  385,  680,  746,  381,  382,  383,  384,  385,
			  733,  745,  677,  381,  382,  383,  384,  385,  734,  734,
			  734,  734,  747,  353,  354,  355,  356,  357,  492,  492,
			  492,  492,  492,  492,  505,  505,  505,  505,  505,  505,
			  518,  518,  518,  518,  518,  518,  748,  652,  652,  652,
			  733,  353,  354,  355,  356,  357,  753,  353,  354,  355,
			  356,  357,  652,  652,  652,  657,  657,  657,  757,  754,
			  353,  354,  355,  356,  357,  657,  657,  657,  381,  382,

			  383,  384,  385,  755,  756,  353,  354,  355,  356,  357,
			  381,  382,  383,  384,  385,  768,  670,  669,  381,  382,
			  383,  384,  385,  353,  354,  355,  356,  357,  668,  774,
			  381,  382,  383,  384,  385,  662,  381,  382,  383,  384,
			  385,  732,  732,  732,  732,  734,  734,  734,  734,  658,
			  381,  382,  383,  384,  385,  353,  354,  355,  356,  357,
			  775,  353,  354,  355,  356,  357,  769,  769,  769,  769,
			  776,  770,  770,  770,  770,  381,  382,  383,  384,  385,
			  381,  382,  383,  384,  385,  381,  382,  383,  384,  385,
			  353,  354,  355,  356,  357,  801,  791,  653,  381,  382, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  383,  384,  385,  792,  793,  801,  647,  381,  382,  383,
			  384,  385,  769,  769,  769,  769,  644,  785,  770,  770,
			  770,  770,  786,  787,  815,  815,  815,  825,  788,  381,
			  382,  383,  384,  385,  635,  628,  381,  382,  383,  384,
			  385,  627,  381,  382,  383,  384,  385,  825,  618,  353,
			  354,  355,  356,  357,  353,  354,  355,  356,  357,  381,
			  382,  383,  384,  385,  381,  382,  383,  384,  385,  817,
			  817,  817,  614,  802,  803,  804,  805,  806,  807,  808,
			  809,  810,  811,  381,  382,  383,  384,  385,  819,  819,
			  819,  820,  820,  820,  822,  822,  822,  824,  824,  824,

			  815,  815,  815,  613,  612,  802,  803,  804,  805,  806,
			  815,  815,  815,  826,  826,  826,  827,  827,  827,  611,
			  807,  808,  809,  810,  811,  820,  820,  820,  820,  820,
			  820,  828,  828,  828,  829,  829,  829,  815,  815,  815,
			  815,  815,  815,  820,  820,  820,  820,  820,  820,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   84,   84,   84,   84,   84, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,

			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  194,  194,  194,  194,  610,  194,  194,  194,  194,  194,
			  194,  606,  194,  194,  194,  194,  201,  194,  194,  601,
			  600,  599,  592,  201,  591,  590,  586,  585,  201,  201,
			  584,  201,  201,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  583,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  582,  235,
			  235,  235,  235,  235,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  578,  241,  241, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  241,  241,  241,  254,  573,  254,  572,  565,  564,  563,
			  555,  254,  254,  262,  551,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  549,  262,  262,  279,  279,  279,  535,  523,
			  286,  286,  286,  279,  279,  519,  279,  279,  286,  286,
			  506,  286,  286,  298,  493,  298,  298,  341,  480,  298,
			  298,  298,  298,  298,  478,  298,  298,  298,  298,  298,
			  298,  298,  304,  477,  476,  315,  462,  458,  285,  304,
			  454,  271,  453,  452,  304,  304,  451,  304,  304,  321,
			  450,  321,  449,  443,  439,  321,  321,  321,  321,  321,

			  321,  321,  321,  321,  321,  321,  321,  321,  327,  435,
			  230,  334,  432,  327,  327,  423,  327,  327,  334,  421,
			  420,  419,  216,  334,  334,  346,  334,  334,  405,  403,
			  346,  346,  402,  346,  346,  352,  352,  352,  352,  389,
			  373,  365,  363,  352,  352,  341,  352,  352,  374,  374,
			  374,  374,  315,  297,  293,  285,  374,  374,  271,  374,
			  374,  380,  380,  380,  380,  269,  268,  261,  260,  380,
			  380,  259,  380,  380,  215,  215,  215,  215,  258,  215,
			  215,  215,  215,  215,  215,  257,  215,  215,  215,  215,
			  256,  215,  215,  229,  229,  229,  229,  229,  229,  229, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  255,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  248,  248,  248,  248,  249,  248,  248,  248,
			  248,  248,  270,  247,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  230,  270,  270,  292,  292,  292,  228,  216,  214,
			  193,  830,  292,  292,  830,  292,  292,  314,  830,  314,
			  314,  830,  830,  314,  314,  314,  314,  314,  830,  314,
			  314,  314,  314,  314,  314,  314,  340,  830,  340,  830,
			  830,  830,  340,  340,  340,  340,  340,  340,  340,  340,

			  340,  340,  340,  340,  340,  364,  364,  364,  364,  830,
			  830,  830,  830,  364,  364,  830,  364,  364,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  388,  388,  388,  388,  830,  830,  830,  830,
			  388,  388,  830,  388,  388,  422,  422,  422,  422,  422,
			  830,  830,  830,  422,  422,  830,  422,  422,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  438,  830,  438,  438,  438,  438,  438,  457,  457,  457,
			  830,  830,  830,  830,  830,  457,  457,  830,  457,  457,
			  479,  479,  479,  479,  479,  830,  830,  830,  479,  479,
			  830,  479,  479,  492,  492,  492,  492,  492,  830,  830,
			  830,  492,  492,  830,  492,  492,  505,  505,  505,  505,
			  505,  830,  830,  830,  505,  505,  830,  505,  505,  518,
			  518,  518,  518,  518,  830,  830,  830,  518,  518,  830,
			  518,  518,  550,  550,  550,  550,  830,  830,  830,  830,
			  550,  550,  830,  550,  550,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,

			  652,  652,  652,  652,  652,  652,  652,  657,  657,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  785,
			  785,  785,  785,  785,  785,  830,  785,  785,  785,  785,
			  785,  785,  830,  830,  785,  785,  785,  830,  785,  786,
			  786,  786,  830,  786,  786,  830,  786,  786,  786,  786,
			  786,  786,  830,  830,  786,  786,  786,  830,  786,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  788,  788,  788,  788,  788,  788,  788,  788,  788, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,   37,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,

			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830, yy_Dummy>>,
			1, 147, 3800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3946)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
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
			yy_chk_template_19 (an_array)
			yy_chk_template_20 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,   23,   23,   23,   23,
			    0,    1,    0,   24,   24,   24,   24,   25,   26,   44,
			    9,   31,    9,    9,   31,   33,   31,   39,  138,  192,
			   39,    1,  192,   44,    0,  867,    0,   23,   25,   26,
			   10,  867,   10,   10,   24,   31,   33,   44,   34,    0,
			   25,   26,   51,   51,   51,   51,  138,   31,   33,    1,
			  211,   31,    0,    0,   25,   26,   25,   26,  528,   34,
			  528,   31,   33,   31,   33,    0,  202,    0,    9,  202,
			  211,   34,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    2,    2,    2,   34,  808,   34,   10,  211,

			    2,    9,    9,    9,    9,    9,    9,    9,    9,   29,
			   29,   46,   46,   46,   29,   42,   42,   42,   42,   42,
			    2,   10,   10,   10,   10,   10,   10,   10,   10,   30,
			   30,   48,   48,   48,   30,   49,   49,   29,  213,   29,
			   43,   29,   50,   50,   50,   29,   59,   59,    2,   29,
			   52,   52,   52,   52,   54,   54,   54,   30,  803,   30,
			  799,   30,  213,   32,  305,   30,   32,  305,   32,   30,
			  796,    2,    2,    2,    2,    2,    2,    2,    2,    3,
			    3,    3,    3,    3,   56,   56,   56,   32,   58,   58,
			   58,   69,   69,   43,   91,   91,    3,  790,   43,   32, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   43,  106,  106,   32,  786,   43,   53,   53,   53,   53,
			   60,   60,   60,   32,  785,   32,  784,   43,   43,   43,
			   43,   43,   61,   61,   61,   61,   62,   62,   62,   62,
			   63,   63,   63,   63,   63,  119,  119,   54,   54,   54,
			   54,   54,   66,   66,   66,   68,   68,   68,   70,   70,
			   70,   71,   71,   71,   71,   72,   72,   72,   72,  782,
			    3,    3,    3,    3,    3,    3,    3,    3,    4,    4,
			    4,    4,    4,   84,   84,   84,   84,   84,   88,   88,
			   88,   90,   90,   90,  781,    4,   92,   92,   92,   53,
			   53,   53,   53,   53,   93,   93,   93,   93,   94,   94,

			   94,   94,   97,   97,   97,   97,   97,  100,  100,  100,
			  100,  780,   93,  103,  103,  103,   94,  102,  102,  102,
			  102,  102,  132,  132,   93,   93,  148,  148,   94,   94,
			  105,  105,  105,  107,  107,  107,  111,  111,  111,  111,
			  111,  116,  116,  116,  118,  118,  118,  169,  169,    4,
			    4,    4,    4,    4,    4,    4,    4,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   13,   13,   13,   13,   13,  778,
			   13,  120,  120,  120,   13,   13,  123,  123,  123,  123,
			  124,  124,  124,  124,  125,  125,  125,  125,  126,  126,
			  126,  126,  126,  777,   13,  127,  127,  127,  127,  127,
			  128,  129,  129,  129,  131,  131,  131,  113,  133,  133,
			  133,  134,  134,  134,  134,  135,  135,  135,  135,  136,
			  136,  136,  136,  136,  137,  137,  137,  137,  137,  145,
			  145,  145,  147,  147,  147,  149,  149,  149,  160,  160,

			  160,  160,  160,  190,  190,   13,   13,   13,   13,   13,
			   13,   13,   13,   14,   14,   14,   14,   14,  141,   14,
			  113,  773,  140,   14,   14,  113,  142,  113,  140,  166,
			  166,  166,  113,  163,  168,  168,  168,  128,  128,  128,
			  128,  128,  174,   14,  113,  113,  113,  113,  113,  141,
			  141,  141,  141,  141,  772,  142,  142,  142,  142,  142,
			  161,  161,  161,  161,  161,  767,  140,  140,  140,  140,
			  140,  163,  163,  163,  163,  163,  150,  150,  150,  150,
			  766,  150,  170,  170,  170,  765,  150,  164,  176,  174,
			  174,  174,  174,  174,   14,   14,   14,   14,   14,   14, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   14,   14,   15,   15,   15,   15,   15,  150,   15,  175,
			  181,  764,   15,   15,  151,  151,  151,  151,  762,  151,
			  172,  198,  198,  172,  151,  761,  164,  164,  164,  164,
			  164,  172,   15,  209,  209,  176,  176,  176,  176,  176,
			  187,  187,  187,  226,  226,  151,  759,  175,  175,  175,
			  175,  175,  189,  189,  189,  239,  239,  181,  181,  181,
			  181,  181,  245,  245,  177,  758,  177,  191,  191,  191,
			  194,  194,  194,  194,  194,  195,  195,  195,  197,  197,
			  197,  266,  266,   15,   15,   15,   15,   15,   15,   15,
			   15,   16,   16,   16,   16,   16,  752,   16,  199,  199,

			  199,   16,   16,  177,  177,  177,  177,  177,  200,  200,
			  200,  200,  200,  200,  200,  200,  206,  206,  206,  283,
			  283,   16,  208,  208,  208,  210,  210,  210,  215,  215,
			  215,  215,  215,  216,  216,  216,  217,  217,  217,  218,
			  218,  218,  219,  219,  219,  220,  220,  220,  220,  221,
			  221,  221,  221,  751,  222,  222,  222,  223,  223,  223,
			  225,  225,  225,  227,  227,  227,  200,  229,  229,  229,
			  229,  229,   16,   16,   16,   16,   16,   16,   16,   16,
			   17,   17,   17,   17,   17,  749,   17,  290,  290,   17,
			   17,   17,  230,  230,  230,  231,  231,  231,  232,  232, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  232,  233,  233,  233,  234,  234,  234,  234,  235,  235,
			  235,  235,  235,  236,  236,  236,  238,  238,  238,  240,
			  240,  240,  242,  242,  242,  244,  244,  244,  246,  246,
			  246,  744,  221,  221,  221,  221,  221,  222,  222,  222,
			  222,  222,  249,  249,  249,  250,  250,  250,  251,  251,
			  251,  252,  252,  252,  253,  253,  253,  253,  263,  263,
			  263,   17,   17,   17,   17,   17,   17,   17,   17,   18,
			   18,   18,   18,   18,  743,   18,  302,  302,   18,   18,
			   18,  262,  262,  262,  262,  262,  265,  265,  265,  267,
			  267,  267,  270,  270,  270,  270,  270,  271,  271,  271,

			  272,  272,  272,  273,  273,  273,  274,  274,  274,  275,
			  275,  275,  275,  277,  277,  277,  277,  279,  279,  279,
			  279,  279,  280,  280,  280,  312,  312,  275,  282,  282,
			  282,  284,  284,  284,  286,  286,  286,  286,  286,  275,
			  275,  287,  287,  287,  289,  289,  289,  291,  291,  291,
			   18,   18,   18,   18,   18,   18,   18,   18,   19,   19,
			   19,   19,   19,  742,   19,  325,  325,   19,   19,   19,
			  292,  292,  292,  292,  292,  293,  293,  293,  294,  294,
			  294,  295,  295,  295,  296,  296,  296,  298,  298,  298,
			  298,  298,  299,  299,  299,  301,  301,  301,  303,  303, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  303,  309,  309,  309,  311,  311,  311,  313,  313,  313,
			  314,  314,  314,  314,  314,  315,  315,  315,  316,  316,
			  316,  317,  317,  317,  318,  318,  318,  319,  319,  319,
			  319,  320,  320,  320,  320,  322,  322,  322,  741,   19,
			   19,   19,   19,   19,   19,   19,   19,   20,   20,   20,
			   20,   20,  737,   20,  331,  331,   20,   20,   20,  321,
			  321,  321,  321,  321,  324,  324,  324,  326,  326,  326,
			  328,  328,  328,  330,  330,  330,  332,  332,  332,  335,
			  335,  335,  337,  337,  337,  338,  338,  339,  339,  339,
			  340,  340,  340,  340,  340,  341,  341,  341,  342,  342,

			  342,  343,  343,  343,  344,  344,  344,  345,  345,  345,
			  345,  347,  347,  347,  349,  349,  349,  350,  350,  351,
			  351,  351,  352,  352,  352,  352,  352,  736,   20,   20,
			   20,   20,   20,   20,   20,   20,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,

			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   35,   35,   35,   35,   35,  333,
			  333,  333,  333,  333,  333,  333,  333,  353,  353,  353,
			  355,  355,  355,  356,  356,  357,  357,  357,  360,  358,
			  735,  359,  378,  378,   35,  364,  364,  364,  364,  364,
			  365,  365,  365,  366,  366,  366,  358,  370,  733,  361,
			  358,  367,  367,  367,  368,  368,  368,  371,  358,  375,
			  375,  375,   35,  377,  377,  377,  731,  333,  358,  359,
			  359,  359,  359,  359,  362,  730,  360,  360,  360,  360,
			  360,  379,  379,  379,  721,   35,   35,   35,   35,   35, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   35,   35,   35,   36,   36,   36,   36,   36,  361,  361,
			  361,  361,  361,  381,  381,  381,  720,  362,  362,  362,
			  362,  362,  369,  369,  369,  369,  719,  369,  383,  383,
			  383,  387,  369,   36,  717,  370,  370,  370,  370,  370,
			  371,  371,  371,  371,  371,  374,  374,  374,  374,  374,
			  384,  384,  707,  369,  380,  380,  380,  380,  380,  415,
			  415,   36,  385,  385,  385,  472,  472,  387,  387,  387,
			  387,  387,  388,  388,  388,  388,  388,  396,  386,  389,
			  389,  389,  430,  706,   36,   36,   36,   36,   36,   36,
			   36,   36,   64,   64,   64,   64,   64,   64,   64,   64,

			   64,   64,   64,   64,  397,  430,   64,  386,  386,  386,
			  386,  386,  390,  390,  390,  398,   64,   64,   64,   64,
			  391,  391,  391,  392,  392,  392,  399,  396,  396,  396,
			  396,  396,  405,  405,  405,  705,  397,  397,  397,  397,
			  397,  490,  490,   64,   64,   64,  400,  503,  503,  398,
			  398,  398,  398,  398,  401,  406,  406,  406,  399,  399,
			  399,  399,  399,  407,  407,  407,  704,   64,  408,  408,
			  408,   64,   64,   64,   64,   64,  201,  422,  400,  400,
			  400,  400,  400,  412,  412,  412,  201,  201,  699,  201,
			  201,  201,  201,  201,  201,  201,  201,  698,  201,  414, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  414,  414,  516,  516,  401,  401,  401,  401,  401,  409,
			  409,  409,  409,  409,  409,  409,  409,  431,  409,  416,
			  416,  416,  423,  423,  423,  424,  424,  424,  425,  425,
			  425,  694,  422,  422,  422,  422,  422,  426,  426,  426,
			  431,  433,  433,  433,  434,  434,  434,  436,  436,  436,
			  437,  437,  437,  201,  201,  201,  201,  201,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  542,  542,  241,  438,  438,  438,  438,  438,  439,  439,
			  439,  693,  241,  241,  241,  241,  440,  440,  440,  441,
			  441,  441,  442,  442,  442,  443,  443,  443,  444,  444,

			  444,  445,  445,  445,  446,  446,  446,  547,  547,  241,
			  241,  241,  447,  447,  447,  448,  448,  448,  455,  455,
			  455,  456,  456,  456,  457,  457,  457,  457,  457,  458,
			  458,  458,  593,  241,  459,  459,  459,  241,  241,  241,
			  241,  241,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  248,  248,  479,  593,  248,  460,  460,  460,
			  461,  461,  461,  462,  462,  462,  248,  248,  248,  248,
			  463,  463,  463,  464,  464,  464,  465,  465,  465,  466,
			  466,  466,  467,  467,  467,  469,  469,  469,  471,  471,
			  471,  805,  805,  248,  248,  248,  473,  473,  473,  480, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  480,  480,  481,  481,  481,  482,  482,  482,  492,  479,
			  479,  479,  479,  479,  483,  483,  483,  248,  484,  484,
			  484,  248,  248,  248,  248,  248,  304,  485,  485,  485,
			  487,  487,  487,  489,  489,  489,  304,  304,  505,  304,
			  304,  304,  304,  304,  304,  304,  304,  689,  304,  491,
			  491,  491,  493,  493,  493,  494,  494,  494,  495,  495,
			  495,  810,  810,  492,  492,  492,  492,  492,  496,  496,
			  496,  497,  497,  497,  497,  497,  497,  497,  497,  594,
			  497,  500,  500,  500,  502,  502,  502,  504,  504,  504,
			  506,  506,  506,  505,  505,  505,  505,  505,  507,  507,

			  507,  518,  594,  304,  304,  304,  304,  304,  327,  327,
			  688,  327,  327,  327,  327,  327,  327,  327,  327,  687,
			  327,  508,  508,  508,  509,  509,  509,  510,  510,  510,
			  511,  511,  511,  513,  513,  513,  515,  515,  515,  517,
			  517,  517,  519,  519,  519,  520,  520,  520,  521,  521,
			  521,  522,  522,  522,  684,  683,  518,  518,  518,  518,
			  518,  523,  523,  523,  524,  524,  524,  525,  525,  525,
			  526,  526,  526,  531,  682,  327,  327,  327,  327,  327,
			  334,  532,  681,  534,  670,  669,  533,  536,  536,  536,
			  334,  334,  668,  334,  334,  334,  334,  334,  334,  334, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  334,  662,  334,  537,  537,  537,  539,  539,  539,  647,
			  531,  531,  531,  531,  531,  534,  534,  534,  534,  534,
			  646,  532,  532,  532,  532,  532,  533,  533,  533,  533,
			  533,  541,  541,  541,  543,  543,  543,  544,  544,  544,
			  546,  546,  546,  548,  548,  548,  550,  550,  550,  550,
			  550,  551,  551,  551,  552,  552,  552,  334,  334,  334,
			  334,  334,  346,  346,  570,  346,  346,  346,  346,  346,
			  346,  346,  346,  560,  346,  553,  553,  553,  554,  554,
			  554,  555,  555,  555,  556,  556,  556,  557,  557,  557,
			  558,  558,  558,  559,  559,  559,  559,  559,  561,  561,

			  561,  562,  562,  562,  566,  560,  560,  560,  560,  560,
			  567,  568,  571,  645,  570,  570,  570,  570,  570,  574,
			  574,  574,  575,  575,  575,  569,  578,  578,  578,  346,
			  346,  346,  346,  346,  644,  614,  566,  566,  566,  566,
			  566,  579,  579,  579,  571,  571,  571,  571,  571,  580,
			  580,  580,  567,  567,  567,  567,  567,  568,  568,  568,
			  568,  568,  569,  569,  569,  569,  569,  581,  581,  581,
			  588,  588,  588,  589,  589,  589,  595,  595,  595,  596,
			  596,  596,  597,  597,  597,  598,  598,  598,  602,  602,
			  602,  603,  603,  603,  604,  604,  604,  605,  605,  605, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  606,  606,  606,  607,  607,  607,  608,  608,  608,  609,
			  609,  609,  616,  616,  616,  617,  617,  617,  618,  618,
			  618,  619,  619,  619,  620,  620,  620,  621,  621,  621,
			  623,  623,  623,  624,  624,  624,  625,  625,  625,  625,
			  625,  625,  625,  625,  652,  625,  626,  626,  626,  626,
			  626,  626,  626,  626,  627,  626,  657,  611,  627,  610,
			  601,  627,  628,  628,  628,  629,  629,  629,  630,  630,
			  630,  631,  631,  631,  633,  633,  633,  634,  634,  634,
			  635,  635,  635,  636,  636,  636,  637,  637,  637,  638,
			  638,  638,  640,  640,  640,  641,  641,  641,  642,  642,

			  642,  643,  643,  643,  648,  600,  650,  651,  653,  653,
			  653,  599,  649,  654,  654,  654,  655,  655,  655,  656,
			  656,  656,  652,  652,  652,  652,  652,  592,  591,  657,
			  657,  657,  657,  657,  658,  658,  658,  671,  648,  648,
			  648,  648,  648,  649,  649,  649,  649,  649,  650,  650,
			  650,  650,  650,  651,  651,  651,  651,  651,  659,  659,
			  659,  660,  660,  660,  661,  661,  661,  663,  663,  663,
			  664,  664,  664,  665,  665,  665,  666,  666,  666,  667,
			  673,  672,  678,  678,  678,  586,  675,  671,  671,  671,
			  671,  671,  674,  676,  679,  679,  679,  583,  685,  685, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  685,  685,  690,  690,  690,  691,  691,  691,  667,  667,
			  667,  667,  667,  672,  672,  672,  672,  672,  675,  675,
			  675,  675,  675,  582,  709,  673,  673,  673,  673,  673,
			  685,  708,  577,  674,  674,  674,  674,  674,  686,  686,
			  686,  686,  710,  676,  676,  676,  676,  676,  695,  695,
			  695,  696,  696,  696,  700,  700,  700,  701,  701,  701,
			  702,  702,  702,  703,  703,  703,  711,  713,  713,  713,
			  686,  709,  709,  709,  709,  709,  723,  708,  708,  708,
			  708,  708,  714,  714,  714,  715,  715,  715,  726,  723,
			  710,  710,  710,  710,  710,  716,  716,  716,  718,  718,

			  718,  718,  718,  724,  725,  711,  711,  711,  711,  711,
			  722,  722,  722,  722,  722,  746,  565,  564,  723,  723,
			  723,  723,  723,  727,  727,  727,  727,  727,  563,  753,
			  726,  726,  726,  726,  726,  549,  724,  724,  724,  724,
			  724,  732,  732,  732,  732,  734,  734,  734,  734,  545,
			  725,  725,  725,  725,  725,  745,  745,  745,  745,  745,
			  756,  746,  746,  746,  746,  746,  747,  747,  747,  747,
			  757,  748,  748,  748,  748,  753,  753,  753,  753,  753,
			  754,  754,  754,  754,  754,  755,  755,  755,  755,  755,
			  768,  768,  768,  768,  768,  787,  774,  540,  756,  756, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  756,  756,  756,  775,  776,  788,  529,  757,  757,  757,
			  757,  757,  769,  769,  769,  769,  527,  769,  770,  770,
			  770,  770,  769,  770,  802,  802,  802,  815,  770,  774,
			  774,  774,  774,  774,  514,  501,  775,  775,  775,  775,
			  775,  498,  776,  776,  776,  776,  776,  820,  488,  747,
			  747,  747,  747,  747,  748,  748,  748,  748,  748,  791,
			  791,  791,  791,  791,  792,  792,  792,  792,  792,  804,
			  804,  804,  478,  787,  787,  787,  787,  787,  788,  788,
			  788,  788,  788,  793,  793,  793,  793,  793,  806,  806,
			  806,  807,  807,  807,  809,  809,  809,  811,  811,  811,

			  816,  816,  816,  477,  476,  815,  815,  815,  815,  815,
			  817,  817,  817,  818,  818,  818,  819,  819,  819,  475,
			  820,  820,  820,  820,  820,  821,  821,  821,  822,  822,
			  822,  823,  823,  823,  824,  824,  824,  826,  826,  826,
			  827,  827,  827,  828,  828,  828,  829,  829,  829,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  833,  833,  833,  833,  833, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,

			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  838,  838,  838,  838,  474,  838,  838,  838,  838,  838,
			  838,  470,  838,  838,  838,  838,  839,  838,  838,  452,
			  451,  450,  429,  839,  428,  427,  421,  420,  839,  839,
			  419,  839,  839,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  418,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  417,  841,
			  841,  841,  841,  841,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  413,  842,  842, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  842,  842,  842,  843,  403,  843,  402,  395,  394,  393,
			  382,  843,  843,  844,  376,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  373,  844,  844,  845,  845,  845,  363,  354,
			  846,  846,  846,  845,  845,  348,  845,  845,  846,  846,
			  336,  846,  846,  847,  329,  847,  847,  323,  310,  847,
			  847,  847,  847,  847,  308,  847,  847,  847,  847,  847,
			  847,  847,  848,  307,  306,  300,  288,  281,  276,  848,
			  269,  264,  261,  260,  848,  848,  259,  848,  848,  849,
			  257,  849,  255,  243,  237,  849,  849,  849,  849,  849,

			  849,  849,  849,  849,  849,  849,  849,  849,  850,  228,
			  224,  851,  214,  850,  850,  207,  850,  850,  851,  205,
			  204,  203,  196,  851,  851,  852,  851,  851,  188,  186,
			  852,  852,  185,  852,  852,  853,  853,  853,  853,  167,
			  154,  146,  144,  853,  853,  130,  853,  853,  854,  854,
			  854,  854,  117,  110,  104,   98,  854,  854,   89,  854,
			  854,  855,  855,  855,  855,   87,   86,   83,   82,  855,
			  855,   81,  855,  855,  856,  856,  856,  856,   80,  856,
			  856,  856,  856,  856,  856,   79,  856,  856,  856,  856,
			   78,  856,  856,  857,  857,  857,  857,  857,  857,  857, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   76,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  858,   67,  858,  858,  858,
			  858,  858,  859,   65,  859,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			  859,   57,  859,  859,  860,  860,  860,   55,   47,   45,
			   41,   37,  860,  860,    0,  860,  860,  861,    0,  861,
			  861,    0,    0,  861,  861,  861,  861,  861,    0,  861,
			  861,  861,  861,  861,  861,  861,  862,    0,  862,    0,
			    0,    0,  862,  862,  862,  862,  862,  862,  862,  862,

			  862,  862,  862,  862,  862,  863,  863,  863,  863,    0,
			    0,    0,    0,  863,  863,    0,  863,  863,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  866,  866,  866,  866,    0,    0,    0,    0,
			  866,  866,    0,  866,  866,  868,  868,  868,  868,  868,
			    0,    0,    0,  868,  868,    0,  868,  868,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  869,    0,  869,  869,  869,  869,  869,  870,  870,  870,
			    0,    0,    0,    0,    0,  870,  870,    0,  870,  870,
			  871,  871,  871,  871,  871,    0,    0,    0,  871,  871,
			    0,  871,  871,  872,  872,  872,  872,  872,    0,    0,
			    0,  872,  872,    0,  872,  872,  873,  873,  873,  873,
			  873,    0,    0,    0,  873,  873,    0,  873,  873,  874,
			  874,  874,  874,  874,    0,    0,    0,  874,  874,    0,
			  874,  874,  875,  875,  875,  875,    0,    0,    0,    0,
			  875,  875,    0,  875,  875,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,

			  876,  876,  876,  876,  876,  876,  876,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  878,
			  878,  878,  878,  878,  878,    0,  878,  878,  878,  878,
			  878,  878,    0,    0,  878,  878,  878,    0,  878,  879,
			  879,  879,    0,  879,  879,    0,  879,  879,  879,  879,
			  879,  879,    0,    0,  879,  879,  879,    0,  879,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  881,  881,  881,  881,  881,  881,  881,  881,  881, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,

			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830, yy_Dummy>>,
			1, 147, 3800)
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
			 1246, 1335,    0,    4,   11,    7,    8, 1424,    0,  102,
			  122,   14,  156,   15,   38, 1513, 1602, 3461, 3857,   25,
			 3857, 3457,   30,  132,   13, 3400,   29, 3374,   49,   52,
			   60,   50,  148,  204,  152, 3439,  102, 3367,  106,   63,
			  128,  220,  224,  145, 1686, 3400,  160, 3342,  163,  108,
			  166,  249,  253, 3857, 3857,    0, 3381, 3857, 3357, 3315,
			 3307, 3295, 3303, 3302,  188, 3857, 3363, 3306,  196, 3274,
			  199,  111,  204,  292,  296, 3857, 3857,  217, 3322, 3857,

			  305, 3857,  232,  231, 3270,  248,  118,  251, 3857, 3857,
			 3350,  251, 3857,  659, 3857, 3857,  259, 3268,  262,  152,
			  549, 3857, 3857,  634,  638,  642,  563,  570,  652,  579,
			 3261,  582,  239,  586,  669,  673,  594,  599,   22, 3857,
			  681,  664,  670, 3857, 3283,  607, 3257,  610,  243,  613,
			  774,  812, 3857, 3857, 3291, 3857, 3857, 3857, 3857, 3857,
			  613,  675, 3857,  686,  741, 3857,  647, 3255,  652,  264,
			  700, 3857,  780, 3857,  704,  762,  750,  818, 3857, 3857,
			 3857,  772, 3857, 3857, 3857, 3326, 3270,  758, 3244,  770,
			  620,  785,   27, 3857,  785,  793, 3238,  796,  738,  816, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  887, 1768,    7, 3245, 3244, 3242,  834, 3231,  840,  750,
			  843,   42, 3857,   83, 3279,  843,  851,  854,  857,  860,
			  943,  947,  952,  875, 3226,  878,  760,  881, 3276,  882,
			  910,  913,  916,  919, 1002,  923,  931, 3210,  934,  772,
			  937, 1852,  940, 3209,  943,  779,  946, 3857, 1936,  960,
			  963,  966,  969, 1052,    0, 3271, 3857, 3227,    0, 3225,
			 3209, 3207,  996,  976, 3197, 1004,  798, 1007, 3857, 3247,
			 1007, 1015, 1018, 1021, 1024, 1107, 3245, 1111, 3857, 1032,
			 1040, 3193, 1046,  836, 1049, 3857, 1049, 1059, 3192, 1062,
			  904, 1065, 1085, 1093, 1096, 1099, 1102, 3857, 1102, 1110,

			 3191, 1113,  993, 1116, 2018,   95, 3198, 3197, 3187, 1119,
			 3174, 1122, 1042, 1125, 1125, 1133, 1136, 1139, 1142, 1225,
			 1229, 1174, 1153, 3173, 1182, 1082, 1185, 2090, 1188, 3170,
			 1191, 1171, 1194, 1498, 2172, 1197, 3166, 1200, 1202, 1205,
			 1205, 1213, 1216, 1219, 1222, 1305, 2244, 1229, 3161, 1232,
			 1234, 1237, 1237, 1445, 3155, 1448, 1450, 1453, 1521, 1494,
			 1501, 1523, 1532, 3205, 1460, 1468, 1471, 1479, 1482, 1620,
			 1550, 1555, 3857, 3195, 1560, 1487, 3130, 1491, 1459, 1509,
			 1569, 1531, 3126, 1546, 1567, 1580, 1622, 1582, 1587, 1597,
			 1630, 1638, 1641, 3166, 3162, 3168, 1642, 1651, 1664, 1673, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1693, 1719, 3149, 3171, 3857, 1650, 1673, 1681, 1686, 1788,
			    0, 3857, 1701, 3113, 1717, 1576, 1737, 3106, 3081, 3110,
			 3107, 3065, 1747, 1740, 1743, 1746, 1755, 3117, 3086, 3095,
			 1636, 1771, 3857, 1759, 1762, 3857, 1765, 1768, 1788, 1796,
			 1804, 1807, 1810, 1813, 1816, 1819, 1822, 1830, 1833, 3857,
			 3060, 3060, 3054,    0, 3857, 1836, 1839, 1839, 1847, 1852,
			 1875, 1878, 1881, 1888, 1891, 1894, 1897, 1900, 3857, 1903,
			 3037, 1906, 1582, 1914, 3042, 2848, 2874, 2873, 2801, 1924,
			 1917, 1920, 1923, 1932, 1936, 1945, 3857, 1948, 2764, 1951,
			 1658, 1967, 1978, 1970, 1973, 1976, 1986, 2050, 2818, 3857,

			 1999, 2751, 2002, 1664, 2005, 2008, 2008, 2016, 2039, 2042,
			 2045, 2048, 3857, 2051, 2750, 2054, 1719, 2057, 2071, 2060,
			 2063, 2066, 2069, 2079, 2082, 2085, 2088, 2763,   23, 2758,
			 3857, 2125, 2136, 2141, 2130, 3857, 2105, 2121, 3857, 2124,
			 2713, 2149, 1787, 2152, 2155, 2665, 2158, 1824, 2161, 2697,
			 2161, 2169, 2172, 2193, 2196, 2199, 2202, 2205, 2208, 2208,
			 2220, 2216, 2219, 2673, 2668, 2666, 2251, 2267, 2272, 2277,
			 2229, 2259, 3857, 3857, 2237, 2240, 3857, 2602, 2244, 2259,
			 2267, 2285, 2593, 2522, 3857, 3857, 2509, 3857, 2288, 2291,
			 3857, 2491, 2489, 1887, 2034, 2294, 2297, 2300, 2303, 2447, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2441, 2393, 2306, 2309, 2312, 2315, 2318, 2321, 2324, 2327,
			 2429, 2382, 3857, 3857, 2259, 3857, 2330, 2333, 2336, 2339,
			 2342, 2345, 3857, 2348, 2351, 2415, 2425, 2431, 2380, 2383,
			 2386, 2389, 3857, 2392, 2395, 2398, 2401, 2404, 2407, 3857,
			 2410, 2413, 2416, 2419, 2281, 2274, 2167, 2156, 2453, 2458,
			 2463, 2468, 2437, 2426, 2431, 2434, 2437, 2444, 2452, 2476,
			 2479, 2482, 2166, 2485, 2488, 2491, 2494, 2523, 2153, 2140,
			 2130, 2502, 2528, 2540, 2548, 2533, 2558, 3857, 2500, 2512,
			 3857, 2152, 2144, 2102, 2119, 2596, 2636, 2052, 2049, 1976,
			 2520, 2523, 3857, 1851, 1801, 2566, 2569, 3857, 1767, 1758,

			 2572, 2575, 2578, 2581, 1721, 1689, 1640, 1617, 2592, 2586,
			 2605, 2620, 3857, 2585, 2600, 2603, 2613, 1581, 2613, 1588,
			 1573, 1551, 2625, 2633, 2651, 2665, 2645, 2638, 3857, 3857,
			 1529, 1523, 2739, 1525, 2743, 1470, 1259, 1182, 3857, 3857,
			 3857, 1195, 1124, 1021,  978, 2670, 2676, 2764, 2769,  950,
			 3857,  914,  845, 2690, 2695, 2700, 2713, 2722,  816,  811,
			 3857,  759,  747,    0,  759,  738,  724,  722, 2705, 2810,
			 2816, 3857,  716,  682, 2744, 2751, 2757,  614,  572,    0,
			  241,  231,  206, 3857,  168,  207,  192, 2788, 2793, 3857,
			  159, 2774, 2779, 2798, 3857, 3857,  105, 3857, 3857,  113, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3857, 3857, 2742,   74, 2787, 1908, 2806, 2809,   12, 2812,
			 1978, 2815, 3857,    0, 3857, 2820, 2818, 2828, 2831, 2834,
			 2835, 2843, 2846, 2849, 2852, 3857, 2855, 2858, 2861, 2864,
			 3857, 2948, 2971, 2994, 3017, 3040, 3063, 3086, 3105, 3119,
			 3141, 3160, 3179, 3192, 3211, 3224, 3229, 3248, 3265, 3284,
			 3294, 3304, 3311, 3324, 3337, 3350, 3369, 3389, 3408, 3430,
			 3443, 3462, 3481, 3494, 3516, 3538, 3551,   22, 3564, 3583,
			 3596, 3609, 3622, 3635, 3648, 3661, 3683, 3705, 3726, 3746,
			 3767, 3789, 3811, 3833, yy_Dummy>>,
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
			    0,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830, yy_Dummy>>,
			1, 84, 800)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 256)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    8,    9,   10,   11,   12,
			   13,   14,   15,   16,   17,   18,   19,   20,   21,   22,
			   23,   24,   25,   26,   26,   27,   26,   28,   29,   30,
			   31,   32,   33,   34,    9,   35,   36,   37,   38,   39,
			   40,   41,   42,   43,   42,   44,   45,   46,   47,   48,
			   49,   50,   51,   52,   53,   54,   42,   42,   55,   56,
			   42,   57,   58,   59,   58,   60,   58,   61,   62,   63,

			   64,   65,   62,   66,   42,   67,   42,   42,   68,   69,
			   70,   71,   72,   73,   74,   75,   76,   77,   78,   42,
			   79,   80,   42,   58,   81,   58,   58,   58,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,    1,    1,   85,   85,   85,   85,   85,   85, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   86,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   88,   89,   89,   89,   89,   89,   89,   89,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    3,    4,    5,    6,    7,    5,
			    8,    9,   10,    5,    5,    5,    5,    5,   11,   12,
			    5,   13,   13,   13,   13,   13,   13,   13,   13,   14,
			   15,   16,    5,   17,   18,   19,   19,   19,   19,   19,
			   19,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   17,   17,   21,
			   22,   19,   19,   19,   19,   19,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   17,    1,    1,    1,   23,   23,   23,   23,   23, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 830)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			yy_accept_template_4 (an_array)
			yy_accept_template_5 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  150,  148,  144,
			  143,  142,  145,  131,  100,  147,  148,  148,  148,  148,
			  148,    4,    4,    4,    5,    7,  148,  148,  148,  148,
			  148,   26,   26,   27,   24,   29,  148,  148,  148,  148,
			  148,   22,   22,   21,   20,   18,   18,   19,  148,   18,
			   18,   18,   18,   18,   33,   32,   32,   35,  148,  148,
			  148,  148,  148,  108,  108,  111,  110,  106,  148,  103,

			  109,  102,  104,  148,  148,  148,  148,  148,  126,  126,
			  126,  127,  137,  131,  136,  124,  148,  148,  148,  148,
			  148,  138,  139,  133,  132,  132,  134,   98,  131,  148,
			  148,  148,  148,  148,   73,   73,   95,   71,  148,   70,
			   71,   71,   71,   52,   53,  148,  148,  148,  148,  148,
			  148,   80,   79,   51,  148,   83,   84,   86,   87,   82,
			   88,   71,   85,   71,   71,   81,  148,  148,  148,  148,
			  148,   50,  148,   49,   71,   71,   71,   71,   92,   90,
			   91,   71,   65,   65,   64,   64,   64,  148,  148,  148,
			  148,  148,  144,  141,  145,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   99,   10,    0,  146,    0,    0,    0,    0,
			    4,    4,    5,    0,    0,    0,    0,    0,    3,    6,
			    0,    0,    0,    0,   26,   27,    0,    0,    0,    0,
			    0,   24,    0,    0,    0,    0,    0,   23,   25,    0,
			    0,    0,    0,   22,   18,    0,   11,   18,   16,   18,
			   18,   18,   33,    0,    0,    0,    0,    0,   32,    0,
			   34,    0,    0,    0,    0,  108,    0,  109,  102,  106,
			    0,    0,    0,    0,    0,  101,  104,    0,    0,    0,
			    0,    0,  105,    0,    0,    0,    0,  125,  127,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  128,    0,    0,    0,    0,  133,
			  132,  134,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  135,    0,    0,    0,    0,   73,    0,    0,    0,    0,
			    0,    0,   71,    0,    0,    0,    0,    0,    0,   71,
			   71,   71,   71,    0,   72,    0,    0,    0,    0,    0,
			    0,    0,   79,    0,   88,    0,    0,    0,    0,    0,
			   71,    0,    0,    0,    0,    0,   71,   71,   72,    0,
			    0,    0,    0,    0,    0,    0,   71,   71,   41,   71, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   71,   71,    0,    0,   64,    0,    0,    0,    0,    0,
			    0,  117,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  140,    0,    0,    2,    0,    0,   28,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   13,
			   18,   18,   18,   15,   31,    0,    0,  107,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  122,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   96,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  119,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   93,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   60,   71,   71,   71,   71,   61,    0,    0,   77,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   89,    0,    0,    0,    0,    0,    0,    0,    0,   68,
			   71,    0,    0,    0,    0,    0,   71,   71,   71,   71,
			   71,   71,   62,   63,    0,    0,  129,    0,    0,    0,
			    0,    0,    0,    0,  115,  114,    0,  118,    0,    0,
			    1,    0,    0,    0,    0,    0,    0,    0,    0,   18, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   18,   18,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  115,  114,    0,  123,    0,    0,    0,    0,
			    0,    0,   97,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  120,    0,    0,    0,    0,    0,    0,   94,
			    0,    0,    0,    0,    0,    0,    0,    0,   71,   71,
			   71,   71,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   71,    0,    0,
			    0,   71,   71,   71,   71,   71,   71,  130,    0,    0,
			  116,    0,    0,    0,    0,    0,    0,   18,   18,   18,
			    0,    0,  116,    0,    0,    0,    0,  121,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,   71,   71,
			   71,   71,   78,    0,    0,    0,    0,    0,   67,    0,
			    0,    0,   40,   71,   42,   71,   71,   69,  112,  113,
			    0,    0,    9,    0,    8,   18,   18,   18,  112,  113,
			  121,    0,    0,    0,    0,   58,   71,   71,   71,    0,
			   39,    0,    0,   71,   44,   43,   71,   71,    0,    0,
			    9,   18,   18,   12,    0,    0,    0,    0,   59,    0,
			    0,   66,    0,    0,   71,   46,   71,    0,    0,   17,
			   18,    0,    0,   56,    0,    0,    0,    0,    0,   38,
			    0,   45,   47,   48,   36,   30,   18,   55,   54,    0, yy_Dummy>>,
			1, 200, 600)
		end

	yy_accept_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   76,   74,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   37,   14,   57,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   75,    0,    0,    0,    0,
			    0, yy_Dummy>>,
			1, 31, 800)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 3857
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 830
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 831
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

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



feature -- Scanning

	read_token
			-- (NOTE: THIS IS THE COPY/PASTE VERSION OF THE CODE IN
			-- THE YY_COMPRESSED_SCANNER_SKELETON CLASS, FOR OPTIMISATION
			-- WITH ISE EIFFEL (ALLOW INLINING NOT POSSIBLE IN
			-- YY_COMPRESSED_SCANNER_SKELETON).)

			-- Read a token from `input_buffer'.
			-- Make result available in `last_token'.
		local
			yy_cp, yy_bp: INTEGER
			yy_current_state: INTEGER
			yy_next_state: INTEGER
			yy_matched_count: INTEGER
			yy_act: INTEGER
			yy_goto: INTEGER
			yy_c: INTEGER
			yy_found: BOOLEAN
			yy_rejected_line: INTEGER
			yy_rejected_column: INTEGER
			yy_rejected_position: INTEGER
			yy_done: BOOLEAN
			l_content_area: like yy_content_area
		do
				-- This routine is implemented with a loop whose body
				-- is a big inspect instruction. This is a mere
				-- translation of C gotos into Eiffel. Needless to
				-- say that I'm not very proud of this piece of code.
				-- However I performed some benchmarks and the results
				-- were that this implementation runs amazingly faster
				-- than an alternative implementation with no loop nor
				-- inspect instructions and where every branch of the
				-- old inspect instruction was written in a separate
				-- routine. I think that the performance penalty is due
				-- to the routine call overhead and the depth of the call
				-- stack. Anyway, I prefer to provide you with a big and
				-- ugly but fast scanning routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				last_token := yyUnknown_token
				yy_goto := yyNext_token
			until
				last_token /= yyUnknown_token
			loop
				inspect yy_goto
				when yyNext_token then
					if yy_more_flag then
						yy_more_len := yy_end - yy_start
						yy_more_flag := False
					else
						yy_more_len := 0
						line := yy_line
						column := yy_column
						position := yy_position
					end
					yy_cp := yy_end
						-- `yy_bp' is the position of the first
						-- character of the current token.
					yy_bp := yy_cp
						-- Find the start state.
--	START INLINING 'yy_at_beginning_of_line'
--					yy_current_state := yy_start_state + yy_at_beginning_of_line
					if input_buffer.beginning_of_line then
						yy_current_state := yy_start_state + 1
					else
						yy_current_state := yy_start_state
					end
--	END INLINING 'yy_at_beginning_of_line'
					if yyReject_or_variable_trail_context then
							-- Set up for storing up states.
						SPECIAL_INTEGER_.force (yy_state_stack, yy_current_state, 0)
						yy_state_count := 1
					end
					yy_goto := yyMatch
				when yyMatch then
						-- Find the next match.
					l_content_area := yy_content_area
					from
						yy_done := False
					until
						yy_done
					loop
						if attached yy_ec as l_yy_ec then
							if l_content_area /= Void then
								yy_c := l_yy_ec.item (l_content_area.item (yy_cp).code)
							else
								yy_c := l_yy_ec.item (yy_content.item (yy_cp).code)
							end
						else
							if l_content_area /= Void then
								yy_c := l_content_area.item (yy_cp).code
							else
								yy_c := yy_content.item (yy_cp).code
							end
						end
						if not yyReject_or_variable_trail_context and then yy_accept.item (yy_current_state) /= 0 then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						from
						until
							yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
						loop
							yy_current_state := yy_def.item (yy_current_state)
							if attached yy_meta as l_yy_meta and then yy_current_state >= yyTemplate_mark then
									-- We've arranged it so that templates are
									-- never chained to one another. This means
									-- we can afford to make a very simple test
									-- to see if we need to convert to `yy_c''s
									-- meta-equivalence class without worrying
									-- about erroneously looking up the meta
									-- equivalence class twice.
								yy_c := l_yy_meta.item (yy_c)
							end
						end
						yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							SPECIAL_INTEGER_.force (yy_state_stack, yy_current_state, yy_state_count)
							yy_state_count := yy_state_count + 1
						end
						yy_cp := yy_cp + 1
						yy_done := (yy_current_state = yyJam_state)
					end
					if not yyReject_or_variable_trail_context then
							-- Do the guaranteed-needed backing up
							-- to find out the match.
						yy_cp := yy_last_accepting_cpos
						yy_current_state := yy_last_accepting_state
					end
					yy_goto := yyFind_action
				when yyFind_action then
						-- Find the action number.
					if not yyReject_or_variable_trail_context then
						yy_act := yy_accept.item (yy_current_state)
						yy_goto := yyDo_action
					else
						yy_state_count := yy_state_count - 1
						yy_current_state := yy_state_stack.item (yy_state_count)
						yy_lp := yy_accept.item (yy_current_state)
						yy_goto := yyFind_rule
					end
				when yyFind_rule then
						-- We branch here when backing up.
					check
						reject_used: yyReject_or_variable_trail_context
						yy_acclist_not_void: attached yy_acclist as l_yy_acclist
					then
						from
							yy_found := False
						until
							yy_found
						loop
							if yy_lp /= 0 and yy_lp < yy_accept.item (yy_current_state + 1) then
								yy_act := l_yy_acclist.item (yy_lp)
								if yyVariable_trail_context then
									if yy_act < -yyNb_rules or yy_looking_for_trail_begin /= 0 then
										if yy_act = yy_looking_for_trail_begin then
											yy_looking_for_trail_begin := 0
											yy_act := -yy_act - yyNb_rules
											yy_found := True
										else
											yy_lp := yy_lp + 1
										end
									elseif yy_act < 0 then
										yy_looking_for_trail_begin := yy_act - yyNb_rules
										if yyReject_used then
												-- Remember matched text in case
												-- we back up due to `reject'.
											yy_full_match := yy_cp
											yy_full_state := yy_state_count
											yy_full_lp := yy_lp
										end
										yy_lp := yy_lp + 1
									else
										yy_full_match := yy_cp
										yy_full_state := yy_state_count
										yy_full_lp := yy_lp
										yy_found := True
									end
								else
									yy_full_match := yy_cp
									yy_found := True
								end
							else
								yy_cp := yy_cp - 1
								yy_state_count := yy_state_count - 1
								yy_current_state := yy_state_stack.item (yy_state_count)
								yy_lp := yy_accept.item (yy_current_state)
							end
						end
						yy_rejected_line := yy_line
						yy_rejected_column := yy_column
						yy_rejected_position := yy_position
						yy_goto := yyDo_action
					end
				when yyDo_action then
						-- Set up `text' before action.
					yy_bp := yy_bp - yy_more_len
					yy_start := yy_bp
					yy_end := yy_cp
					debug ("GELEX")
					end
					yy_goto := yyNext_token
						-- Semantic actions.
					if yy_act = 0 then
							-- Must back up.
						if not yyReject_or_variable_trail_context then
								-- Backing-up info for compressed tables is
								-- taken after `yy_cp' has been incremented
								-- for the next state.
							yy_cp := yy_last_accepting_cpos
							yy_bp := yy_bp + yy_more_len
							yy_current_state := yy_last_accepting_state
							yy_goto := yyFind_action
						else
							last_token := yyError_token
							fatal_error ("fatal scanner internal error: no action found")
						end
					elseif yy_act = yyEnd_of_buffer then
							-- Amount of text matched not including
							-- the EOB character.
						yy_matched_count := yy_cp - yy_bp - 1
							-- Note that here we test for `yy_end' "<="
							-- to the position of the first EOB in the buffer,
							-- since `yy_end' will already have been
							-- incremented past the NULL character (since all
							-- states make transitions on EOB to the
							-- end-of-buffer state). Contrast this with the
							-- test in `read_character'.
						if yy_end <= input_buffer.count + 1 then
								-- This was really a NULL character.
							yy_end := yy_bp + yy_matched_count
							yy_current_state := yy_previous_state
								-- We're now positioned to make the NULL
								-- transition. We couldn't have
								-- `yy_previous_state' go ahead and do it
								-- for us because it doesn't know how to deal
								-- with the possibility of jamming (and we
								-- don't want to build jamming into it because
								-- then it will run more slowly).
							yy_next_state := yy_null_trans_state (yy_current_state)
							yy_bp := yy_bp + yy_more_len
							if yy_next_state /= 0 then
									-- Consume the NULL character.
								yy_cp := yy_end + 1
								yy_end := yy_cp
								yy_current_state := yy_next_state
								yy_goto := yyMatch
							else
								if yyReject_or_variable_trail_context then
										-- Still need to initialize `yy_cp',
										-- though `yy_current_state' was set
										-- up by `yy_previous_state'.
									yy_cp := yy_end
										-- Remove the state which was inserted
										-- in `yy_state_stack' by the call to
										-- `yy_null_trans_state'.
									yy_state_count := yy_state_count - 1
								else
										-- Do the guaranteed-needed backing up
										-- then figure out the match.
									yy_cp := yy_last_accepting_cpos
									yy_current_state := yy_last_accepting_state
								end
								yy_goto := yyFind_action
							end
						else
								-- Do not take the EOB character
								-- into account.
							yy_end := yy_end - 1
							yy_refill_input_buffer
							if input_buffer.filled then
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyMatch
							elseif yy_end - yy_start - yy_more_len /= 0 then
									-- Some text has been matched prior to
									-- the EOB. First process it.
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyFind_action
							else
									-- Only the EOB character has been matched,
									-- so treat this as a final EOF.
								if wrap then
									yy_bp := yy_start
									yy_cp := yy_end
									yy_execute_eof_action ((yy_start_state - 1) // 2)
								end
							end
						end
					else
						yy_execute_action (yy_act)
						if yy_rejected then
							yy_rejected := False
							yy_line := yy_rejected_line
							yy_column := yy_rejected_column
							yy_position := yy_rejected_position
								-- Restore position backed-over text.
							yy_cp := yy_full_match
							if yyVariable_trail_context then
									-- Restore original accepting position.
								yy_lp := yy_full_lp
									-- Restore original state.
								yy_state_count := yy_full_state
									-- Restore current state.
								yy_current_state := yy_state_stack.item (yy_state_count - 1)
							end
							yy_lp := yy_lp + 1
							yy_goto := yyFind_rule
						end
					end
				end
			end
			debug ("GELEX")
				print_last_token
			end
		end

end

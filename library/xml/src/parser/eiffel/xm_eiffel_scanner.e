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
			create an_array.make_filled (0, 0, 5207)
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
			yy_nxt_template_21 (an_array)
			yy_nxt_template_22 (an_array)
			yy_nxt_template_23 (an_array)
			yy_nxt_template_24 (an_array)
			yy_nxt_template_25 (an_array)
			yy_nxt_template_26 (an_array)
			yy_nxt_template_27 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   38,   39,   40,   41,   39,  150,  151,  150,  150,
			  830,   43,  830,  150,  151,  150,  150,   38,   38,  211,
			   38,  178,   85,   86,  179,   38,  180,  192,  358,  192,
			  192,   44,  192,  212,  830,  830,  830,  152,   38,   38,
			   38,  830,   85,   86,  152,   38,   38,  213,  830,  830,
			  137,  137,  220,  220,  220,  220,  213,  137,  137,  393,
			   45,  181,  394,  830,  830,  153,  153,   38,   38,  645,
			  395,  646,   38,   38,   38,   38,  830,  830,  830,   87,
			  220,  220,  220,  220,   38,   38,   38,   46,   47,   48,
			   49,   50,   38,   39,   40,   41,   39,  218,  218,   87,

			  232,  232,   43,   38,   38,   38,   88,   89,   90,   91,
			   92,  821,  171,  172,   38,  251,  251,  173,  215,  215,
			  215,  816,   44,   38,   38,   38,   88,   89,   90,   91,
			   92,  171,  172,  273,  273,   38,  173,  217,  217,  217,
			  161,  814,  174,  813,  175,  295,  295,  137,  176,  812,
			  200,   45,  177,  195,  196,  197,  198,  199,  800,  161,
			  800,  174,   38,  175,   38,  178,  417,  176,  179,  418,
			  180,  177,  219,  219,  219,   38,   38,   38,   46,   47,
			   48,   49,   50,   38,   51,   52,   51,   53,  799,   38,
			  229,  229,  229,  798,  220,  220,  220,  221,  317,  317, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   55,  137,  343,  343,  202,  181,  797,  830,  830,  830,
			  203,  796,  204,  231,  231,  231,   38,  205,   38,  233,
			  233,  233,  234,  234,  234,  234,  248,  248,  248,  206,
			  207,  208,  209,  210,  234,  234,  234,  234,  236,  237,
			  238,  239,  240,  250,  250,  250,  252,  252,  252,  253,
			  253,  253,  253,  253,  253,  253,  253,  263,  264,  265,
			  266,  267,  270,  270,  270,  593,   38,   38,   38,   56,
			   57,   58,   59,   60,   38,   51,   52,   51,   53,  223,
			  224,  225,  226,  227,  272,  272,  272,  274,  274,  274,
			  593,   55,  223,  224,  225,  226,  227,  275,  275,  275,

			  275,  275,  275,  275,  275,  280,  281,  282,  283,  284,
			  277,  277,  277,  277,  795,  276,  292,  292,  292,  276,
			  287,  288,  289,  290,  291,  367,  367,  277,  278,  391,
			  391,  277,  278,  294,  294,  294,  296,  296,  296,  299,
			  300,  301,  302,  303,  314,  314,  314,  316,  316,  316,
			  318,  318,  318,  319,  319,  319,  319,   38,   38,   38,
			   56,   57,   58,   59,   60,   38,   61,   62,   61,   61,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   64,   63,   63,   63,   63,   65,   64, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   63,   63,   63,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   63,   38,   38,
			   38,   66,   67,   68,   69,   70,   38,   71,   72,   71,
			   71,   38,   73,   38,   38,   38,   38,   74,   38,   38,
			   38,   38,   38,   75,   38,   38,   75,   76,   75,   75,
			   75,   75,   75,   75,   38,   38,   38,   77,   38,   78,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   38,   38,   38,   38,   75,   75,   75,
			   75,   79,   75,   75,   75,   75,   75,   80,   75,   75,
			   75,   75,   81,   75,   75,   82,   75,   83,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   93,   94,
			   93,   93,   38,   95,   38,   38,   38,   38,   96,   38,
			   38,   38,   38,   38,   97,   97,   98,   97,   97,   97,
			   97,   97,   97,   97,   97,   99,   38,   38,  100,  101,
			   38,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  102,  102,  102,  102,   38,   38,   38,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,   38,
			   38,   38,   38,  103,  104,  105,  106,  107,   38,  108,
			  109,  110,  108,  794,  112,  340,  340,  340,  113,  114,
			  319,  319,  319,  319,  319,  320,  319,  319,  322,  323,
			  324,  325,  326,  328,  329,  330,  331,  332,  115,  361,
			  790,  333,  342,  342,  342,  344,  344,  344,  345,  345,
			  345,  345,  200,  345,  345,  345,  345,  347,  348,  349,
			  350,  351,  353,  354,  355,  356,  357,  364,  364,  364,

			  407,  407,  353,  354,  355,  356,  357,  366,  366,  366,
			  368,  368,  368,  375,  376,  377,  378,  379,  388,  388,
			  388,   38,   38,   38,  116,  117,  118,  119,  120,   38,
			  108,  109,  110,  108,  430,  112,  305,  359,  362,  113,
			  114,  789,  306,  360,  307,  390,  390,  390,  386,  308,
			  335,  336,  337,  338,  339,  392,  392,  392,  784,  115,
			  431,  309,  310,  311,  312,  313,  387,  218,  218,  353,
			  354,  355,  356,  357,  381,  382,  383,  384,  385,  404,
			  404,  404,  783,  353,  354,  355,  356,  357,  381,  382,
			  383,  384,  385,  782,  369,  369,  369,  369,  781,  370, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  425,  425,  396,  397,  371,  232,  232,  381,  382,  383,
			  384,  385,   38,   38,   38,  116,  117,  118,  119,  120,
			   38,  108,  109,  110,  108,  372,  121,  398,  441,  441,
			  113,  122,  369,  369,  369,  369,  401,  370,  406,  406,
			  406,  780,  371,  381,  382,  383,  384,  385,  445,  445,
			  115,  381,  382,  383,  384,  385,  399,  779,  400,  408,
			  408,  408,  778,  372,  195,  196,  197,  198,  199,  215,
			  215,  215,  217,  217,  217,  777,  381,  382,  383,  384,
			  385,  219,  219,  219,  773,  353,  354,  355,  356,  357,
			  422,  422,  422,  424,  424,  424,  427,  381,  382,  383,

			  384,  385,  772,   38,   38,   38,  116,  117,  118,  119,
			  120,   38,  108,  109,  110,  108,  428,  121,  426,  426,
			  426,  113,  122,  409,  409,  409,  409,  409,  409,  409,
			  409,  195,  196,  197,  198,  199,  429,  215,  215,  215,
			  771,  115,  215,  215,  215,  433,  433,  433,  434,  434,
			  434,  220,  220,  220,  220,  220,  220,  220,  221,  767,
			  830,  830,  830,  229,  229,  229,  231,  231,  231,  233,
			  233,  233,  223,  224,  225,  226,  227,  229,  229,  229,
			  229,  229,  229,  410,  436,  436,  436,  437,  437,  437,
			  234,  234,  234,  234,   38,   38,   38,  116,  117,  118, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  119,  120,   38,  123,  124,  125,  123,  766,  112,  273,
			  273,  127,  128,  114,  236,  237,  238,  239,  240,  438,
			  438,  438,  440,  440,  440,  442,  442,  442,  248,  248,
			  248,  444,  444,  444,  446,  446,  446,  248,  248,  248,
			  223,  224,  225,  226,  227,  223,  224,  225,  226,  227,
			  248,  248,  248,  447,  447,  447,  448,  448,  448,  253,
			  253,  253,  253,  263,  264,  265,  266,  267,  270,  270,
			  270,  272,  272,  272,  274,  274,  274,  263,  264,  265,
			  266,  267,  270,  270,  270,   38,   38,   38,  129,  130,
			  131,  132,  133,   38,  123,  124,  125,  123,  765,  112,

			  460,  460,  127,  128,  114,  270,  270,  270,  455,  455,
			  455,  456,  456,  456,  275,  275,  275,  275,  277,  277,
			  277,  277,  280,  281,  282,  283,  284,  457,  457,  457,
			  464,  464,  276,  459,  459,  459,  461,  461,  461,  287,
			  288,  289,  290,  291,  277,  278,  292,  292,  292,  463,
			  463,  463,  465,  465,  465,  287,  288,  289,  290,  291,
			  292,  292,  292,  292,  292,  292,  466,  466,  466,  467,
			  467,  467,  314,  314,  314,  764,   38,   38,   38,  129,
			  130,  131,  132,  133,   38,  123,  124,  125,  123,  763,
			  121,  317,  317,  127,  128,  122,  299,  300,  301,  302, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  303,  316,  316,  316,  318,  318,  318,  474,  482,  482,
			  475,  479,  479,  479,  481,  481,  481,  483,  483,  483,
			  299,  300,  301,  302,  303,  314,  314,  314,  314,  314,
			  314,  484,  484,  484,  485,  485,  485,  319,  319,  319,
			  319,  319,  319,  319,  319,  322,  323,  324,  325,  326,
			  340,  340,  340,  342,  342,  342,  343,  343,  344,  344,
			  344,  492,  492,  492,  494,  494,  494,   38,   38,   38,
			  129,  130,  131,  132,  133,   38,  123,  124,  125,  123,
			  762,  121,  495,  495,  127,  128,  122,  496,  496,  496,
			  409,  409,  409,  497,  409,  409,  409,  409,  505,  505,

			  505,  507,  507,  507,  508,  508,  509,  509,  509,  322,
			  323,  324,  325,  326,  340,  340,  340,  340,  340,  340,
			  510,  510,  510,  511,  511,  511,  345,  345,  345,  345,
			  518,  518,  518,  520,  520,  520,  521,  521,  522,  522,
			  522,  353,  354,  355,  356,  357,  364,  364,  364,  761,
			  498,  524,  524,  524,  525,  525,  553,  553,   38,   38,
			   38,  129,  130,  131,  132,  133,   38,  134,  135,  134,
			  134,   38,   38,   38,   38,  136,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,  137,   38,  138,   38,  139,   38, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  137,  137,  137,  137,  137,  137,  137,  137,  140,  137,
			  137,  137,  137,  137,  141,  137,  137,  142,  137,  137,
			  137,  137,  137,  143,   38,  144,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,   38,   38,
			   38,   38,  145,  146,  147,  148,  149,   38,  134,  135,
			  134,  134,   38,   38,  154,   38,  136,   38,   38,  155,
			  156,  157,  158,  159,  160,  160,   38,  160,  160,  160,
			  160,  160,  160,  160,  160,  161,   38,   38,   38,  139,
			  162,  163,  161,  161,  161,  164,  161,  161,  161,  161,

			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,   38,   38,   38,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  165,
			   38,   38,   38,  166,  167,  168,  169,  170,   38,  182,
			  183,  182,  182,  526,  526,  526,  427,  531,  532,  364,
			  364,  364,  533,  364,  364,  364,  760,  534,  353,  354,
			  355,  356,  357,  527,  536,  536,  536,  528,  185,  537,
			  537,  537,  538,  557,  557,  529,  375,  376,  377,  378,
			  379,  550,  550,  550,  759,  538,  530,  353,  354,  355, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  356,  357,  353,  354,  355,  356,  357,  186,  353,  354,
			  355,  356,  357,  353,  354,  355,  356,  357,  369,  369,
			  369,  369,  758,  370,  552,  552,  552,  752,  371,  580,
			  580,   38,   38,   38,  187,  188,  189,  190,  191,   38,
			  182,  183,  182,  182,  554,  554,  554,  559,  560,  372,
			  381,  382,  383,  384,  385,  388,  388,  388,  556,  556,
			  556,  566,  539,  540,  541,  542,  543,  608,  608,  185,
			  544,  545,  546,  547,  548,  558,  558,  558,  381,  382,
			  383,  384,  385,  388,  388,  388,  381,  382,  383,  384,
			  385,  381,  382,  383,  384,  385,  593,  751,  186,  388,

			  388,  388,  561,  561,  561,  562,  562,  562,  571,  620,
			  620,  567,  750,  381,  382,  383,  384,  385,  404,  404,
			  404,  594,   38,   38,   38,  187,  188,  189,  190,  191,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  569,  749,  235,  381,  382,  383,  384,  385,
			  568,  404,  404,  404,  235,  235,  235,  235,  570,  744,
			  353,  354,  355,  356,  357,  574,  574,  574,  575,  575,
			  575,  422,  422,  422,  630,  630,  381,  382,  383,  384,
			  385,  743,  235,  235,  235,  587,  381,  382,  383,  384,
			  385,  742,  381,  382,  383,  384,  385,  409,  409,  409, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  409,  409,  409,  409,  409,  741,  576,  235,  579,  579,
			  579,  242,  243,  244,  245,  246,  830,  581,  581,  581,
			  422,  422,  422,  422,  422,  422,  201,  201,  740,  201,
			  201,  201,  201,  201,  201,  201,  201,  740,  411,  588,
			  588,  588,  412,  413,  414,  415,  416,  589,  589,  589,
			  215,  215,  215,  215,  215,  215,  229,  229,  229,  229,
			  229,  229,  236,  237,  238,  239,  240,  438,  438,  438,
			  438,  438,  438,  595,  595,  595,  596,  596,  596,  248,
			  248,  248,  248,  248,  248,  597,  597,  597,  598,  598,
			  598,  248,  248,  248,  739,  412,  413,  414,  415,  416,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  637,  637,  235,  248,  248,  248,  270,  270,
			  270,  270,  270,  270,  235,  235,  235,  235,  280,  281,
			  282,  283,  284,  457,  457,  457,  457,  457,  457,  602,
			  602,  602,  603,  603,  603,  292,  292,  292,  292,  292,
			  292,  738,  235,  235,  235,  604,  604,  604,  605,  605,
			  605,  292,  292,  292,  292,  292,  292,  479,  479,  479,
			  607,  607,  607,  609,  609,  609,  615,  235,  479,  479,
			  479,  242,  243,  244,  245,  246,  438,  438,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  622,  737, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  438,  479,  479,  479,  616,  616,  616,  617,  617,  617,
			  438,  438,  438,  438,  314,  314,  314,  314,  314,  314,
			  492,  492,  492,  619,  619,  619,  621,  621,  621,  492,
			  492,  492,  736,  469,  470,  471,  472,  473,  438,  438,
			  438,  492,  492,  492,  623,  623,  623,  624,  624,  624,
			  505,  505,  505,  632,  735,  487,  488,  489,  490,  491,
			  629,  629,  629,  438,  631,  631,  631,  242,  243,  244,
			  245,  246,  830,  505,  505,  505,  505,  505,  505,  633,
			  633,  633,  304,  304,  639,  304,  304,  304,  304,  304,
			  304,  304,  304,  731,  468,  409,  409,  409,  409,  625,

			  409,  409,  626,  730,  576,  634,  634,  634,  655,  655,
			  500,  501,  502,  503,  504,  340,  340,  340,  340,  340,
			  340,  518,  518,  518,  636,  636,  636,  638,  638,  638,
			  518,  518,  518,  518,  518,  518,  640,  640,  640,  649,
			  729,  513,  514,  515,  516,  517,  641,  641,  641,  648,
			  728,  469,  470,  471,  472,  473,  327,  327,  650,  327,
			  327,  327,  327,  327,  327,  327,  327,  721,  486,  364,
			  364,  364,  364,  364,  364,  642,  642,  642,  643,  643,
			  643,  353,  354,  355,  356,  357,  651,  720,  353,  354,
			  355,  356,  357,  364,  364,  364,  364,  364,  364,  719, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  353,  354,  355,  356,  357,  652,  652,  652,  654,  654,
			  654,  656,  656,  656,  657,  657,  657,  659,  659,  659,
			  353,  354,  355,  356,  357,  487,  488,  489,  490,  491,
			  830,  660,  660,  661,  661,  661,  550,  550,  550,  717,
			  334,  334,  707,  334,  334,  334,  334,  334,  334,  334,
			  334,  667,  499,  375,  376,  377,  378,  379,  550,  550,
			  550,  663,  663,  663,  664,  664,  664,  388,  388,  388,
			  388,  388,  388,  665,  665,  665,  666,  666,  666,  381,
			  382,  383,  384,  385,  675,  381,  382,  383,  384,  385,
			  388,  388,  388,  388,  388,  388,  671,  672,  673,  404,

			  404,  404,  404,  404,  404,  422,  422,  422,  706,  500,
			  501,  502,  503,  504,  346,  346,  674,  346,  346,  346,
			  346,  346,  346,  346,  346,  705,  512,  676,  704,  685,
			  381,  382,  383,  384,  385,  685,  381,  382,  383,  384,
			  385,  381,  382,  383,  384,  385,  381,  382,  383,  384,
			  385,  422,  422,  422,  685,  381,  382,  383,  384,  385,
			  686,  353,  354,  355,  356,  357,  678,  678,  678,  679,
			  679,  679,  422,  422,  422,  422,  422,  422,  438,  438,
			  438,  818,  818,  513,  514,  515,  516,  517,  438,  438,
			  438,  248,  248,  248,  248,  248,  248,  457,  457,  457, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  457,  457,  457,  292,  292,  292,  292,  292,  292,  479,
			  479,  479,  479,  479,  479,  690,  690,  690,  691,  691,
			  691,  479,  479,  479,  479,  479,  479,  492,  492,  492,
			  492,  492,  492,  695,  695,  695,  696,  696,  696,  492,
			  492,  492,  492,  492,  492,  409,  409,  409,  409,  409,
			  409,  409,  409,  712,  697,  409,  409,  409,  409,  409,
			  409,  409,  409,  698,  697,  694,  712,  699,  711,  693,
			  677,  505,  505,  505,  505,  505,  505,  700,  700,  700,
			  701,  701,  701,  505,  505,  505,  505,  505,  505,  518,
			  518,  518,  518,  518,  518,  702,  702,  702,  703,  703,

			  703,  518,  518,  518,  518,  518,  518,  364,  364,  364,
			  364,  364,  364,  708,  692,  710,  353,  354,  355,  356,
			  357,  709,  652,  652,  652,  652,  652,  652,  713,  713,
			  713,  823,  823,  539,  540,  541,  542,  543,  714,  714,
			  714,  544,  545,  546,  547,  548,  657,  657,  657,  353,
			  354,  355,  356,  357,  353,  354,  355,  356,  357,  353,
			  354,  355,  356,  357,  657,  657,  657,  715,  715,  715,
			  716,  716,  716,  550,  550,  550,  550,  550,  550,  388,
			  388,  388,  388,  388,  388,  718,  722,  723,  725,  422,
			  422,  422,  726,  422,  422,  422,  724,  727,  479,  479, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  479,  479,  479,  479,  732,  732,  732,  732,  492,  492,
			  492,  492,  492,  492,  689,  688,  381,  382,  383,  384,
			  385,  381,  382,  383,  384,  385,  381,  382,  383,  384,
			  385,  381,  382,  383,  384,  385,  733,  747,  381,  382,
			  383,  384,  385,  381,  382,  383,  384,  385,  745,  353,
			  354,  355,  356,  357,  734,  734,  734,  734,  505,  505,
			  505,  505,  505,  505,  518,  518,  518,  518,  518,  518,
			  746,  748,  652,  652,  652,  652,  652,  652,  657,  657,
			  657,  657,  657,  657,  756,  687,  733,  353,  354,  355,
			  356,  357,  755,  757,  684,  683,  353,  354,  355,  356,

			  357,  381,  382,  383,  384,  385,  381,  382,  383,  384,
			  385,  753,  353,  354,  355,  356,  357,  768,  682,  353,
			  354,  355,  356,  357,  754,  681,  680,  381,  382,  383,
			  384,  385,  381,  382,  383,  384,  385,  381,  382,  383,
			  384,  385,  353,  354,  355,  356,  357,  732,  732,  732,
			  732,  734,  734,  734,  734,  381,  382,  383,  384,  385,
			  353,  354,  355,  356,  357,  353,  354,  355,  356,  357,
			  769,  769,  769,  769,  774,  770,  770,  770,  770,  381,
			  382,  383,  384,  385,  381,  382,  383,  384,  385,  775,
			  353,  354,  355,  356,  357,  776,  769,  769,  769,  769, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  801,  785,  770,  770,  770,  770,  786,  787,  791,  677,
			  801,  670,  788,  792,  381,  382,  383,  384,  385,  815,
			  815,  815,  381,  382,  383,  384,  385,  793,  825,  381,
			  382,  383,  384,  385,  381,  382,  383,  384,  385,  817,
			  817,  817,  669,  381,  382,  383,  384,  385,  381,  382,
			  383,  384,  385,  825,  668,  353,  354,  355,  356,  357,
			  353,  354,  355,  356,  357,  662,  658,  381,  382,  383,
			  384,  385,  381,  382,  383,  384,  385,  819,  819,  819,
			  802,  803,  804,  805,  806,  807,  808,  809,  810,  811,
			  381,  382,  383,  384,  385,  820,  820,  820,  822,  822,

			  822,  824,  824,  824,  815,  815,  815,  653,  802,  803,
			  804,  805,  806,  815,  815,  815,  826,  826,  826,  827,
			  827,  827,  820,  820,  820,  820,  820,  820,  807,  808,
			  809,  810,  811,  828,  828,  828,  829,  829,  829,  815,
			  815,  815,  815,  815,  815,  820,  820,  820,  820,  820,
			  820,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   54,   54, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,  111,  111,  111,  111,  111,  111,  111,  111,

			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  194,  194,  194,  194,  647,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  644,  194,

			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  635,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  201,  628,  577,  577,  577,  577,  577,
			  577,  577,  577,  627,  618,  614,  613,  201,  577,  612,
			  611,  610,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  606,  601,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  600,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  599,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  592,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  254,  591,  254,  254,

			  254,  254,  254,  254,  254,  254,  590,  586,  585,  584,
			  583,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  582,  578,  573,  254,  254,  254,  254,  254,  254,
			  254,  254,  262,  572,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  565,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  564,  563,
			  555,  551,  549,  279,  279,  279,  279,  279,  279,  279, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  279,  279,  279,  535,  523,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  519,  506,  493,  341,  480,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  478,  477,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  298,  476,  298,  298,  315,  462,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  458,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  304,  285,  454,  271,  453,

			  452,  451,  450,  449,  443,  439,  435,  230,  432,  304,
			  423,  421,  420,  419,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  216,  405,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  321,  403,  321,  402,
			  389,  373,  321,  321,  321,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  321,  321,  327,
			  365,  363,  341,  315,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  297,  293,  327,  327,  327,  327, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  327,  327,  327,  327,  327,  327,  334,  285,  271,  269,
			  268,  261,  260,  259,  258,  257,  256,  255,  249,  247,
			  334,  230,  228,  216,  214,  334,  334,  334,  334,  334,
			  334,  334,  334,  334,  334,  193,  830,  334,  334,  334,
			  334,  334,  334,  334,  334,  334,  334,  346,  830,  830,
			  830,  830,  346,  346,  346,  346,  346,  346,  346,  346,
			  346,  346,  830,  830,  346,  346,  346,  346,  346,  346,
			  346,  346,  346,  346,  352,  352,  352,  352,  352,  352,
			  352,  352,  352,  352,  352,  830,  830,  830,  830,  352,
			  352,  352,  352,  352,  352,  352,  352,  352,  352,  830,

			  830,  352,  352,  352,  352,  352,  352,  352,  352,  352,
			  352,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  374,  374,  830,  830,  830,  830,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  830,  830,  374,  374,
			  374,  374,  374,  374,  374,  374,  374,  374,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  830,
			  830,  830,  830,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  830,  830,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  215,  215,  215,  215,  830,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  215,  215,  215,  830,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  830,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  229,  229,
			  229,  229,  229,  229,  229,  830,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  830,  248,  248,  248,  248,  248,  248,  248,

			  248,  248,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  248,  248,  248,  270,  830,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  830,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  830,  830,  830,  830,  830,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  830,  830,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  314,  830, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  314,  314,  830,  830,  314,  314,  314,  314,  314,  314,
			  314,  314,  314,  314,  314,  314,  830,  314,  314,  314,
			  314,  314,  314,  314,  314,  314,  314,  314,  314,  314,
			  314,  314,  314,  314,  314,  314,  314,  314,  314,  314,
			  314,  340,  830,  340,  830,  830,  830,  340,  340,  340,
			  340,  340,  340,  340,  340,  340,  340,  340,  340,  340,
			  340,  340,  340,  340,  340,  340,  340,  340,  340,  340,
			  340,  340,  340,  340,  340,  340,  340,  340,  340,  340,
			  340,  340,  340,  340,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  830,  830,  830,  830,  364,

			  364,  364,  364,  364,  364,  364,  364,  364,  364,  830,
			  830,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  388,  388,  388,  388,  388,  388,  388,
			  388,  388,  388,  388,  830,  830,  830,  830,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  830,  830,
			  388,  388,  388,  388,  388,  388,  388,  388,  388,  388,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  830,  830,  830,  422,  422,  422,  422,  422,
			  422,  422,  422,  422,  422,  830,  830,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  438,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,

			  438,  438,  438,  438,  438,  438,  438,  830,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,
			  457,  457,  457,  457,  457,  457,  457,  457,  457,  457,
			  830,  830,  830,  830,  830,  457,  457,  457,  457,  457,
			  457,  457,  457,  457,  457,  830,  830,  457,  457,  457,
			  457,  457,  457,  457,  457,  457,  457,  479,  479,  479,
			  479,  479,  479,  479,  479,  479,  479,  479,  479,  830,
			  830,  830,  479,  479,  479,  479,  479,  479,  479,  479,
			  479,  479,  830,  830,  479,  479,  479,  479,  479,  479, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_nxt_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  479,  479,  479,  479,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  830,  830,  830,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  830,
			  830,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  505,  505,  505,  505,  505,  505,  505,  505,  505,
			  505,  505,  505,  830,  830,  830,  505,  505,  505,  505,
			  505,  505,  505,  505,  505,  505,  830,  830,  505,  505,
			  505,  505,  505,  505,  505,  505,  505,  505,  518,  518,
			  518,  518,  518,  518,  518,  518,  518,  518,  518,  518,
			  830,  830,  830,  518,  518,  518,  518,  518,  518,  518,

			  518,  518,  518,  830,  830,  518,  518,  518,  518,  518,
			  518,  518,  518,  518,  518,  550,  550,  550,  550,  550,
			  550,  550,  550,  550,  550,  550,  830,  830,  830,  830,
			  550,  550,  550,  550,  550,  550,  550,  550,  550,  550,
			  830,  830,  550,  550,  550,  550,  550,  550,  550,  550,
			  550,  550,  652,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  657,  657, yy_Dummy>>,
			1, 200, 4600)
		end

	yy_nxt_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  785,  785,  785,  785,  785,  785,
			  830,  785,  785,  785,  785,  785,  785,  785,  785,  785,
			  785,  785,  785,  785,  830,  830,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  785,  785,  830,  830,  785,
			  785,  785,  785,  785,  785,  785,  785,  785,  786,  786,
			  786,  830,  786,  786,  830,  786,  786,  786,  786,  786,

			  786,  786,  786,  786,  786,  786,  786,  786,  830,  830,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  830,  830,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  787,  787,  787,  787,  787,  787,  787,  787,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788, yy_Dummy>>,
			1, 200, 4800)
		end

	yy_nxt_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  815,  815,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,

			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,   37,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830, yy_Dummy>>,
			1, 200, 5000)
		end

	yy_nxt_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  830,  830,  830,  830,  830,  830,  830,  830, yy_Dummy>>,
			1, 8, 5200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5207)
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
			yy_chk_template_21 (an_array)
			yy_chk_template_22 (an_array)
			yy_chk_template_23 (an_array)
			yy_chk_template_24 (an_array)
			yy_chk_template_25 (an_array)
			yy_chk_template_26 (an_array)
			yy_chk_template_27 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,   23,   23,   23,   23,
			    0,    1,    0,   24,   24,   24,   24,   25,   26,   44,
			    9,   31,    9,    9,   31,   33,   31,   39,  138,  192,
			   39,    1,  192,   44,    0,    0,    0,   23,   25,   26,
			   10,    0,   10,   10,   24,   31,   33,   44,    0,    0,
			   25,   26,   51,   51,   51,   51,  138,   31,   33,  172,
			    1,   31,  172,    0,    0,   25,   26,   25,   26,  528,
			  172,  528,   31,   33,   31,   33,    0,    0,    0,    9,
			   52,   52,   52,   52,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    2,    2,    2,    2,   49,   49,   10,

			   59,   59,    2,    9,    9,    9,    9,    9,    9,    9,
			    9,  808,   29,   29,   34,   69,   69,   29,   46,   46,
			   46,  803,    2,   10,   10,   10,   10,   10,   10,   10,
			   10,   30,   30,   91,   91,   34,   30,   48,   48,   48,
			   29,  799,   29,  796,   29,  106,  106,   34,   29,  790,
			   43,    2,   29,   42,   42,   42,   42,   42,  786,   30,
			  785,   30,   34,   30,   34,   32,  202,   30,   32,  202,
			   32,   30,   50,   50,   50,    2,    2,    2,    2,    2,
			    2,    2,    2,    3,    3,    3,    3,    3,  784,   32,
			   56,   56,   56,  782,   53,   53,   53,   53,  119,  119, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,   32,  132,  132,   43,   32,  781,   54,   54,   54,
			   43,  780,   43,   58,   58,   58,   32,   43,   32,   60,
			   60,   60,   61,   61,   61,   61,   66,   66,   66,   43,
			   43,   43,   43,   43,   62,   62,   62,   62,   63,   63,
			   63,   63,   63,   68,   68,   68,   70,   70,   70,   71,
			   71,   71,   71,   72,   72,   72,   72,   84,   84,   84,
			   84,   84,   88,   88,   88,  430,    3,    3,    3,    3,
			    3,    3,    3,    3,    4,    4,    4,    4,    4,   53,
			   53,   53,   53,   53,   90,   90,   90,   92,   92,   92,
			  430,    4,   54,   54,   54,   54,   54,   93,   93,   93,

			   93,   94,   94,   94,   94,   97,   97,   97,   97,   97,
			  100,  100,  100,  100,  778,   93,  103,  103,  103,   94,
			  102,  102,  102,  102,  102,  148,  148,   93,   93,  169,
			  169,   94,   94,  105,  105,  105,  107,  107,  107,  111,
			  111,  111,  111,  111,  116,  116,  116,  118,  118,  118,
			  120,  120,  120,  123,  123,  123,  123,    4,    4,    4,
			    4,    4,    4,    4,    4,    5,    5,    5,    5,    5,
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
			    7,    7,    7,    7,    7,    7,    7,   11,   11,   11,
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
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   13,   13,
			   13,   13,   13,  777,   13,  129,  129,  129,   13,   13,
			  124,  124,  124,  124,  125,  125,  125,  125,  126,  126,
			  126,  126,  126,  127,  127,  127,  127,  127,   13,  141,
			  773,  128,  131,  131,  131,  133,  133,  133,  134,  134,
			  134,  134,  113,  135,  135,  135,  135,  136,  136,  136,
			  136,  136,  137,  137,  137,  137,  137,  145,  145,  145,

			  190,  190,  141,  141,  141,  141,  141,  147,  147,  147,
			  149,  149,  149,  160,  160,  160,  160,  160,  166,  166,
			  166,   13,   13,   13,   13,   13,   13,   13,   13,   14,
			   14,   14,   14,   14,  213,   14,  113,  140,  142,   14,
			   14,  772,  113,  140,  113,  168,  168,  168,  163,  113,
			  128,  128,  128,  128,  128,  170,  170,  170,  767,   14,
			  213,  113,  113,  113,  113,  113,  164,  198,  198,  142,
			  142,  142,  142,  142,  161,  161,  161,  161,  161,  187,
			  187,  187,  766,  140,  140,  140,  140,  140,  163,  163,
			  163,  163,  163,  765,  150,  150,  150,  150,  764,  150, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  209,  209,  174,  175,  150,  226,  226,  164,  164,  164,
			  164,  164,   14,   14,   14,   14,   14,   14,   14,   14,
			   15,   15,   15,   15,   15,  150,   15,  176,  239,  239,
			   15,   15,  151,  151,  151,  151,  181,  151,  189,  189,
			  189,  762,  151,  175,  175,  175,  175,  175,  245,  245,
			   15,  174,  174,  174,  174,  174,  177,  761,  177,  191,
			  191,  191,  759,  151,  194,  194,  194,  194,  194,  195,
			  195,  195,  197,  197,  197,  758,  176,  176,  176,  176,
			  176,  199,  199,  199,  752,  181,  181,  181,  181,  181,
			  206,  206,  206,  208,  208,  208,  211,  177,  177,  177,

			  177,  177,  751,   15,   15,   15,   15,   15,   15,   15,
			   15,   16,   16,   16,   16,   16,  211,   16,  210,  210,
			  210,   16,   16,  200,  200,  200,  200,  200,  200,  200,
			  200,  215,  215,  215,  215,  215,  211,  216,  216,  216,
			  749,   16,  217,  217,  217,  218,  218,  218,  219,  219,
			  219,  220,  220,  220,  220,  221,  221,  221,  221,  744,
			  222,  222,  222,  223,  223,  223,  225,  225,  225,  227,
			  227,  227,  229,  229,  229,  229,  229,  230,  230,  230,
			  231,  231,  231,  200,  232,  232,  232,  233,  233,  233,
			  234,  234,  234,  234,   16,   16,   16,   16,   16,   16, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   16,   16,   17,   17,   17,   17,   17,  743,   17,  266,
			  266,   17,   17,   17,  235,  235,  235,  235,  235,  236,
			  236,  236,  238,  238,  238,  240,  240,  240,  242,  242,
			  242,  244,  244,  244,  246,  246,  246,  249,  249,  249,
			  221,  221,  221,  221,  221,  222,  222,  222,  222,  222,
			  250,  250,  250,  251,  251,  251,  252,  252,  252,  253,
			  253,  253,  253,  262,  262,  262,  262,  262,  263,  263,
			  263,  265,  265,  265,  267,  267,  267,  270,  270,  270,
			  270,  270,  271,  271,  271,   17,   17,   17,   17,   17,
			   17,   17,   17,   18,   18,   18,   18,   18,  742,   18,

			  283,  283,   18,   18,   18,  272,  272,  272,  273,  273,
			  273,  274,  274,  274,  275,  275,  275,  275,  277,  277,
			  277,  277,  279,  279,  279,  279,  279,  280,  280,  280,
			  290,  290,  275,  282,  282,  282,  284,  284,  284,  286,
			  286,  286,  286,  286,  275,  275,  287,  287,  287,  289,
			  289,  289,  291,  291,  291,  292,  292,  292,  292,  292,
			  293,  293,  293,  294,  294,  294,  295,  295,  295,  296,
			  296,  296,  299,  299,  299,  741,   18,   18,   18,   18,
			   18,   18,   18,   18,   19,   19,   19,   19,   19,  737,
			   19,  302,  302,   19,   19,   19,  298,  298,  298,  298, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  298,  301,  301,  301,  303,  303,  303,  305,  312,  312,
			  305,  309,  309,  309,  311,  311,  311,  313,  313,  313,
			  314,  314,  314,  314,  314,  315,  315,  315,  316,  316,
			  316,  317,  317,  317,  318,  318,  318,  319,  319,  319,
			  319,  320,  320,  320,  320,  321,  321,  321,  321,  321,
			  322,  322,  322,  324,  324,  324,  325,  325,  326,  326,
			  326,  328,  328,  328,  330,  330,  330,   19,   19,   19,
			   19,   19,   19,   19,   19,   20,   20,   20,   20,   20,
			  736,   20,  331,  331,   20,   20,   20,  332,  332,  332,
			  333,  333,  333,  333,  333,  333,  333,  333,  335,  335,

			  335,  337,  337,  337,  338,  338,  339,  339,  339,  340,
			  340,  340,  340,  340,  341,  341,  341,  342,  342,  342,
			  343,  343,  343,  344,  344,  344,  345,  345,  345,  345,
			  347,  347,  347,  349,  349,  349,  350,  350,  351,  351,
			  351,  352,  352,  352,  352,  352,  353,  353,  353,  735,
			  333,  355,  355,  355,  356,  356,  378,  378,   20,   20,
			   20,   20,   20,   20,   20,   20,   21,   21,   21,   21,
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
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,

			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   35,   35,
			   35,   35,   35,  357,  357,  357,  358,  359,  360,  365,
			  365,  365,  361,  366,  366,  366,  733,  362,  364,  364,
			  364,  364,  364,  358,  367,  367,  367,  358,   35,  368,
			  368,  368,  370,  384,  384,  358,  374,  374,  374,  374,
			  374,  375,  375,  375,  731,  371,  358,  359,  359,  359, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  359,  359,  362,  362,  362,  362,  362,   35,  360,  360,
			  360,  360,  360,  361,  361,  361,  361,  361,  369,  369,
			  369,  369,  730,  369,  377,  377,  377,  721,  369,  415,
			  415,   35,   35,   35,   35,   35,   35,   35,   35,   36,
			   36,   36,   36,   36,  379,  379,  379,  386,  387,  369,
			  380,  380,  380,  380,  380,  381,  381,  381,  383,  383,
			  383,  396,  370,  370,  370,  370,  370,  472,  472,   36,
			  371,  371,  371,  371,  371,  385,  385,  385,  386,  386,
			  386,  386,  386,  389,  389,  389,  387,  387,  387,  387,
			  387,  388,  388,  388,  388,  388,  431,  720,   36,  390,

			  390,  390,  391,  391,  391,  392,  392,  392,  401,  490,
			  490,  397,  719,  396,  396,  396,  396,  396,  405,  405,
			  405,  431,   36,   36,   36,   36,   36,   36,   36,   36,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,  399,  717,   64,  397,  397,  397,  397,  397,
			  398,  406,  406,  406,   64,   64,   64,   64,  400,  707,
			  401,  401,  401,  401,  401,  407,  407,  407,  408,  408,
			  408,  412,  412,  412,  503,  503,  399,  399,  399,  399,
			  399,  706,   64,   64,   64,  422,  398,  398,  398,  398,
			  398,  705,  400,  400,  400,  400,  400,  409,  409,  409, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  409,  409,  409,  409,  409,  704,  409,   64,  414,  414,
			  414,   64,   64,   64,   64,   64,  201,  416,  416,  416,
			  423,  423,  423,  424,  424,  424,  201,  201,  699,  201,
			  201,  201,  201,  201,  201,  201,  201,  698,  201,  425,
			  425,  425,  422,  422,  422,  422,  422,  426,  426,  426,
			  433,  433,  433,  434,  434,  434,  436,  436,  436,  437,
			  437,  437,  438,  438,  438,  438,  438,  439,  439,  439,
			  440,  440,  440,  441,  441,  441,  442,  442,  442,  443,
			  443,  443,  444,  444,  444,  445,  445,  445,  446,  446,
			  446,  447,  447,  447,  694,  201,  201,  201,  201,  201,

			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  516,  516,  241,  448,  448,  448,  455,  455,
			  455,  456,  456,  456,  241,  241,  241,  241,  457,  457,
			  457,  457,  457,  458,  458,  458,  459,  459,  459,  460,
			  460,  460,  461,  461,  461,  462,  462,  462,  463,  463,
			  463,  693,  241,  241,  241,  464,  464,  464,  465,  465,
			  465,  466,  466,  466,  467,  467,  467,  469,  469,  469,
			  471,  471,  471,  473,  473,  473,  479,  241,  480,  480,
			  480,  241,  241,  241,  241,  241,  248,  248,  248,  248,
			  248,  248,  248,  248,  248,  248,  248,  248,  492,  689, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  248,  481,  481,  481,  482,  482,  482,  483,  483,  483,
			  248,  248,  248,  248,  484,  484,  484,  485,  485,  485,
			  487,  487,  487,  489,  489,  489,  491,  491,  491,  493,
			  493,  493,  688,  479,  479,  479,  479,  479,  248,  248,
			  248,  494,  494,  494,  495,  495,  495,  496,  496,  496,
			  500,  500,  500,  505,  687,  492,  492,  492,  492,  492,
			  502,  502,  502,  248,  504,  504,  504,  248,  248,  248,
			  248,  248,  304,  506,  506,  506,  507,  507,  507,  508,
			  508,  508,  304,  304,  518,  304,  304,  304,  304,  304,
			  304,  304,  304,  684,  304,  497,  497,  497,  497,  497,

			  497,  497,  497,  683,  497,  509,  509,  509,  542,  542,
			  505,  505,  505,  505,  505,  510,  510,  510,  511,  511,
			  511,  513,  513,  513,  515,  515,  515,  517,  517,  517,
			  519,  519,  519,  520,  520,  520,  521,  521,  521,  532,
			  682,  518,  518,  518,  518,  518,  522,  522,  522,  531,
			  681,  304,  304,  304,  304,  304,  327,  327,  533,  327,
			  327,  327,  327,  327,  327,  327,  327,  670,  327,  523,
			  523,  523,  524,  524,  524,  525,  525,  525,  526,  526,
			  526,  532,  532,  532,  532,  532,  534,  669,  531,  531,
			  531,  531,  531,  536,  536,  536,  537,  537,  537,  668, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  533,  533,  533,  533,  533,  539,  539,  539,  541,  541,
			  541,  543,  543,  543,  544,  544,  544,  546,  546,  546,
			  534,  534,  534,  534,  534,  327,  327,  327,  327,  327,
			  334,  547,  547,  548,  548,  548,  551,  551,  551,  662,
			  334,  334,  647,  334,  334,  334,  334,  334,  334,  334,
			  334,  560,  334,  550,  550,  550,  550,  550,  552,  552,
			  552,  553,  553,  553,  554,  554,  554,  555,  555,  555,
			  556,  556,  556,  557,  557,  557,  558,  558,  558,  559,
			  559,  559,  559,  559,  570,  560,  560,  560,  560,  560,
			  561,  561,  561,  562,  562,  562,  566,  567,  568,  574,

			  574,  574,  575,  575,  575,  578,  578,  578,  646,  334,
			  334,  334,  334,  334,  346,  346,  569,  346,  346,  346,
			  346,  346,  346,  346,  346,  645,  346,  571,  644,  593,
			  566,  566,  566,  566,  566,  594,  570,  570,  570,  570,
			  570,  567,  567,  567,  567,  567,  568,  568,  568,  568,
			  568,  579,  579,  579,  593,  569,  569,  569,  569,  569,
			  594,  571,  571,  571,  571,  571,  580,  580,  580,  581,
			  581,  581,  588,  588,  588,  589,  589,  589,  595,  595,
			  595,  805,  805,  346,  346,  346,  346,  346,  596,  596,
			  596,  597,  597,  597,  598,  598,  598,  602,  602,  602, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  603,  603,  603,  604,  604,  604,  605,  605,  605,  606,
			  606,  606,  607,  607,  607,  608,  608,  608,  609,  609,
			  609,  616,  616,  616,  617,  617,  617,  618,  618,  618,
			  619,  619,  619,  620,  620,  620,  621,  621,  621,  623,
			  623,  623,  624,  624,  624,  625,  625,  625,  625,  625,
			  625,  625,  625,  652,  625,  626,  626,  626,  626,  626,
			  626,  626,  626,  627,  626,  614,  657,  627,  651,  611,
			  627,  628,  628,  628,  629,  629,  629,  630,  630,  630,
			  631,  631,  631,  633,  633,  633,  634,  634,  634,  635,
			  635,  635,  636,  636,  636,  637,  637,  637,  638,  638,

			  638,  640,  640,  640,  641,  641,  641,  642,  642,  642,
			  643,  643,  643,  648,  610,  650,  651,  651,  651,  651,
			  651,  649,  653,  653,  653,  654,  654,  654,  655,  655,
			  655,  810,  810,  652,  652,  652,  652,  652,  656,  656,
			  656,  657,  657,  657,  657,  657,  658,  658,  658,  648,
			  648,  648,  648,  648,  649,  649,  649,  649,  649,  650,
			  650,  650,  650,  650,  659,  659,  659,  660,  660,  660,
			  661,  661,  661,  663,  663,  663,  664,  664,  664,  665,
			  665,  665,  666,  666,  666,  667,  671,  672,  674,  678,
			  678,  678,  675,  679,  679,  679,  673,  676,  690,  690, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  690,  691,  691,  691,  685,  685,  685,  685,  695,  695,
			  695,  696,  696,  696,  601,  600,  667,  667,  667,  667,
			  667,  672,  672,  672,  672,  672,  675,  675,  675,  675,
			  675,  674,  674,  674,  674,  674,  685,  710,  671,  671,
			  671,  671,  671,  673,  673,  673,  673,  673,  708,  676,
			  676,  676,  676,  676,  686,  686,  686,  686,  700,  700,
			  700,  701,  701,  701,  702,  702,  702,  703,  703,  703,
			  709,  711,  713,  713,  713,  714,  714,  714,  715,  715,
			  715,  716,  716,  716,  725,  599,  686,  710,  710,  710,
			  710,  710,  724,  726,  592,  591,  708,  708,  708,  708,

			  708,  718,  718,  718,  718,  718,  722,  722,  722,  722,
			  722,  723,  711,  711,  711,  711,  711,  746,  586,  709,
			  709,  709,  709,  709,  723,  583,  582,  724,  724,  724,
			  724,  724,  725,  725,  725,  725,  725,  726,  726,  726,
			  726,  726,  727,  727,  727,  727,  727,  732,  732,  732,
			  732,  734,  734,  734,  734,  723,  723,  723,  723,  723,
			  745,  745,  745,  745,  745,  746,  746,  746,  746,  746,
			  747,  747,  747,  747,  753,  748,  748,  748,  748,  754,
			  754,  754,  754,  754,  755,  755,  755,  755,  755,  756,
			  768,  768,  768,  768,  768,  757,  769,  769,  769,  769, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  787,  769,  770,  770,  770,  770,  769,  770,  774,  577,
			  788,  565,  770,  775,  791,  791,  791,  791,  791,  802,
			  802,  802,  753,  753,  753,  753,  753,  776,  815,  756,
			  756,  756,  756,  756,  757,  757,  757,  757,  757,  804,
			  804,  804,  564,  774,  774,  774,  774,  774,  775,  775,
			  775,  775,  775,  820,  563,  747,  747,  747,  747,  747,
			  748,  748,  748,  748,  748,  549,  545,  776,  776,  776,
			  776,  776,  792,  792,  792,  792,  792,  806,  806,  806,
			  787,  787,  787,  787,  787,  788,  788,  788,  788,  788,
			  793,  793,  793,  793,  793,  807,  807,  807,  809,  809,

			  809,  811,  811,  811,  816,  816,  816,  540,  815,  815,
			  815,  815,  815,  817,  817,  817,  818,  818,  818,  819,
			  819,  819,  821,  821,  821,  822,  822,  822,  820,  820,
			  820,  820,  820,  823,  823,  823,  824,  824,  824,  826,
			  826,  826,  827,  827,  827,  828,  828,  828,  829,  829,
			  829,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  832,  832, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  834,  834,  834,  834,  834,  834,  834,  834,

			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,  837,  837,
			  838,  838,  838,  838,  529,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  527,  838,

			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  514,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  839,  501,  867,  867,  867,  867,  867,
			  867,  867,  867,  498,  488,  478,  477,  839,  867,  476,
			  475,  474,  839,  839,  839,  839,  839,  839,  839,  839,
			  839,  839,  470,  452,  839,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  451,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  450,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  841,  841,  841,  841,  841,  841,  841,
			  841,  841,  841,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  429,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  842,  842,  842,  842,
			  842,  842,  842,  842,  842,  842,  843,  428,  843,  843,

			  843,  843,  843,  843,  843,  843,  427,  421,  420,  419,
			  418,  843,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  417,  413,  403,  843,  843,  843,  843,  843,  843,
			  843,  843,  844,  402,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  395,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  394,  393,
			  382,  376,  373,  845,  845,  845,  845,  845,  845,  845, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  845,  845,  845,  363,  354,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  846,  846,  846,  846,  846,
			  846,  846,  846,  846,  846,  348,  336,  329,  323,  310,
			  846,  846,  846,  846,  846,  846,  846,  846,  846,  846,
			  308,  307,  846,  846,  846,  846,  846,  846,  846,  846,
			  846,  846,  847,  306,  847,  847,  300,  288,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  281,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  848,  276,  269,  264,  261,

			  260,  259,  257,  255,  243,  237,  228,  224,  214,  848,
			  207,  205,  204,  203,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  196,  188,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  849,  186,  849,  185,
			  167,  154,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  849,  850,
			  146,  144,  130,  117,  850,  850,  850,  850,  850,  850,
			  850,  850,  850,  850,  110,  104,  850,  850,  850,  850, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  850,  850,  850,  850,  850,  850,  851,   98,   89,   87,
			   86,   83,   82,   81,   80,   79,   78,   76,   67,   65,
			  851,   57,   55,   47,   45,  851,  851,  851,  851,  851,
			  851,  851,  851,  851,  851,   41,   37,  851,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  852,    0,    0,
			    0,    0,  852,  852,  852,  852,  852,  852,  852,  852,
			  852,  852,    0,    0,  852,  852,  852,  852,  852,  852,
			  852,  852,  852,  852,  853,  853,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,    0,    0,    0,    0,  853,
			  853,  853,  853,  853,  853,  853,  853,  853,  853,    0,

			    0,  853,  853,  853,  853,  853,  853,  853,  853,  853,
			  853,  854,  854,  854,  854,  854,  854,  854,  854,  854,
			  854,  854,    0,    0,    0,    0,  854,  854,  854,  854,
			  854,  854,  854,  854,  854,  854,    0,    0,  854,  854,
			  854,  854,  854,  854,  854,  854,  854,  854,  855,  855,
			  855,  855,  855,  855,  855,  855,  855,  855,  855,    0,
			    0,    0,    0,  855,  855,  855,  855,  855,  855,  855,
			  855,  855,  855,    0,    0,  855,  855,  855,  855,  855,
			  855,  855,  855,  855,  855,  856,  856,  856,  856,    0,
			  856,  856,  856,  856,  856,  856,  856,  856,  856,  856, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  856,  856,  856,    0,  856,  856,  856,  856,  856,  856,
			  856,  856,  856,  856,  856,  856,  856,    0,  856,  856,
			  856,  856,  856,  856,  856,  856,  856,  856,  857,  857,
			  857,  857,  857,  857,  857,    0,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  857,  857,  857,  857,  857,
			  857,  857,  858,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,    0,  858,  858,  858,  858,  858,  858,  858,

			  858,  858,  858,  858,  858,  858,  858,  858,  858,  858,
			  858,  858,  858,  858,  858,  859,    0,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			  859,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			    0,  859,  859,  859,  859,  859,  859,  859,  859,  859,
			  859,  860,  860,  860,  860,  860,  860,  860,  860,  860,
			  860,    0,    0,    0,    0,    0,  860,  860,  860,  860,
			  860,  860,  860,  860,  860,  860,    0,    0,  860,  860,
			  860,  860,  860,  860,  860,  860,  860,  860,  861,    0, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  861,  861,    0,    0,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,    0,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  861,  861,  861,  861,  861,  861,  861,  861,  861,
			  861,  862,    0,  862,    0,    0,    0,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  862,  862,  862,  862,  862,  862,
			  862,  862,  862,  862,  863,  863,  863,  863,  863,  863,
			  863,  863,  863,  863,  863,    0,    0,    0,    0,  863,

			  863,  863,  863,  863,  863,  863,  863,  863,  863,    0,
			    0,  863,  863,  863,  863,  863,  863,  863,  863,  863,
			  863,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  864,  864,  864,
			  864,  864,  864,  864,  864,  864,  864,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_chk_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  865,  865,  865,  865,  865,  865,  865,  865,  865,  865,
			  865,  865,  865,  866,  866,  866,  866,  866,  866,  866,
			  866,  866,  866,  866,    0,    0,    0,    0,  866,  866,
			  866,  866,  866,  866,  866,  866,  866,  866,    0,    0,
			  866,  866,  866,  866,  866,  866,  866,  866,  866,  866,
			  868,  868,  868,  868,  868,  868,  868,  868,  868,  868,
			  868,  868,    0,    0,    0,  868,  868,  868,  868,  868,
			  868,  868,  868,  868,  868,    0,    0,  868,  868,  868,
			  868,  868,  868,  868,  868,  868,  868,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,

			  869,  869,  869,  869,  869,  869,  869,    0,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  869,  869,  869,  869,  869,  869,  869,  869,
			  870,  870,  870,  870,  870,  870,  870,  870,  870,  870,
			    0,    0,    0,    0,    0,  870,  870,  870,  870,  870,
			  870,  870,  870,  870,  870,    0,    0,  870,  870,  870,
			  870,  870,  870,  870,  870,  870,  870,  871,  871,  871,
			  871,  871,  871,  871,  871,  871,  871,  871,  871,    0,
			    0,    0,  871,  871,  871,  871,  871,  871,  871,  871,
			  871,  871,    0,    0,  871,  871,  871,  871,  871,  871, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_chk_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  871,  871,  871,  871,  872,  872,  872,  872,  872,  872,
			  872,  872,  872,  872,  872,  872,    0,    0,    0,  872,
			  872,  872,  872,  872,  872,  872,  872,  872,  872,    0,
			    0,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			  872,  873,  873,  873,  873,  873,  873,  873,  873,  873,
			  873,  873,  873,    0,    0,    0,  873,  873,  873,  873,
			  873,  873,  873,  873,  873,  873,    0,    0,  873,  873,
			  873,  873,  873,  873,  873,  873,  873,  873,  874,  874,
			  874,  874,  874,  874,  874,  874,  874,  874,  874,  874,
			    0,    0,    0,  874,  874,  874,  874,  874,  874,  874,

			  874,  874,  874,    0,    0,  874,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  875,  875,  875,  875,  875,
			  875,  875,  875,  875,  875,  875,    0,    0,    0,    0,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  875,
			    0,    0,  875,  875,  875,  875,  875,  875,  875,  875,
			  875,  875,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  876,  876,  876,  876,  876,  877,  877, yy_Dummy>>,
			1, 200, 4600)
		end

	yy_chk_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  877,  877,  877,  877,  877,  877,
			  877,  877,  877,  877,  878,  878,  878,  878,  878,  878,
			    0,  878,  878,  878,  878,  878,  878,  878,  878,  878,
			  878,  878,  878,  878,    0,    0,  878,  878,  878,  878,
			  878,  878,  878,  878,  878,  878,  878,    0,    0,  878,
			  878,  878,  878,  878,  878,  878,  878,  878,  879,  879,
			  879,    0,  879,  879,    0,  879,  879,  879,  879,  879,

			  879,  879,  879,  879,  879,  879,  879,  879,    0,    0,
			  879,  879,  879,  879,  879,  879,  879,  879,  879,  879,
			  879,    0,    0,  879,  879,  879,  879,  879,  879,  879,
			  879,  879,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  880,  880,  880,  880,  880,  880,  880,  880,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881, yy_Dummy>>,
			1, 200, 4800)
		end

	yy_chk_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  881,  881,  881,  881,  881,  881,
			  881,  881,  881,  881,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  882,  882,  882,  882,  882,  882,  882,  882,  882,  882,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,

			  883,  883,  883,  883,  883,  883,  883,  883,  883,  883,
			  883,  883,  883,  883,  883,  883,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830, yy_Dummy>>,
			1, 200, 5000)
		end

	yy_chk_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  830,  830,  830,  830,  830,  830,  830,  830, yy_Dummy>>,
			1, 8, 5200)
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
			    0,    0,   91,  182,  273,  364,    0,  455,    0,   19,
			   39,  546,    0,  637,  728,  819,  910, 1001, 1092, 1183,
			 1274, 1365,    0,    4,   11,    7,    8, 1456,    0,  105,
			  124,   14,  158,   15,  104, 1547, 1638, 3836, 5116,   25,
			 5116, 3832,   66,  142,   13, 3764,   34, 3737,   53,   12,
			   88,   50,   78,  192,  205, 3804,  106, 3735,  129,   15,
			  135,  220,  232,  151, 1724, 3786,  142, 3732,  159,   30,
			  162,  247,  251, 5116, 5116,    0, 3798, 5116, 3783, 3743,
			 3741, 3735, 3746, 3745,  170, 5116, 3807, 3749,  178, 3722,
			  200,   48,  203,  295,  299, 5116, 5116,  218, 3774, 5116,

			  308, 5116,  233,  232, 3709,  249,   60,  252, 5116, 5116,
			 3791,  252, 5116,  674, 5116, 5116,  260, 3697,  263,  113,
			  266, 5116, 5116,  351,  648,  652,  571,  576,  663,  561,
			 3696,  588,  117,  591,  676,  681,  600,  605,   22, 5116,
			  696,  615,  682, 5116, 3721,  613, 3694,  623,  240,  626,
			  792,  830, 5116, 5116, 3692, 5116, 5116, 5116, 5116, 5116,
			  626,  687, 5116,  701,  720, 5116,  634, 3654,  661,  244,
			  671, 5116,   19, 5116,  764,  756,  789,  810, 5116, 5116,
			 5116,  798, 5116, 5116, 5116, 3733, 3677,  695, 3639,  754,
			  615,  775,   27, 5116,  777,  785, 3638,  788,  682,  797, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  902, 1808,   95, 3635, 3634, 3632,  806, 3624,  809,  715,
			  834,  878, 5116,  679, 3675,  844,  853,  858,  861,  864,
			  949,  953,  958,  879, 3621,  882,  720,  885, 3673,  885,
			  893,  896,  900,  903,  988,  927,  935, 3619,  938,  743,
			  941, 1894,  944, 3618,  947,  763,  950, 5116, 1980,  953,
			  966,  969,  972, 1057,    0, 3682, 5116, 3638,    0, 3639,
			 3624, 3622,  976,  984, 3612,  987,  924,  990, 5116, 3664,
			  990,  998, 1021, 1024, 1027, 1112, 3663, 1116, 5116, 1035,
			 1043, 3584, 1049, 1015, 1052, 5116, 1052, 1062, 3571, 1065,
			 1045, 1068, 1068, 1076, 1079, 1082, 1085, 5116, 1109, 1088,

			 3570, 1117, 1106, 1120, 2064, 1136, 3575, 3563, 3561, 1127,
			 3543, 1130, 1123, 1133, 1133, 1141, 1144, 1147, 1150, 1235,
			 1239, 1158, 1166, 3542, 1169, 1171, 1174, 2138, 1177, 3541,
			 1180, 1197, 1203, 1269, 2222, 1214, 3540, 1217, 1219, 1222,
			 1222, 1230, 1233, 1236, 1239, 1324, 2296, 1246, 3539, 1249,
			 1251, 1254, 1254, 1262, 3518, 1267, 1269, 1469, 1538, 1510,
			 1521, 1526, 1515, 3570, 1481, 1475, 1479, 1490, 1495, 1616,
			 1575, 1583, 5116, 3555, 1499, 1507, 3505, 1540, 1271, 1560,
			 1563, 1571, 3504, 1574, 1498, 1591, 1591, 1599, 1604, 1599,
			 1615, 1618, 1621, 3546, 3542, 3528, 1626, 1658, 1699, 1689, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1705, 1673, 3475, 3490, 5116, 1634, 1667, 1681, 1684, 1776,
			    0, 5116, 1687, 3436, 1724, 1544, 1733, 3447, 3437, 3479,
			 3478, 3434, 1755, 1736, 1739, 1755, 1763, 3488, 3449, 3436,
			  219, 1650, 5116, 1766, 1769, 5116, 1772, 1775, 1775, 1783,
			 1786, 1789, 1792, 1795, 1798, 1801, 1804, 1807, 1831, 5116,
			 3357, 3301, 3276,    0, 5116, 1834, 1837, 1841, 1849, 1852,
			 1855, 1858, 1861, 1864, 1871, 1874, 1877, 1880, 5116, 1883,
			 3266, 1886, 1582, 1889, 3267, 3267, 3309, 3306, 3262, 1946,
			 1894, 1917, 1920, 1923, 1930, 1933, 5116, 1936, 3248, 1939,
			 1624, 1942, 1968, 1945, 1957, 1960, 1963, 2074, 3310, 5116,

			 1966, 3238, 1976, 1689, 1980, 2023, 1989, 1992, 1995, 2021,
			 2031, 2034, 5116, 2037, 3226, 2040, 1827, 2043, 2054, 2046,
			 2049, 2052, 2062, 2085, 2088, 2091, 2094, 3245,   24, 3236,
			 5116, 2101, 2094, 2113, 2133, 5116, 2109, 2112, 5116, 2121,
			 2821, 2124, 2023, 2127, 2130, 2780, 2133, 2146, 2149, 2827,
			 2166, 2152, 2174, 2177, 2180, 2183, 2186, 2189, 2192, 2192,
			 2198, 2206, 2209, 2799, 2793, 2761, 2243, 2254, 2259, 2268,
			 2249, 2274, 5116, 5116, 2215, 2218, 5116, 2779, 2221, 2267,
			 2282, 2285, 2696, 2648, 5116, 5116, 2640, 5116, 2288, 2291,
			 5116, 2658, 2656, 2284, 2290, 2294, 2304, 2307, 2310, 2620, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2550, 2545, 2313, 2316, 2319, 2322, 2325, 2328, 2331, 2334,
			 2484, 2392, 5116, 5116, 2387, 5116, 2337, 2340, 2343, 2346,
			 2349, 2352, 5116, 2355, 2358, 2424, 2434, 2440, 2387, 2390,
			 2393, 2396, 5116, 2399, 2402, 2405, 2408, 2411, 2414, 5116,
			 2417, 2420, 2423, 2426, 2275, 2286, 2255, 2189, 2462, 2467,
			 2472, 2429, 2446, 2438, 2441, 2444, 2454, 2454, 2462, 2480,
			 2483, 2486, 2204, 2489, 2492, 2495, 2498, 2529, 2160, 2142,
			 2113, 2551, 2534, 2556, 2544, 2539, 2562, 5116, 2505, 2509,
			 5116, 2120, 2110, 2050, 2058, 2602, 2652, 1985, 1970, 1926,
			 2514, 2517, 5116, 1921, 1864, 2524, 2527, 5116, 1807, 1798,

			 2574, 2577, 2580, 2583, 1760, 1745, 1738, 1724, 2609, 2632,
			 2600, 2625, 5116, 2588, 2591, 2594, 2597, 1690, 2614, 1674,
			 1654, 1584, 2619, 2668, 2640, 2645, 2650, 2655, 5116, 5116,
			 1566, 1541, 2745, 1533, 2749, 1277, 1210, 1117, 5116, 5116,
			 5116, 1132, 1059,  954,  906, 2673, 2678, 2768, 2773,  905,
			 5116,  863,  833, 2735, 2692, 2697, 2742, 2747,  826,  827,
			 5116,  789,  768,    0,  746,  746,  726,  715, 2703, 2794,
			 2800, 5116,  703,  631, 2756, 2761, 2780,  604,  256,    0,
			  139,  153,  140, 5116,  140,  153,  146, 2793, 2798, 5116,
			  111, 2727, 2785, 2803, 5116, 5116,   77, 5116, 5116,   94, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 5116, 5116, 2735,   35, 2755, 2296, 2793, 2811,   25, 2814,
			 2446, 2817, 5116,    0, 5116, 2821, 2820, 2829, 2832, 2835,
			 2841, 2838, 2841, 2849, 2852, 5116, 2855, 2858, 2861, 2864,
			 5116, 2950, 2997, 3044, 3091, 3138, 3185, 3232, 3275, 3316,
			 3362, 3405, 3448, 3485, 3530, 3567, 3604, 3647, 3688, 3731,
			 3758, 3799, 3826, 3863, 3900, 3937, 3980, 4024, 4067, 4113,
			 4150, 4193, 4236, 4273, 4319, 4365, 4402, 3312, 4439, 4482,
			 4519, 4556, 4593, 4630, 4667, 4704, 4750, 4796, 4841, 4885,
			 4930, 4976, 5022, 5068, yy_Dummy>>,
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
			   57,   58,   59,   60,   59,   61,   59,   62,   63,   64,

			   65,   66,   67,   68,   42,   69,   42,   42,   70,   71,
			   72,   73,   74,   75,   76,   77,   78,   79,   80,   42,
			   81,   82,   42,   59,   83,   59,   59,   59,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,    1,    1,   87,   87,   87,   87,   87,   87, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   88,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   90,   91,   91,   91,   91,   91,   91,   91,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    3,    4,    5,    6,    7,    5,
			    8,    9,   10,    5,    5,    5,    5,    5,   11,   12,
			    5,   13,   14,   15,   16,   17,   18,   19,   20,   21,
			   22,   23,    5,   24,   25,   26,   26,   26,   26,   26,
			   26,   27,   28,   27,   27,   27,   27,   27,   27,   27,
			   29,   27,   30,   31,   32,   33,   34,   35,   36,   24,
			   37,   38,   26,   26,   26,   26,   26,   26,   27,   27,
			   27,   27,   27,   27,   39,   40,   27,   41,   42,   43,
			   44,   45,   46,   24,    1,    1,    1,   47,   47,   47,
			   47,   47, yy_Dummy>>)
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

	yyJam_base: INTEGER = 5116
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

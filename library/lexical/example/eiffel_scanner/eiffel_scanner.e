note

	description:

		"Scanners for Eiffel parsers"

	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class EIFFEL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	EIFFEL_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create

	make, execute, benchmark

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_STR)
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
--|#line 51 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 51")
end
-- Ignore separators
when 2 then
--|#line 52 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 52")
end
eif_lineno := eif_lineno + text_count
when 3 then
--|#line 57 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 57")
end
-- Ignore comments
when 4 then
--|#line 58 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 58")
end
eif_lineno := eif_lineno + 1
when 5 then
--|#line 63 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 63")
end
last_token := Minus_code
when 6 then
--|#line 64 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 64")
end
last_token := Plus_code
when 7 then
--|#line 65 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 65")
end
last_token := Star_code
when 8 then
--|#line 66 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 66")
end
last_token := Slash_code
when 9 then
--|#line 67 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 67")
end
last_token := Caret_code
when 10 then
--|#line 68 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 68")
end
last_token := Equal_code
when 11 then
--|#line 69 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 69")
end
last_token := Greater_than_code
when 12 then
--|#line 70 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 70")
end
last_token := Less_than_code
when 13 then
--|#line 71 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 71")
end
last_token := Dot_code
when 14 then
--|#line 72 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 72")
end
last_token := Semicolon_code
when 15 then
--|#line 73 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 73")
end
last_token := Comma_code
when 16 then
--|#line 74 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 74")
end
last_token := Colon_code
when 17 then
--|#line 75 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 75")
end
last_token := Exclamation_code
when 18 then
--|#line 76 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 76")
end
last_token := Left_parenthesis_code
when 19 then
--|#line 77 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 77")
end
last_token := Right_parenthesis_code
when 20 then
--|#line 78 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 78")
end
last_token := Left_brace_code
when 21 then
--|#line 79 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 79")
end
last_token := Right_brace_code
when 22 then
--|#line 80 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 80")
end
last_token := Left_bracket_code
when 23 then
--|#line 81 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 81")
end
last_token := Right_bracket_code
when 24 then
--|#line 82 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 82")
end
last_token := Dollar_code
when 25 then
--|#line 83 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 83")
end
last_token := Question_mark_code
when 26 then
--|#line 84 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 84")
end
last_token := E_DIV
when 27 then
--|#line 85 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 85")
end
last_token := E_MOD
when 28 then
--|#line 86 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 86")
end
last_token := E_NE
when 29 then
--|#line 87 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 87")
end
last_token := E_GE
when 30 then
--|#line 88 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 88")
end
last_token := E_LE
when 31 then
--|#line 89 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 89")
end
last_token := E_BANGBANG
when 32 then
--|#line 90 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 90")
end
last_token := E_ARROW
when 33 then
--|#line 91 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 91")
end
last_token := E_DOTDOT
when 34 then
--|#line 92 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 92")
end
last_token := E_LARRAY
when 35 then
--|#line 93 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 93")
end
last_token := E_RARRAY
when 36 then
--|#line 94 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 94")
end
last_token := E_ASSIGN
when 37 then
--|#line 95 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 95")
end
last_token := E_REVERSE
when 38 then
--|#line 100 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 100")
end
last_token := E_ALIAS
when 39 then
--|#line 101 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 101")
end
last_token := E_ALL
when 40 then
--|#line 102 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 102")
end
last_token := E_AND
when 41 then
--|#line 103 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 103")
end
last_token := E_AS
when 42 then
--|#line 104 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 104")
end
last_token := E_BITTYPE
when 43 then
--|#line 105 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 105")
end
last_token := E_CHECK
when 44 then
--|#line 106 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 106")
end
last_token := E_CLASS
when 45 then
--|#line 107 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 107")
end

										if create_keyword then
											last_token := E_CREATE
										else
											last_token := E_IDENTIFIER
											last_detachable_string_value := text
										end
									
when 46 then
--|#line 115 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 115")
end
last_token := E_CREATION
when 47 then
--|#line 116 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 116")
end
last_token := E_CURRENT
when 48 then
--|#line 117 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 117")
end
last_token := E_DEBUG
when 49 then
--|#line 118 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 118")
end
last_token := E_DEFERRED
when 50 then
--|#line 119 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 119")
end
last_token := E_DO
when 51 then
--|#line 120 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 120")
end
last_token := E_ELSE
when 52 then
--|#line 121 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 121")
end
last_token := E_ELSEIF
when 53 then
--|#line 122 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 122")
end
last_token := E_END
when 54 then
--|#line 123 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 123")
end
last_token := E_ENSURE
when 55 then
--|#line 124 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 124")
end
last_token := E_EXPANDED
when 56 then
--|#line 125 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 125")
end
last_token := E_EXPORT
when 57 then
--|#line 126 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 126")
end
last_token := E_EXTERNAL
when 58 then
--|#line 127 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 127")
end
last_token := E_FALSE
when 59 then
--|#line 128 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 128")
end
last_token := E_FEATURE
when 60 then
--|#line 129 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 129")
end
last_token := E_FROM
when 61 then
--|#line 130 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 130")
end
last_token := E_FROZEN
when 62 then
--|#line 131 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 131")
end
last_token := E_IF
when 63 then
--|#line 132 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 132")
end
last_token := E_IMPLIES
when 64 then
--|#line 133 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 133")
end
last_token := E_INDEXING
when 65 then
--|#line 134 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 134")
end

										is_operator := True
										last_token := E_INFIX
									
when 66 then
--|#line 138 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 138")
end
last_token := E_INHERIT
when 67 then
--|#line 139 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 139")
end
last_token := E_INSPECT
when 68 then
--|#line 140 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 140")
end
last_token := E_INVARIANT
when 69 then
--|#line 141 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 141")
end
last_token := E_IS
when 70 then
--|#line 142 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 142")
end
last_token := E_LIKE
when 71 then
--|#line 143 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 143")
end
last_token := E_LOCAL
when 72 then
--|#line 144 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 144")
end
last_token := E_LOOP
when 73 then
--|#line 145 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 145")
end
last_token := E_NOT
when 74 then
--|#line 146 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 146")
end
last_token := E_NOTE
when 75 then
--|#line 147 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 147")
end
last_token := E_OBSOLETE
when 76 then
--|#line 148 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 148")
end
last_token := E_OLD
when 77 then
--|#line 149 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 149")
end
last_token := E_ONCE
when 78 then
--|#line 150 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 150")
end
last_token := E_OR
when 79 then
--|#line 151 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 151")
end
last_token := E_PRECURSOR
when 80 then
--|#line 152 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 152")
end

										is_operator := True
										last_token := E_PREFIX
									
when 81 then
--|#line 156 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 156")
end
last_token := E_REDEFINE
when 82 then
--|#line 157 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 157")
end
last_token := E_RENAME
when 83 then
--|#line 158 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 158")
end
last_token := E_REQUIRE
when 84 then
--|#line 159 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 159")
end
last_token := E_RESCUE
when 85 then
--|#line 160 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 160")
end
last_token := E_RESULT
when 86 then
--|#line 161 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 161")
end
last_token := E_RETRY
when 87 then
--|#line 162 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 162")
end
last_token := E_SELECT
when 88 then
--|#line 163 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 163")
end
last_token := E_SEPARATE
when 89 then
--|#line 164 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 164")
end
last_token := E_STRIP
when 90 then
--|#line 165 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 165")
end
last_token := E_THEN
when 91 then
--|#line 166 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 166")
end
last_token := E_TRUE
when 92 then
--|#line 167 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 167")
end
last_token := E_UNDEFINE
when 93 then
--|#line 168 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 168")
end
last_token := E_UNIQUE
when 94 then
--|#line 169 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 169")
end
last_token := E_UNTIL
when 95 then
--|#line 170 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 170")
end
last_token := E_VARIANT
when 96 then
--|#line 171 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 171")
end
last_token := E_WHEN
when 97 then
--|#line 172 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 172")
end
last_token := E_XOR
when 98 then
--|#line 177 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 177")
end

				last_token := E_IDENTIFIER
				last_detachable_string_value := text
			
when 99 then
--|#line 185 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 185")
end

				last_token := E_FREEOP
				last_detachable_string_value := text
			
when 100 then
--|#line 196 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 196")
end
last_token := E_CHARACTER; last_character_value := text_item (2)
when 101 then
--|#line 199 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 199")
end
last_token := E_CHARACTER; last_character_value := '%''
when 102 then
--|#line 200 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 200")
end
last_token := E_CHARACTER; last_character_value := '%A'
when 103 then
--|#line 201 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 201")
end
last_token := E_CHARACTER; last_character_value := '%B'
when 104 then
--|#line 202 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 202")
end
last_token := E_CHARACTER; last_character_value := '%C'
when 105 then
--|#line 203 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 203")
end
last_token := E_CHARACTER; last_character_value := '%D'
when 106 then
--|#line 204 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 204")
end
last_token := E_CHARACTER; last_character_value := '%F'
when 107 then
--|#line 205 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 205")
end
last_token := E_CHARACTER; last_character_value := '%H'
when 108 then
--|#line 206 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 206")
end
last_token := E_CHARACTER; last_character_value := '%L'
when 109 then
--|#line 207 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 207")
end
last_token := E_CHARACTER; last_character_value := '%N'
when 110 then
--|#line 208 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 208")
end
last_token := E_CHARACTER; last_character_value := '%Q'
when 111 then
--|#line 209 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 209")
end
last_token := E_CHARACTER; last_character_value := '%R'
when 112 then
--|#line 210 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 210")
end
last_token := E_CHARACTER; last_character_value := '%S'
when 113 then
--|#line 211 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 211")
end
last_token := E_CHARACTER; last_character_value := '%T'
when 114 then
--|#line 212 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 212")
end
last_token := E_CHARACTER; last_character_value := '%U'
when 115 then
--|#line 213 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 213")
end
last_token := E_CHARACTER; last_character_value := '%V'
when 116 then
--|#line 214 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 214")
end
last_token := E_CHARACTER; last_character_value := '%%'
when 117 then
--|#line 215 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 215")
end
last_token := E_CHARACTER; last_character_value := '%''
when 118 then
--|#line 216 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 216")
end
last_token := E_CHARACTER; last_character_value := '%"'
when 119 then
--|#line 217 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 217")
end
last_token := E_CHARACTER; last_character_value := '%('
when 120 then
--|#line 218 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 218")
end
last_token := E_CHARACTER; last_character_value := '%)'
when 121 then
--|#line 219 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 219")
end
last_token := E_CHARACTER; last_character_value := '%<'
when 122 then
--|#line 220 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 220")
end
last_token := E_CHARACTER; last_character_value := '%>'
when 123 then
--|#line 221 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 221")
end

						code_ := text_substring (4, text_count - 2).to_integer
						if code_ > Platform.Maximum_character_code then
							last_token := E_CHARERR
						else
							last_token := E_CHARACTER
							last_character_value := INTEGER_.to_character (code_)
						end
					
when 124 then
--|#line 232 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 232")
end
last_token := E_CHARACTER; last_character_value := text_item (3)
when 125, 126 then
--|#line 234 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 234")
end
last_token := E_CHARERR	-- Catch-all rules (no backing up)
when 127 then
--|#line 240 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 240")
end
last_token := process_operator (E_STRPLUS)
when 128 then
--|#line 241 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 241")
end
last_token := process_operator (E_STRMINUS)
when 129 then
--|#line 242 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 242")
end
last_token := process_operator (E_STRSTAR)
when 130 then
--|#line 243 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 243")
end
last_token := process_operator (E_STRSLASH)
when 131 then
--|#line 244 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 244")
end
last_token := process_operator (E_STRDIV)
when 132 then
--|#line 245 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 245")
end
last_token := process_operator (E_STRMOD)
when 133 then
--|#line 246 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 246")
end
last_token := process_operator (E_STRPOWER)
when 134 then
--|#line 247 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 247")
end
last_token := process_operator (E_STRLT)
when 135 then
--|#line 248 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 248")
end
last_token := process_operator (E_STRLE)
when 136 then
--|#line 249 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 249")
end
last_token := process_operator (E_STRGT)
when 137 then
--|#line 250 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 250")
end
last_token := process_operator (E_STRGE)
when 138 then
--|#line 251 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 251")
end
last_token := process_operator (E_STRNOT)
when 139 then
--|#line 252 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 252")
end
last_token := process_operator (E_STRAND)
when 140 then
--|#line 253 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 253")
end
last_token := process_operator (E_STROR)
when 141 then
--|#line 254 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 254")
end
last_token := process_operator (E_STRXOR)
when 142 then
--|#line 255 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 255")
end
last_token := process_operator (E_STRANDTHEN)
when 143 then
--|#line 256 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 256")
end
last_token := process_operator (E_STRORELSE)
when 144 then
--|#line 257 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 257")
end
last_token := process_operator (E_STRIMPLIES)
when 145 then
--|#line 258 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 258")
end

			if is_operator then
				is_operator := False
				last_token := E_STRFREEOP
			else
				last_token := E_STRING
			end
			last_detachable_string_value := text_substring (2, text_count - 1)
		
when 146 then
--|#line 267 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 267")
end

				last_token := E_STRING
				last_detachable_string_value := text_substring (2, text_count - 1)
			
when 147 then
--|#line 271 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 271")
end

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 148 then
--|#line 277 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 277")
end
eif_buffer.append_string (text)
when 149 then
--|#line 278 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 278")
end
eif_buffer.append_character ('%A')
when 150 then
--|#line 279 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 279")
end
eif_buffer.append_character ('%B')
when 151 then
--|#line 280 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 280")
end
eif_buffer.append_character ('%C')
when 152 then
--|#line 281 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 281")
end
eif_buffer.append_character ('%D')
when 153 then
--|#line 282 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 282")
end
eif_buffer.append_character ('%F')
when 154 then
--|#line 283 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 283")
end
eif_buffer.append_character ('%H')
when 155 then
--|#line 284 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 284")
end
eif_buffer.append_character ('%L')
when 156 then
--|#line 285 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 285")
end
eif_buffer.append_character ('%N')
when 157 then
--|#line 286 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 286")
end
eif_buffer.append_character ('%Q')
when 158 then
--|#line 287 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 287")
end
eif_buffer.append_character ('%R')
when 159 then
--|#line 288 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 288")
end
eif_buffer.append_character ('%S')
when 160 then
--|#line 289 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 289")
end
eif_buffer.append_character ('%T')
when 161 then
--|#line 290 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 290")
end
eif_buffer.append_character ('%U')
when 162 then
--|#line 291 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 291")
end
eif_buffer.append_character ('%V')
when 163 then
--|#line 292 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 292")
end
eif_buffer.append_character ('%%')
when 164 then
--|#line 293 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 293")
end
eif_buffer.append_character ('%'')
when 165 then
--|#line 294 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 294")
end
eif_buffer.append_character ('%"')
when 166 then
--|#line 295 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 295")
end
eif_buffer.append_character ('%(')
when 167 then
--|#line 296 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 296")
end
eif_buffer.append_character ('%)')
when 168 then
--|#line 297 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 297")
end
eif_buffer.append_character ('%<')
when 169 then
--|#line 298 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 298")
end
eif_buffer.append_character ('%>')
when 170 then
--|#line 299 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 299")
end

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := E_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		
when 171 then
--|#line 312 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 312")
end
eif_lineno := eif_lineno + 1
when 172 then
--|#line 313 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 313")
end

			last_token := E_STRING
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			create str_.make (eif_buffer.count)
			str_.append_string (eif_buffer)
			eif_buffer.wipe_out
			last_detachable_string_value := str_
			set_start_condition (INITIAL)
		
when 173 then
--|#line 326 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 326")
end
eif_buffer.append_character (text_item (2))
when 174, 175, 176 then
--|#line 328 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 328")
end
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
when 177 then
--|#line 339 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 339")
end
last_token := E_BIT; last_detachable_string_value := text
when 178 then
--|#line 344 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 344")
end

						last_token := E_INTEGER
						last_integer_value := text.to_integer
					
when 179 then
--|#line 348 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 348")
end

						last_token := E_INTEGER
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end 
							i_ := i_ + 1
						end
						last_integer_value := eif_buffer.to_integer
						eif_buffer.wipe_out
					
when 180 then
--|#line 362 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 362")
end
last_token := E_INTERR	-- Catch-all rule (no backing up)
when 181 then
	yy_end := yy_end - 1
--|#line 367 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 367")
end

						last_token := E_REAL
						last_double_value := text.to_double
					
when 182, 183 then
--|#line 368 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 368")
end

						last_token := E_REAL
						last_double_value := text.to_double
					
when 184 then
	yy_end := yy_end - 1
--|#line 373 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 373")
end

						last_token := E_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_double_value := eif_buffer.to_double
						eif_buffer.wipe_out
					
when 185, 186 then
--|#line 374 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 374")
end

						last_token := E_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_double_value := eif_buffer.to_double
						eif_buffer.wipe_out
					
when 187 then
--|#line 397 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 397")
end
last_token := text_item (1).code
when 188 then
--|#line 0 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 0")
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
			inspect yy_sc
when 0 then
--|#line 396 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 396")
end
terminate
when 1 then
--|#line 331 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 331")
end
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1052)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			an_array.area.fill_with (537, 1000, 1052)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,    7,    8,    7,    9,   10,   11,   12,    6,   13,
			   14,   15,   16,   17,   18,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   36,   37,   36,   36,   38,   36,   39,
			   40,   41,   36,   42,   43,   44,   45,   46,   47,   48,
			   36,   36,   49,   50,   51,   52,   53,   30,   31,   32,
			   33,   35,   36,   38,   39,   36,   42,   43,   44,   45,
			   46,   54,   55,    6,   57,   57,  173,   58,   58,  436,
			   59,   59,   60,  437,   60,   64,   65,   81,   82,   83,
			   87,  109,   66,   67,  174,   68,   88,   69,   84,   95,

			   96,  110,   70,  121,   71,   85,   72,   86,   86,  122,
			   89,  135,   90,   91,   73,   89,  130,   91,   91,   74,
			   75,   92,   97,   98,   60,  128,   60,   64,  132,   76,
			  100,  131,  101,   77,  102,   78,  105,   72,  133,  103,
			  106,  111,  135,  112,   74,  136,  107,  114,  128,  108,
			   93,  115,   92,  113,  131,   93,  134,  132,  101,  102,
			  178,  133,  103,  117,  116,  105,  106,  111,  112,  107,
			  118,  119,  108,  124,  136,   64,  120,  175,  114,  139,
			  139,  134,   63,  125,   63,  126,  167,  116,  171,  127,
			   64,  430,   64,  117,   64,  176,  119,   64,  223,  120, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  172,  535,  215,  215,  124,  270,  270,  227,  230,  125,
			  126,  222,  127,  180,  216,  219,  219,  139,  143,  144,
			  143,  223,  145,  379,  177,  146,  147,  148,  149,  179,
			  227,  230,  181,  355,  150,   89,  180,  218,  218,  151,
			  182,  152,  222,  153,  154,  155,  156,  225,  157,  177,
			  158,  361,  220,  139,  159,  221,  160,  247,  355,  161,
			  162,  163,  164,  165,  166,  187,  235,  372,  188,  189,
			  190,  191,  527,  211,  211,   93,  361,  192,  225,  228,
			  247,  221,  193,  229,  194,  212,  195,  196,  197,  198,
			  233,  199,  235,  200,  234,  236,  248,  201,   89,  202,

			  217,  218,  203,  204,  205,  206,  207,  208,  231,   92,
			  228,  213,  239,  229,  240,  330,  241,  234,  249,  248,
			  245,  250,  277,  232,  278,  259,  236,  242,  331,  257,
			  243,  261,  246,  258,   64,  265,  267,   64,   93,  231,
			   92,  139,  139,  239,  240,  241,  232,  252,  259,  249,
			  242,  245,  250,  243,  261,  257,  262,  253,  265,  267,
			  254,  263,  255,  256,  268,  144,  268,  144,   64,  144,
			  275,   64,  264,  210,  269,  210,  526,  276,  252,  139,
			  281,  524,  253,  254,  316,  255,  256,  262,  523,  287,
			  287,  522,  274,  304,  304,  264,  305,   64,  305,  317, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  276,  306,  306,  307,  307,  212,  308,  308,  311,  279,
			  311,  315,  315,  312,  312,  316,  318,   89,  309,  313,
			  314,  319,   89,  274,  314,  314,  421,  320,   92,  325,
			  317,  213,  279,  321,  337,  324,  521,  339,  328,  318,
			  329,  332,  344,  326,  310,  345,  347,  348,  349,  139,
			  320,  351,  319,  353,  520,  358,  321,   93,  324,   92,
			  325,  328,   93,  329,   64,  337,  350,  332,  339,  363,
			  348,  364,   64,  344,  351,  345,  518,  347,  358,  349,
			  268,  144,  268,  496,  353,  362,  270,  270,  487,  350,
			  369,  287,  287,  370,  370,  485,  365,  367,  306,  306,

			  371,  371,  373,  373,  484,  212,  374,  374,  375,  391,
			  375,  377,  377,  376,  376,  312,  312,  382,  309,  378,
			  378,  380,  365,  313,  314,  380,  384,  314,  314,  381,
			  381,  213,   92,  385,  391,  388,  390,  392,  372,  393,
			  382,  395,   64,  400,  310,  402,  403,  404,  405,  384,
			  407,  410,  411,  413,  414,  416,  385,  379,  388,  390,
			  392,  139,  393,   92,  395,  139,  400,  139,  402,  417,
			  418,  405,  403,  404,  410,  419,   64,  414,  411,  482,
			  407,  463,  420,  462,  413,  416,  370,  370,  425,  425,
			  426,  426,  417,  427,  427,  440,  418,  438,  424,  428, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  428,  376,  376,  429,  429,  420,  419,  439,  422,  431,
			  431,  309,  432,  432,  433,  433,  428,  428,  435,  443,
			  139,  139,  438,  442,  444,  440,  372,   64,  434,  445,
			  439,  446,  450,  461,  422,  464,  453,  310,  457,  459,
			   64,  430,  443,  460,   64,  470,  470,  469,  469,  444,
			  379,  471,  445,  483,  442,  465,  446,  458,   93,  453,
			  464,  457,  459,  450,  461,  466,  460,  468,  486,  468,
			  428,  428,  469,  469,  473,  473,  483,  213,  474,  474,
			  475,  475,  472,  467,  465,  372,  476,  476,  477,  477,
			  478,  488,  478,  480,  480,  476,  476,  489,  490,  486,

			  491,  492,  493,  494,  495,  481,  467,  497,  498,   64,
			   64,  499,  430,   64,  488,  469,  469,  469,  469,  503,
			  503,  490,  489,  491,  379,  493,  494,  507,  507,  495,
			  497,  509,  492,  498,  499,  500,  517,  504,  502,  504,
			  508,  508,  505,  505,  506,  515,  506,  514,  501,  507,
			  507,  476,  476,  510,  510,  476,  476,  310,  511,  511,
			  516,  512,  517,  512,  519,  430,  513,  513,   64,  533,
			  509,  501,  514,  505,  505,  456,  515,  528,  528,  507,
			  507,  507,  507,  529,  529,  475,  475,  534,  530,  519,
			  530,  516,  533,  531,  531,  455,  310,  509,  513,  513, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  532,  532,  525,  503,  503,  531,  531,  536,  536,  454,
			  534,  510,  510,  529,  529,  372,   56,   56,   56,   56,
			   56,   56,  452,  310,  451,   63,  449,  525,   63,   63,
			   63,   79,   79,   79,  448,  447,  441,  423,  379,  140,
			  415,  372,  140,  140,  140,  430,  412,  409,  408,  379,
			   80,  430,   80,   80,   80,   80,  142,  142,  142,  142,
			  142,  142,   65,  406,  401,   65,   65,   65,  184,  399,
			  184,  184,  184,  184,  186,  398,  186,  186,  186,  186,
			   83,   83,   83,   83,   83,   83,  214,  214,  214,  397,
			  214,  214,  479,  479,  479,  396,  479,  479,  394,  389,

			  387,  386,  383,  368,  366,  360,  359,  357,  356,  354,
			  352,  346,  343,  342,  341,  340,  338,  336,  335,  334,
			  333,  327,  323,  322,  303,  302,  301,  300,  299,  298,
			  297,  296,  295,  294,  293,  292,  291,  290,  289,  288,
			  286,  285,  284,  283,  282,  281,  280,  273,  272,  271,
			  141,  266,  260,  251,  244,  238,  237,  226,  224,  210,
			  209,  185,  183,  170,  169,  168,   64,   61,  141,  138,
			  137,  129,  123,  104,   99,   94,   62,   61,  537,    5,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1052)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			an_array.area.fill_with (537, 1000, 1052)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    4,   70,    3,    4,  385,
			    3,    4,    7,  385,    7,   10,   10,   13,   13,   19,
			   21,   33,   10,   10,   70,   10,   21,   10,   19,   26,

			   26,   33,   10,   38,   10,   20,   10,   20,   20,   38,
			   22,   46,   22,   22,   10,   23,   43,   23,   23,   10,
			   10,   22,   28,   28,   60,   41,   60,   73,   44,   10,
			  542,   43,   30,   10,   30,   10,   32,   10,   44,   30,
			   32,   34,   46,   34,   10,   47,   32,   35,   41,   32,
			   22,   35,   22,   34,   43,   23,   45,   44,   30,   30,
			   73,   44,   30,   37,   35,   32,   32,   34,   34,   32,
			   37,   37,   32,   40,   47,   75,   37,   71,   35,   53,
			   53,   45,   65,   40,   65,   40,   65,   35,   69,   40,
			   72,  529,   77,   37,   74,   71,   37,   76,  104,   37, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   69,  525,   89,   89,   40,  150,  150,  108,  111,   40,
			   40,  102,   40,   75,   89,   93,   93,   53,   59,   59,
			   59,  104,   59,  510,   72,   59,   59,   59,   59,   74,
			  108,  111,   76,  260,   59,   91,   75,   91,   91,   59,
			   77,   59,  102,   59,   59,   59,   59,  106,   59,   72,
			   59,  266,  101,   93,   59,  101,   59,  123,  260,   59,
			   59,   59,   59,   59,   59,   81,  114,  503,   81,   81,
			   81,   81,  502,   86,   86,   91,  266,   81,  106,  109,
			  123,  101,   81,  109,   81,   86,   81,   81,   81,   81,
			  113,   81,  114,   81,  113,  115,  124,   81,   90,   81,

			   90,   90,   81,   81,   81,   81,   81,   81,  112,   90,
			  109,   86,  119,  109,  119,  237,  119,  113,  125,  124,
			  122,  126,  180,  112,  180,  131,  115,  119,  237,  130,
			  119,  133,  122,  130,  178,  135,  137,  179,   90,  112,
			   90,  139,  139,  119,  119,  119,  112,  129,  131,  125,
			  119,  122,  126,  119,  133,  130,  134,  129,  135,  137,
			  129,  134,  129,  129,  143,  143,  143,  144,  177,  144,
			  178,  181,  134,  210,  144,  210,  501,  179,  129,  139,
			  192,  498,  129,  129,  220,  129,  129,  134,  497,  192,
			  192,  495,  177,  211,  211,  134,  212,  365,  212,  224, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  179,  212,  212,  213,  213,  211,  215,  215,  216,  181,
			  216,  219,  219,  216,  216,  220,  225,  217,  215,  217,
			  217,  226,  218,  177,  218,  218,  365,  227,  217,  233,
			  224,  211,  181,  228,  243,  232,  494,  245,  235,  225,
			  236,  238,  251,  233,  215,  251,  253,  254,  255,  219,
			  227,  256,  226,  258,  493,  263,  228,  217,  232,  217,
			  233,  235,  218,  236,  275,  243,  255,  238,  245,  274,
			  254,  274,  277,  251,  256,  251,  489,  253,  263,  255,
			  268,  268,  268,  457,  258,  270,  270,  270,  445,  255,
			  287,  287,  287,  304,  304,  442,  275,  277,  305,  305,

			  306,  306,  307,  307,  439,  304,  308,  308,  309,  325,
			  309,  310,  310,  309,  309,  311,  311,  316,  308,  312,
			  312,  313,  275,  313,  313,  314,  318,  314,  314,  315,
			  315,  304,  313,  319,  325,  322,  324,  326,  306,  327,
			  316,  329,  363,  335,  308,  337,  339,  342,  344,  318,
			  346,  349,  350,  352,  353,  357,  319,  312,  322,  324,
			  326,  313,  327,  313,  329,  314,  335,  315,  337,  358,
			  359,  344,  339,  342,  349,  360,  367,  353,  350,  437,
			  346,  417,  363,  416,  352,  357,  370,  370,  371,  371,
			  372,  372,  358,  373,  373,  389,  359,  386,  370,  374, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  374,  375,  375,  376,  376,  363,  360,  388,  367,  377,
			  377,  374,  378,  378,  379,  379,  380,  380,  381,  392,
			  381,  381,  386,  391,  393,  389,  371,  420,  380,  395,
			  388,  396,  401,  414,  367,  419,  405,  374,  409,  411,
			  421,  376,  392,  413,  422,  426,  426,  425,  425,  393,
			  378,  427,  395,  438,  391,  420,  396,  410,  381,  405,
			  419,  409,  411,  401,  414,  421,  413,  424,  444,  424,
			  428,  428,  424,  424,  429,  429,  438,  427,  430,  430,
			  431,  431,  428,  422,  420,  425,  432,  432,  433,  433,
			  434,  447,  434,  435,  435,  434,  434,  448,  449,  444,

			  450,  451,  452,  453,  455,  435,  422,  461,  462,  466,
			  465,  464,  429,  467,  447,  468,  468,  469,  469,  470,
			  470,  449,  448,  450,  432,  452,  453,  473,  473,  455,
			  461,  475,  451,  462,  464,  465,  486,  471,  467,  471,
			  474,  474,  471,  471,  472,  484,  472,  482,  466,  472,
			  472,  476,  476,  477,  477,  478,  478,  475,  480,  480,
			  485,  481,  486,  481,  492,  473,  481,  481,  500,  519,
			  480,  466,  482,  504,  504,  408,  484,  505,  505,  506,
			  506,  507,  507,  508,  508,  511,  511,  521,  509,  492,
			  509,  485,  519,  509,  509,  407,  480,  511,  512,  512, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  513,  513,  500,  528,  528,  530,  530,  531,  531,  406,
			  521,  532,  532,  536,  536,  505,  538,  538,  538,  538,
			  538,  538,  404,  511,  402,  539,  400,  500,  539,  539,
			  539,  540,  540,  540,  398,  397,  390,  369,  513,  543,
			  354,  528,  543,  543,  543,  531,  351,  348,  347,  532,
			  541,  536,  541,  541,  541,  541,  544,  544,  544,  544,
			  544,  544,  545,  345,  336,  545,  545,  545,  546,  334,
			  546,  546,  546,  546,  547,  333,  547,  547,  547,  547,
			  548,  548,  548,  548,  548,  548,  549,  549,  549,  332,
			  549,  549,  550,  550,  550,  331,  550,  550,  328,  323,

			  321,  320,  317,  279,  276,  265,  264,  262,  261,  259,
			  257,  252,  250,  248,  247,  246,  244,  242,  241,  240,
			  239,  234,  230,  229,  208,  207,  206,  205,  204,  203,
			  202,  201,  200,  199,  198,  197,  196,  195,  194,  193,
			  191,  190,  189,  188,  187,  186,  182,  176,  174,  172,
			  140,  136,  132,  128,  121,  118,  116,  107,  105,   83,
			   82,   80,   78,   68,   67,   66,   63,   61,   56,   50,
			   48,   42,   39,   31,   29,   24,    9,    8,    5,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 550)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   72,   73,  978,  979,   81,  975,  972,
			   80,    0,  979,   79,  979,  979,  979,  979,  979,   74,
			   89,   73,   94,   99,  952,  979,   77,  979,   99,  951,
			   95,  939,  103,   61,  104,  121,    0,  132,   69,  932,
			  146,   82,  941,   86,   95,  117,   85,  112,  930,  979,
			  916,  979,  979,  161,  979,  979,  963,  979,  979,  217,
			  123,  965,  979,  961,  979,  181,  960,  959,  958,  183,
			   71,  172,  185,  122,  189,  170,  192,  187,  957,    0,
			  952,  260,  951,  957,  979,  979,  255,  979,  979,  184,
			  282,  219,  979,  197,  979,  979,  979,  979,  979,  979,

			    0,  218,  182,    0,  153,  928,  221,  927,  164,  252,
			    0,  164,  279,  249,  229,  269,  916,    0,  914,  283,
			    0,  918,  292,  212,  252,  289,  293,    0,  923,  318,
			  292,  282,  922,  285,  327,  292,  921,  293,  979,  323,
			  945,  979,  979,  363,  366,  979,  979,  979,  979,  979,
			  187,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  944,  979,  943,  979,  942,  363,  329,  332,
			  319,  366,  941,  979,  979,  979,  936,  935,  934,  933,
			  932,  931,  371,  930,  929,  928,  927,  926,  925,  924, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  923,  922,  921,  920,  919,  918,  917,  916,  915,  979,
			  372,  375,  383,  385,  979,  388,  395,  401,  406,  393,
			  358,    0,    0,    0,  371,  372,  395,  384,  387,  893,
			  892,    0,  389,  403,  891,  394,  395,  277,  404,  890,
			  885,  888,  876,  408,  886,  411,  874,  884,  873,    0,
			  882,  414,  881,  420,  401,  420,  408,  880,  427,  875,
			  194,  878,  877,  413,  872,  871,  212,    0,  479,  979,
			  468,  979,  979,  979,  466,  459,  899,  467,  979,  898,
			  979,  979,  979,  979,  979,  979,  979,  473,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  979,

			  979,  979,  979,  979,  475,  480,  482,  484,  488,  495,
			  493,  497,  501,  505,  509,  511,  473,  866,  482,  488,
			  871,  868,  492,  865,  493,  470,  494,  496,  868,  495,
			    0,  865,  855,  826,  820,  500,  834,  502,    0,  509,
			    0,    0,  510,    0,  502,  829,  519,  810,  813,  505,
			  515,  796,  525,  511,  799,    0,    0,  524,  523,  533,
			  549,    0,  979,  537,  979,  392,  979,  571,  979,  828,
			  568,  570,  572,  575,  581,  583,  585,  591,  594,  596,
			  598,  602,    0,    0,    0,   49,  558,    0,  564,  564,
			  806,  594,  574,  585,    0,  586,  592,  805,  800,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  792,  604,  790,    0,  792,  593,  760,  761,  745,  595,
			  627,  594,    0,  598,  607,    0,  549,  551,    0,  596,
			  622,  635,  639,  979,  654,  629,  627,  621,  652,  656,
			  660,  662,  668,  670,  677,  675,    0,  539,  608,  474,
			    0,    0,  465,    0,  642,  458,    0,  647,  658,  653,
			  655,  675,  657,  659,    0,  665,    0,  453,    0,    0,
			    0,  662,  669,    0,  666,  705,  704,  708,  697,  699,
			  701,  724,  731,  709,  722,  701,  733,  735,  737,  979,
			  740,  748,  708,    0,  716,  731,  699,    0,    0,  444,
			    0,    0,  725,  424,  396,  361,    0,  358,  351,    0,

			  763,  371,  267,  211,  755,  759,  761,  763,  765,  775,
			  167,  767,  780,  782,    0,    0,    0,    0,    0,  724,
			    0,  744,    0,    0,    0,  196,  979,  979,  785,  135,
			  787,  789,  793,    0,    0,  979,  795,  979,  815,  824,
			  827,  849,  125,  838,  855,  861,  867,  873,  879,  885,
			  891, yy_Dummy>>,
			1, 151, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 550)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  537,    1,  538,  538,  537,  537,  537,  537,  537,
			  539,  540,  537,  541,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  537,
			  537,  537,  537,  537,  537,  537,  543,  537,  537,  544,
			  537,  537,  537,  539,  537,  545,  539,  539,  539,  539,
			  539,  539,  539,  539,  539,  539,  539,  539,  539,  540,
			  546,  547,  546,  548,  537,  537,  537,  537,  537,  549,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,

			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  537,  537,
			  543,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  539,  537,  539,  537,  539,  539,  539,  539,
			  539,  539,  539,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  537,  537,
			  537,  537,  537,  537,  539,  539,  539,  539,  537,  539,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,

			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  537,  539,  537,  539,  537,  539,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  549,  537,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  539,  539,  539,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  550,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  539,  539,  539,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  542,

			  539,  539,  539,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  539,  537,  537,  537,  537,
			  537,  537,  537,  542,  542,  537,  537,    0,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537, yy_Dummy>>,
			1, 151, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (73, 200, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   73,   73,   73,   73,   73,   73,   73,   73,    1,
			    2,   73,   73,    1,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,    3,    4,    5,    6,    7,    8,    6,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   18,
			   19,   19,   19,   19,   19,   19,   19,   19,   20,   21,
			   22,   23,   24,   25,    6,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,
			   41,   42,   43,   44,   45,   46,   47,   48,   49,   50,
			   51,   52,   53,   54,   55,   56,   73,   57,   58,   59,

			   60,   30,   61,   32,   62,   34,   35,   36,   63,   38,
			   64,   40,   41,   65,   66,   67,   68,   69,   70,   48,
			   49,   50,   51,   71,    6,   72,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73, yy_Dummy>>,
			1, 200, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,    6,    1,    6,    6,    3,    6,
			    6,    6,    6,    6,    6,    6,    4,    6,    5,    5,
			    6,    6,    6,    6,    6,    6,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    6,    6,    6,    6,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    6,    6,    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 537)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,  189,  187,    1,    2,   17,
			  147,   99,   24,  187,   18,   19,    7,    6,   15,    5,
			   13,    8,  178,  178,   16,   14,   12,   10,   11,   25,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   22,
			  187,   23,    9,  180,   20,   21,  148,  174,  172,  174,
			    1,    2,   31,  147,  146,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,   99,
			  125,  125,  125,    3,   32,   33,  183,   26,   28,    0,
			  178,  178,  177,  180,   36,   34,   30,   29,   35,   37,

			   98,   98,   98,   41,   98,   98,   98,   98,   98,   98,
			   50,   98,   98,   98,   98,   98,   98,   62,   98,   98,
			   69,   98,   98,   98,   98,   98,   98,   78,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   27,  180,
			  148,  172,  173,  173,  175,  165,  163,  164,  166,  167,
			  173,  168,  169,  149,  150,  151,  152,  153,  154,  155,
			  156,  157,  158,  159,  160,  161,  162,  145,  129,  127,
			  128,  130,  147,  134,  147,  136,  147,  147,  147,  147,
			  147,  147,  147,  133,  125,  100,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  101,
			    4,  183,    0,    0,  181,  183,  181,  178,  178,  180,
			   98,   39,   40,   42,   98,   98,   98,   98,   98,   98,
			   98,   53,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   73,   98,   76,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   97,    0,  171,
			  176,  131,  135,  137,  147,  147,  147,  147,  140,  147,
			  132,  124,  118,  116,  117,  119,  120,  126,  121,  122,
			  102,  103,  104,  105,  106,  107,  108,  109,  110,  111,

			  112,  113,  114,  115,  183,    0,  183,    0,  183,    0,
			    0,    0,  182,  178,  178,  180,   98,   98,   98,   98,
			   98,   98,   98,   51,   98,   98,   98,   98,   98,   98,
			   60,   98,   98,   98,   98,   98,   98,   98,   70,   98,
			   72,   74,   98,   77,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   90,   91,   98,   98,   98,
			   98,   96,  170,  147,  139,  147,  138,  147,  141,  126,
			  183,  183,    0,    0,  183,    0,  182,    0,  182,    0,
			    0,  179,   38,   43,   44,   98,   98,   48,   98,   98,
			   98,   98,   98,   98,   58,   98,   98,   98,   98,   65, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   98,   98,   98,   71,   98,   98,   98,   98,   98,   98,
			   98,   98,   86,   98,   98,   89,   98,   98,   94,   98,
			  147,  147,  147,  123,    0,  183,    0,  186,  183,  182,
			    0,    0,  182,    0,  181,    0,   45,   98,   98,   98,
			   52,   54,   98,   56,   98,   98,   61,   98,   98,   98,
			   98,   98,   98,   98,   80,   98,   82,   98,   84,   85,
			   87,   98,   98,   93,   98,  147,  147,  147,    0,  183,
			    0,    0,    0,  182,    0,  186,  182,    0,    0,  184,
			  186,  184,   98,   47,   98,   98,   98,   59,   63,   98,
			   66,   67,   98,   98,   98,   98,   83,   98,   98,   95,

			  147,  147,  147,  186,    0,  186,    0,  182,    0,    0,
			  185,  186,    0,  185,   46,   49,   55,   57,   64,   98,
			   75,   98,   81,   88,   92,  147,  144,  143,  186,  185,
			    0,  185,  185,   68,   79,  142,  185,    0, yy_Dummy>>,
			1, 138, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 979
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 537
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 538
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 73
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

	yyNb_rules: INTEGER = 188
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 189
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new Eiffel scanner.
		do
			make_with_buffer (Empty_buffer)
			create eif_buffer.make (Init_buffer_size)
			str_ := ""
			eif_lineno := 1
			create_keyword := True
		end

	execute
			-- Analyze Eiffel files `arguments (1..argument_count)'.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
		do
			make
			n := Arguments.argument_count
			if n = 0 then
				std.error.put_string ("usage: eiffel_scanner filename ...%N")
				Exceptions.die (1)
			else
				from j := 1 until j > n loop
					a_filename := Arguments.argument (j)
					create a_file.make (a_filename)
					a_file.open_read
					if a_file.is_open_read then
						set_input_buffer (new_file_buffer (a_file))
						scan
						a_file.close
					else
						std.error.put_string ("eiffel_scanner: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
					end
					j := j + 1
				end
			end
		end

	benchmark
			-- Analyze Eiffel file `argument (2)' `argument (1)' times.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
		do
			make
			if
				Arguments.argument_count < 2 or else
				not Arguments.argument (1).is_integer
			then
				std.error.put_string ("usage: eiffel_scanner nb filename%N")
				Exceptions.die (1)
			else
				n := Arguments.argument (1).to_integer
				a_filename := Arguments.argument (2)
				from j := 1 until j > n loop
					create a_file.make (a_filename)
					a_file.open_read
					if a_file.is_open_read then
						set_input_buffer (new_file_buffer (a_file))
						scan
						a_file.close
					else
						std.error.put_string ("eiffel_scanner: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
						Exceptions.die (1)
					end
					j := j + 1
				end
			end
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			eif_lineno := 1
			eif_buffer.wipe_out
		end

feature -- Access

	last_detachable_string_value: detachable STRING
	last_character_value: CHARACTER
	last_double_value: DOUBLE
	last_integer_value: INTEGER
			-- Semantic values to be passed to the parser

	eif_buffer: STRING
			-- Buffer for lexial tokens

	eif_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

feature -- Status report

	create_keyword: BOOLEAN
			-- Should `create' be considered as
			-- a keyword (otherwise identifier)?

feature {NONE} -- Processing

	process_operator (op: INTEGER): INTEGER
			-- Process current token as operator `op' or as
			-- an Eiffel string depending on the context
		require
			text_count_large_enough: text_count > 2
		do
			if is_operator then
				is_operator := False
				Result := op
			else
				Result := E_STRING
				last_detachable_string_value := text_substring (2, text_count - 1)
			end
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `eif_buffer'

invariant

	eif_buffer_not_void: eif_buffer /= Void

end

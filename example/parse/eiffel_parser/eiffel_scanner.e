indexing

	description:

		"Scanners for Eiffel parsers"

	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
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
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM

create

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_STR)
		end

feature {NONE} -- Implementation

	yy_build_tables is
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

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 94 then
if yy_act <= 47 then
if yy_act <= 24 then
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 45 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 45")
end
-- Ignore separators
else
--|#line 46 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 46")
end
eif_lineno := eif_lineno + text_count
end
else
--|#line 51 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 51")
end
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 52 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 52")
end
eif_lineno := eif_lineno + 1
else
--|#line 57 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 57")
end
last_token := Minus_code
end
else
--|#line 58 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 58")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 59 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 59")
end
last_token := Star_code
else
--|#line 60 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 60")
end
last_token := Slash_code
end
else
--|#line 61 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 61")
end
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 62 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 62")
end
last_token := Equal_code
else
--|#line 63 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 63")
end
last_token := Greater_than_code
end
else
--|#line 64 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 64")
end
last_token := Less_than_code
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 65 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 65")
end
last_token := Dot_code
else
--|#line 66 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 66")
end
last_token := Semicolon_code
end
else
--|#line 67 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 67")
end
last_token := Comma_code
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 68 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 68")
end
last_token := Colon_code
else
--|#line 69 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 69")
end
last_token := Exclamation_code
end
else
--|#line 70 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 70")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 71 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 71")
end
last_token := Right_parenthesis_code
else
--|#line 72 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 72")
end
last_token := Left_brace_code
end
else
--|#line 73 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 73")
end
last_token := Right_brace_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 74 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 74")
end
last_token := Left_bracket_code
else
--|#line 75 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 75")
end
last_token := Right_bracket_code
end
else
--|#line 76 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 76")
end
last_token := Dollar_code
end
end
end
end
else
if yy_act <= 36 then
if yy_act <= 30 then
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 77 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 77")
end
last_token := Question_mark_code
else
--|#line 78 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 78")
end
last_token := E_DIV
end
else
--|#line 79 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 79")
end
last_token := E_MOD
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 80 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 80")
end
last_token := E_NE
else
--|#line 81 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 81")
end
last_token := E_GE
end
else
--|#line 82 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 82")
end
last_token := E_LE
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 83 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 83")
end
last_token := E_BANGBANG
else
--|#line 84 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 84")
end
last_token := E_ARROW
end
else
--|#line 85 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 85")
end
last_token := E_DOTDOT
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 86 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 86")
end
last_token := E_LARRAY
else
--|#line 87 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 87")
end
last_token := E_RARRAY
end
else
--|#line 88 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 88")
end
last_token := E_ASSIGN
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 89 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 89")
end
last_token := E_REVERSE
else
--|#line 94 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 94")
end
last_token := E_ALIAS
end
else
--|#line 95 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 95")
end
last_token := E_ALL
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 96 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 96")
end
last_token := E_AND
else
--|#line 97 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 97")
end
last_token := E_AS
end
else
--|#line 98 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 98")
end
last_token := E_BITTYPE
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 99 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 99")
end
last_token := E_CHECK
else
--|#line 100 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 100")
end
last_token := E_CLASS
end
else
--|#line 101 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 101")
end

										if create_keyword then
											last_token := E_CREATE
										else
											last_token := E_IDENTIFIER
											last_string_value := text
										end
									
end
else
if yy_act = 46 then
--|#line 109 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 109")
end
last_token := E_CREATION
else
--|#line 110 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 110")
end
last_token := E_CURRENT
end
end
end
end
end
else
if yy_act <= 71 then
if yy_act <= 59 then
if yy_act <= 53 then
if yy_act <= 50 then
if yy_act <= 49 then
if yy_act = 48 then
--|#line 111 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 111")
end
last_token := E_DEBUG
else
--|#line 112 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 112")
end
last_token := E_DEFERRED
end
else
--|#line 113 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 113")
end
last_token := E_DO
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 114 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 114")
end
last_token := E_ELSE
else
--|#line 115 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 115")
end
last_token := E_ELSEIF
end
else
--|#line 116 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 116")
end
last_token := E_END
end
end
else
if yy_act <= 56 then
if yy_act <= 55 then
if yy_act = 54 then
--|#line 117 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 117")
end
last_token := E_ENSURE
else
--|#line 118 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 118")
end
last_token := E_EXPANDED
end
else
--|#line 119 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 119")
end
last_token := E_EXPORT
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 120 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 120")
end
last_token := E_EXTERNAL
else
--|#line 121 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 121")
end
last_token := E_FALSE
end
else
--|#line 122 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 122")
end
last_token := E_FEATURE
end
end
end
else
if yy_act <= 65 then
if yy_act <= 62 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 123 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 123")
end
last_token := E_FROM
else
--|#line 124 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 124")
end
last_token := E_FROZEN
end
else
--|#line 125 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 125")
end
last_token := E_IF
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 126 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 126")
end
last_token := E_IMPLIES
else
--|#line 127 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 127")
end
last_token := E_INDEXING
end
else
--|#line 128 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 128")
end

										is_operator := True
										last_token := E_INFIX
									
end
end
else
if yy_act <= 68 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 132 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 132")
end
last_token := E_INHERIT
else
--|#line 133 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 133")
end
last_token := E_INSPECT
end
else
--|#line 134 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 134")
end
last_token := E_INVARIANT
end
else
if yy_act <= 70 then
if yy_act = 69 then
--|#line 135 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 135")
end
last_token := E_IS
else
--|#line 136 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 136")
end
last_token := E_LIKE
end
else
--|#line 137 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 137")
end
last_token := E_LOCAL
end
end
end
end
else
if yy_act <= 83 then
if yy_act <= 77 then
if yy_act <= 74 then
if yy_act <= 73 then
if yy_act = 72 then
--|#line 138 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 138")
end
last_token := E_LOOP
else
--|#line 139 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 139")
end
last_token := E_NOT
end
else
--|#line 140 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 140")
end
last_token := E_OBSOLETE
end
else
if yy_act <= 76 then
if yy_act = 75 then
--|#line 141 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 141")
end
last_token := E_OLD
else
--|#line 142 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 142")
end
last_token := E_ONCE
end
else
--|#line 143 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 143")
end
last_token := E_OR
end
end
else
if yy_act <= 80 then
if yy_act <= 79 then
if yy_act = 78 then
--|#line 144 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 144")
end
last_token := E_PRECURSOR
else
--|#line 145 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 145")
end

										is_operator := True
										last_token := E_PREFIX
									
end
else
--|#line 149 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 149")
end
last_token := E_REDEFINE
end
else
if yy_act <= 82 then
if yy_act = 81 then
--|#line 150 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 150")
end
last_token := E_RENAME
else
--|#line 151 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 151")
end
last_token := E_REQUIRE
end
else
--|#line 152 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 152")
end
last_token := E_RESCUE
end
end
end
else
if yy_act <= 89 then
if yy_act <= 86 then
if yy_act <= 85 then
if yy_act = 84 then
--|#line 153 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 153")
end
last_token := E_RESULT
else
--|#line 154 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 154")
end
last_token := E_RETRY
end
else
--|#line 155 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 155")
end
last_token := E_SELECT
end
else
if yy_act <= 88 then
if yy_act = 87 then
--|#line 156 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 156")
end
last_token := E_SEPARATE
else
--|#line 157 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 157")
end
last_token := E_STRIP
end
else
--|#line 158 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 158")
end
last_token := E_THEN
end
end
else
if yy_act <= 92 then
if yy_act <= 91 then
if yy_act = 90 then
--|#line 159 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 159")
end
last_token := E_TRUE
else
--|#line 160 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 160")
end
last_token := E_UNDEFINE
end
else
--|#line 161 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 161")
end
last_token := E_UNIQUE
end
else
if yy_act = 93 then
--|#line 162 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 162")
end
last_token := E_UNTIL
else
--|#line 163 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 163")
end
last_token := E_VARIANT
end
end
end
end
end
end
else
if yy_act <= 141 then
if yy_act <= 118 then
if yy_act <= 106 then
if yy_act <= 100 then
if yy_act <= 97 then
if yy_act <= 96 then
if yy_act = 95 then
--|#line 164 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 164")
end
last_token := E_WHEN
else
--|#line 165 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 165")
end
last_token := E_XOR
end
else
--|#line 170 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 170")
end

				last_token := E_IDENTIFIER
				last_string_value := text
			
end
else
if yy_act <= 99 then
if yy_act = 98 then
--|#line 178 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 178")
end

				last_token := E_FREEOP
				last_string_value := text
			
else
--|#line 189 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 189")
end
last_token := E_CHARACTER; last_character_value := text_item (2)
end
else
--|#line 192 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 192")
end
last_token := E_CHARACTER; last_character_value := '%''
end
end
else
if yy_act <= 103 then
if yy_act <= 102 then
if yy_act = 101 then
--|#line 193 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 193")
end
last_token := E_CHARACTER; last_character_value := '%A'
else
--|#line 194 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 194")
end
last_token := E_CHARACTER; last_character_value := '%B'
end
else
--|#line 195 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 195")
end
last_token := E_CHARACTER; last_character_value := '%C'
end
else
if yy_act <= 105 then
if yy_act = 104 then
--|#line 196 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 196")
end
last_token := E_CHARACTER; last_character_value := '%D'
else
--|#line 197 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 197")
end
last_token := E_CHARACTER; last_character_value := '%F'
end
else
--|#line 198 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 198")
end
last_token := E_CHARACTER; last_character_value := '%H'
end
end
end
else
if yy_act <= 112 then
if yy_act <= 109 then
if yy_act <= 108 then
if yy_act = 107 then
--|#line 199 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 199")
end
last_token := E_CHARACTER; last_character_value := '%L'
else
--|#line 200 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 200")
end
last_token := E_CHARACTER; last_character_value := '%N'
end
else
--|#line 201 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 201")
end
last_token := E_CHARACTER; last_character_value := '%Q'
end
else
if yy_act <= 111 then
if yy_act = 110 then
--|#line 202 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 202")
end
last_token := E_CHARACTER; last_character_value := '%R'
else
--|#line 203 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 203")
end
last_token := E_CHARACTER; last_character_value := '%S'
end
else
--|#line 204 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 204")
end
last_token := E_CHARACTER; last_character_value := '%T'
end
end
else
if yy_act <= 115 then
if yy_act <= 114 then
if yy_act = 113 then
--|#line 205 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 205")
end
last_token := E_CHARACTER; last_character_value := '%U'
else
--|#line 206 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 206")
end
last_token := E_CHARACTER; last_character_value := '%V'
end
else
--|#line 207 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 207")
end
last_token := E_CHARACTER; last_character_value := '%%'
end
else
if yy_act <= 117 then
if yy_act = 116 then
--|#line 208 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 208")
end
last_token := E_CHARACTER; last_character_value := '%''
else
--|#line 209 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 209")
end
last_token := E_CHARACTER; last_character_value := '%"'
end
else
--|#line 210 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 210")
end
last_token := E_CHARACTER; last_character_value := '%('
end
end
end
end
else
if yy_act <= 130 then
if yy_act <= 124 then
if yy_act <= 121 then
if yy_act <= 120 then
if yy_act = 119 then
--|#line 211 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 211")
end
last_token := E_CHARACTER; last_character_value := '%)'
else
--|#line 212 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 212")
end
last_token := E_CHARACTER; last_character_value := '%<'
end
else
--|#line 213 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 213")
end
last_token := E_CHARACTER; last_character_value := '%>'
end
else
if yy_act <= 123 then
if yy_act = 122 then
--|#line 214 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 214")
end

						code_ := text_substring (4, text_count - 2).to_integer
						if code_ > Platform.Maximum_character_code then
							last_token := E_CHARERR
						else
							last_token := E_CHARACTER
							last_character_value := INTEGER_.to_character (code_)
						end
					
else
--|#line 225 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 225")
end
last_token := E_CHARACTER; last_character_value := text_item (3)
end
else
--|#line 227 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 227")
end
last_token := E_CHARERR	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 127 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 228 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 228")
end
last_token := E_CHARERR	-- Catch-all rules (no backing up)
else
--|#line 233 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 233")
end
last_token := process_operator (E_STRPLUS)
end
else
--|#line 234 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 234")
end
last_token := process_operator (E_STRMINUS)
end
else
if yy_act <= 129 then
if yy_act = 128 then
--|#line 235 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 235")
end
last_token := process_operator (E_STRSTAR)
else
--|#line 236 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 236")
end
last_token := process_operator (E_STRSLASH)
end
else
--|#line 237 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 237")
end
last_token := process_operator (E_STRDIV)
end
end
end
else
if yy_act <= 136 then
if yy_act <= 133 then
if yy_act <= 132 then
if yy_act = 131 then
--|#line 238 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 238")
end
last_token := process_operator (E_STRMOD)
else
--|#line 239 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 239")
end
last_token := process_operator (E_STRPOWER)
end
else
--|#line 240 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 240")
end
last_token := process_operator (E_STRLT)
end
else
if yy_act <= 135 then
if yy_act = 134 then
--|#line 241 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 241")
end
last_token := process_operator (E_STRLE)
else
--|#line 242 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 242")
end
last_token := process_operator (E_STRGT)
end
else
--|#line 243 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 243")
end
last_token := process_operator (E_STRGE)
end
end
else
if yy_act <= 139 then
if yy_act <= 138 then
if yy_act = 137 then
--|#line 244 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 244")
end
last_token := process_operator (E_STRNOT)
else
--|#line 245 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 245")
end
last_token := process_operator (E_STRAND)
end
else
--|#line 246 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 246")
end
last_token := process_operator (E_STROR)
end
else
if yy_act = 140 then
--|#line 247 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 247")
end
last_token := process_operator (E_STRXOR)
else
--|#line 248 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 248")
end
last_token := process_operator (E_STRANDTHEN)
end
end
end
end
end
else
if yy_act <= 164 then
if yy_act <= 153 then
if yy_act <= 147 then
if yy_act <= 144 then
if yy_act <= 143 then
if yy_act = 142 then
--|#line 249 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 249")
end
last_token := process_operator (E_STRORELSE)
else
--|#line 250 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 250")
end
last_token := process_operator (E_STRIMPLIES)
end
else
--|#line 251 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 251")
end

			if is_operator then
				is_operator := False
				last_token := E_STRFREEOP
			else
				last_token := E_STRING
			end
			last_string_value := text_substring (2, text_count - 1)
		
end
else
if yy_act <= 146 then
if yy_act = 145 then
--|#line 260 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 260")
end

				last_token := E_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 264 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 264")
end

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
--|#line 270 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 270")
end
eif_buffer.append_string (text)
end
end
else
if yy_act <= 150 then
if yy_act <= 149 then
if yy_act = 148 then
--|#line 271 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 271")
end
eif_buffer.append_character ('%A')
else
--|#line 272 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 272")
end
eif_buffer.append_character ('%B')
end
else
--|#line 273 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 273")
end
eif_buffer.append_character ('%C')
end
else
if yy_act <= 152 then
if yy_act = 151 then
--|#line 274 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 274")
end
eif_buffer.append_character ('%D')
else
--|#line 275 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 275")
end
eif_buffer.append_character ('%F')
end
else
--|#line 276 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 276")
end
eif_buffer.append_character ('%H')
end
end
end
else
if yy_act <= 159 then
if yy_act <= 156 then
if yy_act <= 155 then
if yy_act = 154 then
--|#line 277 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 277")
end
eif_buffer.append_character ('%L')
else
--|#line 278 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 278")
end
eif_buffer.append_character ('%N')
end
else
--|#line 279 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 279")
end
eif_buffer.append_character ('%Q')
end
else
if yy_act <= 158 then
if yy_act = 157 then
--|#line 280 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 280")
end
eif_buffer.append_character ('%R')
else
--|#line 281 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 281")
end
eif_buffer.append_character ('%S')
end
else
--|#line 282 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 282")
end
eif_buffer.append_character ('%T')
end
end
else
if yy_act <= 162 then
if yy_act <= 161 then
if yy_act = 160 then
--|#line 283 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 283")
end
eif_buffer.append_character ('%U')
else
--|#line 284 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 284")
end
eif_buffer.append_character ('%V')
end
else
--|#line 285 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 285")
end
eif_buffer.append_character ('%%')
end
else
if yy_act = 163 then
--|#line 286 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 286")
end
eif_buffer.append_character ('%'')
else
--|#line 287 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 287")
end
eif_buffer.append_character ('%"')
end
end
end
end
else
if yy_act <= 176 then
if yy_act <= 170 then
if yy_act <= 167 then
if yy_act <= 166 then
if yy_act = 165 then
--|#line 288 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 288")
end
eif_buffer.append_character ('%(')
else
--|#line 289 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 289")
end
eif_buffer.append_character ('%)')
end
else
--|#line 290 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 290")
end
eif_buffer.append_character ('%<')
end
else
if yy_act <= 169 then
if yy_act = 168 then
--|#line 291 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 291")
end
eif_buffer.append_character ('%>')
else
--|#line 292 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 292")
end

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := E_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		
end
else
--|#line 305 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 305")
end
eif_lineno := eif_lineno + 1
end
end
else
if yy_act <= 173 then
if yy_act <= 172 then
if yy_act = 171 then
--|#line 306 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 306")
end

			last_token := E_STRING
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			create str_.make (eif_buffer.count)
			str_.append_string (eif_buffer)
			eif_buffer.wipe_out
			last_string_value := str_
			set_start_condition (INITIAL)
		
else
--|#line 319 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 319")
end
eif_buffer.append_character (text_item (2))
end
else
--|#line 321 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 321")
end
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
else
if yy_act <= 175 then
if yy_act = 174 then
--|#line 322 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 322")
end
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 323 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 323")
end
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
else
--|#line 332 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 332")
end
last_token := E_BIT; last_string_value := text
end
end
end
else
if yy_act <= 182 then
if yy_act <= 179 then
if yy_act <= 178 then
if yy_act = 177 then
--|#line 337 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 337")
end

						last_token := E_INTEGER
						last_integer_value := text.to_integer
					
else
--|#line 341 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 341")
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
					
end
else
--|#line 355 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 355")
end
last_token := E_INTERR	-- Catch-all rule (no backing up)
end
else
if yy_act <= 181 then
if yy_act = 180 then
	yy_end := yy_end - 1
--|#line 360 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 360")
end

						last_token := E_REAL
						last_double_value := text.to_double
					
else
--|#line 361 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 361")
end

						last_token := E_REAL
						last_double_value := text.to_double
					
end
else
--|#line 362 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 362")
end

						last_token := E_REAL
						last_double_value := text.to_double
					
end
end
else
if yy_act <= 185 then
if yy_act <= 184 then
if yy_act = 183 then
	yy_end := yy_end - 1
--|#line 366 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 366")
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
					
else
--|#line 367 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 367")
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
					
end
else
--|#line 368 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 368")
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
					
end
else
if yy_act = 186 then
--|#line 390 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 390")
end
last_token := text_item (1).code
else
--|#line 0 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 0 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'eiffel_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1138)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,    6,    7,    8,    7,    9,   10,   11,   12,    6,
			   13,   14,   15,   16,   17,   18,   19,   20,   21,   22,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   36,   37,   36,   36,   38,   36,
			   39,   40,   41,   36,   42,   43,   44,   45,   46,   47,
			   48,   36,   36,   49,   50,   51,   52,   53,   30,   31,
			   32,   33,   35,   36,   38,   39,   36,   42,   43,   44,
			   45,   46,   54,   55,   57,   57,  173,   58,   58,  435,
			   59,   59,   60,  436,   60,   64,   65,   81,   82,   83,
			   87,  109,   66,   67,  174,   68,   88,   69,   84,   95,

			   96,  110,   70,  121,   71,   85,   72,   86,   86,  122,
			   89,  135,   90,   91,   73,   89,  130,   91,   91,   74,
			   75,   92,   97,   98,   60,  128,   60,   64,  132,   76,
			  429,  131,  101,   77,  102,   78,  105,   72,  133,  103,
			  106,  111,  135,  112,   74,  136,  107,  114,  128,  108,
			   93,  115,   92,  113,  131,   93,  134,  132,  101,  102,
			  178,  133,  103,  117,  116,  105,  106,  111,  112,  107,
			  118,  119,  108,  124,  136,   64,  120,  175,  114,  139,
			  139,  134,   63,  125,   63,  126,  167,  116,  171,  127,
			   64,  534,   64,  117,   64,  176,  119,   64,  223,  120,

			  172,  378,  215,  215,  124,  270,  270,  227,  230,  125,
			  126,  222,  127,  180,  216,  219,  219,  139,  143,  144,
			  143,  223,  145,  371,  177,  146,  147,  148,  149,  179,
			  227,  230,  181,  354,  150,   89,  180,  218,  218,  151,
			  182,  152,  222,  153,  154,  155,  156,  225,  157,  177,
			  158,  360,  220,  139,  159,  221,  160,  247,  354,  161,
			  162,  163,  164,  165,  166,  187,  235,  526,  188,  189,
			  190,  191,  525,  211,  211,   93,  360,  192,  225,  228,
			  247,  221,  193,  229,  194,  212,  195,  196,  197,  198,
			  233,  199,  235,  200,  234,  236,  248,  201,   89,  202,

			  217,  218,  203,  204,  205,  206,  207,  208,  231,   92,
			  228,  213,  239,  229,  240,  330,  241,  234,  249,  248,
			  245,  250,  277,  232,  278,  259,  236,  242,  331,  257,
			  243,  261,  246,  258,   64,  265,  267,   64,   93,  231,
			   92,  139,  139,  239,  240,  241,  232,  252,  259,  249,
			  242,  245,  250,  243,  261,  257,  262,  253,  265,  267,
			  254,  263,  255,  256,  268,  144,  268,  144,   64,  144,
			  275,   64,  264,  210,  269,  210,  523,  276,  252,  139,
			  281,  522,  253,  254,  316,  255,  256,  262,  521,  287,
			  287,  520,  274,  304,  304,  264,  305,   64,  305,  317,

			  276,  306,  306,  307,  307,  212,  308,  308,  311,  279,
			  311,  315,  315,  312,  312,  316,  318,   89,  309,  313,
			  314,  319,   89,  274,  314,  314,  420,  320,   92,  325,
			  317,  213,  279,  321,  337,  324,  519,  339,  328,  318,
			  329,  332,  343,  326,  310,  344,  346,  347,  348,  139,
			  320,  350,  319,  352,  517,  357,  321,   93,  324,   92,
			  325,  328,   93,  329,   64,  337,  349,  332,  339,  362,
			  347,  363,   64,  343,  350,  344,  495,  346,  357,  348,
			  268,  144,  268,  486,  352,  361,  270,  270,  484,  349,
			  368,  287,  287,  369,  369,  483,  364,  366,  306,  306,

			  370,  370,  372,  372,  481,  212,  373,  373,  374,  390,
			  374,  376,  376,  375,  375,  312,  312,  381,  309,  377,
			  377,  379,  364,  313,  314,  379,  383,  314,  314,  380,
			  380,  213,   92,  384,  390,  387,  389,  391,  371,  392,
			  381,  394,   64,  399,  310,  401,  402,  403,  404,  383,
			  406,  409,  410,  412,  413,  415,  384,  378,  387,  389,
			  391,  139,  392,   92,  394,  139,  399,  139,  401,  416,
			  417,  404,  402,  403,  409,  418,   64,  413,  410,  462,
			  406,  461,  419,  457,  412,  415,  369,  369,  424,  424,
			  425,  425,  416,  426,  426,  439,  417,  437,  423,  427,

			  427,  375,  375,  428,  428,  419,  418,  438,  421,  430,
			  430,  309,  431,  431,  432,  432,  427,  427,  434,  442,
			  139,  139,  437,  441,  443,  439,  371,   64,  433,  444,
			  438,  445,  449,  460,  421,  463,  452,  310,  456,  458,
			   64,  429,  442,  459,   64,  469,  469,  468,  468,  443,
			  378,  470,  444,  482,  441,  464,  445,  455,   93,  452,
			  463,  456,  458,  449,  460,  465,  459,  467,  485,  467,
			  427,  427,  468,  468,  472,  472,  482,  213,  473,  473,
			  474,  474,  471,  466,  464,  371,  475,  475,  476,  476,
			  477,  487,  477,  479,  479,  475,  475,  488,  489,  485,

			  490,  491,  492,  493,  494,  480,  466,  496,  497,   64,
			   64,  498,  429,   64,  487,  468,  468,  468,  468,  502,
			  502,  489,  488,  490,  378,  492,  493,  506,  506,  494,
			  496,  508,  491,  497,  498,  499,  516,  503,  501,  503,
			  507,  507,  504,  504,  505,  514,  505,  513,  500,  506,
			  506,  475,  475,  509,  509,  475,  475,  310,  510,  510,
			  515,  511,  516,  511,  518,  429,  512,  512,   64,  532,
			  508,  500,  513,  504,  504,  454,  514,  527,  527,  506,
			  506,  506,  506,  528,  528,  474,  474,  533,  529,  518,
			  529,  515,  532,  530,  530,  453,  310,  508,  512,  512,

			  531,  531,  524,  502,  502,  530,  530,  535,  535,  451,
			  533,  509,  509,  528,  528,  371,  100,  100,  100,  100,
			  100,  100,   79,  310,  450,  448,  447,  524,   79,   79,
			   79,   79,   79,   79,   79,  446,  440,  422,  378,  414,
			  411,  371,  408,  407,  405,  429,  400,  398,  397,  378,
			  396,  429,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   63,   63,  395,   63,   63,
			  393,   63,   63,   63,   63,   63,   63,   63,   80,   80,
			  388,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,  140,  140,  386,  140,  140,  385,  140,  140,  140,

			  140,  140,  140,  140,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,   65,   65,  382,
			   65,   65,  367,   65,   65,   65,   65,   65,   65,   65,
			  184,  184,  365,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  186,  186,  359,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,  214,
			  214,  214,  214,  214,  214,  358,  214,  214,  214,  214,
			  214,  214,  478,  478,  478,  478,  478,  478,  356,  478,
			  478,  478,  478,  478,  478,  355,  353,  351,  345,  342, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  341,  340,  338,  336,  335,  334,  333,  327,  323,  322,
			  303,  302,  301,  300,  299,  298,  297,  296,  295,  294,
			  293,  292,  291,  290,  289,  288,  286,  285,  284,  283,
			  282,  281,  280,  273,  272,  271,  141,  266,  260,  251,
			  244,  238,  237,  226,  224,  210,  209,  185,  183,  170,
			  169,  168,   64,   61,  141,  138,  137,  129,  123,  104,
			   99,   94,   62,   61,  536,    5,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536, yy_Dummy>>,
			1, 139, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1138)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    4,   70,    3,    4,  384,
			    3,    4,    7,  384,    7,   10,   10,   13,   13,   19,
			   21,   33,   10,   10,   70,   10,   21,   10,   19,   26,

			   26,   33,   10,   38,   10,   20,   10,   20,   20,   38,
			   22,   46,   22,   22,   10,   23,   43,   23,   23,   10,
			   10,   22,   28,   28,   60,   41,   60,   73,   44,   10,
			  528,   43,   30,   10,   30,   10,   32,   10,   44,   30,
			   32,   34,   46,   34,   10,   47,   32,   35,   41,   32,
			   22,   35,   22,   34,   43,   23,   45,   44,   30,   30,
			   73,   44,   30,   37,   35,   32,   32,   34,   34,   32,
			   37,   37,   32,   40,   47,   75,   37,   71,   35,   53,
			   53,   45,   65,   40,   65,   40,   65,   35,   69,   40,
			   72,  524,   77,   37,   74,   71,   37,   76,  104,   37,

			   69,  509,   89,   89,   40,  150,  150,  108,  111,   40,
			   40,  102,   40,   75,   89,   93,   93,   53,   59,   59,
			   59,  104,   59,  502,   72,   59,   59,   59,   59,   74,
			  108,  111,   76,  260,   59,   91,   75,   91,   91,   59,
			   77,   59,  102,   59,   59,   59,   59,  106,   59,   72,
			   59,  266,  101,   93,   59,  101,   59,  123,  260,   59,
			   59,   59,   59,   59,   59,   81,  114,  501,   81,   81,
			   81,   81,  500,   86,   86,   91,  266,   81,  106,  109,
			  123,  101,   81,  109,   81,   86,   81,   81,   81,   81,
			  113,   81,  114,   81,  113,  115,  124,   81,   90,   81,

			   90,   90,   81,   81,   81,   81,   81,   81,  112,   90,
			  109,   86,  119,  109,  119,  237,  119,  113,  125,  124,
			  122,  126,  180,  112,  180,  131,  115,  119,  237,  130,
			  119,  133,  122,  130,  178,  135,  137,  179,   90,  112,
			   90,  139,  139,  119,  119,  119,  112,  129,  131,  125,
			  119,  122,  126,  119,  133,  130,  134,  129,  135,  137,
			  129,  134,  129,  129,  143,  143,  143,  144,  177,  144,
			  178,  181,  134,  210,  144,  210,  497,  179,  129,  139,
			  192,  496,  129,  129,  220,  129,  129,  134,  494,  192,
			  192,  493,  177,  211,  211,  134,  212,  364,  212,  224,

			  179,  212,  212,  213,  213,  211,  215,  215,  216,  181,
			  216,  219,  219,  216,  216,  220,  225,  217,  215,  217,
			  217,  226,  218,  177,  218,  218,  364,  227,  217,  233,
			  224,  211,  181,  228,  243,  232,  492,  245,  235,  225,
			  236,  238,  251,  233,  215,  251,  253,  254,  255,  219,
			  227,  256,  226,  258,  488,  263,  228,  217,  232,  217,
			  233,  235,  218,  236,  275,  243,  255,  238,  245,  274,
			  254,  274,  277,  251,  256,  251,  456,  253,  263,  255,
			  268,  268,  268,  444,  258,  270,  270,  270,  441,  255,
			  287,  287,  287,  304,  304,  438,  275,  277,  305,  305,

			  306,  306,  307,  307,  436,  304,  308,  308,  309,  325,
			  309,  310,  310,  309,  309,  311,  311,  316,  308,  312,
			  312,  313,  275,  313,  313,  314,  318,  314,  314,  315,
			  315,  304,  313,  319,  325,  322,  324,  326,  306,  327,
			  316,  329,  362,  335,  308,  337,  339,  341,  343,  318,
			  345,  348,  349,  351,  352,  356,  319,  312,  322,  324,
			  326,  313,  327,  313,  329,  314,  335,  315,  337,  357,
			  358,  343,  339,  341,  348,  359,  366,  352,  349,  416,
			  345,  415,  362,  409,  351,  356,  369,  369,  370,  370,
			  371,  371,  357,  372,  372,  388,  358,  385,  369,  373,

			  373,  374,  374,  375,  375,  362,  359,  387,  366,  376,
			  376,  373,  377,  377,  378,  378,  379,  379,  380,  391,
			  380,  380,  385,  390,  392,  388,  370,  419,  379,  394,
			  387,  395,  400,  413,  366,  418,  404,  373,  408,  410,
			  420,  375,  391,  412,  421,  425,  425,  424,  424,  392,
			  377,  426,  394,  437,  390,  419,  395,  407,  380,  404,
			  418,  408,  410,  400,  413,  420,  412,  423,  443,  423,
			  427,  427,  423,  423,  428,  428,  437,  426,  429,  429,
			  430,  430,  427,  421,  419,  424,  431,  431,  432,  432,
			  433,  446,  433,  434,  434,  433,  433,  447,  448,  443,

			  449,  450,  451,  452,  454,  434,  421,  460,  461,  465,
			  464,  463,  428,  466,  446,  467,  467,  468,  468,  469,
			  469,  448,  447,  449,  431,  451,  452,  472,  472,  454,
			  460,  474,  450,  461,  463,  464,  485,  470,  466,  470,
			  473,  473,  470,  470,  471,  483,  471,  481,  465,  471,
			  471,  475,  475,  476,  476,  477,  477,  474,  479,  479,
			  484,  480,  485,  480,  491,  472,  480,  480,  499,  518,
			  479,  465,  481,  503,  503,  406,  483,  504,  504,  505,
			  505,  506,  506,  507,  507,  510,  510,  520,  508,  491,
			  508,  484,  518,  508,  508,  405,  479,  510,  511,  511,

			  512,  512,  499,  527,  527,  529,  529,  530,  530,  403,
			  520,  531,  531,  535,  535,  504,  541,  541,  541,  541,
			  541,  541,  539,  510,  401,  399,  397,  499,  539,  539,
			  539,  539,  539,  539,  539,  396,  389,  368,  512,  353,
			  350,  527,  347,  346,  344,  530,  336,  334,  333,  531,
			  332,  535,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  538,  538,  331,  538,  538,
			  328,  538,  538,  538,  538,  538,  538,  538,  540,  540,
			  323,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  542,  542,  321,  542,  542,  320,  542,  542,  542,

			  542,  542,  542,  542,  543,  543,  543,  543,  543,  543,
			  543,  543,  543,  543,  543,  543,  543,  544,  544,  317,
			  544,  544,  279,  544,  544,  544,  544,  544,  544,  544,
			  545,  545,  276,  545,  545,  545,  545,  545,  545,  545,
			  545,  545,  545,  546,  546,  265,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  547,  547,  547,  547,
			  547,  547,  547,  547,  547,  547,  547,  547,  547,  548,
			  548,  548,  548,  548,  548,  264,  548,  548,  548,  548,
			  548,  548,  549,  549,  549,  549,  549,  549,  262,  549,
			  549,  549,  549,  549,  549,  261,  259,  257,  252,  250, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  248,  246,  244,  242,  241,  240,  239,  234,  230,  229,
			  208,  207,  206,  205,  204,  203,  202,  201,  200,  199,
			  198,  197,  196,  195,  194,  193,  191,  190,  189,  188,
			  187,  186,  182,  176,  174,  172,  140,  136,  132,  128,
			  121,  118,  116,  107,  105,   83,   82,   80,   78,   68,
			   67,   66,   63,   61,   56,   50,   48,   42,   39,   31,
			   29,   24,    9,    8,    5,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536, yy_Dummy>>,
			1, 139, 1000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   71,   72, 1064, 1065,   80, 1060, 1057,
			   79,    0, 1065,   78, 1065, 1065, 1065, 1065, 1065,   73,
			   88,   72,   93,   98, 1037, 1065,   76, 1065,   98, 1036,
			   94, 1024,  102,   60,  103,  120,    0,  131,   68, 1017,
			  145,   81, 1026,   85,   94,  116,   84,  111, 1015, 1065,
			 1001, 1065, 1065,  160, 1065, 1065, 1048, 1065, 1065,  216,
			  122, 1050, 1065, 1046, 1065,  180, 1045, 1044, 1043,  182,
			   70,  171,  184,  121,  188,  169,  191,  186, 1042,    0,
			 1037,  259, 1036, 1042, 1065, 1065,  254, 1065, 1065,  183,
			  281,  218, 1065,  196, 1065, 1065, 1065, 1065, 1065, 1065,

			    0,  217,  181,    0,  152, 1013,  220, 1012,  163,  251,
			    0,  163,  278,  248,  228,  268, 1001,    0,  999,  282,
			    0, 1003,  291,  211,  251,  288,  292,    0, 1008,  317,
			  291,  281, 1007,  284,  326,  291, 1006,  292, 1065,  322,
			 1030, 1065, 1065,  362,  365, 1065, 1065, 1065, 1065, 1065,
			  186, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065,
			 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065,
			 1065, 1065, 1029, 1065, 1028, 1065, 1027,  362,  328,  331,
			  318,  365, 1026, 1065, 1065, 1065, 1021, 1020, 1019, 1018,
			 1017, 1016,  370, 1015, 1014, 1013, 1012, 1011, 1010, 1009,

			 1008, 1007, 1006, 1005, 1004, 1003, 1002, 1001, 1000, 1065,
			  371,  374,  382,  384, 1065,  387,  394,  400,  405,  392,
			  357,    0,    0,    0,  370,  371,  394,  383,  386,  978,
			  977,    0,  388,  402,  976,  393,  394,  276,  403,  975,
			  970,  973,  961,  407,  971,  410,  959,    0,  959,    0,
			  968,  413,  967,  419,  400,  419,  407,  966,  426,  961,
			  193,  964,  957,  412,  940,  910,  211,    0,  478, 1065,
			  467, 1065, 1065, 1065,  465,  458,  926,  466, 1065,  916,
			 1065, 1065, 1065, 1065, 1065, 1065, 1065,  472, 1065, 1065,
			 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065,

			 1065, 1065, 1065, 1065,  474,  479,  481,  483,  487,  494,
			  492,  496,  500,  504,  508,  510,  472,  882,  481,  487,
			  865,  860,  491,  845,  492,  469,  493,  495,  839,  494,
			    0,  836,  815,  798,  797,  499,  815,  501,    0,  508,
			    0,  509,    0,  501,  809,  518,  804,  807,  504,  514,
			  789,  524,  510,  797,    0,    0,  523,  522,  532,  548,
			    0, 1065,  536, 1065,  391, 1065,  570, 1065,  827,  567,
			  569,  571,  574,  580,  582,  584,  590,  593,  595,  597,
			  601,    0,    0,    0,   48,  557,    0,  563,  563,  805,
			  593,  573,  584,    0,  585,  591,  804,  791,    0,  790,

			  603,  789,    0,  778,  592,  745,  740,  626,  594,  552,
			  593,    0,  597,  606,    0,  546,  548,    0,  595,  621,
			  634,  638, 1065,  653,  628,  626,  620,  651,  655,  659,
			  661,  667,  669,  676,  674,    0,  463,  607,  464,    0,
			    0,  457,    0,  641,  452,    0,  646,  657,  652,  654,
			  674,  656,  658,    0,  664,    0,  445,    0,    0,    0,
			  661,  668,    0,  665,  704,  703,  707,  696,  698,  700,
			  723,  730,  708,  721,  700,  732,  734,  736, 1065,  739,
			  747,  707,    0,  715,  730,  698,    0,    0,  421,    0,
			    0,  724,  405,  350,  357,    0,  350,  345,    0,  762,

			  266,  261,  166,  754,  758,  760,  762,  764,  774,  144,
			  766,  779,  781,    0,    0,    0,    0,    0,  723,    0,
			  743,    0,    0,    0,  185, 1065, 1065,  784,   73,  786,
			  788,  792,    0,    0, 1065,  794, 1065,  851,  864,  821,
			  877,  808,  890,  903,  916,  929,  942,  955,  968,  981, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  536,    1,  537,  537,  536,  536,  536,  536,  536,
			  538,  539,  536,  540,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  536,
			  536,  536,  536,  536,  536,  536,  542,  536,  536,  543,
			  536,  536,  536,  538,  536,  544,  538,  538,  538,  538,
			  538,  538,  538,  538,  538,  538,  538,  538,  538,  539,
			  545,  546,  545,  547,  536,  536,  536,  536,  536,  548,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  536,  536,
			  542,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  538,  536,  538,  536,  538,  538,  538,  538,
			  538,  538,  538,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  536,  536,
			  536,  536,  536,  536,  538,  538,  538,  538,  536,  538,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  536,  538,  536,  538,  536,  538,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  548,
			  536,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,

			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  538,
			  538,  538,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  549,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  538,  538,  538,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  538,

			  538,  538,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  538,  536,  536,  536,  536,  536,
			  536,  536,  541,  541,  536,  536,    0,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    5,    6,    7,    8,    9,    7,   10,
			   11,   12,   13,   14,   15,   16,   17,   18,   19,   19,
			   20,   20,   20,   20,   20,   20,   20,   20,   21,   22,
			   23,   24,   25,   26,    7,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   48,   49,   50,   51,
			   52,   53,   54,   55,   56,   57,    1,   58,   59,   60,

			   61,   31,   62,   33,   63,   35,   36,   37,   64,   39,
			   65,   41,   42,   66,   67,   68,   69,   70,   71,   49,
			   50,   51,   52,   72,    7,   73,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    1,    5,    1,    1,    6,
			    1,    1,    1,    1,    1,    1,    1,    7,    1,    8,
			    9,    1,    1,    1,    1,    1,    1,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,   10,   11,    1,    1,    1,    1,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			   12,   13,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  188,  186,    1,    2,   17,
			  146,   98,   24,  186,   18,   19,    7,    6,   15,    5,
			   13,    8,  177,  177,   16,   14,   12,   10,   11,   25,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   22,
			  186,   23,    9,  179,   20,   21,  147,  173,  171,  173,
			    1,    2,   31,  146,  145,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,   98,
			  124,  124,  124,    3,   32,   33,  182,   26,   28,    0,
			  177,  177,  176,  179,   36,   34,   30,   29,   35,   37,

			   97,   97,   97,   41,   97,   97,   97,   97,   97,   97,
			   50,   97,   97,   97,   97,   97,   97,   62,   97,   97,
			   69,   97,   97,   97,   97,   97,   97,   77,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   27,  179,
			  147,  171,  172,  172,  174,  164,  162,  163,  165,  166,
			  172,  167,  168,  148,  149,  150,  151,  152,  153,  154,
			  155,  156,  157,  158,  159,  160,  161,  144,  128,  126,
			  127,  129,  146,  133,  146,  135,  146,  146,  146,  146,
			  146,  146,  146,  132,  124,   99,  124,  124,  124,  124,
			  124,  124,  124,  124,  124,  124,  124,  124,  124,  124,

			  124,  124,  124,  124,  124,  124,  124,  124,  124,  100,
			    4,  182,    0,    0,  180,  182,  180,  177,  177,  179,
			   97,   39,   40,   42,   97,   97,   97,   97,   97,   97,
			   97,   53,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   73,   97,   75,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   96,    0,  170,
			  175,  130,  134,  136,  146,  146,  146,  146,  139,  146,
			  131,  123,  117,  115,  116,  118,  119,  125,  120,  121,
			  101,  102,  103,  104,  105,  106,  107,  108,  109,  110,

			  111,  112,  113,  114,  182,    0,  182,    0,  182,    0,
			    0,    0,  181,  177,  177,  179,   97,   97,   97,   97,
			   97,   97,   97,   51,   97,   97,   97,   97,   97,   97,
			   60,   97,   97,   97,   97,   97,   97,   97,   70,   97,
			   72,   97,   76,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   89,   90,   97,   97,   97,   97,
			   95,  169,  146,  138,  146,  137,  146,  140,  125,  182,
			  182,    0,    0,  182,    0,  181,    0,  181,    0,    0,
			  178,   38,   43,   44,   97,   97,   48,   97,   97,   97,
			   97,   97,   97,   58,   97,   97,   97,   97,   65,   97,

			   97,   97,   71,   97,   97,   97,   97,   97,   97,   97,
			   97,   85,   97,   97,   88,   97,   97,   93,   97,  146,
			  146,  146,  122,    0,  182,    0,  185,  182,  181,    0,
			    0,  181,    0,  180,    0,   45,   97,   97,   97,   52,
			   54,   97,   56,   97,   97,   61,   97,   97,   97,   97,
			   97,   97,   97,   79,   97,   81,   97,   83,   84,   86,
			   97,   97,   92,   97,  146,  146,  146,    0,  182,    0,
			    0,    0,  181,    0,  185,  181,    0,    0,  183,  185,
			  183,   97,   47,   97,   97,   97,   59,   63,   97,   66,
			   67,   97,   97,   97,   97,   82,   97,   97,   94,  146,

			  146,  146,  185,    0,  185,    0,  181,    0,    0,  184,
			  185,    0,  184,   46,   49,   55,   57,   64,   97,   74,
			   97,   80,   87,   91,  146,  143,  142,  185,  184,    0,
			  184,  184,   68,   78,  141,  184,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1065
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 536
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 537
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 187
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 188
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make is
			-- Create a new Eiffel scanner.
		do
			make_with_buffer (Empty_buffer)
			create eif_buffer.make (Init_buffer_size)
			eif_lineno := 1
			create_keyword := True
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			eif_lineno := 1
			eif_buffer.wipe_out
		end

feature -- Access

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

	process_operator (op: INTEGER): INTEGER is
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
				last_string_value := text_substring (2, text_count - 1)
			end
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `eif_buffer'

invariant

	eif_buffer_not_void: eif_buffer /= Void

end

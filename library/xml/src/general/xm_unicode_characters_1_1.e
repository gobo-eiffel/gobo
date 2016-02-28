note

	description:

		"XML 1.1 unicode character classes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_UNICODE_CHARACTERS_1_1

inherit

	XM_UNICODE_CHARACTERS

feature -- Characters

	is_char (a: INTEGER): BOOLEAN
			-- Is this a character code matching XML 1.1's 'Char'?
		do
			Result := (a >= 1 and a <= 55295) --[#x1-#xD7FF]
				or (a >= 57344 and a <= 65533) -- [#xE000-#xFFFD]
				or (a >= 65536 and a <= 1114111) -- [#x10000-#x10FFFF]
		end

	is_name_first (a: INTEGER): BOOLEAN
			-- Is this a character code matching XML 1.1's 'NameStartChar'?
		do
			Result := (a = (':').code) --":"
				or (a >= ('A').code and a <= ('Z').code) -- [A-Z]
				or (a = ('_').code) -- "_"
				or (a >= ('a').code and a <= ('z').code) -- [a-z]
				or (a >= 192 and a <= 214) -- [#xC0-#xD6]
				or (a >= 216 and a <= 246) -- [#xD8-#xF6]
				or (a >= 248 and a <= 767) -- [#xF8-#x2FF]
				or (a >= 880 and a <= 893) -- [#x370-#x37D]
				or (a >= 895 and a <= 8191) -- [#x37F-#x1FFF]
				or (a = 8204) or (a = 8205) -- [#x200C-#x200D]
				or (a >= 8304 and a <= 8591) -- [#x2070-#x218F]
				or (a >= 11264 and a <= 12271) -- [#x2C00-#x2FEF]
				or (a >= 12289 and a <= 55295) -- [#x3001-#xD7FF]
				or (a >= 63744 and a <= 64975) -- [#xF900-#xFDCF]
				or (a >= 65008 and a <= 65533) -- [#xFDF0-#xFFFD]
				or (a >= 65536 and a <= 983039) -- [#x10000-#xEFFFF]
		end

	is_name_char (a: INTEGER): BOOLEAN
			-- Is this a character code matching XML 1.1's 'NameChar'?
		do
			Result := is_name_first (a)
				or a = ('-').code
				or a = ('.').code
				or (a >= ('0').code and a <= ('9').code)
				or a = 183 -- #xB7
				or (a >= 768 and a <= 879) -- [#x0300-#x036F]
				or (a >= 8255 and a <= 8256) -- [#x203F-#x2040]
		end

	is_space (a: INTEGER): BOOLEAN
			-- Is this a character code matching XML 1.1's 'S'?
		do
			Result := a = 32 or a = 9 or a = 10 or a = 13
		end

end

note
	description: "[
						Code sets, only two byte and four byte encoding codeset are listed. 
						The rest are granted as one byte encoding.
						All keys of tables are in lower case.
				]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CODE_SETS

feature -- Access

	code_pages: STRING_TABLE [READABLE_STRING_8]
			-- All code pages that iconv can possibly support.
			-- It is not used now.
		note
			EIS: "name=GNU libiconv", "src=http://www.gnu.org/software/libiconv/", "tag=encoding library"
		once
			create Result.make_caseless (122)

				-- European languages
			Result.put ("ASCII", "ascii")
			Result.put ("ISO-8859-1", "iso-8859-1")
			Result.put ("ISO-8859-2", "iso-8859-2")
			Result.put ("ISO-8859-3", "iso-8859-3")
			Result.put ("ISO-8859-4", "iso-8859-4")
			Result.put ("ISO-8859-5", "iso-8859-5")
			Result.put ("ISO-8859-7", "iso-8859-7")
			Result.put ("ISO-8859-9", "iso-8859-9")
			Result.put ("ISO-8859-10", "iso-8859-10")
			Result.put ("ISO-8859-13", "iso-8859-13")
			Result.put ("ISO-8859-14", "iso-8859-14")
			Result.put ("ISO-8859-15", "iso-8859-15")
			Result.put ("ISO-8859-16", "iso-8859-16")
			Result.put ("KOI8-R", "koi8-r")
			Result.put ("KOI8-U", "koi8-u")
			Result.put ("KOI8-RU", "koi8-ru")
			Result.put ("CP1250", "cp1250")
			Result.put ("CP1251", "cp1251")
			Result.put ("CP1252", "cp1252")
			Result.put ("CP1253", "cp1253")
			Result.put ("CP1254", "cp1254")
			Result.put ("CP1257", "cp1257")
			Result.put ("CP850", "cp850")
			Result.put ("CP866", "cp866")
			Result.put ("MacRoman", "macroman")
			Result.put ("MacCentralEurope", "maccentraleurope")
			Result.put ("MacIceland", "maciceland")
			Result.put ("MacCroatian", "maccroatian")
			Result.put ("MacRomania", "macromania")
			Result.put ("MacCyrillic", "maccyrillic")
			Result.put ("MacUkraine", "macukraine")
			Result.put ("MacGreek", "macgreek")
			Result.put ("MacTurkish", "macturkish")
			Result.put ("Macintosh", "macintosh")

				-- Semitic languages
			Result.put ("ISO-8859-6", "iso-8859-6")
			Result.put ("ISO-8859-8", "iso-8859-8")
			Result.put ("CP1255", "cp1255")
			Result.put ("CP1256", "cp1256")
			Result.put ("CP862", "cp862")
			Result.put ("MacHebrew", "machebrew")
			Result.put ("MacArabic", "macarabic")

				-- Japanese
			Result.put ("EUC-JP", "euc-jp")
			Result.put ("SHIFT_JIS", "shift_jis")
			Result.put ("CP932", "cp932")
			Result.put ("ISO-2022-JP", "iso-2022-jp")
			Result.put ("ISO-2022-JP-2", "iso-2022-jp-2")
			Result.put ("ISO-2022-JP-1", "iso-2022-jp-1")

				-- Chinese
			Result.put ("EUC-CN", "euc-cn")
			Result.put ("HZ", "hz")
			Result.put ("GBK", "gbk")
			Result.put ("CP936", "cp936")
			Result.put ("GB18030", "gb18030")
			Result.put ("EUC-TW", "euc-tw")
			Result.put ("BIG5", "big5")
			Result.put ("CP950", "cp950")
			Result.put ("BIG5-HKSCS", "big5-hkscs")
			Result.put ("BIG5-HKSCS:2001", "big5-hkscs:2001")
			Result.put ("BIG5-HKSCS:1999", "big5-hkscs:1999")
			Result.put ("ISO-2022-CN", "iso-2022-cn")
			Result.put ("ISO-2022-CN-EXT", "iso-2022-cn-ext")

				-- Korean
			Result.put ("EUC-KR", "euc-kr")
			Result.put ("CP949", "cp949")
			Result.put ("ISO-2022-KR", "iso-2022-kr")
			Result.put ("JOHAB", "johab")

				-- Armenian
			Result.put ("ARMSCII-8", "armscii-8")

				-- Georgian
			Result.put ("Georgian-Academy", "georgian-academy")
			Result.put ("Georgian-PS", "georgian-ps")

				-- Tajik
			Result.put ("KOI8-T", "koi8-t")

				-- Kazakh
			Result.put ("PT154", "pt154")
			Result.put ("RK1048", "rk1048")

				-- Thai
			Result.put ("ISO-8859-11", "iso-8859-11")
			Result.put ("TIS-620", "tis-620")
			Result.put ("CP874", "cp874")
			Result.put ("MacThai", "macthai")

				-- Laotian
			Result.put ("MuleLao-1", "mulelao-1")
			Result.put ("CP1133", "cp1133")

				-- Vietnamese
			Result.put ("VISCII", "viscii")
			Result.put ("TCVN", "tcvn")
			Result.put ("CP1258", "cp1258")

				-- Platform specifics
			Result.put ("HP-ROMAN8", "hp-roman8")
			Result.put ("NEXTSTEP", "nextstep")

				-- Full Unicode
			Result.put ({CODE_PAGE_CONSTANTS}.utf8, "utf-8")
			Result.put ("UCS-2", "ucs-2")
			Result.put ("UCS-2BE", "ucs-2be")
			Result.put ("UCS-2LE", "ucs-2le")
			Result.put ("UCS-4", "ucs-4")
			Result.put ("UCS-4BE", "ucs-4be")
			Result.put ("UCS-4LE", "ucs-4le")
			Result.put ({CODE_PAGE_CONSTANTS}.utf16, "utf-16")
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_be, "utf-16be")
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_le, "utf-16le")
			Result.put ({CODE_PAGE_CONSTANTS}.utf32, "utf-32")
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_be, "utf-32be")
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_le, "utf-32le")
			Result.put ({CODE_PAGE_CONSTANTS}.utf7, "utf-7")
			Result.put ("C99", "c99")
			Result.put ("JAVA", "java")

				-- Full Unicode, in terms of uint16_t or uint32_t (with machine dependent endianness and alignment)
			Result.put ("UCS-2-INTERNAL", "ucs-2-internal")
			Result.put ("UCS-4-INTERNAL", "ucs-4-internal")

					-- Extra encodings:
				-- European languages
			Result.put ("CP437", "cp437")
			Result.put ("CP737", "cp737")
			Result.put ("CP775", "cp775")
			Result.put ("CP852", "cp852")
			Result.put ("CP853", "cp853")
			Result.put ("CP855", "cp855")
			Result.put ("CP857", "cp857")
			Result.put ("CP858", "cp858")
			Result.put ("CP860", "cp860")
			Result.put ("CP861", "cp861")
			Result.put ("CP863", "cp863")
			Result.put ("CP865", "cp865")
			Result.put ("CP869", "cp869")
			Result.put ("CP1125", "cp1125")

				-- Semitic languages
			Result.put ("CP864", "cp864")

				-- Japanese
			Result.put ("EUC-JISX0213", "euc-jisx0213")
			Result.put ("Shift_JISX0213", "shift_jisx0213")
			Result.put ("ISO-2022-JP-3", "iso-2022-jp-3")

				-- Chinese
			Result.put ("BIG5-2003", "big5-2003") -- (experimental)

				-- Turkmen
			Result.put ("TDS565", "tds565")

				-- Platform specifics
			Result.put ("ATARIST", "atarist")
			Result.put ("RISCOS-LATIN1", "riscos-latin1")
		end

	two_byte_code_pages: STRING_TABLE [READABLE_STRING_8]
			-- Two byte code pages that iconv can possibly support.
		once
			create Result.make_caseless (20)

			Result.put ("UCS-2", "ucs-2")
			Result.put ("ISO-10646-UCS-2", "iso-10646-ucs-2") -- Alias
			Result.put ("csUnicode", "csunicode") -- Alias

			Result.put ("UCS-2BE", "ucs-2be")
			Result.put ("UNICODEBIG", "unicodebig") -- Alias
			Result.put ("UNICODE-1-1", "unicode-1-1") -- Alias
			Result.put ("csUnicode11", "csunicode11") -- Alias

			Result.put ("UCS-2LE", "ucs-2le")
			Result.put ("UNICODELITTLE", "unicodelittle") -- Alias

			Result.put ({CODE_PAGE_CONSTANTS}.utf16, "utf-16")
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_be, "utf-16be")
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_le, "utf-16le")

			Result.put ("UCS-2-INTERNAL", "ucs-2-internal")
			Result.put ("UCS-2-SWAPPED", "ucs-2-swapped")

			Result.put ("JAVA", "java")
		end

	four_byte_code_pages: STRING_TABLE [READABLE_STRING_8]
			-- Four byte code pages that iconv can possibly support.
		once
			create Result.make_caseless (10)
			Result.put ("UCS-4", "ucs-4")
			Result.put ("ISO-10646-UCS-4", "iso-10646-ucs-4") -- Alias
			Result.put ("csUCS4", "csucs4") -- Alias

			Result.put ("UCS-4BE", "ucs-4be")
			Result.put ("UCS-4LE", "ucs-4le")

			Result.put ({CODE_PAGE_CONSTANTS}.utf32, "utf-32")
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_be, "utf-32be")
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_le, "utf-32le")

			Result.put ("UCS-4-INTERNAL", "ucs-4-internal")
			Result.put ("UCS-4-SWAPPED", "ucs-4-swapped")
		end

	little_endian_code_pages: STRING_TABLE [READABLE_STRING_8]
			-- Little endian code pages that iconv can possibly support.
		once
			create Result.make_caseless (5)
			Result.put ("UCS-2LE", "ucs-2le")
			Result.put ("UNICODELITTLE", "unicodelittle") -- Alias
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_le, "utf-16le")
			Result.put ("UCS-4LE", "ucs-4le")
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_le, "utf-32le")
		end

	big_endian_code_pages: STRING_TABLE [READABLE_STRING_8]
			-- Big endian code pages that iconv can possibly support.
		once
			create Result.make_caseless (5)
			Result.put ("UCS-2BE", "ucs-2be")
			Result.put ("UNICODEBIG", "unicodebig")
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_be, "utf-16be")
			Result.put ("UCS-4BE", "ucs-4be")
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_be, "utf-32be")
		end

note
	ca_ignore: "CA032", "CA032: too long routine"
	library:   "Encoding: Library of reusable components for Eiffel."
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end

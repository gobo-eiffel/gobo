note
	description: "Code page identifiers that Windows supports."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CODE_PAGES

feature -- Code-Page Identifiers

	code_pages: STRING_TABLE [READABLE_STRING_8]
			-- Code page identifiers.
		once
			create Result.make_caseless (168)
			Result.put ("037", "037") -- IBM EBCDIC - U.S./Canada
			Result.put ("437", "437") -- OEM - United States
			Result.put ("500", "500") -- IBM EBCDIC - International
			Result.put ("708", "708") -- Arabic - ASMO 708
			Result.put ("709", "709") -- Arabic - ASMO 449+, BCON V4
			Result.put ("710", "710") -- Arabic - Transparent Arabic
			Result.put ("720", "720") -- Arabic - Transparent ASMO
			Result.put ("737", "737") -- OEM - Greek (formerly 437G)
			Result.put ("775", "775") -- OEM - Baltic
			Result.put ("850", "850") -- OEM - Multilingual Latin I
			Result.put ("852", "852") -- OEM - Latin II
			Result.put ("855", "855") -- OEM - Cyrillic (primarily Russian)
			Result.put ("857", "857") -- OEM - Turkish
			Result.put ("858", "858") -- OEM - Multlingual Latin I + Euro symbol
			Result.put ("860", "860") -- OEM - Portuguese
			Result.put ("861", "861") -- OEM - Icelandic
			Result.put ("862", "862") -- OEM - Hebrew
			Result.put ("863", "863") -- OEM - Canadian-French
			Result.put ("864", "864") -- OEM - Arabic
			Result.put ("865", "865") -- OEM - Nordic
			Result.put ("866", "866") -- OEM - Russian
			Result.put ("869", "869") -- OEM - Modern Greek
			Result.put ("870", "870") -- IBM EBCDIC - Multilingual/ROECE (Latin-2)
			Result.put ("874", "874") -- ANSI/OEM - Thai (same as 28605, ISO 8859-15)
			Result.put ("875", "875") -- IBM EBCDIC - Modern Greek
			Result.put ("932", "932") -- ANSI/OEM - Japanese, Shift-JIS
			Result.put ("936", "936") -- ANSI/OEM - Simplified Chinese (PRC, Singapore)
			Result.put ("949", "949") -- ANSI/OEM - Korean (Unified Hangeul Code)
			Result.put ("950", "950") -- ANSI/OEM - Traditional Chinese (Taiwan; Hong Kong SAR, PRC)
			Result.put ("1026", "1026") -- IBM EBCDIC - Turkish (Latin-5)
			Result.put ("1047", "1047") -- IBM EBCDIC - Latin 1/Open System
			Result.put ("1140", "1140") -- IBM EBCDIC - U.S./Canada (037 + Euro symbol)
			Result.put ("1141", "1141") -- IBM EBCDIC - Germany (20273 + Euro symbol)
			Result.put ("1142", "1142") -- IBM EBCDIC - Denmark/Norway (20277 + Euro symbol)
			Result.put ("1143", "1143") -- IBM EBCDIC - Finland/Sweden (20278 + Euro symbol)
			Result.put ("1144", "1144") -- IBM EBCDIC - Italy (20280 + Euro symbol)
			Result.put ("1145", "1145") -- IBM EBCDIC - Latin America/Spain (20284 + Euro symbol)
			Result.put ("1146", "1146") -- IBM EBCDIC - United Kingdom (20285 + Euro symbol)
			Result.put ("1147", "1147") -- IBM EBCDIC - France (20297 + Euro symbol)
			Result.put ("1148", "1148") -- IBM EBCDIC - International (500 + Euro symbol)
			Result.put ("1149", "1149") -- IBM EBCDIC - Icelandic (20871 + Euro symbol)
			Result.put ("1200", "1200") -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)	
			Result.put ("1201", "1201") -- Unicode UCS-2 Big-Endian
			Result.put ("1250", "1250") -- ANSI - Central European
			Result.put ("1251", "1251") -- ANSI - Cyrillic
			Result.put ("1252", "1252") -- ANSI - Latin I
			Result.put ("1253", "1253") -- ANSI - Greek
			Result.put ("1254", "1254") -- ANSI - Turkish
			Result.put ("1255", "1255") -- ANSI - Hebrew
			Result.put ("1256", "1256") -- ANSI - Arabic
			Result.put ("1257", "1257") -- ANSI - Baltic
			Result.put ("1258", "1258") -- ANSI/OEM - Vietnamese
			Result.put ("1361", "1361") -- Korean (Johab)
			Result.put ("10000", "10000") -- MAC - Roman
			Result.put ("10001", "10001") -- MAC - Japanese
			Result.put ("10002", "10002") -- MAC - Traditional Chinese (Big5)
			Result.put ("10003", "10003") -- MAC - Korean
			Result.put ("10004", "10004") -- MAC - Arabic
			Result.put ("10005", "10005") -- MAC - Hebrew
			Result.put ("10006", "10006") -- MAC - Greek I
			Result.put ("10007", "10007") -- MAC - Cyrillic
			Result.put ("10008", "10008") -- MAC - Simplified Chinese (GB 2312)
			Result.put ("10010", "10010") -- MAC - Romania
			Result.put ("10017", "10017") -- MAC - Ukraine
			Result.put ("10021", "10021") -- MAC - Thai
			Result.put ("10029", "10029") -- MAC - Latin II
			Result.put ("10079", "10079") -- MAC - Icelandic
			Result.put ("10081", "10081") -- MAC - Turkish
			Result.put ("10082", "10082") -- MAC - Croatia
			Result.put ("12000", "12000") -- Unicode UCS-4 Little-Endian
			Result.put ("12001", "12001") -- Unicode UCS-4 Big-Endian
			Result.put ("20000", "20000") -- CNS - Taiwan
			Result.put ("20001", "20001") -- TCA - Taiwan
			Result.put ("20002", "20002") -- Eten - Taiwan
			Result.put ("20003", "20003") -- IBM5550 - Taiwan
			Result.put ("20004", "20004") -- TeleText - Taiwan
			Result.put ("20005", "20005") -- Wang - Taiwan
			Result.put ("20105", "20105") -- IA5 IRV International Alphabet No. 5 (7-bit)
			Result.put ("20106", "20106") -- IA5 German (7-bit)
			Result.put ("20107", "20107") -- IA5 Swedish (7-bit)
			Result.put ("20108", "20108") -- IA5 Norwegian (7-bit)
			Result.put ("20127", "20127") -- US-ASCII (7-bit)
			Result.put ("20261", "20261") -- T.61
			Result.put ("20269", "20269") -- ISO 6937 Non-Spacing Accent
			Result.put ("20273", "20273") -- IBM EBCDIC - Germany
			Result.put ("20277", "20277") -- IBM EBCDIC - Denmark/Norway
			Result.put ("20278", "20278") -- IBM EBCDIC - Finland/Sweden
			Result.put ("20280", "20280") -- IBM EBCDIC - Italy
			Result.put ("20284", "20284") -- IBM EBCDIC - Latin America/Spain
			Result.put ("20285", "20285") -- IBM EBCDIC - United Kingdom
			Result.put ("20290", "20290") -- IBM EBCDIC - Japanese Katakana Extended
			Result.put ("20297", "20297") -- IBM EBCDIC - France
			Result.put ("20420", "20420") -- IBM EBCDIC - Arabic
			Result.put ("20423", "20423") -- IBM EBCDIC - Greek
			Result.put ("20424", "20424") -- IBM EBCDIC - Hebrew
			Result.put ("20833", "20833") -- IBM EBCDIC - Korean Extended
			Result.put ("20838", "20838") -- IBM EBCDIC - Thai
			Result.put ("20866", "20866") -- Russian - KOI8-R
			Result.put ("20871", "20871") -- IBM EBCDIC - Icelandic
			Result.put ("20880", "20880") -- IBM EBCDIC - Cyrillic (Russian)
			Result.put ("20905", "20905") -- IBM EBCDIC - Turkish
			Result.put ("20924", "20924") -- IBM EBCDIC - Latin-1/Open System (1047 + Euro symbol)
			Result.put ("20932", "20932") -- JIS X 0208-1990 & 0121-1990
			Result.put ("20936", "20936") -- Simplified Chinese (GB2312)
			Result.put ("21025", "21025") -- IBM EBCDIC - Cyrillic (Serbian, Bulgarian)
			Result.put ("21027", "21027") -- Extended Alpha Lowercase
			Result.put ("21866", "21866") -- Ukrainian (KOI8-U)
			Result.put ("28591", "28591") -- ISO 8859-1 Latin I
			Result.put ("28592", "28592") -- ISO 8859-2 Central Europe
			Result.put ("28593", "28593") -- ISO 8859-3 Latin 3
			Result.put ("28594", "28594") -- ISO 8859-4 Baltic
			Result.put ("28595", "28595") -- ISO 8859-5 Cyrillic
			Result.put ("28596", "28596") -- ISO 8859-6 Arabic
			Result.put ("28597", "28597") -- ISO 8859-7 Greek
			Result.put ("28598", "28598") -- ISO 8859-8 Hebrew
			Result.put ("28599", "28599") -- ISO 8859-9 Latin 5
			Result.put ("28605", "28605") -- ISO 8859-15 Latin 9
			Result.put ("29001", "29001") -- Europa 3
			Result.put ("38598", "38598") -- ISO 8859-8 Hebrew
			Result.put ("50220", "50220") -- ISO 2022 Japanese with no halfwidth Katakana
			Result.put ("50221", "50221") -- ISO 2022 Japanese with halfwidth Katakana
			Result.put ("50222", "50222") -- ISO 2022 Japanese JIS X 0201-1989
			Result.put ("50225", "50225") -- ISO 2022 Korean
			Result.put ("50227", "50227") -- ISO 2022 Simplified Chinese
			Result.put ("50229", "50229") -- ISO 2022 Traditional Chinese
			Result.put ("50930", "50930") -- Japanese (Katakana) Extended
			Result.put ("50931", "50931") -- US/Canada and Japanese
			Result.put ("50933", "50933") -- Korean Extended and Korean
			Result.put ("50935", "50935") -- Simplified Chinese Extended and Simplified Chinese
			Result.put ("50936", "50936") -- Simplified Chinese
			Result.put ("50937", "50937") -- US/Canada and Traditional Chinese
			Result.put ("50939", "50939") -- Japanese (Latin) Extended and Japanese
			Result.put ("51932", "51932") -- EUC - Japanese
			Result.put ("51936", "51936") -- EUC - Simplified Chinese
			Result.put ("51949", "51949") -- EUC - Korean
			Result.put ("51950", "51950") -- EUC - Traditional Chinese
			Result.put ("52936", "52936") -- HZ-GB2312 Simplified Chinese
			Result.put ("54936", "54936") -- Windows XP: GB18030 Simplified Chinese (4 Byte)
			Result.put ("57002", "57002") -- ISCII Devanagari
			Result.put ("57003", "57003") -- ISCII Bengali
			Result.put ("57004", "57004") -- ISCII Tamil
			Result.put ("57005", "57005") -- ISCII Telugu
			Result.put ("57006", "57006") -- ISCII Assamese
			Result.put ("57007", "57007") -- ISCII Oriya
			Result.put ("57008", "57008") -- ISCII Kannada
			Result.put ("57009", "57009") -- ISCII Malayalam
			Result.put ("57010", "57010") -- ISCII Gujarati
			Result.put ("57011", "57011") -- ISCII Punjabi
			Result.put ("65000", "65000") -- Unicode UTF-7
			Result.put ("65001", "65001") -- Unicode UTF-8

				-- Added for more functionalities.
			Result.put ("65000", {CODE_PAGE_CONSTANTS}.utf7) -- Unicode UTF-7
			Result.put ({CODE_PAGE_CONSTANTS}.utf7, {CODE_PAGE_CONSTANTS}.utf7)
			Result.put ("65001", {CODE_PAGE_CONSTANTS}.utf8) -- Unicode UTF-8
			Result.put ({CODE_PAGE_CONSTANTS}.utf8, {CODE_PAGE_CONSTANTS}.utf8)


			Result.put ("1200", {CODE_PAGE_CONSTANTS}.utf16.as_lower)  -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf16, {CODE_PAGE_CONSTANTS}.utf16)
			Result.put ("1200", {CODE_PAGE_CONSTANTS}.utf16_le)  -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_le, {CODE_PAGE_CONSTANTS}.utf16_le)

			Result.put ("12000", {CODE_PAGE_CONSTANTS}.utf32.as_lower) -- Unicode UCS-4 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf32, {CODE_PAGE_CONSTANTS}.utf32)
			Result.put ("12000", {CODE_PAGE_CONSTANTS}.utf32_le.as_lower) -- Unicode UCS-4 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_le, {CODE_PAGE_CONSTANTS}.utf32_le)

			Result.put ("1201", {CODE_PAGE_CONSTANTS}.utf16_be.as_lower) -- Unicode UCS-2 Big-Endian
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_be, {CODE_PAGE_CONSTANTS}.utf16_be)
			Result.put ("12001", {CODE_PAGE_CONSTANTS}.utf32_be.as_lower) -- Unicode UCS-4 Big-Endian
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_be, {CODE_PAGE_CONSTANTS}.utf32_be)
		ensure
			class
		end

	two_byte_code_pages: STRING_TABLE [READABLE_STRING_8]
		once
			create Result.make_caseless (8)
			Result.put ("1200", "1200")  -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)
			Result.put ("1201", "1201") -- Unicode UCS-2 Big-Endian
			Result.put ("1200", {CODE_PAGE_CONSTANTS}.utf16.as_lower)  -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf16, {CODE_PAGE_CONSTANTS}.utf16)
			Result.put ("1200", {CODE_PAGE_CONSTANTS}.utf16_le.as_lower)  -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_le, {CODE_PAGE_CONSTANTS}.utf16_le)
			Result.put ("1201", {CODE_PAGE_CONSTANTS}.utf16_be.as_lower) -- Unicode UCS-2 Big-Endian
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_be, {CODE_PAGE_CONSTANTS}.utf16_be)
		ensure
			class
		end

	four_byte_code_pages: STRING_TABLE [READABLE_STRING_8] 
		once
			create Result.make_caseless (8)
			Result.put ("12000", "12000") -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)
			Result.put ("12001", "12001") -- Unicode UCS-4 Big-Endian
			Result.put ("12000", {CODE_PAGE_CONSTANTS}.utf32.as_lower) -- Unicode UCS-2 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf32, {CODE_PAGE_CONSTANTS}.utf32)
			Result.put ("12000", {CODE_PAGE_CONSTANTS}.utf32_le.as_lower) -- Unicode UCS-4 Little-Endian (BMP of ISO 10646)
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_le, {CODE_PAGE_CONSTANTS}.utf32_le)
			Result.put ("12001", {CODE_PAGE_CONSTANTS}.utf32_be.as_lower) -- Unicode UCS-4 Big-Endian
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_be, {CODE_PAGE_CONSTANTS}.utf32_be)
		ensure
			class
		end

	big_endian_code_pages: STRING_TABLE [READABLE_STRING_8]
		once
			create Result.make_caseless (6)
			Result.put ("1201", "1201") -- Unicode UCS-2 Big-Endian
			Result.put ("12001", "12001") -- Unicode UCS-4 Big-Endian
			Result.put ("1201", {CODE_PAGE_CONSTANTS}.utf16_be.as_lower) -- Unicode UCS-2 Big-Endian
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_be, {CODE_PAGE_CONSTANTS}.utf16_be)
			Result.put ("12001", {CODE_PAGE_CONSTANTS}.utf32_be.as_lower) -- Unicode UCS-4 Big-Endian
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_be, {CODE_PAGE_CONSTANTS}.utf32_be)
		ensure
			class
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

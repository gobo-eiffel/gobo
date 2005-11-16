indexing

	description:

		"Test features of class UC_UTF8_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class UC_TEST_UTF8_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UTF8_ROUTINES

feature

	test_valid is
			-- Test feature `valid_utf8' when valid.
		do
			assert ("empty", utf8.valid_utf8 (""))
			assert ("Low ASCII", utf8.valid_utf8 ("%/0/"))
			assert ("High ASCII", utf8.valid_utf8 ("%/127/"))
			assert ("0xC2,0x80", utf8.valid_utf8 ("%/194/%/128/"))
			assert ("0xC2,0xBF", utf8.valid_utf8 ("%/194/%/191/"))
			assert ("0xDf,0xBF", utf8.valid_utf8 ("%/223/%/191/"))
			assert ("0xE0,0xA0,0x80", utf8.valid_utf8 ("%/224/%/160/%/128/"))
			assert ("0xE0,0xBF,0x80", utf8.valid_utf8 ("%/224/%/191/%/128/"))
			assert ("0xE0,0xBF,0x80", utf8.valid_utf8 ("%/224/%/191/%/191/"))
			assert ("0xE1,0x80,0x80", utf8.valid_utf8 ("%/225/%/128/%/128/"))
			assert ("0xEC,0x80,0x80", utf8.valid_utf8 ("%/236/%/128/%/128/"))
			assert ("0xEC,0xBF,0xBF", utf8.valid_utf8 ("%/236/%/191/%/191/"))
			assert ("0xED,0x80,0x80", utf8.valid_utf8 ("%/237/%/128/%/128/"))
			assert ("0xED,0x9F,0xBF", utf8.valid_utf8 ("%/237/%/159/%/191/"))
			assert ("0xEE,0x80,0x80", utf8.valid_utf8 ("%/238/%/128/%/128/"))
			assert ("0xEF,0x80,0x80", utf8.valid_utf8 ("%/239/%/128/%/128/"))
			assert ("0xEF,0xBF,0xBF", utf8.valid_utf8 ("%/239/%/191/%/191/"))
			assert ("0xF0,0x90,0x80,0x80", utf8.valid_utf8 ("%/240/%/144/%/128/%/128/"))
			assert ("0xF0,0xBF,0x80,0x80", utf8.valid_utf8 ("%/240/%/191/%/128/%/128/"))
			assert ("0xF0,0xBF,0x80,0x80", utf8.valid_utf8 ("%/240/%/191/%/191/%/128/"))
			assert ("0xF1,0x80,0x80,0x80", utf8.valid_utf8 ("%/241/%/128/%/128/%/128/"))
			assert ("0xF3,0x80,0x80,0x80", utf8.valid_utf8 ("%/243/%/128/%/128/%/128/"))
			assert ("0xF3,0xBF,0xBF,0xBF", utf8.valid_utf8 ("%/243/%/191/%/191/%/191/"))
			assert ("0xF4,0x80,0x80,0x80", utf8.valid_utf8 ("%/244/%/128/%/128/%/128/"))
			assert ("0xF4,0x8F,0xBF,0xBF", utf8.valid_utf8 ("%/244/%/143/%/191/%/191/"))
		end

	test_invalid is
			-- Test feature `valid_utf16' when invalid.
		do
			assert ("0x80", not utf8.valid_utf8 ("%/128/"))
			assert ("0x80,0x80", not utf8.valid_utf8 ("%/128/%/128/"))
			assert ("0xC1,0x80", not utf8.valid_utf8 ("%/193/%/128/"))
			assert ("0xC2,0x7F", not utf8.valid_utf8 ("%/194/%/127/"))
			assert ("0xC2,0xC0", not utf8.valid_utf8 ("%/194/%/192/"))
			assert ("0xC2,0x80, 0x80", not utf8.valid_utf8 ("%/194/%/128/%/128/"))
			assert ("0xE0,0x80", not utf8.valid_utf8 ("%/224/%/128/"))
			assert ("0xE0,0x80,0x80", not utf8.valid_utf8 ("%/224/%/128/%/128/"))
			assert ("0xE0,0x9F,0x80", not utf8.valid_utf8 ("%/224/%/159/%/128/"))
			assert ("0xE0,0xA0,0x7F", not utf8.valid_utf8 ("%/224/%/160/%/127/"))
			assert ("0xE0,0xC0,0x80", not utf8.valid_utf8 ("%/224/%/192/%/128/"))
			assert ("0xE0,0xA0,0xC0", not utf8.valid_utf8 ("%/224/%/160/%/192/"))
			assert ("0xE0,0xC0,0x80", not utf8.valid_utf8 ("%/224/%/192/%/128/"))
			assert ("0xE1,0x7F,0x80", not utf8.valid_utf8 ("%/225/%/127/%/128/"))
			assert ("0xE1,0xC0,0x80", not utf8.valid_utf8 ("%/225/%/192/%/128/"))
			assert ("0xE1,0x80,0x7F", not utf8.valid_utf8 ("%/225/%/128/%/127/"))
			assert ("0xE1,0x80,0xC0", not utf8.valid_utf8 ("%/225/%/128/%/192/"))
			assert ("0xED,0xA0,0xBF", not utf8.valid_utf8 ("%/237/%/160/%/191/"))
			assert ("0xED,0x7F,0xBF", not utf8.valid_utf8 ("%/237/%/127/%/191/"))
			assert ("0xED,0x80,0xC0", not utf8.valid_utf8 ("%/237/%/128/%/192/"))
			assert ("0xEE,0x7F,0x80", not utf8.valid_utf8 ("%/238/%/127/%/128/"))
			assert ("0xEE,0xC0,0x80", not utf8.valid_utf8 ("%/238/%/192/%/128/"))
			assert ("0xEE,0x80,0x7F", not utf8.valid_utf8 ("%/238/%/128/%/127/"))
			assert ("0xEE,0x80,0xC0", not utf8.valid_utf8 ("%/238/%/128/%/192/"))
			assert ("0xF0,0x90,0x80", not utf8.valid_utf8 ("%/240/%/144/%/128/"))
			assert ("0xF0,0x8F,0x80,0x80", not utf8.valid_utf8 ("%/240/%/143/%/128/%/128/"))
			assert ("0xF0,0xC0,0x80,0x80", not utf8.valid_utf8 ("%/240/%/192/%/128/%/128/"))
			assert ("0xF0,0x90,0x80,0xC0", not utf8.valid_utf8 ("%/240/%/144/%/128/%/192/"))
			assert ("0xF0,0x90,0xC0,0x80", not utf8.valid_utf8 ("%/240/%/144/%/192/%/128/"))
			assert ("0xF1,0x7F,0x80,0x80", not utf8.valid_utf8 ("%/241/%/127/%/128/%/128/"))
			assert ("0xF1,0x80,0x7F,0x80", not utf8.valid_utf8 ("%/241/%/128/%/127/%/128/"))
			assert ("0xF1,0x80,0x80,0x7F", not utf8.valid_utf8 ("%/241/%/128/%/128/%/127/"))
			assert ("0xF1,0xC0,0x80,0x80", not utf8.valid_utf8 ("%/241/%/192/%/128/%/128/"))
			assert ("0xF1,0x80,0xC0,0x80", not utf8.valid_utf8 ("%/241/%/128/%/192/%/128/"))
			assert ("0xF1,0x80,0x80,0xC0", not utf8.valid_utf8 ("%/241/%/128/%/128/%/192/"))
			assert ("0xF4,0x7F,0x80,0x80", not utf8.valid_utf8 ("%/244/%/127/%/128/%/128/"))
			assert ("0xF4,0x90,0x80,0x80", not utf8.valid_utf8 ("%/244/%/144/%/128/%/128/"))
			assert ("0xF4,0x80,0x7F,0x80", not utf8.valid_utf8 ("%/244/%/128/%/127/%/128/"))
			assert ("0xF4,0x80,0x80,0x7F", not utf8.valid_utf8 ("%/244/%/128/%/128/%/127/"))
			assert ("0xF4,0x80,0xC0,0x80", not utf8.valid_utf8 ("%/244/%/128/%/192/%/128/"))
			assert ("0xF4,0x80,0x80,0xC0", not utf8.valid_utf8 ("%/244/%/128/%/128/%/192/"))
			assert ("Five bytes", not utf8.valid_utf8 ("%/244/%/143/%/191/%/191/%/128/"))
		end

end

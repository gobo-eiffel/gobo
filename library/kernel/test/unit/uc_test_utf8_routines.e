note

	description:

		"Test features of class UC_UTF8_ROUTINES"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005-2020, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_TEST_UTF8_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UTF8_ROUTINES

create

	make_default

feature -- Tests

	test_valid
			-- Test feature `valid_utf8' when valid.
		do
			assert ("empty", utf8.valid_utf8 (""))
			assert ("low_ascii", utf8.valid_utf8 ("%/0/"))
			assert ("High ASCII", utf8.valid_utf8 ("%/127/"))
			assert ("0xc2_0x80", utf8.valid_utf8 ("%/194/%/128/"))
			assert ("0xc2_0xbf", utf8.valid_utf8 ("%/194/%/191/"))
			assert ("0xdf_0xbf", utf8.valid_utf8 ("%/223/%/191/"))
			assert ("0xe0_0xa0_0x80", utf8.valid_utf8 ("%/224/%/160/%/128/"))
			assert ("0xe0_0xbf_0x80", utf8.valid_utf8 ("%/224/%/191/%/128/"))
			assert ("0xe0_0xbf_0x80", utf8.valid_utf8 ("%/224/%/191/%/191/"))
			assert ("0xe1_0x80_0x80", utf8.valid_utf8 ("%/225/%/128/%/128/"))
			assert ("0xec_0x80_0x80", utf8.valid_utf8 ("%/236/%/128/%/128/"))
			assert ("0xec_0xbf_0xbf", utf8.valid_utf8 ("%/236/%/191/%/191/"))
			assert ("0xed_0x80_0x80", utf8.valid_utf8 ("%/237/%/128/%/128/"))
			assert ("0xed_0x9f_0xbf", utf8.valid_utf8 ("%/237/%/159/%/191/"))
			assert ("0xee_0x80_0x80", utf8.valid_utf8 ("%/238/%/128/%/128/"))
			assert ("0xef_0x80_0x80", utf8.valid_utf8 ("%/239/%/128/%/128/"))
			assert ("0xef_0xbf_0xbf", utf8.valid_utf8 ("%/239/%/191/%/191/"))
			assert ("0xf0_0x90_0x80_0x80", utf8.valid_utf8 ("%/240/%/144/%/128/%/128/"))
			assert ("0xf0_0xbf_0x80_0x80", utf8.valid_utf8 ("%/240/%/191/%/128/%/128/"))
			assert ("0xf0_0xbf_0x80_0x80", utf8.valid_utf8 ("%/240/%/191/%/191/%/128/"))
			assert ("0xf1_0x80_0x80_0x80", utf8.valid_utf8 ("%/241/%/128/%/128/%/128/"))
			assert ("0xf3_0x80_0x80_0x80", utf8.valid_utf8 ("%/243/%/128/%/128/%/128/"))
			assert ("0xf3_0xbf_0xbf_0xbf", utf8.valid_utf8 ("%/243/%/191/%/191/%/191/"))
			assert ("0xf4_0x80_0x80_0x80", utf8.valid_utf8 ("%/244/%/128/%/128/%/128/"))
			assert ("0xf4_0x8f_0xbf_0xbf", utf8.valid_utf8 ("%/244/%/143/%/191/%/191/"))
		end

	test_invalid
			-- Test feature `valid_utf8' when invalid.
		do
			assert ("0x80", not utf8.valid_utf8 ("%/128/"))
			assert ("0x80_0x80", not utf8.valid_utf8 ("%/128/%/128/"))
			assert ("0xc1_0x80", not utf8.valid_utf8 ("%/193/%/128/"))
			assert ("0xc2_0x7f", not utf8.valid_utf8 ("%/194/%/127/"))
			assert ("0xc2_0xc0", not utf8.valid_utf8 ("%/194/%/192/"))
			assert ("0xc2_0x80_0x80", not utf8.valid_utf8 ("%/194/%/128/%/128/"))
			assert ("0xe0_0x80", not utf8.valid_utf8 ("%/224/%/128/"))
			assert ("0xe0_0x80_0x80", not utf8.valid_utf8 ("%/224/%/128/%/128/"))
			assert ("0xe0_0x9f_0x80", not utf8.valid_utf8 ("%/224/%/159/%/128/"))
			assert ("0xe0_0xa0_0x7f", not utf8.valid_utf8 ("%/224/%/160/%/127/"))
			assert ("0xe0_0xc0_0x80", not utf8.valid_utf8 ("%/224/%/192/%/128/"))
			assert ("0xe0_0xa0_0xc0", not utf8.valid_utf8 ("%/224/%/160/%/192/"))
			assert ("0xe0_0xc0_0x80", not utf8.valid_utf8 ("%/224/%/192/%/128/"))
			assert ("0xe1_0x7f_0x80", not utf8.valid_utf8 ("%/225/%/127/%/128/"))
			assert ("0xe1_0xc0_0x80", not utf8.valid_utf8 ("%/225/%/192/%/128/"))
			assert ("0xe1_0x80_0x7f", not utf8.valid_utf8 ("%/225/%/128/%/127/"))
			assert ("0xe1_0x80_0xc0", not utf8.valid_utf8 ("%/225/%/128/%/192/"))
			assert ("0xed_0xa0_0xbf", not utf8.valid_utf8 ("%/237/%/160/%/191/"))
			assert ("0xed_0x7f_0xbf", not utf8.valid_utf8 ("%/237/%/127/%/191/"))
			assert ("0xed_0x80_0xc0", not utf8.valid_utf8 ("%/237/%/128/%/192/"))
			assert ("0xee_0x7f_0x80", not utf8.valid_utf8 ("%/238/%/127/%/128/"))
			assert ("0xee_0xc0_0x80", not utf8.valid_utf8 ("%/238/%/192/%/128/"))
			assert ("0xee_0x80_0x7f", not utf8.valid_utf8 ("%/238/%/128/%/127/"))
			assert ("0xee_0x80_0xc0", not utf8.valid_utf8 ("%/238/%/128/%/192/"))
			assert ("0xf0_0x90_0x80", not utf8.valid_utf8 ("%/240/%/144/%/128/"))
			assert ("0xf0_0x8f_0x80_0x80", not utf8.valid_utf8 ("%/240/%/143/%/128/%/128/"))
			assert ("0xf0_0xc0_0x80_0x80", not utf8.valid_utf8 ("%/240/%/192/%/128/%/128/"))
			assert ("0xf0_0x90_0x80_0xc0", not utf8.valid_utf8 ("%/240/%/144/%/128/%/192/"))
			assert ("0xf0_0x90_0xc0_0x80", not utf8.valid_utf8 ("%/240/%/144/%/192/%/128/"))
			assert ("0xf1_0x7f_0x80_0x80", not utf8.valid_utf8 ("%/241/%/127/%/128/%/128/"))
			assert ("0xf1_0x80_0x7f_0x80", not utf8.valid_utf8 ("%/241/%/128/%/127/%/128/"))
			assert ("0xf1_0x80_0x80_0x7f", not utf8.valid_utf8 ("%/241/%/128/%/128/%/127/"))
			assert ("0xf1_0xC0_0x80_0x80", not utf8.valid_utf8 ("%/241/%/192/%/128/%/128/"))
			assert ("0xf1_0x80_0xc0_0x80", not utf8.valid_utf8 ("%/241/%/128/%/192/%/128/"))
			assert ("0xf1_0x80_0x80_0xc0", not utf8.valid_utf8 ("%/241/%/128/%/128/%/192/"))
			assert ("0xf4_0x7f_0x80_0x80", not utf8.valid_utf8 ("%/244/%/127/%/128/%/128/"))
			assert ("0xf4_0x90_0x80_0x80", not utf8.valid_utf8 ("%/244/%/144/%/128/%/128/"))
			assert ("0xf4_0x80_0x7f_0x80", not utf8.valid_utf8 ("%/244/%/128/%/127/%/128/"))
			assert ("0xf4_0x80_0x80_0x7f", not utf8.valid_utf8 ("%/244/%/128/%/128/%/127/"))
			assert ("0xf4_0x80_0xc0_0x80", not utf8.valid_utf8 ("%/244/%/128/%/192/%/128/"))
			assert ("0xf4_0x80_0x80_0xc0", not utf8.valid_utf8 ("%/244/%/128/%/128/%/192/"))
			assert ("five_bytes", not utf8.valid_utf8 ("%/244/%/143/%/191/%/191/%/128/"))
		end

	test_four_byte_character_code
			-- Test feature 'four_byte_character_code'.
		do
			assert_naturals_32_equal ("code_127001", 127001, utf8.four_byte_character_code ((0xF0).to_character_8, (0x9F).to_character_8, (0x80).to_character_8, (0x99).to_character_8))
		end

end

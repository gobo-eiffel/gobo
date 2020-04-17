note

	description:

		"Character codes"

	remark:

		"Character codes are declared as integer constants such as %
		% Lower_a_code: NATURAL_32 = 97 %
		%rather than once functions such as %
		% Lower_a_code: NATURAL_32 once Result := ({CHARACTER_32} 'a').natural_32_code end %
		%This is due to the fact that these character codes need to be %
		%integer constants in order to appear in multi-branch instructions."

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2019-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_CHARACTER_32_CODES

inherit

	UC_CHARACTER_CODES

end

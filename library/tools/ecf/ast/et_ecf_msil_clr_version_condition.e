note

	description:

		"ECF MSIL CLR version conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_MSIL_CLR_VERSION_CONDITION

inherit

	ET_ECF_VERSION_CONDITION

create

	make

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		local
			l_version: UT_VERSION
		do
-- TODO: extract the MSIL CLR version from the ECF options.
			create l_version.make (1, 0, 0, 0)
			Result := is_included (l_version)
		end

end

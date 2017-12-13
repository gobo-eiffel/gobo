note

	description:

		"ECF pathnames to be passed for external compilations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_EXTERNAL_PATHNAME

inherit

	ET_ECF_EXTERNAL_VALUE
		rename
			value as pathname
		redefine
			fill_external_values
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

feature -- Element change

	fill_external_values (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Add to `a_universe.current_system' the current external pathname
			-- of conditions satisfy `a_state'.
		local
			l_pathname: STRING
		do
			if is_enabled (a_state) then
				if pathname.starts_with ("$ECF_CONFIG_PATH") then
					l_pathname := file_system.dirname (a_universe.filename) + pathname.substring (17, pathname.count)
				elseif pathname.starts_with ("$(ECF_CONFIG_PATH)") or pathname.starts_with ("${ECF_CONFIG_PATH}") then
					l_pathname := file_system.dirname (a_universe.filename) + pathname.substring (19, pathname.count)
				else
					l_pathname := pathname
				end
				add_external_value (l_pathname, a_universe)
			end
		end
	
end

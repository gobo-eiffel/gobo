note

	description:

		"ECF external includes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_INCLUDE

inherit

	ET_ECF_CONDITIONED

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_pathname: like pathname)
			-- Create a new external include.
		require
			a_pathname_not_void: a_pathname /= Void
		do
			pathname := a_pathname
		ensure
			pathname_set: pathname = a_pathname
		end

feature -- Access

	pathname: STRING
			-- Pathname

feature -- Element change

	fill_external_includes (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Add to `a_universe.current_system' the current external include pathname
			-- of conditions satisfy `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		local
			l_pathname: STRING
		do
			if is_enabled (a_state) then
				if l_pathname.starts_with ("$ECF_CONFIG_PATH") then
					l_pathname := file_system.dirname (a_universe.filename) + l_pathname.substring (17, l_pathname.count)
				elseif l_pathname.starts_with ("$(ECF_CONFIG_PATH)") or l_pathname.starts_with ("${ECF_CONFIG_PATH}") then
					l_pathname := file_system.dirname (a_universe.filename) + l_pathname.substring (19, l_pathname.count)
				else
					l_pathname := pathname
				end
				a_universe.current_system.external_include_pathnames.force_last (l_pathname)
			end
		end

invariant

	pathname_not_void: pathname /= Void

end

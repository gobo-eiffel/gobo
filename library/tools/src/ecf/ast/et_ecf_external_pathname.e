note

	description:

		"ECF pathnames to be passed for external compilations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
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

	fill_external_values (a_target: ET_ECF_TARGET; a_state: ET_ECF_STATE)
			-- Add to `a_target.system_config.universe.current_system' the current external value
			-- of conditions satisfy `a_state'.
			-- `a_target' is the target where this external value has been declared.
		local
			l_pathname: STRING
			l_root_dir: STRING
			nb: INTEGER
		do
			if is_enabled (a_state) then
				if pathname.starts_with ("$ECF_CONFIG_PATH") then
					nb := 17
				elseif pathname.starts_with ("$(ECF_CONFIG_PATH)") or pathname.starts_with ("${ECF_CONFIG_PATH}") then
					nb := 19
				end
				if nb > 0 then
					if attached a_target.settings.value ({ET_ECF_SETTING_NAMES}.library_root_setting_name) as l_library_root then
						l_root_dir := l_library_root
					else
						l_root_dir := file_system.dirname (a_target.system_config.filename)
					end
					l_pathname := l_root_dir + pathname.substring (nb, pathname.count)
				else
					l_pathname := pathname
				end
				add_external_value (l_pathname, a_target.system_config.universe)
			end
		end

end

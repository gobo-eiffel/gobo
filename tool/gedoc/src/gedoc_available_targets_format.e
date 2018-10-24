note

	description:
	"[
		Gobo Eiffel Documentation Available-targets Format.
		Print the list of target names found in the ECF input file.
		Report an error if `target_name' is specified but
		is not the name of a target in the ECF file.
	]"

	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_AVAILABLE_TARGETS_FORMAT

inherit

	GEDOC_ECF_SYSTEM_CONFIG_FORMAT

create

	make

create {GEDOC_AVAILABLE_TARGETS_FORMAT}

	make_from_format

feature {NONE} -- Processing

	process_system_config (a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Print the list of target names found in `a_system_config'.
			-- Report an error if `target_name' is specified but
			-- is not the name of a target in `a_system_config'.
		local
			i, nb: INTEGER
		do
			if attached a_system_config.targets as l_targets then
				from
					i := 1
					nb := l_targets.count
				until
					i > nb
				loop
					error_handler.report_info_message (l_targets.target (i).name)
					i := i + 1
				end
			end
			if attached target_name as l_target_name then
				if not attached a_system_config.targets as l_targets or else not l_targets.has_target (l_target_name)then
					report_target_not_found_error (l_target_name)
				end
			end
		end

end

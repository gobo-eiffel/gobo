note

	description:

		"Geant project options"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PROJECT_OPTIONS

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize project options.
		do
		end

feature -- Access

	verbose: BOOLEAN
			-- Print additional information during build process?

	debug_mode: BOOLEAN
			-- Print additional, internal information during build process?

	no_exec: BOOLEAN
			-- Do not execute commands (only show what they would do)?

	variable_local_by_default: BOOLEAN
			-- Variable are local variable by default ?
			-- Or global (default behavior)

feature -- Setting

	set_verbose (a_verbose: BOOLEAN) is
			-- Set `verbose' to `a_verbose'
		do
			verbose := a_verbose
		ensure
			verbose_set: verbose = a_verbose
		end

	set_debug_mode (a_debug_mode: BOOLEAN) is
			-- Set `debug_mode' to `a_debug_mode'
		do
			debug_mode := a_debug_mode
		ensure
			debug_mode_set: debug_mode = a_debug_mode
		end

	set_no_exec (a_no_exec: BOOLEAN) is
			-- Set `no_exec' to `a_no_exec'
		do
			no_exec := a_no_exec
		ensure
			no_exec_set: no_exec = a_no_exec
		end

	set_variable_local_by_default (a_variable_local_by_default: BOOLEAN) is
			-- Set `variable_local_by_default' to `a_variable_local_by_default'
		do
			variable_local_by_default := a_variable_local_by_default
		ensure
			variable_local_by_default_set: variable_local_by_default = a_variable_local_by_default
		end

end

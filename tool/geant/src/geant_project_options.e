note

	description:

		"Geant project options"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2023, Sven Ehrke and others"
	license: "MIT License"

class GEANT_PROJECT_OPTIONS

create

	make

feature {NONE} -- Initialization

	make
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

	use_thread_count: BOOLEAN
			-- Should the number of threads to be used when running thread-capable
			-- tasks be overridden with `thread_count'?

	thread_count: INTEGER
			-- Number of threads to be used when running thread-capable tasks.
			-- Negative numbers -N mean "number of CPUs - N".

	variable_local_by_default: BOOLEAN
			-- Variable are local variable by default ?
			-- Or global (default behavior)

feature -- Setting

	set_verbose (a_verbose: BOOLEAN)
			-- Set `verbose' to `a_verbose'
		do
			verbose := a_verbose
		ensure
			verbose_set: verbose = a_verbose
		end

	set_debug_mode (a_debug_mode: BOOLEAN)
			-- Set `debug_mode' to `a_debug_mode'
		do
			debug_mode := a_debug_mode
		ensure
			debug_mode_set: debug_mode = a_debug_mode
		end

	set_no_exec (a_no_exec: BOOLEAN)
			-- Set `no_exec' to `a_no_exec'
		do
			no_exec := a_no_exec
		ensure
			no_exec_set: no_exec = a_no_exec
		end

	set_thread_count (a_thread_count: INTEGER)
			-- Set `thread_count' to `a_thread_count'.
		do
			thread_count := a_thread_count
			use_thread_count := True
		ensure
			use_thread_count_set: use_thread_count
			thread_count_set: thread_count = a_thread_count
		end

	set_variable_local_by_default (a_variable_local_by_default: BOOLEAN)
			-- Set `variable_local_by_default' to `a_variable_local_by_default'
		do
			variable_local_by_default := a_variable_local_by_default
		ensure
			variable_local_by_default_set: variable_local_by_default = a_variable_local_by_default
		end

end

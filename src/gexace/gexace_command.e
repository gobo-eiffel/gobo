indexing

	description:

		"Commands for 'gexace'"

	system:     "Gobo Eiffel Xace"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class GEXACE_COMMAND

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new command.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
			system_filename := default_system_filename
		ensure
			error_handler_set: error_handler = an_error_handler
			system_filename_set: system_filename = default_system_filename
		end

feature -- Access

	system_filename: STRING
			-- Name of Xace file

	default_system_filename: STRING is "system.xace"
			-- Default name of Xace file

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_system_filename (a_name: like system_filename) is
			-- Set `system_filename' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			system_filename := a_name
		ensure
			system_filename_set: system_filename = a_name
		end

feature -- Execution

	execute is
			-- Execute command.
		deferred
		end

invariant

	system_filename_not_void: system_filename /= Void
	system_filename_not_empty: system_filename.count > 0
	error_handler_not_void: error_handler /= Void

end -- class GEXACE_COMMAND

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

inherit

	ANY

	KL_IMPORTED_INPUT_STREAM_ROUTINES
		export {NONE} all end

feature -- Access

	xace_filename: STRING
			-- Name of Xace file

	variables: ET_XACE_VARIABLES
			-- Dollar variables defined

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_xace_filename (a_name: like xace_filename) is
			-- Set `xace_filename' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			xace_filename := a_name
		ensure
			xace_filename_set: xace_filename = a_name
		end

feature -- Execution

	execute is
			-- Execute command.
		deferred
		end

feature {NONE} -- Constants

	default_system_filename: STRING is "system.xace"
			-- Default name of system Xace file

	default_cluster_filename: STRING is "cluster.xace"
			-- Default name of cluster Xace file

invariant

	xace_filename_not_void: xace_filename /= Void
	xace_filename_not_empty: xace_filename.count > 0
	variables_not_void: variables /= Void
	error_handler_not_void: error_handler /= Void

end -- class GEXACE_COMMAND

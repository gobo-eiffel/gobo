note

	description:

		"Commands for 'gexace'"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001-2019, Andreas Leitner and others"
	license: "MIT License"

deferred class GEXACE_COMMAND

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

feature -- Access

	xace_filename: STRING
			-- Name of Xace file

	variables: KL_VALUES [STRING, STRING]
			-- Dollar variables defined

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_xace_filename (a_name: like xace_filename)
			-- Set `xace_filename' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			xace_filename := a_name
		ensure
			xace_filename_set: xace_filename = a_name
		end

feature -- Status report

	is_shallow: BOOLEAN
			-- Should parsing of Xace files not follow mounted libraries?

feature -- Status setting

	set_shallow (b: BOOLEAN)
			-- Set `is_shallow' to `b'.
		do
			is_shallow := b
		ensure
			shallow_set: is_shallow = b
		end

feature -- Execution

	execute
			-- Execute command.
		deferred
		end

feature {NONE} -- Constants

	default_system_filename: STRING = "system.xace"
			-- Default name of system Xace file

	default_library_filename: STRING = "library.xace"
			-- Default name of library Xace file

invariant

	xace_filename_not_void: xace_filename /= Void
	xace_filename_not_empty: xace_filename.count > 0
	variables_not_void: variables /= Void
	error_handler_not_void: error_handler /= Void

end

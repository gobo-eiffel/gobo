indexing

	description:

		"Ace file generators from Xace systems"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_XACE_GENERATOR

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new generator.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
		ensure
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Output

	generate (a_system: ET_XACE_UNIVERSE) is
			-- Generate a new Ace file from `a_system'.
		require
			a_system_not_void: a_system /= Void
			system_name_not_void: a_system.system_name /= Void
			root_class_name_not_void: a_system.root_class_name /= Void
			creation_procedure_name_not_void: a_system.creation_procedure_name /= Void
		deferred
		end

feature {NONE} -- Output

	print_indentation (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `indent' tab characters to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i: INTEGER
		do
			from i := 1 until i > indent loop
				a_file.put_character ('%T')
				i := i + 1
			end
		end

invariant

	error_handler_not_void: error_handler /= Void

end -- class ET_XACE_GENERATOR

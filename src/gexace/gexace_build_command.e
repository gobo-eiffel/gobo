indexing

	description:

		"'build' commands for 'gexace'"

	system:     "Gobo Eiffel Xace"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEXACE_BUILD_COMMAND

inherit

	GEXACE_COMMAND
		redefine
			make
		end

	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new 'build' command.
		do
			precursor (an_error_handler)
			!! generators.make
		end

feature -- Access

	generators: DS_LINKED_LIST [ET_XACE_GENERATOR]
			-- Ace file generators

	variables: ET_XACE_VARIABLES
			-- Dollar variables defined for current universe

feature -- Setting

	set_variables (a_variables: like variables) is
			-- Set `variables' to `a_variables'.
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

feature -- Execution

	execute is
			-- Execute 'build' command.
		local
			a_parser: ET_XACE_SYSTEM_PARSER
			a_system: ET_XACE_UNIVERSE
			a_file: like INPUT_STREAM_TYPE
		do
			!! a_parser.make (error_handler)
			a_file := INPUT_STREAM_.make_file_open_read (system_filename)
			if INPUT_STREAM_.is_open_read (a_file) then
				a_parser.parse_file (a_file)
				INPUT_STREAM_.close (a_file)
				a_system := a_parser.last_universe
				if a_system /= Void then
					a_system.set_variables (variables)
					execute_generators (a_system)
				end
			else
				error_handler.report_cannot_read_file_error (system_filename)
			end
		end

	execute_generators (a_system: ET_XACE_UNIVERSE) is
			-- Execute Ace file generators.
		require
			a_system_not_void: a_system /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR]
		do
			a_cursor := generators.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.generate (a_system)
				a_cursor.forth
			end
		end

invariant

	generators_not_void: generators /= Void
	no_void_generator: not generators.has (Void)

end -- class GEXACE_BUILD_COMMAND

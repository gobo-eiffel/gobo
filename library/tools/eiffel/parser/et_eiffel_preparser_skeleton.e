indexing

	description:

		"Eiffel preparser skeletons"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_EIFFEL_PREPARSER_SKELETON

inherit

	ET_EIFFEL_SCANNER_SKELETON
		rename
			make as make_eiffel_scanner,
			make_with_factory as make_eiffel_scanner_with_factory
		redefine
			reset
		end

feature {NONE} -- Initialization

	make (a_universe: ET_UNIVERSE; an_error_handler: like error_handler) is
			-- Create a new Eiffel preparser.
		require
			a_universe_not_void: a_universe /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_AST_FACTORY
		do
			!! a_factory.make
			make_with_factory (a_universe, a_factory, an_error_handler)
		ensure
			universe_set: universe = a_universe
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_universe: ET_UNIVERSE; a_factory: like ast_factory;
		an_error_handler: like error_handler) is
			-- Create a new Eiffel preparser.
		require
			a_universe_not_void: a_universe /= Void
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			universe := a_universe
			make_eiffel_scanner_with_factory ("unknown file", a_factory, an_error_handler)
		ensure
			universe_set: universe = a_universe
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			precursor
			class_keyword_found := False
			last_classname := Void
		end

feature -- Status report

	class_keyword_found: BOOLEAN
			-- Has a 'class' keyword been found?

feature -- Access

	last_classname: ET_CLASS_NAME
			-- Last classname found

	universe: ET_UNIVERSE
			-- Eiffel class universe

feature -- Parsing

	preparse_single (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Scan Eiffel file `a_file' to find the name of the class it
			-- contains. The file is supposed to contain exactly one class.
			-- Add the class to `universe.classes', but do not parse it.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		local
			a_class: ET_CLASS
		do
			filename := a_filename
			input_buffer := Eiffel_buffer
			Eiffel_buffer.set_file (a_file)
			yy_load_input_buffer
			read_token
			if last_classname /= Void then
				a_class := universe.eiffel_class (last_classname)
				if a_class.is_preparsed then
					-- TODO:
				else
					a_class.set_filename (a_filename)
					a_class.set_cluster (a_cluster)
				end
			else
				-- TODO:
			end
			reset
		rescue
			reset
		end

	preparse_multiple (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Scan Eiffel file `a_file' to find the names of the classes
			-- it contains. The file can contain more than one class. Add
			-- the classes to `universe.classes', but do not parse them.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		local
			a_class: ET_CLASS
		do
			filename := a_filename
			input_buffer := Eiffel_buffer
			Eiffel_buffer.set_file (a_file)
			yy_load_input_buffer
			from
				read_token
				if last_classname = Void then
					-- TODO:
				end
			until
				last_classname = Void
			loop
				a_class := universe.eiffel_class (last_classname)
				if a_class.is_preparsed then
					-- TODO:
				else
					a_class.set_filename (a_filename)
					a_class.set_cluster (a_cluster)
				end
				class_keyword_found := False
				last_classname := Void
				read_token
			end
			reset
		rescue
			reset
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		do
			error_handler.report_syntax_error (current_position)
			if last_class /= Void then
				last_class.set_syntax_error (True)
			end
		end

feature {NONE} -- Constants

	Eiffel_buffer: YY_FILE_BUFFER is
			-- Eiffel file input buffer
		once
			!! Result.make (std.input)
		ensure
			eiffel_buffer_not_void: Result /= Void
		end

invariant

	universe_not_void: universe /= Void

end -- class ET_EIFFEL_PREPARSER_SKELETON

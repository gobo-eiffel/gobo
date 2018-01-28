note

	description:

		"ECF Eiffel library parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_LIBRARY_PARSER

inherit

	ET_ECF_PARSER
		redefine
			make_with_factory,
			create_library_parser,
			parse_file
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make, make_standard, make_with_factory

feature {NONE} -- Initialization

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler)
			-- Create a new ECF parser using `a_factory' as AST factory.
		do
			create adapted_library.make (create {ET_IDENTIFIER}.make ("*unknown*"), create {ET_IDENTIFIER}.make ("*unknown*"), create {ET_ECF_SYSTEM}.make ("*unknown*", "*unknown*"))
			precursor (a_factory, an_error_handler)
		end

	create_library_parser (a_factory: like ast_factory; an_error_handler: like error_handler)
			-- Create `library_parser', or set it to `Current' in descendant class
			-- ET_ECF_LIBRARY_PARSER (otherwise we would recurse in
			-- `make_with_factory' forever).
		do
			library_parser := Current
		end

feature -- Access

	last_library: detachable ET_ECF_LIBRARY
			-- Eiffel library being parsed
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF library will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse ECF file `a_file'.
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF library will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.
		local
			l_old_library: ET_LIBRARY
		do
			last_library := Void
			l_old_library := adapted_library.library
			precursor (a_file)
			adapted_library.set_library (l_old_library)
		end

	parse_adapted_library (a_file: KI_CHARACTER_INPUT_STREAM; a_adapted_library: ET_ECF_ADAPTED_LIBRARY)
			-- Parse ECF file `a_file' containing the library being adapted by `a_adapted_library'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_adapted_library_not_void: a_adapted_library /= Void
		local
			l_old_adapted_library: ET_ECF_ADAPTED_LIBRARY
		do
			l_old_adapted_library := adapted_library
			adapted_library := a_adapted_library
			parse_file (a_file)
			adapted_library := l_old_adapted_library
		end

feature {NONE} -- Access

	adapted_library: ET_ECF_ADAPTED_LIBRARY
			-- Adapted version of the library being parsed, if any

feature {NONE} -- Element change

	build_system_config (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING)
			-- Build system config from `an_element'.
		do
			last_library := new_library (an_element, a_position_table, a_filename, adapted_library)
		end

invariant

	adapted_library_not_void: adapted_library /= Void

end

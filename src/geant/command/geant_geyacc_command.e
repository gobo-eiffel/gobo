indexing

  description:
        "geyacc command"

    library:    "gobo/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  "Sven Ehrke and others"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_GEYACC_COMMAND
	inherit
		GEANT_COMMAND
		end
		KL_IMPORTED_STRING_ROUTINES
		end

	
creation
	make


-- ?? how do I turn options which are on by default	off ?
	
feature
	make is
		do
			a_size := ""
			eiffel_parser_classname := ""
			grammar_filename := ""
		end

	execute is
		local
			cmd	: STRING
		do
			cmd := "geyacc "

			-- -v
			if verbose_filename /= void and then verbose_filename.count > 0 then
				cmd.append("-v ")
				cmd.append(verbose_filename)
				cmd.append(" ")
			end

			-- -x
			if separate_actions then
				cmd.append("-x ")
			end

			-- -t
			if eiffel_tokens_classname /= void and then eiffel_tokens_classname.count > 0 then
				cmd.append("-t ")
				cmd.append(eiffel_tokens_classname)
				cmd.append(" ")
			end

			-- -o
			if eiffel_parser_filename /= void and then eiffel_parser_filename.count > 0 then
				cmd.append("-o ")
				cmd.append(eiffel_parser_filename)
				cmd.append(" ")
			end

			cmd.append(grammar_filename)

			log("  [geyacc] " + cmd + "%N")
			system(cmd)
		end

	is_executable : BOOLEAN is
		do
			Result := grammar_filename /= Void and then not grammar_filename.is_empty
		ensure then
			grammar_filename_not_void : Result implies grammar_filename /= Void
			grammar_filename_not_empty: Result implies not grammar_filename.is_empty
		end

	feature -- geyacc commandline options setters

	set_verbose_filename(a_verbose_filename : STRING) is
		-- required
		require
			verbose_filename_not_void : a_verbose_filename /= Void
			verbose_filename_not_empty: not a_verbose_filename.is_empty
		do
			verbose_filename := a_verbose_filename
		end

	set_separate_actions(a_separate_actions : BOOLEAN) is
		-- -x option, default: off
		do
			separate_actions := a_separate_actions
		end

	set_eiffel_tokens_classname(a_eiffel_tokens_classname : STRING) is
		-- -t option
		-- if omitted output goes to stdout
		require
			eiffel_tokens_classname_not_void : a_eiffel_tokens_classname /= Void
			eiffel_tokens_classname_not_empty: not a_eiffel_tokens_classname.is_empty
		do
			eiffel_tokens_classname := a_eiffel_tokens_classname
		end

	set_eiffel_parser_filename(a_eiffel_parser_filename : STRING) is
		-- -o option
		-- if omitted output goes to stdout
		require
			eiffel_parser_filename_not_void : a_eiffel_parser_filename /= Void
			eiffel_parser_filename_not_empty: not a_eiffel_parser_filename.is_empty
		do
			eiffel_parser_filename := a_eiffel_parser_filename
		end

	set_grammar_filename(a_grammar_filename : STRING) is
		-- required
		require
			grammar_filename_not_void : a_grammar_filename /= Void
			grammar_filename_not_empty: not a_grammar_filename.is_empty
		do
			grammar_filename := a_grammar_filename
		end

	feature -- geyacc commandline options

	verbose_filename : STRING
		-- -v option

	separate_actions : BOOLEAN
		-- -x option, default: false

	eiffel_tokens_classname : STRING
		-- -t option

	eiffel_parser_filename : STRING
		-- -o option

	grammar_filename : STRING
		-- required

end

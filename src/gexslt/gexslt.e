indexing

	description:

		"Gobo Eiffel XSLT 2.0 processor"

	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXSLT

inherit

	GEXSLT_VERSION

	KL_SHARED_EXCEPTIONS

	KL_SHARED_ARGUMENTS

	KL_SHARED_STANDARD_FILES

	UC_SHARED_STRING_EQUALITY_TESTER

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_NAME_UTILITIES

	XM_RESOLVER_FACTORY

	KL_IMPORTED_STRING_ROUTINES

creation

	execute

feature -- Execution

	execute is
			-- Start 'gexslt' execution.
		local
			i, nb: INTEGER
			arg: STRING
		do
			Arguments.set_program_name ("gexslt")
			create error_handler.make_standard
			nb := Arguments.argument_count
			if nb = 0 then
				report_usage_message
				Exceptions.die (0)
			end
			create uris.make (nb)
			uris.set_equality_tester (string_equality_tester)
			is_line_numbering := True
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("-V") or else arg.is_equal ("--version") then
					report_version_number
					Exceptions.die (0)
				elseif arg.is_equal ("-h") or else arg.is_equal ("-?") or else arg.is_equal ("--help") then
					report_usage_message
					Exceptions.die (0)
				elseif arg.is_equal ("--") then
					are_options_disallowed := True
				elseif arg.substring_index ("--", 1) = 1 and then not are_options_disallowed then
					process_option (arg.substring (3, arg.count))
				elseif arg.index_of ('=', 2) > 0  and not are_parameters_disallowed then
					set_string_parameter (arg)
				else
					uris.put_last (arg)
				end
				i := i + 1
			end
			if uris.count = 0 then
				report_usage_message
				Exceptions.die (1)
			end
			if uris.count = 1 then
				if use_processing_instruction then
					-- TODO
					check
						False
						-- This can't happen at the moment.
					end
					report_usage_message
					Exceptions.die (1)
				else
					report_usage_message
					Exceptions.die (1)
				end
			end
			if uris.count > 2 then
				report_not_yet_implemented ("Multiple source documents")
				report_usage_message
				Exceptions.die (1)
			end
			process_uris
		end

	process_option (an_option: STRING) is
			-- Process `an_option'.
		require
			plausible_option: an_option /= Void and then an_option.count > 0
			options_allowed: not are_options_disallowed
		do
			if an_option.is_equal ("no-line-numbers") then
				is_line_numbering := False
			elseif an_option.is_equal ("tiny-tree") then
				is_tiny_tree_model := True
			elseif an_option.substring_index ("output-destination", 1) = 1 then
				report_not_yet_implemented ("Output destination")
			elseif an_option.substring_index ("use-xml-stylesheet-processing-instruction", 1) = 1 then
				report_not_yet_implemented ("Xml-stylesheet processing instruction")					
			elseif an_option.is_equal ("equals-in-uris") then
				are_parameters_disallowed := True
			elseif an_option.substring_index ("define-xpath-param=", 1) = 1 then
					report_not_yet_implemented ("XPath expressions in parameters")
			elseif an_option.substring_index ("define-param=", 1) = 1 and then an_option.count > 13 then
					set_string_parameter (an_option.substring (14, an_option.count))
			elseif an_option.substring_index ("--", 1) = 1 then
				report_unknown_option (an_option)
				report_usage_message
				Exceptions.die (1)
			end
		end

	process_uris is
			-- Read `uris' and perform transform(s).
		require
			uri_list_valid: uris /= Void
				and then uris.count = 2 -- for now
			xml_stylesheet_pi_not_yet_supported: not use_processing_instruction
			output_destination_uri_not_yet_supported: True
			parameters_not_yet_supported: True
		local
			a_stylesheet_uri, a_source_uri: XM_XSLT_URI_SOURCE
			a_destination: XM_OUTPUT
			a_configuration: XM_XSLT_CONFIGURATION
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_transformer: XM_XSLT_TRANSFORMER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.use_tiny_tree_model (is_tiny_tree_model)
			a_configuration.set_line_numbering (is_line_numbering)
			create a_stylesheet_uri.make (uris.item (1))
			create a_stylesheet.make (a_configuration)
			a_stylesheet.prepare (a_stylesheet_uri)
			if a_stylesheet.load_stylesheet_module_failed then
				report_processing_error ("Could not compile stylesheet", a_stylesheet.load_stylesheet_module_error)
			else
				a_transformer := a_stylesheet.new_transformer
				process_parameters (a_transformer)
				create a_source_uri.make (uris.item (2))
				create a_destination -- To standard output
				create a_result.make (a_destination)
				a_transformer.transform (a_source_uri, a_result)
				if a_transformer.is_error then
					-- do nothing for now - the error listener has already reported the error.
				end
			end
		end

	process_parameters (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Set any parameters onto the transformer.
		require
			transformer_not_void: a_transformer /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			if parameters /= Void then
				from
					a_cursor := parameters.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					a_transformer.set_string_parameter (a_cursor.item, a_cursor.key)
					a_cursor.forth
				end
			end
		end

feature -- Status report

	use_processing_instruction: BOOLEAN
			-- Do we read the stylesheet URI from xml-stylesheet pi?

	is_tiny_tree_model: BOOLEAN
		-- Do we build tiny trees for the source documents?

	is_line_numbering: BOOLEAN
			-- Will diagnostics include line numbers?

	are_options_disallowed: BOOLEAN
			-- Are option flags disallowed on the rest of the command line?
	
	are_parameters_disallowed: BOOLEAN
			-- Are name=value parameters disallowed on the rest of the command line?

feature -- Setting

	set_string_parameter (a_string_parameter_option: STRING) is
			-- Set a string-valued parameter on the stylesheet.
		require
			non_zero_length_parameter: a_string_parameter_option /= Void and then a_string_parameter_option.count > 0
		local
			a_string_splitter: ST_SPLITTER
			a_component_list: DS_LIST [STRING]
			a_parameter_name, a_parameter_value: STRING
		do
			create a_string_splitter.make
			a_string_splitter.set_separators ("=")
			a_component_list := a_string_splitter.split (a_string_parameter_option)
			if a_component_list.count /= 2 then
				report_string_parameter_option_syntax_message (a_string_parameter_option)
				Exceptions.die (1)
			end
			a_parameter_name := a_component_list.item (1)
			if not is_valid_expanded_name (a_parameter_name) then
				report_parameter_name_syntax_message (a_parameter_name)
				Exceptions.die (1)
			end
			a_parameter_value := a_component_list.item (2)

			-- Strip off any quotation marks around the value
			
			if a_parameter_value.count > 1 and then
				(a_parameter_value.item (1) = '"' or else a_parameter_value.item (1) = '%'') and then
				a_parameter_value.item (a_parameter_value.count) = a_parameter_value.item (1) then
				a_parameter_value := a_parameter_value.substring (2, a_parameter_value.count)
			end

			if parameters = Void then
				create parameters.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
			end
			if parameters.has (a_parameter_name) then
				report_duplicate_parameter_name (a_parameter_name)
				Exceptions.die (1)
			else
				parameters.put (a_parameter_value, a_parameter_name)
			end
		end

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	uris: DS_ARRAYED_LIST [STRING]
			-- Stylesheet and source document URIs

	parameters: DS_HASH_TABLE [STRING, STRING]
			-- String parameter values indexed by expanded name

feature -- Error handling

	report_cannot_read_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_not_yet_implemented (a_feature: STRING) is
			-- Report that `a_feature' is not yet implemented.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_feature + ": Not yet implemented. Sorry.")
			error_handler.report_error (an_error)
		end
	
	report_processing_error (a_category, a_message: STRING) is
			-- Report a compilation or transformation error.
		require
			message_not_void: a_message /= Void
			category_not_void: a_category /= Void
		local
			an_error: UT_MESSAGE
			a_message_string: STRING
		do
			a_message_string := STRING_.concat (a_category, ": ")
			a_message_string := STRING_.appended_string (a_message_string, a_message)
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	report_unknown_option (an_option: STRING) is
			-- Report that `an_option' is unknown.
		require
			option_not_void: an_option /= Void
		local
			an_error: UT_UNKNOWN_FLAG_ERROR
		do
			create an_error.make (an_option)
			error_handler.report_error (an_error)
		end

	report_string_parameter_option_syntax_message (a_string_parameter_option: STRING) is
			-- Report a syntax error with a string parameter option.
		require
			parameter_option_not_void: a_string_parameter_option /= Void
		local
			an_error: UT_MESSAGE
			a_message_string: STRING
		do
			a_message_string := STRING_.concat ("Bad syntax for string parameter: ", a_string_parameter_option)
			a_message_string := STRING_.appended_string (a_message_string, ".%NSyntax is [--][{namespace-uri}]local-name=[%"|']value[%"|']%N")
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	report_parameter_name_syntax_message (a_parameter_name: STRING) is
			-- Report a syntax error with a parameter name.
		require
			parameter_name_not_void: a_parameter_name /= Void
		local
			an_error: UT_MESSAGE
			a_message_string: STRING
		do
			a_message_string := STRING_.concat ("Bad syntax for parameter name: ", a_parameter_name)
			a_message_string := STRING_.appended_string (a_message_string, ".%NSyntax is [{namespace-uri}]local-name%N")
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end	

	report_duplicate_parameter_name (a_parameter_name: STRING) is
			-- Report a duplicate parameter name.
		require
			parameter_name_not_void: a_parameter_name /= Void
		local
			an_error: UT_MESSAGE
			a_message_string: STRING
		do
			a_message_string := STRING_.concat ("Parameter name: ", a_parameter_name)
			a_message_string := STRING_.appended_string (a_message_string, " appears more than once on the command line%N")
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	report_usage_message is
			-- Report usage message.
		do
			error_handler.report_info (Usage_message)
		end

	report_version_number is
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end
	
	Usage_message: UT_USAGE_MESSAGE is
			-- Gexslt usage message.
		once
			create Result.make ("stylesheet-URI source-document-URI [parameter-name=value]* %N" +
									  " or    gexslt --use-xml-stylesheet-processing-instruction source-document-URI [parameter-name=value]* %N" +
									  " or    gexslt --version%N" +
									  " or    gexslt --help%N" +
									  "      Options can appear anywhere before -- .%N" +
									  "       -- %N" +
									  "       --output-destination=URI%N" +
									  "       --equals-in-uris%N" +
									  "       --no-line-numbers%N" +
									  "       --tiny-tree%N" +
									  "       --define-param=name=string-value%N" +
									  "       --define-xpath-param=name=xpath-expression%N")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end

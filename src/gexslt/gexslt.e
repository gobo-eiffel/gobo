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

	XM_SHARED_CATALOG_MANAGER

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

	MEMORY

creation

	execute

feature -- Execution

	execute is
			-- Start 'gexslt' execution.
		local
			i, nb: INTEGER
			arg: STRING
		do
			create configuration.make_with_defaults
			error_handler := configuration.error_reporter
			Arguments.set_program_name ("gexslt")
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
				elseif arg.substring_index ("--", 1) = 1 then
					process_option (arg.substring (3, arg.count))
				elseif arg.index_of ('=', 2) > 0 then
					set_string_parameter (arg)
				else
					process_file_or_uri (arg)
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

feature -- Status report

	use_processing_instruction: BOOLEAN
			-- Do we read the stylesheet URI from xml-stylesheet pi?

	is_tiny_tree_model: BOOLEAN
		-- Do we build tiny trees for the source documents?

	is_line_numbering: BOOLEAN
			-- Will diagnostics include line numbers?

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
				a_parameter_value := a_parameter_value.substring (2, a_parameter_value.count - 1)
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

	output_destination: STRING
			-- Output destination URL (if `Void' use standard output)

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
			a_message_string := STRING_.appended_string (a_message_string, ".%NSyntax is [--][{namespace-uri}]local-name=[']value[']%N")
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
	
	report_general_message (a_message_string: STRING) is
			-- Report a miscellaneous message.
		require
			message_not_void: a_message_string /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end
	
	Usage_message: UT_USAGE_MESSAGE is
			-- Gexslt usage message.
		once
			create Result.make ("[--file=|--uri=]stylesheet-URI [--file=|--uri=]source-document-URI [option]* [parameter-name=value]* %N" +
									  " or    gexslt --version%N" +
									  " or    gexslt --help%N" +
									  "       --output=local-file-name%N" +
									  "       --errors=[local-file-name]%N" +
									  "       --warnings=[local-file-name]%N" +
									  "       --errors-and-warnings=[local-file-name]%N" +
									  "       --no-line-numbers%N" +
									  "       --no-gc%N" +
									  "       --no-catalogs%N" +
									  "       --no-catalog-pi%N" +
									  "       --prefer-system%N" +
									  "       --no-default-catalog%N" +
									  "       --catalog-debug-level=[0-10]%N" +
									  "       --output=local-file-name%N" +
									  "       --tiny-tree%N" +
									  "       --param=name=string-value%N" +
									  "       --xpath-param=name=xpath-expression%N")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	configuration: XM_XSLT_CONFIGURATION
			-- Configuration

	process_option (an_option: STRING) is
			-- Process `an_option'.
		require
			plausible_option: an_option /= Void and then an_option.count > 0
		local
			an_integer: INTEGER
			a_number: STRING
		do
			if an_option.is_equal ("no-line-numbers") then
				is_line_numbering := False
			elseif an_option.is_equal ("tiny-tree") then
				is_tiny_tree_model := True
			elseif an_option.substring_index ("output=", 1) = 1 then
				if an_option.count > 7 then
					output_destination := an_option.substring (8, an_option.count)
				else
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.substring_index ("use-pi", 1) = 1 then
				report_not_yet_implemented ("Xml-stylesheet processing instruction")					
			elseif an_option.substring_index ("template", 1) = 1 then
				report_not_yet_implemented ("Initial template")					
			elseif an_option.substring_index ("mode", 1) = 1 then
				report_not_yet_implemented ("Initial mode")					
			elseif an_option.is_equal ("no-gc") then
				collection_off
			elseif an_option.substring_index ("xpath-param=", 1) = 1 then
				report_not_yet_implemented ("XPath expressions in parameters")
			elseif an_option.substring_index ("param=", 1) = 1 and then an_option.count > 6 then
				set_string_parameter (an_option.substring (7, an_option.count))
			elseif an_option.substring_index ("file=", 1) = 1 and then an_option.count > 5 then
				process_file (an_option.substring (6, an_option.count))
			elseif an_option.is_equal ("no-catalogs") then
				shared_catalog_manager.suppress_catalogs
			elseif an_option.is_equal ("no-catalog-pi") then
				shared_catalog_manager.suppress_processing_instructions
			elseif an_option.is_equal ("no-default-catalog") then
				shared_catalog_manager.suppress_default_system_catalog_file
			elseif an_option.is_equal ("prefer-system") then
				shared_catalog_manager.set_prefer_system
			elseif an_option.substring_index ("warnings=", 1) = 1 then
				if an_option.count = 9 then
					error_handler.set_warning_null
				else
					set_warning_file (an_option.substring (10, an_option.count))
				end
			elseif an_option.substring_index ("errors=", 1) = 1 then
				if an_option.count = 7 then
					error_handler.set_error_null
				else
					set_error_file (an_option.substring (8, an_option.count))
				end
			elseif an_option.substring_index ("errors-and-warnings=", 1) = 1 then
				if an_option.count = 20 then
					error_handler.set_error_null
					error_handler.set_warning_null
				else
					set_errors_and_warnings (an_option.substring (21, an_option.count))
				end
			elseif an_option.substring_index ("trace-destination=", 1) = 1 and then an_option.count > 18 then
				set_trace_file (an_option.substring (19, an_option.count))
			elseif an_option.substring_index ("catalog-debug-level=", 1) = 1 and then an_option.count > 20 then
				a_number := an_option.substring (21, an_option.count)
				if a_number.is_integer then
					an_integer := a_number.to_integer
					shared_catalog_manager.set_debug_level (an_integer)
				else
					report_general_message ("Catalog-debug-level must specify an integer between 0 and 10 inclusive")
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.substring_index ("uri=", 1) = 1 and then an_option.count > 4 then
					process_uri (an_option.substring (5, an_option.count))
			else
				report_unknown_option (an_option)
				report_usage_message
				Exceptions.die (1)
			end
		end

	process_file (a_file: STRING) is
			-- Convert `a_file' to a URI and add it to `uris'.
		require
			at_least_one_character: a_file /= Void and then a_file.count > 0
		local
			a_uri: STRING
		do
			a_uri := unix_file_system.pathname_from_file_system (a_file, file_system)
			uris.put_last (a_uri)
		end
	
	process_uri (a_uri: STRING) is
			-- Add a URI-valued argument to `uris'.
		require
			at_least_one_character: a_uri /= Void and then a_uri.count > 0
		do
			uris.put_last (a_uri)
		end

	process_file_or_uri (a_file_or_uri: STRING) is
			-- Process `a_file_or_uri' as a file name or a URI.
		require
			at_least_one_character: a_file_or_uri /= Void and then a_file_or_uri.count > 0
		local
			is_file: BOOLEAN
		do
			if a_file_or_uri.index_of ('\', 1) > 0 then
				is_file := True
			else
				if a_file_or_uri.index_of (':', 1) = 2 then
					is_file := True
				end
			end
			if is_file then
				process_file (a_file_or_uri)
			else
				process_uri (a_file_or_uri)
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
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_transformer: XM_XSLT_TRANSFORMER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_stream: KL_TEXT_OUTPUT_FILE
		do
			conformance.set_basic_xslt_processor
			configuration.use_tiny_tree_model (is_tiny_tree_model)
			configuration.set_line_numbering (is_line_numbering)
			create a_stylesheet_uri.make (uris.item (1))
			create a_stylesheet.make (configuration)
			a_stylesheet.prepare (a_stylesheet_uri)
			if a_stylesheet.load_stylesheet_module_failed then
				report_processing_error ("Could not compile stylesheet", a_stylesheet.load_stylesheet_module_error)
				Exceptions.die (2)
			else
				a_transformer := a_stylesheet.new_transformer
				process_parameters (a_transformer)
				create a_source_uri.make (uris.item (2))
				create a_destination -- To standard output
				if output_destination /= Void then
					create a_stream.make (output_destination)
					a_stream.open_write
					a_destination.set_output_stream (a_stream)
				end
				create a_result.make (a_destination)
				a_transformer.transform (a_source_uri, a_result)
				if a_stream /= Void then
					a_stream.close
				end
				if a_transformer.is_error then
					Exceptions.die (3) -- the error listener has already reported the error.message
				end
			end
		end

	process_parameters (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Set any parameters onto the transformer.
		require
			transformer_not_void: a_transformer /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
			a_string: STRING
		do
			if parameters /= Void then
				from
					a_cursor := parameters.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					a_string := a_cursor.item
					if a_string.count > 1 and then a_string.index_of ('%'', 1) = 1 and then a_string.index_of ('%'', a_string.count) > 0 then

						-- Strip off surrounding single quotes

						a_string := a_string.substring (1, a_string.count - 1)
					end
					a_transformer.set_string_parameter (a_string, a_cursor.key)
					a_cursor.forth
				end
			end
		end

	set_warning_file (a_filename: STRING) is
			-- Set warning output to `a_filename'.
		require
			file_name_not_void: a_filename /= Void
		local
			a_file: KI_TEXT_OUTPUT_FILE
		do
			a_file := file_system.new_output_file (a_filename)
			a_file.open_write
			error_handler.set_warning_file (a_file)
		end
			
	set_error_file (a_filename: STRING) is
			-- Set error output to `a_filename'.
		require
			file_name_not_void: a_filename /= Void
		local
			a_file: KI_TEXT_OUTPUT_FILE
		do
			a_file := file_system.new_output_file (a_filename)
			a_file.open_write
			error_handler.set_error_file (a_file)
		end
			
	set_errors_and_warnings (a_filename: STRING) is
			-- Set error and warning output to `a_filename'.
		require
			file_name_not_void: a_filename /= Void
		local
			a_file: KI_TEXT_OUTPUT_FILE
		do
			a_file := file_system.new_output_file (a_filename)
			a_file.open_write
			error_handler.set_error_file (a_file)
			error_handler.set_warning_file (a_file)
		end
			

	set_trace_file (a_filename: STRING) is
			-- Set trace output to `a_filename'.
		require
			file_name_not_void: a_filename /= Void
		local
			a_file: KI_TEXT_OUTPUT_FILE
		do
			a_file := file_system.new_output_file (a_filename)
			a_file.open_write
			error_handler.set_info_file (a_file)
		end
			
invariant

	error_handler_not_void: error_handler /= Void

end

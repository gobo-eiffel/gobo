note

	description:

		"Gobo Eiffel XSLT 2.0 processor"

	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEXSLT

inherit

	GEXSLT_VERSION

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_SHARED_CONFORMANCE
		export {NONE} all end

	XM_XSLT_SHARED_EMITTER_FACTORY
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_SHARED_CATALOG_MANAGER
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

	UT_SHARED_URL_ENCODING
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XSLT_CONFIGURATION_CONSTANTS
		export {NONE} all end

	KL_SHARED_MEMORY
		export {NONE} all end

create

	execute

feature -- Execution

	execute
			-- Start 'gexslt' execution.
		local
			i, nb: INTEGER
			arg: STRING
		do
			digits := 18
			create configuration.make_with_defaults
			error_handler := configuration.error_reporter
			error_listener := configuration.error_listener
			Arguments.set_program_name (program_name)
			configure_system_properties
			nb := Arguments.argument_count
			if nb = 0 then
				report_usage_message
				Exceptions.die (0)
			end
			initial_template_name := Void
			initial_mode_name := Void
			initial_context := Void
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
						-- This is dealt with in `process_uris'.
				else
					if initial_template_name = Void then
						report_general_message ("An initial template must be named when the source document is omitted")
						report_usage_message
						Exceptions.die (1)
					else
						-- This is dealt with in `process_uris'.
					end
				end
			end
			if uris.count > 2 then
				report_not_yet_implemented ("Multiple source documents")
				report_usage_message
				Exceptions.die (1)
			end
			process_uris
			if configuration.final_execution_phase > Stop_after_compilation then
				perform_transformation
			end
		end

feature -- Status report

	use_processing_instruction: BOOLEAN
			-- Do we read the stylesheet URI from xml-stylesheet pi?

	is_tiny_tree_model: BOOLEAN
		-- Do we build tiny trees for the source documents?

	is_reporting_document_statistics: BOOLEAN
			-- Do we report statistics on tiny-tree source documents?

	estimated_nodes, estimated_attributes, estimated_namespaces, estimated_characters: INTEGER
			-- estimates for tiny-tree parameters

	is_line_numbering: BOOLEAN
			-- Will diagnostics include line numbers?

	initial_template_name: detachable STRING
			-- Name of initial template to be invoked

	initial_mode_name: detachable STRING
			-- Name of initial mode

	initial_context: detachable STRING
			-- XPath expression to determine initial context node

	is_tracing: BOOLEAN
			-- Is tracing requested?

	is_timed_tracing: BOOLEAN
			-- Are trace timings requested?

	is_timing: BOOLEAN
			-- Is timing requested?

feature -- Setting

	set_string_parameter (a_string_parameter_option: STRING)
			-- Set a string-valued parameter on the stylesheet.
		require
			non_zero_length_parameter: a_string_parameter_option /= Void and then a_string_parameter_option.count > 0
		local
			a_string_splitter: ST_SPLITTER
			a_component_list: DS_LIST [STRING]
			a_parameter_name, a_parameter_value: STRING
			l_parameters: like parameters
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

			l_parameters := parameters
			if l_parameters = Void then
				create l_parameters.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
				parameters := l_parameters
			end
			if l_parameters.has (a_parameter_name) then
				report_duplicate_parameter_name (a_parameter_name)
				Exceptions.die (1)
			else
				l_parameters.force_new (a_parameter_value, a_parameter_name)
			end
		end

	set_xpath_parameter (a_string_parameter_option: STRING)
			-- Set an XPath-valued parameter on the stylesheet.
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
				report_xpath_parameter_option_syntax_message (a_string_parameter_option)
				Exceptions.die (1)
			end
			a_parameter_name := a_component_list.item (1)
			if not is_valid_expanded_name (a_parameter_name) then
				report_parameter_name_syntax_message (a_parameter_name)
				Exceptions.die (1)
			end
			a_parameter_value := a_component_list.item (2)

			if not attached xpath_parameters as l_xpath_parameters then
				create xpath_parameters.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
			elseif l_xpath_parameters.has (a_parameter_name) then
				report_duplicate_parameter_name (a_parameter_name)
				Exceptions.die (1)
			else
				l_xpath_parameters.put_new (a_parameter_value, a_parameter_name)
			end
		end

feature -- Access

	program_name: STRING
			-- Program name
		do
			Result := "gexslt"
		ensure
			program_name_not_void: Result /= Void
		end

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listenmer

	uris: DS_ARRAYED_LIST [STRING]
			-- Stylesheet and source document URIs

	parameters: detachable DS_HASH_TABLE [STRING, STRING]
			-- String parameter values indexed by expanded name

	xpath_parameters: detachable DS_HASH_TABLE [STRING, STRING]
			-- XPath parameter values indexed by expanded name

	output_destination: detachable STRING
			-- Output destination URL (if `Void' use standard output)

	highly_secure: BOOLEAN
			-- Is high security wanted?

	digits: INTEGER
			-- Maximum number of digits in xs:decimal/xs:integer values

feature -- Error handling

	report_cannot_read_error (a_filename: STRING)
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

	report_not_yet_implemented (a_feature: STRING)
			-- Report that `a_feature' is not yet implemented.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_feature + ": Not yet implemented. Sorry.")
			error_handler.report_error (an_error)
		end

	report_processing_error (a_category, a_message: STRING)
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

	report_unknown_option (an_option: STRING)
			-- Report that `an_option' is unknown.
		require
			option_not_void: an_option /= Void
		local
			an_error: UT_UNKNOWN_FLAG_ERROR
		do
			create an_error.make (an_option)
			error_handler.report_error (an_error)
		end

	report_string_parameter_option_syntax_message (a_string_parameter_option: STRING)
			-- Report a syntax error with a string parameter option.
		require
			parameter_option_not_void: a_string_parameter_option /= Void
		local
			an_error: UT_MESSAGE
			a_message_string: STRING
		do
			a_message_string := STRING_.concat ("Bad syntax for string parameter: ", a_string_parameter_option)
			a_message_string := STRING_.appended_string (a_message_string, ".%NSyntax is [--][namespace-uri#]local-name=[']value[']%N")
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	report_xpath_parameter_option_syntax_message (a_parameter_option: STRING)
			-- Report a syntax error with an XPath parameter option.
		require
			parameter_option_not_void: a_parameter_option /= Void
		local
			an_error: UT_MESSAGE
			a_message_string: STRING
		do
			a_message_string := STRING_.concat ("Bad syntax for XPath parameter: ", a_parameter_option)
			a_message_string := STRING_.appended_string (a_message_string, ".%NSyntax is [--][namespace-uri#]local-name=value%N")
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	report_parameter_name_syntax_message (a_parameter_name: STRING)
			-- Report a syntax error with a parameter name.
		require
			parameter_name_not_void: a_parameter_name /= Void
		local
			an_error: UT_MESSAGE
			a_message_string: STRING
		do
			a_message_string := STRING_.concat ("Bad syntax for parameter name: ", a_parameter_name)
			a_message_string := STRING_.appended_string (a_message_string, ".%NSyntax is [namespace-uri#]local-name%N")
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	report_duplicate_parameter_name (a_parameter_name: STRING)
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

	report_usage_message
			-- Report usage message.
		do
			error_handler.report_info (Usage_message)
		end

	report_version_number
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

	report_general_message (a_message_string: STRING)
			-- Report a miscellaneous message.
		require
			message_not_void: a_message_string /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	Usage_message: UT_USAGE_MESSAGE
			-- Gexslt usage message.
		once
			create Result.make ("[--file=|--uri=]stylesheet-URI [--file=|--uri=]source-document-URI [option]* [parameter-name=value]* %N" +
									  " or    " + program_name + " --version%N" +
									  " or    " + program_name + " --help%N" +
									  "       --output=local-file-name%N" +
									  "       --errors=[local-file-name]%N" +
									  "       --warnings=[local-file-name]%N" +
									  "       --errors-and-warnings=[local-file-name]%N" +
									  "       --warning-threshold=number%N" +
									  "       --error-threshold=number%N" +
									  "       --treat-warnings-as-errors%N" +
									  "       --secure%N" +
									  "       --recover-silently%N" +
									  "       --do-not-recover%N" +
									  "       --no-line-numbers%N" +
									  "       --no-output-extensions%N" +
									  "       --no-extension-functions%N" +
									  "       --no-gc%N" +
									  "       --no-network-protocols%N" +
									  "       --digits=[n]%N" +
									  "       --no-catalogs%N" +
									  "       --no-catalog-pi%N" +
									  "       --prefer-system%N" +
									  "       --no-default-catalog%N" +
									  "       --catalog-debug-level=[0-10]%N" +
									  "       --trace=local-file-name%N" +
									  "       --timed-trace=local-file-name%N" +
									  "       --suppress-xpath-tracing%N" +
									  "       --suppress-default-action%N" +
									  "       --default-template-warning%N" +
									  "       --tiny-tree%N" +
									  "       --report-document-statistics%N" +
									  "       --nodes=[n]%N" +
									  "       --attributes=[n]%N" +
									  "       --namespaces=[n]%N" +
									  "       --characters=[n]%N" +
									  "       --html-text-ok%N" +
									  "       --mode=[namespace-uri#]local-name%N" +
									  "       --template=[namespace-uri#]local-name%N" +
									  "       --context=xpath-expression%N" +
									  "       --param=[namespace-uri#]local-name=string-value%N" +
									  "       --xpath-param=[namespace-uri#]local-name=xpath-expression%N" +
									  "       --stop-after-compilation%N" +
									  "       --stop-after-source-document%N" +
									  "       --force-explaining%N" +
									  "       --suppress-dtd%N" +
									  additional_options)
		ensure
			usage_message_not_void: Result /= Void
		end

	additional_options: STRING
			-- Additional supported options
		do

			-- This is intended for use by descendants

			Result := ""
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	configuration: XM_XSLT_CONFIGURATION
			-- Configuration

	trace_file: detachable KI_TEXT_OUTPUT_FILE
			-- File fro trace output

	suppress_output_extensions: BOOLEAN
			-- Suppress QName methods for xsl:output.

	suppress_extension_functions: BOOLEAN
			-- Suppress all extension functions

	suppress_network_protocols: BOOLEAN
			-- Suppress URI schemes that access the network.

	medium: detachable STRING
			-- Target medium (for use with  xml-stylesheet PIs)

	title: detachable STRING
			-- Target style (for use with  xml-stylesheet PIs)

	set_digits (a_value: STRING)
			-- Set precision or decimal and integer values.
		require
			a_value_not_void: a_value /= Void
		do
			if a_value.is_integer then
				digits := a_value.to_integer
				if digits < 18 then
					report_general_message ("digits must exceed 17")
					report_usage_message
					Exceptions.die (1)
				end
			else
				report_general_message ("digits must specify a positive integer over 17")
				report_usage_message
				Exceptions.die (1)
			end
		end

	process_option (an_option: STRING)
			-- Process `an_option'.
		require
			plausible_option: an_option /= Void and then an_option.count > 0
		local
			an_integer: INTEGER
			a_number: STRING
		do
			if an_option.is_equal ("no-line-numbers") then
				is_line_numbering := False
			elseif an_option.is_equal ("force-explaining") then
				configuration.force_explaining
			elseif an_option.is_equal ("suppress-dtd") then
				configuration.suppress_dtd
			elseif an_option.is_equal ("tiny-tree") then
				is_tiny_tree_model := True
			elseif an_option.is_equal ("report-document-statistics") then
				is_reporting_document_statistics := True
			elseif an_option.substring_index ("nodes=", 1) = 1 then
				if an_option.count > 6 then
					a_number := an_option.substring (7, an_option.count)
					if a_number.is_integer and then a_number.to_integer > 0 then
						estimated_nodes := a_number.to_integer
					else
						report_general_message ("nodes must specify a positive integer")
						report_usage_message
						Exceptions.die (1)
					end
				else
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.substring_index ("attributes=", 1) = 1 then
				if an_option.count > 11 then
					a_number := an_option.substring (12, an_option.count)
					if a_number.is_integer and then a_number.to_integer > 0 then
						estimated_attributes := a_number.to_integer
					else
						report_general_message ("attributes must specify a positive integer")
						report_usage_message
						Exceptions.die (1)
					end
				else
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.substring_index ("namespaces=", 1) = 1 then
				if an_option.count > 11 then
					a_number := an_option.substring (12, an_option.count)
					if a_number.is_integer and then a_number.to_integer > 0 then
						estimated_namespaces := a_number.to_integer
					else
						report_general_message ("namespaces must specify a positive integer")
						report_usage_message
						Exceptions.die (1)
					end
				else
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.substring_index ("characters=", 1) = 1 then
				if an_option.count > 11 then
					a_number := an_option.substring (12, an_option.count)
					if a_number.is_integer and then a_number.to_integer > 0 then
						estimated_characters := a_number.to_integer
					else
						report_general_message ("characters must specify a positive integer")
						report_usage_message
						Exceptions.die (1)
					end
				else
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.substring_index ("output=", 1) = 1 then
				if an_option.count > 7 then
					output_destination := an_option.substring (8, an_option.count)
				else
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.is_equal ("use-pi") then
				use_processing_instruction := True
			elseif an_option.substring_index ("medium=", 1) = 1 and then an_option.count > 7 then
				medium := an_option.substring (8, an_option.count)
			elseif an_option.substring_index ("title=", 1) = 1 and then an_option.count > 6 then
				title := an_option.substring (7, an_option.count)
			elseif an_option.substring_index ("template=", 1) = 1 and then an_option.count > 9 then
				initial_template_name := an_option.substring (10, an_option.count)
			elseif an_option.substring_index ("mode=", 1) = 1 and then an_option.count > 5 then
				initial_mode_name := an_option.substring (6, an_option.count)
			elseif an_option.substring_index ("context=", 1) = 1 and then an_option.count > 8 then
				initial_context := an_option.substring (9, an_option.count)
			elseif an_option.is_equal ("no-gc") then
				memory.collection_off
			elseif an_option.is_equal ("secure") then
				highly_secure := True
			elseif an_option.is_equal ("html-text-ok") then
				configuration.do_not_assume_xhtml
			elseif an_option.is_equal ("default-template-warning") then
				configuration.set_warns_on_default_action (True)
			elseif an_option.is_equal ("suppress-default-action") then
				configuration.set_default_action_suppressed (True)
			elseif an_option.is_equal ("treat-warnings-as-errors") then
				error_listener.treat_warnings_as_recoverable_errors
			elseif an_option.is_equal ("do-not-recover") then
				configuration.set_recovery_policy (Do_not_recover)
			elseif an_option.is_equal ("recover-silently") then
				configuration.set_recovery_policy (Recover_silently)
			elseif an_option.is_equal ("stop-after-source-document") then
				configuration.set_final_execution_phase (Stop_after_principal_source)
			elseif an_option.is_equal ("stop-after-compilation") then
				configuration.set_final_execution_phase (Stop_after_compilation)
			elseif an_option.substring_index ("warning-threshold=", 1) = 1 and then an_option.count > 18 then
				set_warning_threshold (an_option.substring (19, an_option.count))
			elseif an_option.substring_index ("error-threshold=", 1) = 1 and then an_option.count > 16 then
				set_error_threshold (an_option.substring (17, an_option.count))
			elseif an_option.substring_index ("xpath-param=", 1) = 1 and then an_option.count > 12 then
				set_xpath_parameter (an_option.substring (13, an_option.count))
			elseif an_option.substring_index ("param=", 1) = 1 and then an_option.count > 6 then
				set_string_parameter (an_option.substring (7, an_option.count))
			elseif an_option.substring_index ("file=", 1) = 1 and then an_option.count > 5 then
				process_file (an_option.substring (6, an_option.count))
			elseif an_option.substring_index ("digits=", 1) = 1 and then an_option.count > 7 then
				set_digits (an_option.substring (8, an_option.count))
			elseif an_option.is_equal ("no-output-extensions") then
				suppress_output_extensions := True
			elseif an_option.is_equal ("no-extension-functions") then
				suppress_extension_functions := True
			elseif an_option.is_equal ("no-network-protocols") then
				suppress_network_protocols := True
			elseif an_option.is_equal ("no-catalogs") then
				shared_catalog_manager.suppress_catalogs
			elseif an_option.is_equal ("no-catalog-pi") then
				shared_catalog_manager.suppress_processing_instructions
			elseif an_option.is_equal ("no-default-catalog") then
				shared_catalog_manager.suppress_default_system_catalog_file
			elseif an_option.is_equal ("prefer-system") then
				shared_catalog_manager.set_prefer_system
			elseif an_option.substring_index ("error-script=", 1) = 1 then
				if an_option.count > 13 then
					set_error_script (an_option.substring (14, an_option.count))
				end
			elseif an_option.substring_index ("user=", 1) = 1 then
				if an_option.count > 5 then
					set_user_name (an_option.substring (6, an_option.count))
				end
			elseif an_option.substring_index ("password=", 1) = 1 then
				if an_option.count > 9 then
					set_password (an_option.substring (10, an_option.count))
				end
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
			elseif an_option.substring_index ("suppress-xpath-tracing", 1) = 1 then
				configuration.suppress_trace_output (True)
			elseif an_option.substring_index ("time", 1) = 1 then
				is_timing := True
			elseif an_option.substring_index ("trace", 1) = 1 then
				is_tracing := True
				is_timed_tracing := False
				if an_option.count > 6 and then an_option.item (6) = '=' then
					set_trace_file (an_option.substring (7, an_option.count))
				elseif an_option.count > 5 then
					report_usage_message
					Exceptions.die (1)
				end
			elseif an_option.substring_index ("timed-trace", 1) = 1 then
				is_tracing := True
				is_timed_tracing := True
				if an_option.count > 12 and then an_option.item (12) = '=' then
					set_trace_file (an_option.substring (13, an_option.count))
				elseif an_option.count > 11 then
					report_usage_message
					Exceptions.die (1)
				end
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

	process_file (a_file: STRING)
			-- Convert `a_file' to a URI and add it to `uris'.
		require
			at_least_one_character: a_file /= Void and then a_file.count > 0
		local
			a_uri: UT_URI
		do
			create a_uri.make_resolve_uri (current_directory_base, File_uri.filename_to_uri (a_file))
			uris.put_last (a_uri.full_reference)
		end

	current_directory_base: UT_URI
			-- URI of current directory
		local
			a_cwd: KI_PATHNAME
		once
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := File_uri.pathname_to_uri (a_cwd)
		end

	process_uri (a_uri: STRING)
			-- Add a URI-valued argument to `uris'.
		require
			at_least_one_character: a_uri /= Void and then a_uri.count > 0
		local
			l_uri: UT_URI
		do
			create l_uri.make_resolve (current_directory_base, a_uri)
			uris.put_last (l_uri.full_reference)
		end

	process_file_or_uri (a_file_or_uri: STRING)
			-- Process `a_file_or_uri' as a file name or a URI.
		require
			at_least_one_character: a_file_or_uri /= Void and then a_file_or_uri.count > 0
		local
			is_file: BOOLEAN
		do
			if a_file_or_uri.index_of ('\', 1) > 0 then
				is_file := True
			end
			if is_file then
				process_file (a_file_or_uri)
			else
				process_uri (a_file_or_uri)
			end
		end

	transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			-- Transformer factory

	process_uris
			-- Read `uris' and perform transform(s).
		require
			uri_list_valid: uris /= Void
				and then (uris.count = 2 or else  uris.count = 1)
		local
			l_source: XM_XSLT_URI_SOURCE
			l_stylesheet_source: XM_XSLT_SOURCE
			l_chooser: XM_XSLT_PI_CHOOSER
			l_medium: like medium
		do
			conformance.set_basic_xslt_processor
			configuration.use_tiny_tree_model (is_tiny_tree_model)
			configuration.set_digits (digits)
			configuration.report_tiny_tree_statistics (is_reporting_document_statistics)
			if is_tiny_tree_model then
				configuration.set_tiny_tree_estimates (estimated_nodes, estimated_attributes, estimated_namespaces, estimated_characters)
			end
			configuration.set_line_numbering (is_line_numbering)
			if is_timing then
				configuration.set_timing (True)
			end
			if is_tracing then set_trace_handler end
			if highly_secure then configuration.output_resolver.security_manager.set_high_security (True) end
			if not suppress_output_extensions then
				register_output_extensions
			end
			if not suppress_extension_functions then
				register_extension_functions
			end
			if not suppress_network_protocols then
				register_network_protocols
			end
			register_non_network_protocols
			create transformer_factory.make (configuration)
			if use_processing_instruction then
				create l_source.make (uris.item (1))
				l_medium := medium
				if l_medium = Void then
					l_medium := "screen"
					medium := l_medium
				elseif l_medium.is_equal ("all") then
					report_processing_error ("Forbidden option value", "Medium must not be 'all'")
					Exceptions.die (1)
				end
				if attached title as l_title and then l_title.count > 1 then
					if l_title.item (1) = '"' and then l_title.item (l_title.count) = '"' then
						title := l_title.substring (2, l_title.count - 1)
					end
				end
				if not attached title as l_title then
					create {XM_XSLT_PREFERRED_PI_CHOOSER} l_chooser.make
				else
					create {XM_XSLT_PI_CHOOSER_BY_NAME} l_chooser.make (l_title)
				end
				l_stylesheet_source := transformer_factory.associated_stylesheet (l_source.system_id, l_medium, l_chooser)
				if l_stylesheet_source = Void then
					report_processing_error ("Unable to compile stylesheet",  "Xml-stylesheet processing instuction(s) did not lead to a stylesheet being compiled sucessfully..")
					create {XM_XSLT_URI_SOURCE} l_stylesheet_source.make (uris.item (1))
					Exceptions.die (2)
				end
			else
				create {XM_XSLT_URI_SOURCE} l_stylesheet_source.make (uris.item (1))
			end
			transformer_factory.create_new_transformer (l_stylesheet_source, current_directory_base)
			if transformer_factory.was_error then
				check invariant_of_XM_XSLT_TRANSFORMER_FACTORY: attached transformer_factory.last_error_message as l_last_error_message then
					report_processing_error ("Could not compile stylesheet", l_last_error_message)
					Exceptions.die (2)
				end
			end
		ensure
			transformer_factory_not_void: transformer_factory /= Void
			no_error: not transformer_factory.was_error
		end

	perform_transformation
			-- Perform transformation.
		require
			transformer_factory_not_void: transformer_factory /= Void
			no_error: not transformer_factory.was_error
			transformer_created: transformer_factory.created_transformer /= Void
		local
			a_source: detachable XM_XSLT_URI_SOURCE
			a_destination: XM_OUTPUT
			a_destination_system_id: STRING
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_stream: detachable KL_TEXT_OUTPUT_FILE
			a_uri: UT_URI
		do
			check precondition: attached transformer_factory.created_transformer as a_transformer then
				process_parameters (a_transformer)
				if uris.count = 2 then
					create a_source.make (uris.item (2))
				end
				if attached initial_template_name as l_initial_template_name then
					a_transformer.set_initial_template (l_initial_template_name)
				end
				if not a_transformer.is_error and attached initial_mode_name as l_initial_mode_name then
					a_transformer.set_initial_mode (l_initial_mode_name)
				end
				if not a_transformer.is_error and attached initial_context as l_initial_context then
					a_transformer.set_initial_context (l_initial_context)
				end
				if not a_transformer.is_error then
					create a_destination -- To standard output
					if attached output_destination as l_output_destination then
						create a_stream.make (l_output_destination)
						a_stream.open_write
						a_destination.set_output_stream (a_stream)
						create a_uri.make_resolve_uri (current_directory_base,
															File_uri.filename_to_uri (l_output_destination))
						a_destination_system_id := a_uri.full_reference
					else
						a_destination_system_id := "stdout:"
					end
					create a_result.make (a_destination, a_destination_system_id)
					a_transformer.transform (a_source, a_result)
				end
				if a_stream /= Void then
					a_stream.close
				end
				if attached trace_file as l_trace_file then
					l_trace_file.close
				end
				if a_transformer.is_error then
					Exceptions.die (3) -- the error listener has already reported the error.message
				end
			end
		end

	process_parameters (a_transformer: XM_XSLT_TRANSFORMER)
			-- Set any parameters onto the transformer.
		require
			transformer_not_void: a_transformer /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
			a_string: STRING
		do
			if attached parameters as l_parameters then
				a_cursor := l_parameters.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_string := a_cursor.item
					if a_string.count > 1 and then a_string.item (1) = '%'' and then a_string.item (a_string.count) = '%'' then
							-- Strip off surrounding single quotes.
						a_string := a_string.substring (2, a_string.count - 1)
					end
					a_transformer.set_string_parameter (a_string, a_cursor.key)
					a_cursor.forth
				end
			end
			if attached xpath_parameters as l_xpath_parameters then
				a_cursor := l_xpath_parameters.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_string := a_cursor.item
					a_transformer.set_xpath_parameter (a_string, a_cursor.key)
					a_cursor.forth
				end
			end
		end

	set_error_script (a_script: STRING)
			-- Set error script to `a_script'.
		require
			script_not_void: a_script /= Void
		do
			report_general_message ("Error-listener scripts are not supported in " + program_name)
			Exceptions.die (1)
		end

	set_warning_file (a_filename: STRING)
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

	set_error_file (a_filename: STRING)
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

	set_errors_and_warnings (a_filename: STRING)
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

	set_trace_file (a_filename: STRING)
			-- Set trace output to `a_filename'.
		require
			file_name_not_void: a_filename /= Void
		local
			l_trace_file: like trace_file
		do
			l_trace_file := file_system.new_output_file (a_filename)
			trace_file := l_trace_file
			l_trace_file.open_write
			error_handler.set_info_file (l_trace_file)
		end

	set_warning_threshold (a_warning_threshold: STRING)
			-- Set warning threhold.
		require
			warning_threshold_not_void: a_warning_threshold /= Void and then a_warning_threshold.count > 0
		do
			if a_warning_threshold.is_integer then
				error_listener.set_warning_threshold (a_warning_threshold.to_integer)
			else
				report_general_message ("Warning threshold must be an integer")
				Exceptions.die (1)
			end
		end

	set_error_threshold (a_error_threshold: STRING)
			-- Set recoverable error threhold.
		require
			error_threshold_not_void: a_error_threshold /= Void and then a_error_threshold.count > 0
		do
			if a_error_threshold.is_integer then
				error_listener.set_recoverable_error_threshold (a_error_threshold.to_integer)
			else
				report_general_message ("Error threshold must be an integer")
				Exceptions.die (1)
			end
		end

	set_trace_handler
			-- Create and set trace listener.
		require
			tracing_requested: is_tracing
		local
			a_listener: XM_XSLT_DEFAULT_TRACE_LISTENER
		do
			create a_listener.make (error_handler, is_timed_tracing)
			configuration.set_trace_listener (a_listener)
		end

	register_output_extensions
			-- Register output extensions.
			-- Descendants are encouraged to redefine this routine.
		require
			output_extensions_not_suppressed: not suppress_output_extensions
		local
			another_emitter_factory: XM_XSLT_GEXSLT_EXAMPLES_EMITTER_FACTORY
			an_emitter_factory: XM_XSLT_GEXSLT_EMITTER_FACTORY
		do
			create an_emitter_factory.make
			emitter_factory.register_extension_emitter_factory (an_emitter_factory)
			create another_emitter_factory.make
			emitter_factory.register_extension_emitter_factory (another_emitter_factory)
		end

	register_extension_functions
			-- Register extension functions.
			-- Descendants are encouraged to redefine this routine.
		require
			extension_functions_not_suppressed: not suppress_extension_functions
		local
			l_function_library: XM_XSLT_BUILTIN_EXTENSION_FUNCTIONS
		do
			create l_function_library.make
			configuration.add_extension_function_library (l_function_library)
		end

	register_non_network_protocols
			-- Register additional URI schemes which do not access the network.
			-- Descendants are encouraged to redefine this routine.
		require
			uri_list_valid: uris /= Void
				and then (uris.count = 2 or else uris.count = 1)
		local
			l_stdin_resolver: XM_STDIN_URI_RESOLVER
		do
			-- TODO: add an option to override default content type
			create l_stdin_resolver.make
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.register_scheme (l_stdin_resolver)
		end

	register_network_protocols
			-- Register additional URI schemes which may access the network.
			-- Descendants are encouraged to redefine this routine.
		require
			network_protocols_not_suppressed: not suppress_network_protocols
			uri_list_valid: uris /= Void
				and then (uris.count = 2 or else uris.count = 1)
		do
		end

	configure_system_properties
			-- Set additional system properties in the configuration.
			-- Descendants are encouraged to redefine this routine.
		do
		end

feature {NONE} -- HTTP basic authentication

	user_name: detachable STRING
			-- User name for HTTP basic authentication

	password: detachable STRING
			-- Password for HTTP basic authentication

	is_authentication_requested: BOOLEAN
			-- Is Basic HTTP authentication requested?
		do
			Result := user_name /= Void and password /= Void
		ensure
			definition: Result implies ((attached user_name as l_user_name and then not l_user_name.is_empty) and (attached password as l_password and then not l_password.is_empty))
		end

	set_user_name (a_name: STRING)
			-- Set `user_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			user_name := a_name
		ensure
			user_name_set: user_name = a_name
		end

	set_password (a_password: STRING)
			-- Set `password' to `a_password'.
		require
			a_password_not_void: a_password /= Void
			a_password_not_empty: not a_password.is_empty
		do
			password := a_password
		ensure
			password_set: password = a_password
		end

invariant

	error_handler_not_void: error_handler /= Void
	error_listener_not_void: error_listener /= Void
	configuration_not_void: configuration /= Void

end

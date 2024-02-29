note

	description:

		"Schematron validator illustrating use of XSLT library"

	remark:

		"Exit codes %
		%%
		%The program uses the following scheme for exit codes: %
		%%
		%Code 0: Sucessfull execution: validation may or may not have suceeded %
		%Code 2: Problem encountered - probably due to bad usage, or bad schematron rules %
		%Code 3: Problem encountered - probably due to a BUG %
		%%
		%A validator that could be invoked from within a program %
		%would want to further distinguish between sucessful %
		%validation (code 0), and validation errors (code 1). %
		%This can only be achived by examining the output from the %
		%second-stage, so you would probably want to write that output %
		%to a STRING, rather than stdout. Then if the STRING were %
		%zero length, set code 0, else set code 1 (and the STRING would %
		%contain the validation report)."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2018, Colim Adams and others"
	license: "MIT License"

class SCHEMATRON

inherit

	ANY

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_SHARED_CONFORMANCE
		export {NONE} all end

	XM_SHARED_CATALOG_MANAGER
		export {NONE} all end

	XM_XSLT_CONFIGURATION_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Run.
		local
			a_string_resolver: XM_STRING_URI_RESOLVER
		do
			create configuration.make_with_defaults
			configuration.set_recovery_policy (Recover_silently)
			create a_string_resolver.make
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.register_scheme (a_string_resolver)
			error_handler := configuration.error_reporter
			error_handler.set_warning_null
			Arguments.set_program_name ("schematron")
			process_arguments
			create uris.make (2)
			uris.set_equality_tester (string_equality_tester)
			process_file (schema_filename)
			process_file (data_filename)
			transform_schematron_rules
			create_report
		end

feature -- Access

	transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			-- Transformer factory

	uris: DS_ARRAYED_LIST [STRING]
			-- Stylesheet and source document URIs

feature -- Processing

	process_arguments
			-- Parse command line.
		local
			an_argument: STRING
		do
			if Arguments.argument_count = 3 then
				an_argument := Arguments.argument (1)
				data_filename := Arguments.argument (2)
				schema_filename := Arguments.argument (3)
				if an_argument.count > 9 and then
					an_argument.substring (1, 9).is_equal ("--output=") then
					output_filename := an_argument.substring (10, an_argument.count)
				else
					error_handler.report_error (usage_message)
					Exceptions.die (2)
				end
			elseif Arguments.argument_count = 2 then
				data_filename := Arguments.argument (1)
				schema_filename := Arguments.argument (2)
			else
				error_handler.report_error (usage_message)
				Exceptions.die (2)
				data_filename := ""
				schema_filename := ""
			end
		ensure
			filenames_set: data_filename /= Void and schema_filename /= Void
		end

	transform_schematron_rules
			-- Create validating stylesheet from schematron rules.
		local
			a_source: XM_XSLT_URI_SOURCE
			a_stylesheet_source: XM_XSLT_SOURCE
			an_output: XM_OUTPUT
			a_transformer: detachable XM_XSLT_TRANSFORMER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create transformer_factory.make (configuration)

			-- N.B. SYSTEM id of the stylesheet is here passed as relative to the current working directory:
			-- This means the example will not work unless it is executed from the same directory
			--  as the stylesheet.

			create {XM_XSLT_URI_SOURCE} a_stylesheet_source.make (schematron_basic_uri.full_reference)
			transformer_factory.create_new_transformer (a_stylesheet_source, dummy_uri)
			if transformer_factory.was_error then
				check was_error: attached transformer_factory.last_error_message as l_last_error_message then
					report_processing_error ("Could not compile schematron-basic.xsl", l_last_error_message)
				end
				Exceptions.die (3)
			else
				a_transformer := transformer_factory.created_transformer
				check not_transformer_factory_was_error: a_transformer /= Void then end
				create an_output
				an_output.set_output_to_string
				create a_result.make (an_output, Validator_uri)
				create {XM_XSLT_URI_SOURCE} a_source.make (uris.item (1))
				a_transformer.transform (a_source, a_result)

				-- The result of the stransformation is a STRING representing
				--  the text of a stylesheet which can be used to validate
				--  `data_filename'.
				-- We now plug this string into the resolver, so it can be found
				--  by the XML parser.
				-- This works because "create configuration.make_with_defaults" will
				--  have set the entity resolver to a catalog resolver.

				check an_output_set_output_to_string: attached an_output.last_output as l_last_output then
					shared_catalog_manager.bootstrap_resolver.well_known_system_ids.force (l_last_output, Validator_uri)
				end
			end
		ensure
			transformer_factory_created: transformer_factory /= Void
		end

	create_report
			-- Create a validation report.
		require
			transformer_factory_exists: transformer_factory /= Void
		local
			a_source: XM_XSLT_URI_SOURCE
			a_stylesheet_source: XM_XSLT_SOURCE
			an_output: XM_OUTPUT
			a_transformer: detachable XM_XSLT_TRANSFORMER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_stream: KL_TEXT_OUTPUT_FILE
			a_uri: UT_URI
			a_cwd: STRING
			a_pathname: KI_PATHNAME
			a_drive, a_string: STRING
		do

			-- We use the stylesheet generated by `transform_schematron_rules'

			create {XM_XSLT_URI_SOURCE} a_stylesheet_source.make (Validator_uri)
			transformer_factory.create_new_transformer (a_stylesheet_source, dummy_uri)
			if transformer_factory.was_error then
				check was_error: attached transformer_factory.last_error_message as l_last_error_message then
					report_processing_error ("Could not compile validating-stylesheet", l_last_error_message)
				end
				Exceptions.die (2)
			else
				a_transformer := transformer_factory.created_transformer
				check not_was_error: a_transformer /= Void then end
				create an_output -- to stdout
				if not attached output_filename as l_output_filename then
					create a_result.make (an_output, "stdout:")
				else
					create a_stream.make (l_output_filename)
					a_stream.open_write
					an_output.set_output_stream (a_stream)
					a_cwd := file_system.current_working_directory
					if file_system /= unix_file_system then
						a_pathname := file_system.string_to_pathname (a_cwd)
						a_cwd := unix_file_system.pathname_to_string (a_pathname)
						a_drive := a_pathname.drive
						if a_drive /= Void then
							a_cwd := STRING_.concat (a_drive, a_cwd)
							a_cwd := STRING_.concat ("/", a_cwd)
						end
					end
					a_string := STRING_.concat ("file://", a_cwd)
					create a_uri.make (STRING_.concat (a_string, "/"))
					create a_uri.make_resolve (a_uri, l_output_filename)
					create a_result.make (an_output, a_uri.full_reference)
				end
				create {XM_XSLT_URI_SOURCE} a_source.make (uris.item (2))
				a_transformer.transform (a_source, a_result)
			end
			if a_stream /= Void and then not a_stream.is_closed then
				a_stream.close
			end
		end

	process_file (a_file: STRING)
			-- Convert `a_file' to a URI and add it to `uris'.
		require
			at_least_one_character: a_file /= Void and then a_file.count > 0
			uris_exist: uris /= Void
		local
			a_uri: UT_URI
		do
			create a_uri.make_resolve_uri (current_directory_base, File_uri.filename_to_uri (a_file))
			uris.put_last (a_uri.full_reference)
		end

feature {NONE} -- Implementation

	configuration: XM_XSLT_CONFIGURATION
			-- Configuration

	error_handler: UT_ERROR_HANDLER
		-- Error handler

	data_filename, schema_filename: STRING
	output_filename: detachable STRING
			-- File names from command line

	Validator_uri: STRING = "string:/schematron-rules"
			-- Absolute URI of generated validating-stylesheet

	usage_message: UT_USAGE_MESSAGE
			-- Gexslt usage message.
		once
			create Result.make ("[--output=output-file-name] data-file-name schematron-rules-file-name")
		ensure
			usage_message_not_void: Result /= Void
		end

	current_directory_base: UT_URI
			-- URI of current directory
		local
			a_cwd: KI_PATHNAME
		once
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := File_uri.pathname_to_uri (a_cwd)
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

	data_dirname: STRING
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xslt", "example", "schematron", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	schematron_basic_uri: UT_URI
			-- URI of file 'schematron-basic.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "schematron-basic.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			schematron_basic_uri_not_void: Result /= Void
		end

	dummy_uri: UT_URI
			-- Dummy base URI
		once
			create Result.make ("dummy:")
		ensure
			dummy_uri_not_void: Result /= Void
		end

invariant

	configuration_exists: configuration /= Void
	error_handler_exists: error_handler /= Void

end


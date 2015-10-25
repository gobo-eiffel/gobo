note

	description:

		"Objects that compile astylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_STYLESHEET_COMPILER

inherit

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

	MA_SHARED_DECIMAL_CONSTANTS
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

create {XM_XSLT_TRANSFORMER_FACTORY, XM_XSLT_TEST_STYLESHEET_BUILDER}

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION)
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
			error_listener := configuration.error_listener
			create node_factory.make (error_listener, configuration)
		ensure
			configuration_set: configuration = a_configuration
			stylesheet_not_yet_compiled: executable = Void
		end

feature -- Access

	counter: INTEGER
			-- Counter available for hash code values (for instance)

	configuration: XM_XSLT_CONFIGURATION
			-- User configuration options

	executable: detachable XM_XSLT_EXECUTABLE
			-- Executable form of the stylesheet

	node_factory: XM_XSLT_NODE_FACTORY
			-- Node factory used to compile the stylesheet

	last_loaded_module: detachable XM_XPATH_TREE_DOCUMENT
			-- Last stylesheet module sucessfully loaded

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Last error listener used by `prepare'

feature -- Status report

	load_stylesheet_module_failed: BOOLEAN
			-- Did last call to `load_(principal_)stylesheet_module' fail?

	load_stylesheet_module_error: detachable STRING
			-- Error reported by last call to `load_(principal_)stylesheet_module'

feature -- Status setting

	report_error (l_message: STRING)
			-- Report an error.
		require
			error_message_not_void: l_message /= Void
		do
			load_stylesheet_module_failed := True
			load_stylesheet_module_error := l_message
		ensure
			error_raised: load_stylesheet_module_failed
			message_set: load_stylesheet_module_error = l_message
		end

	report_fatal_error (l_message, l_code: STRING)
			-- Report an error, passing it on to `error_listener'.
		require
			error_message_not_void: l_message /= Void
			l_code_not_void: l_code /= Void
		local
			l_error: XM_XPATH_ERROR_VALUE
		do
			report_error (l_message)
			create l_error.make_from_string (l_message, Xpath_errors_uri, l_code, Static_error)
			error_listener.fatal_error (l_error)
		ensure
			error_raised: load_stylesheet_module_failed
			message_set: load_stylesheet_module_error = l_message
		end

feature -- Element change

	increment_counter
			-- Add one to `counter'.
		do
			counter := counter + 1
		ensure
			counter_incremented: counter = old counter + 1
		end

feature -- Compilation

	prepare (a_source: XM_XSLT_SOURCE; a_uri: UT_URI)
			-- Prepare a stylesheet from a source document.
		require
			source_not_void: a_source /= Void
			stylesheet_not_yet_compiled: executable = Void
			absolute_base_uri: a_uri /= Void and then a_uri.is_absolute
		do
			load_principal_stylesheet_module (a_source, a_uri)
			if not load_stylesheet_module_failed then
				check attached last_loaded_module as l_last_loaded_module then
					create_style_sheet_executable (l_last_loaded_module)
				end
			end
		ensure
			error_or_executable: executable = Void implies load_stylesheet_module_failed
		end

	load_stylesheet_module (a_source: XM_XSLT_URI_SOURCE; a_stream: KI_CHARACTER_INPUT_STREAM; a_system_id: UT_URI; a_error_code: STRING)
			-- Create a tree-representation of a subordinate stylesheet module
		require
			source_not_void: a_source /= Void
			stream_open_read: a_stream /= Void and then a_stream.is_open_read
			system_id_is_absolute: a_system_id /= Void and then a_system_id.is_absolute
			no_error_loading_previous_stylesheet_modules: not load_stylesheet_module_failed
			stylesheet_not_yet_compiled: executable = Void
			a_error_code_not_void: a_error_code /= Void
			a_error_code_not_empty: not a_error_code.is_empty
		local
			l_stylesheet_stripper: XM_XSLT_STYLESHEET_STRIPPER
			l_comment_stripper: XM_XSLT_COMMENT_STRIPPER
			l_tree_builder: XM_XPATH_TREE_BUILDER
			l_parser: XM_EIFFEL_PARSER
			l_locator: XM_XPATH_RESOLVER_LOCATOR
			l_buffer: XM_XSLT_START_TAG_BUFFER
			l_use_when: XM_XSLT_USE_WHEN_FILTER
		do
			last_loaded_module := Void
			create l_parser.make
			l_parser.set_resolver (configuration.entity_resolver)
			l_parser.copy_string_mode (configuration)
			create l_tree_builder.make (node_factory, a_system_id.full_reference, a_system_id)
			create l_locator.make (l_parser)
			l_tree_builder.set_document_locator (l_locator)
			l_tree_builder.set_line_numbering (configuration.is_line_numbering)
			create l_use_when.make (l_tree_builder, configuration, node_factory)
			create l_buffer.make (l_use_when)
			l_use_when.set_tag_buffer (l_buffer)
			l_use_when.set_document_locator (l_locator)
			create l_stylesheet_stripper.make (l_buffer)
			create l_comment_stripper.make (l_stylesheet_stripper)
			a_source.send_from_stream (a_stream, a_system_id, l_parser, l_comment_stripper, True)
			if l_tree_builder.has_xpath_error then
				check postcondition_of_has_xpath_error: attached l_tree_builder.last_xpath_error as l_last_xpath_error then
					error_listener.fatal_error (l_last_xpath_error)
					report_error (l_last_xpath_error.error_message)
				end
			elseif l_tree_builder.has_error then
				check attached l_tree_builder.last_error as l_last_error then
					report_fatal_error (l_last_error, a_error_code)
				end
			else
				last_loaded_module := l_tree_builder.tree_document
				check attached last_loaded_module as l_last_loaded_module then
					l_last_loaded_module.strip_whitespace_nodes
				end
			end
			configuration.reset_entity_resolver
		ensure
			stylesheet_module_load_failed: load_stylesheet_module_failed implies load_stylesheet_module_error /= Void and then last_loaded_module = Void
		end

	load_principal_stylesheet_module (a_source: XM_XSLT_SOURCE; a_uri: UT_URI)
			-- Create a tree-representation of principal stylesheet module
		require
			source_not_void: a_source /= Void
			no_error_loading_previous_stylesheet_modules: not load_stylesheet_module_failed
			stylesheet_not_yet_compiled: executable = Void
			absolute_base_uri: a_uri /= Void and then a_uri.is_absolute
		local
			l_stylesheet_stripper: XM_XSLT_STYLESHEET_STRIPPER
			l_comment_stripper: XM_XSLT_COMMENT_STRIPPER
			l_tree_builder: XM_XPATH_TREE_BUILDER
			l_parser: XM_EIFFEL_PARSER
			l_buffer: XM_XSLT_START_TAG_BUFFER
			l_use_when: XM_XSLT_USE_WHEN_FILTER
			l_locator: XM_XPATH_RESOLVER_LOCATOR
		do
			load_stylesheet_module_error := Void
			last_loaded_module := Void
			create l_parser.make
			l_parser.set_resolver (configuration.entity_resolver)
			l_parser.copy_string_mode (configuration)
			create l_tree_builder.make (node_factory, a_uri.full_reference, a_uri)
			create l_locator.make (l_parser)
			l_tree_builder.set_document_locator (l_locator)
			l_tree_builder.set_line_numbering (configuration.is_line_numbering)
			create l_use_when.make (l_tree_builder, configuration, node_factory)
			create l_buffer.make (l_use_when)
			l_use_when.set_tag_buffer (l_buffer)
			l_use_when.set_document_locator (l_locator)
			create l_stylesheet_stripper.make (l_buffer)
			create l_comment_stripper.make (l_stylesheet_stripper)
			a_source.send (l_parser, l_comment_stripper, a_uri, True)
			if l_tree_builder.has_xpath_error then
				check postcondition_of_has_xpath_error: attached l_tree_builder.last_xpath_error as l_last_xpath_error then
					error_listener.fatal_error (l_last_xpath_error)
					report_error (l_last_xpath_error.error_message)
				end
			elseif l_tree_builder.has_error then
				check attached l_tree_builder.last_error as l_last_error then
					report_fatal_error (l_last_error, "GEXSLT_PRINICIPAL_STYLESHEET_ERROR")
				end
			else
				last_loaded_module := l_tree_builder.tree_document
				check attached last_loaded_module as l_last_loaded_module then
					l_last_loaded_module.strip_whitespace_nodes
				end
			end
			configuration.reset_entity_resolver
		ensure
			stylesheet_module_load_failed: load_stylesheet_module_failed implies load_stylesheet_module_error /= Void and then last_loaded_module = Void
		end

	create_style_sheet_executable (a_document: XM_XPATH_TREE_DOCUMENT)
			-- Create an executable stylesheet.
		require
			document_not_void: a_document /= Void
			no_error_loading_stylesheet_modules: last_loaded_module /= Void
			stylesheet_not_yet_compiled: executable = Void
		local
			a_stylesheet_document: XM_XPATH_TREE_DOCUMENT
		do
			a_stylesheet_document := a_document

			-- If top-level node is a literal result element, stitch it into a skeleton stylesheet

			if attached {XM_XSLT_LITERAL_RESULT_ELEMENT} a_stylesheet_document.document_element as a_top_node then
				check attached a_top_node.constructed_stylesheet (Current) as l_constructed_stylesheet then
					a_stylesheet_document := l_constructed_stylesheet
				end
			end
			if not load_stylesheet_module_failed then
				if not attached {XM_XSLT_STYLESHEET} a_stylesheet_document.document_element as a_stylesheet then
					report_error ("Top-level element of stylesheet is not xsl:stylesheet or xsl:transform or literal result element")
				elseif not a_stylesheet.is_error then
					if a_stylesheet.version.is_equal (decimal.one) then
						error_listener.warning ("XSLT 1.0 stylesheet is being run on an XSLT 2.0 processor.", Void)
					end

					-- Preprocess the stylesheet, performing validation and preparing template  definitions

					if not a_stylesheet.any_compile_errors then
						a_stylesheet.set_stylesheet_compiler (Current, configuration)
						a_stylesheet.preprocess
					end

					-- Compile the stylesheet, retaining the resulting  executable

					if not a_stylesheet.any_compile_errors and a_stylesheet.post_validated then
						if configuration.is_explaining then
							a_stylesheet.force_explaining
						end
						a_stylesheet.compile_stylesheet (configuration)
					end
					if a_stylesheet.any_compile_errors then
						report_error ("There were error compiling the stylesheet")
					else
						executable := a_stylesheet.executable
						check
							executable: attached executable as l_executable
							-- as {XM_XSLT_STYLESHEET}.compile produces an executable if no error.
						then
							l_executable.set_whitespace_stripping (a_stylesheet.strips_whitespace)
							check attached a_stylesheet.static_context as l_stylesheet_static_context then
								l_executable.save_static_context (l_stylesheet_static_context)
							end
							l_executable.rule_manager.rank_all_rules
						end
					end
				end
			end
		ensure
			executable_compiled: not load_stylesheet_module_failed implies executable /= Void
		end

feature -- Creation

	new_transformer (a_factory: XM_XSLT_TRANSFORMER_FACTORY; a_timer: detachable XM_XSLT_TIMING): XM_XSLT_TRANSFORMER
			-- New transformer for this stylesheet
		require
			executable: executable /= Void
			a_factory_not_void: a_factory /= Void
		do
			check precondition_executable: attached executable as l_executable then
				create Result.make (configuration, l_executable, a_factory, a_timer)
			end
		ensure
			result_not_void: Result /= Void
		end

invariant

	configuration_not_void: configuration /= Void
	error_listener_not_void: error_listener /= Void
	node_factory_not_void: node_factory /= Void
	stylesheet_module_load_suceeded: not load_stylesheet_module_failed implies load_stylesheet_module_error = Void
	stylesheet_module_load_failed: load_stylesheet_module_failed implies load_stylesheet_module_error /= Void

end

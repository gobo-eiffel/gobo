note

	description:

		"XML serialization using XSLT serialzer options (see http://www.w3.org/TR/xslt20/#element-output)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2018, Colin Adams and others"
	license: "MIT License"

class SERIALIZER

inherit

	XM_XSLT_SERIALIZER

	XM_XSLT_CONFIGURATION_CONSTANTS
		export {NONE} all end

	XM_RESOLVER_FACTORY
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize `Current'.
		do
			create error_listener.make (Do_not_recover, create {UT_ERROR_HANDLER}.make_standard)
			create encoder_factory
			create output_properties.make (0)
			create emitter_factory.make
			create_arguments_parser
			arguments_parser.parse_arguments
			if arguments_parser.parameters.count /= 1 then
				arguments_parser.error_handler.report_error_message ("Exactly one parameter must be supplied - an XML file name")
			else
				process_arguments
				parse_xml_file (arguments_parser.parameters.item (1))
			end
		end

feature -- Access

	error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			-- Destination for error messages and warnings

	encoder_factory: XM_XSLT_ENCODER_FACTORY
			-- Factory for output encoders

	output_properties: XM_XSLT_OUTPUT_PROPERTIES
			-- XSLT serialization options

	emitter_factory: XM_XSLT_EMITTER_FACTORY
			-- Factory for creating emitter/receiver chains

feature {NONE} -- Basic operations

	parse_xml_file (a_file_name: STRING)
			-- Parse and serialize `a_file_name'.
		require
			a_file_name_not_void: a_file_name /= Void
			a_file_name_not_empty: not a_file_name.is_empty
		local
			l_parser: XM_EIFFEL_PARSER
			l_uri: UT_URI
			l_method, l_method_uri, l_method_local_name: STRING
			l_output: XM_OUTPUT
			l_receiver: XM_XPATH_RECEIVER
			l_namespace_resolver: XM_NAMESPACE_RESOLVER
			l_content: XM_CONTENT_CONCATENATOR
			l_bridge: XM_XPATH_CONTENT_EMITTER
		do
			l_method := output_properties.method
			if l_method.count = 0 then
				l_method_uri := ""; l_method_local_name := ""
			else
				l_method_uri := namespace_uri_from_expanded_name (l_method)
				l_method_local_name := local_name_from_expanded_name (l_method)
			end
			create l_parser.make
			l_parser.set_resolver (new_catalog_resolver)
			create l_uri.make_resolve_uri (current_directory_base, File_uri.filename_to_uri (a_file_name))
			create l_output
			l_receiver := emitter_factory.new_receiver (l_method_uri, l_method_local_name, Current,
																	  l_output, output_properties, Void)
			create l_bridge.make (l_receiver, l_parser.new_stop_on_error_filter)
			create l_namespace_resolver.make_next (l_bridge)
			l_namespace_resolver.set_forward_xmlns (True)
			create l_content.make_next (l_namespace_resolver)
			l_parser.set_callbacks (l_content)
			l_parser.parse_from_system (l_uri.full_reference)
		end

	current_directory_base: UT_URI
			-- URI of current directory
		local
  			l_cwd: KI_PATHNAME
		once
  			l_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := File_uri.pathname_to_uri (l_cwd)
 		end

feature {NONE} -- Argument processing

	process_arguments
			-- Modify `output_properties' according to arguments.
		require
			arguments_parser_not_void: arguments_parser /= Void
		do
			if method_option.was_found and then attached method_option.parameter as l_method_option_parameter then
				output_properties.set_method (l_method_option_parameter, 0)
			end
			if bom_option.was_found and then attached bom_option.parameter as l_bom_option_parameter then
				output_properties.set_byte_order_mark_required (STRING_.same_string (l_bom_option_parameter, Yes_value), 0)
			end
			if doctype_public_option.was_found and then attached doctype_public_option.parameter as l_doctype_public_option_parameter then
				output_properties.set_doctype_public (l_doctype_public_option_parameter, 0)
			end
			if doctype_system_option.was_found and then attached doctype_system_option.parameter as l_doctype_system_option_parameter then
				output_properties.set_doctype_system (l_doctype_system_option_parameter, 0)
			end
			if encoding_option.was_found and then attached encoding_option.parameter as l_encoding_option_parameter then
				output_properties.set_encoding (l_encoding_option_parameter, 0)
			end
			if escape_uri_attributes_option.was_found and then attached escape_uri_attributes_option.parameter as l_escape_uri_attributes_option_parameter then
				output_properties.set_escape_uri_attributes (STRING_.same_string (l_escape_uri_attributes_option_parameter, Yes_value), 0)
			end
			if include_content_type_option.was_found and then attached include_content_type_option.parameter as l_include_content_type_option_parameter then
				output_properties.set_include_content_type (STRING_.same_string (l_include_content_type_option_parameter, Yes_value), 0)
			end
			if indent_option.was_found and then attached indent_option.parameter as l_indent_option_parameter then
				output_properties.set_indent (STRING_.same_string (l_indent_option_parameter, Yes_value), 0)
			end
			if media_type_option.was_found and then attached media_type_option.parameter as l_media_type_option_parameter then
				output_properties.set_media_type (l_media_type_option_parameter, 0)
			end
			if normalization_form_option.was_found and then attached normalization_form_option.parameter as l_normalization_form_option_parameter then
				output_properties.set_normalization_form (l_normalization_form_option_parameter, 0)
			end
			if omit_xml_declaration_option.was_found and then attached omit_xml_declaration_option.parameter as l_omit_xml_declaration_option_parameter then
				output_properties.set_omit_xml_declaration (STRING_.same_string (l_omit_xml_declaration_option_parameter, Yes_value), 0)
			end
			if standalone_option.was_found and then attached standalone_option.parameter as l_standalone_option_parameter then
				output_properties.set_standalone (l_standalone_option_parameter, 0)
			end
			if undeclare_prefixes_option.was_found and then attached undeclare_prefixes_option.parameter as l_undeclare_prefixes_option_parameter then
				output_properties.set_undeclare_prefixes (STRING_.same_string (l_undeclare_prefixes_option_parameter, Yes_value), 0)
			end
			if version_option.was_found and then attached version_option.parameter as l_version_option_parameter then
				output_properties.set_version (l_version_option_parameter, 0)
			end
		end

feature {NONE} -- Arguments

	Yes_value: STRING = "yes"
			-- Parameter value of "yes"

	Omit_value: STRING = "omit"
			-- Parameter value of "omit"

	arguments_parser: AP_PARSER
			-- Parser for command line arguments nd options

	method_option: AP_ENUMERATION_OPTION
			-- Serialization method (Xml, xhtml, html or text)

	bom_option: AP_ENUMERATION_OPTION
			-- Should a byte-order-mark be written (default is per-method)?

			--	cdata_section_elements_option: AP_STRING_LISTOPTION

	doctype_public_option: AP_STRING_OPTION
			-- Value for DOCTYPE PUBLIC (requires `doctype_system_option')

	doctype_system_option: AP_STRING_OPTION
			-- Value for DOCTYPE SYSTEM.

	encoding_option: AP_STRING_OPTION
			-- Value for encoding

	escape_uri_attributes_option: AP_ENUMERATION_OPTION
			-- Value for escape-uri-attributes

	include_content_type_option: AP_ENUMERATION_OPTION
			-- Value for include-content-type

	indent_option: AP_ENUMERATION_OPTION
			-- Value for indent

	media_type_option: AP_STRING_OPTION
			-- Value for media-type

	normalization_form_option: AP_ENUMERATION_OPTION
			-- Value for normalization-form

	omit_xml_declaration_option: AP_ENUMERATION_OPTION
			-- Value for omit-xml-declaration

	standalone_option: AP_ENUMERATION_OPTION
			-- Value for standalone

	undeclare_prefixes_option: AP_ENUMERATION_OPTION
			-- Value for undeclare-prefixes

	version_option: AP_STRING_OPTION
			-- Value for version

	create_arguments_parser
			-- Create options and parameters structures and parser.
		do
			create arguments_parser.make
			arguments_parser.set_application_description ("Parse and serialize an XML file under control from XSLT serialization options.")
			arguments_parser.set_parameters_description ("file-name")
			create_method_option
			create_bom_option
			--		create_cdata_section_elements_option
			create_doctype_public_option
			create_doctype_system_option
			create_encoding_option
			create_escape_uri_attributes_option
			create_include_content_type_option
			create_indent_option
			create_media_type_option
			create_normalization_form_option
			create_omit_xml_declaration_option
			create_standalone_option
			create_undeclare_prefixes_option
			create_version_option
		ensure
			arguments_parser_not_void: arguments_parser /= Void
			method_option_not_void: method_option /= Void
			bom_option_not_void: bom_option /= Void
			doctype_public_option_not_void: doctype_public_option /= Void
			doctype_system_option_not_void: doctype_system_option /= Void
			encoding_option_not_void: encoding_option /= Void
			escape_uri_attributes_option_not_void: escape_uri_attributes_option /= Void
			include_content_type_option_not_void: include_content_type_option /= Void
			indent_option_not_void: indent_option /= Void
			media_type_option_not_void: media_type_option /= Void
			normalization_form_option_not_void: normalization_form_option /= Void
			omit_xml_declaration_option_not_void: omit_xml_declaration_option /= Void
			undeclare_prefixes_option_not_void: undeclare_prefixes_option /= Void
			standalone_option_not_void: standalone_option /= Void
			version_option_not_void: version_option /= Void
		end

	create_method_option
			-- Create and configure `method_option'.
		do
			create method_option.make ('m', "method")
			method_option.set_description ("Serialization method. Default is either 'xml', 'xhtml' or 'html', depending upon the document element.")
			method_option.extend ("xml")
			method_option.extend ("html")
			method_option.extend ("xhtml")
			method_option.extend ("text")
			method_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (method_option)
		ensure
			method_option_not_void: method_option /= Void
		end

	create_bom_option
			-- Create and configure `bom_option'.
		do
			create bom_option.make ('b', "byte-order-mark")
			bom_option.set_description ("Should a byte-order-mark be written? Default is 'no' except when encoding is 'UTF-16'")
			bom_option.extend (Yes_value)
			bom_option.extend ("no")
			bom_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (bom_option)
		ensure
			bom_option_not_void: bom_option /= Void
		end

	create_doctype_public_option
			-- Create and configure `doctype_public_option'.
		do
			create doctype_public_option.make ('p', "doctype-public")
			doctype_public_option.set_description ("Generate 'PUBLIC <text>' as part of the Document Type Declaration (DTD). Requires --doctype-system.")
			doctype_public_option.set_parameter_description ("<text>")
			doctype_public_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (doctype_public_option)
		ensure
			doctype_public_option_not_void: doctype_public_option /= Void
		end

	create_doctype_system_option
			-- Create and configure `doctype_system_option'.
		do
			create doctype_system_option.make ('s', "doctype-system")
			doctype_system_option.set_description ("Generate 'SYSTEM <text>' as part of a Document Type Declaration (DTD).")
			doctype_system_option.set_parameter_description ("<text>")
			doctype_system_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (doctype_system_option)
		ensure
			doctype_system_option_not_void: doctype_system_option /= Void
		end

	create_encoding_option
			-- Create and configure `encoding_option'.
		do
			create encoding_option.make ('n', "encoding")
			encoding_option.set_description ("Set output encoding to <name>. Default is 'UTF-8'.")
			encoding_option.set_parameter_description ("<name>")
			encoding_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (encoding_option)
		ensure
			encoding_option_not_void: encoding_option /= Void
		end

	create_escape_uri_attributes_option
			-- Create and configure `escape_uri_attributes_option'.
		do
			create escape_uri_attributes_option.make ('e', "escape-uri-attributes")
			escape_uri_attributes_option.set_description ("Should (X)HTML URI-valued attributes be escaped? Default is 'yes'.")
			escape_uri_attributes_option.extend (Yes_value)
			escape_uri_attributes_option.extend ("no")
			escape_uri_attributes_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (escape_uri_attributes_option)
		ensure
			escape_uri_attributes_option_not_void: escape_uri_attributes_option /= Void
		end

	create_include_content_type_option
			-- Create and configure `include_content_type_option'.
		do
			create include_content_type_option.make ('i', "include-content-type")
			include_content_type_option.set_description ("Should an (X)HTML meta tag be added specifying the ContentType? Default is 'yes'.")
			include_content_type_option.extend (Yes_value)
			include_content_type_option.extend ("no")
			include_content_type_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (include_content_type_option)
		ensure
			include_content_type_option_not_void: include_content_type_option /= Void
		end

	create_indent_option
			-- Create and configure `indent_option'.
		do
			create indent_option.make ('d', "indent")
			indent_option.set_description ("Should the output be indented? Default is 'yes' for html, 'no' for other methods.")
			indent_option.extend (Yes_value)
			indent_option.extend ("no")
			indent_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (indent_option)
		ensure
			indent_option_not_void: indent_option /= Void
		end

	create_media_type_option
			-- Create and configure `media_type_option'.
		do
			create media_type_option.make ('t', "media-type")
			media_type_option.set_description ("Set output media_type to <name>. Default is 'text/xml', 'text/html' or 'text/plain'.")
			media_type_option.set_parameter_description ("<name>")
			media_type_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (media_type_option)
		ensure
			media_type_option_not_void: media_type_option /= Void
		end

	create_normalization_form_option
			-- Create and configure `normalization_form_option'.
		do
			create normalization_form_option.make ('f', "normalization-form")
			normalization_form_option.set_description ("Unicode normalization form. Default is 'none'.")
			normalization_form_option.extend ("NFC")
			normalization_form_option.extend ("NFD")
			normalization_form_option.extend ("NFKC")
			normalization_form_option.extend ("NFKD")
			normalization_form_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (normalization_form_option)
		ensure
			normalization_form_option_not_void: normalization_form_option /= Void
		end

	create_omit_xml_declaration_option
			-- Create and configure `omit_xml_declaration_option'.
		do
			create omit_xml_declaration_option.make ('o', "omit-xml-declaration")
			omit_xml_declaration_option.set_description ("Should the XML declaration be omitted? Default is 'no'.")
			omit_xml_declaration_option.extend (Yes_value)
			omit_xml_declaration_option.extend ("no")
			omit_xml_declaration_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (omit_xml_declaration_option)
		ensure
			omit_xml_declaration_option_not_void: omit_xml_declaration_option /= Void
		end

	create_standalone_option
			-- Create and configure `standalone_option'.
		do
			create standalone_option.make ('l', "standalone")
			standalone_option.set_description ("Value for the standalone pseudo-attribute? Default is 'omit' (= do not write a standalone pseudo-attribute).")
			standalone_option.extend (Yes_value)
			standalone_option.extend ("no")
			standalone_option.extend (Omit_value)
			standalone_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (standalone_option)
		ensure
			standalone_option_not_void: standalone_option /= Void
		end

	create_undeclare_prefixes_option
			-- Create and configure `undeclare_prefixes_option'.
		do
			create undeclare_prefixes_option.make ('u', "undeclare-prefixes")
			undeclare_prefixes_option.set_description ("Value for undeclare-prefixes? Default is 'no'.")
			undeclare_prefixes_option.extend (Yes_value)
			undeclare_prefixes_option.extend ("no")
			undeclare_prefixes_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (undeclare_prefixes_option)
		ensure
			undeclare_prefixes_option_not_void: undeclare_prefixes_option /= Void
		end

	create_version_option
			-- Create and configure `version_option'.
		do
			create version_option.make ('v', "version")
			version_option.set_description ("Set version pseudo-attribute to <version>.")
			version_option.set_parameter_description ("<version>")
			version_option.set_maximum_occurrences (1)
			arguments_parser.options.force_last (version_option)
		ensure
			version_option_not_void: version_option /= Void
		end

invariant

	error_listener_not_void: error_listener /= Void
	encoder_factory_not_void: encoder_factory /= Void
	output_properties_not_void: output_properties /= Void
	emitter_factory_not_void: emitter_factory /= Void
	arguments_parser_has_method_option: (arguments_parser /= Void and method_option /= Void) implies arguments_parser.options.has (method_option)
	arguments_parser_has_bom_option: (arguments_parser /= Void and bom_option /= Void) implies arguments_parser.options.has (bom_option)
	arguments_parser_has_doctype_public_option: (arguments_parser /= Void and doctype_public_option /= Void) implies arguments_parser.options.has (doctype_public_option)
	arguments_parser_has_doctype_system_option: (arguments_parser /= Void and doctype_system_option /= Void) implies arguments_parser.options.has (doctype_system_option)
	arguments_parser_has_media_type_option: (arguments_parser /= Void and media_type_option /= Void) implies arguments_parser.options.has (media_type_option)
	arguments_parser_has_escape_uri_attributes_option: (arguments_parser /= Void and escape_uri_attributes_option /= Void) implies arguments_parser.options.has (escape_uri_attributes_option)
	arguments_parser_has_include_content_type_option: (arguments_parser /= Void and include_content_type_option /= Void) implies arguments_parser.options.has (include_content_type_option)
	arguments_parser_has_indent_option: (arguments_parser /= Void and indent_option /= Void) implies arguments_parser.options.has (indent_option)
	arguments_parser_has_encoding_option: (arguments_parser /= Void and encoding_option /= Void) implies arguments_parser.options.has (encoding_option)
	arguments_parser_has_normalization_form_option: (arguments_parser /= Void and normalization_form_option /= Void) implies arguments_parser.options.has (normalization_form_option)
	arguments_parser_has_omit_xml_declaration_option: (arguments_parser /= Void and omit_xml_declaration_option /= Void) implies arguments_parser.options.has (omit_xml_declaration_option)
	arguments_parser_has_standalone_option: (arguments_parser /= Void and standalone_option /= Void) implies arguments_parser.options.has (standalone_option)
	arguments_parser_has_undeclare_prefixes_option: (arguments_parser /= Void and undeclare_prefixes_option /= Void) implies arguments_parser.options.has (undeclare_prefixes_option)
	arguments_parser_has_version_option: (arguments_parser /= Void and version_option /= Void) implies arguments_parser.options.has (version_option)

end


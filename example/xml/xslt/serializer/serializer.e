indexing

	description:

		"XML serialization using XSLT serialzer options (see http://www.w3.org/TR/xslt20/#element-output)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class SERIALIZER

inherit

	XM_XSLT_SERIALIZER

	XM_XSLT_CONFIGURATION_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `Current'.
		do
			create error_listener.make (Do_not_recover, create {UT_ERROR_HANDLER}.make_standard)
			create encoder_factory
			create output_properties.make (0)
			create_arguments_parser
			arguments_parser.parse_arguments
		ensure

		end

feature -- Access

	error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER 
			-- Destination for error messages and warnings

	encoder_factory: XM_XSLT_ENCODER_FACTORY
			-- Factory for output encoders

	output_properties: XM_XSLT_OUTPUT_PROPERTIES
			-- XSLT serialization options

feature {NONE} -- Arguments

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
			-- Value for escape_uri_attributes
	
	include_content_type_option: AP_ENUMERATION_OPTION
			-- Value for include_content_type
	
	create_arguments_parser is
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
		ensure
			arguments_parser_not_void: arguments_parser /= Void
			method_option_not_void: method_option /= Void
			bom_option_not_void: bom_option /= Void
			doctype_public_option_not_void: doctype_public_option /= Void
			doctype_system_option_not_void: doctype_system_option /= Void
			encoding_option_not_void: encoding_option /= Void
			escape_uri_attributes_option_not_void: escape_uri_attributes_option /= Void
			include_content_type_option_not_void: include_content_type_option /= Void
		end

	create_method_option is
			-- Create and configure `method_option'.
		do
			create method_option.make ('m', "method")
			method_option.set_description ("Serialization method. Defaults to either xml, xhtml or html, depending upon the document element.")
			method_option.extend ("xml")
			method_option.extend ("html")
			method_option.extend ("xhtml")
			method_option.extend ("text")
			arguments_parser.options.force_last (method_option)
		ensure
			method_option_not_void: method_option /= Void
		end

	create_bom_option is
			-- Create and configure `bom_option'.
		do
			create bom_option.make ('b', "byte-order-mark")
			bom_option.set_description ("Should a byte-order-mark be written?")
			bom_option.extend ("yes")
			bom_option.extend ("no")
			arguments_parser.options.force_last (bom_option)
		ensure
			bom_option_not_void: bom_option /= Void
		end

	create_doctype_public_option is
			-- Create and configure `doctype_public_option'.
		do
			create doctype_public_option.make ('p', "doctype-public")
			doctype_public_option.set_description ("Generate 'PUBLIC <text>' as part of the Document Type Declaration (DTD). Requires --doctype-system.")
			doctype_public_option.set_parameter_description ("<text>")
			arguments_parser.options.force_last (doctype_public_option)
		ensure
			doctype_public_option_not_void: doctype_public_option /= Void
		end
	
	create_doctype_system_option is
			-- Create and configure `doctype_system_option'.
		do
			create doctype_system_option.make ('s', "doctype-system")
			doctype_system_option.set_description ("Generate 'SYSTEM <text>' as part of a Document Type Declaration (DTD).")
			doctype_system_option.set_parameter_description ("<text>")
			arguments_parser.options.force_last (doctype_system_option)
		ensure
			doctype_system_option_not_void: doctype_system_option /= Void
		end

	create_encoding_option is
			-- Create and configure `encoding_option'.
		do
			create encoding_option.make ('n', "encoding")
			encoding_option.set_description ("Set output encoding to <name>. Defaults to UTF-8.")
			encoding_option.set_parameter_description ("<name>")
			arguments_parser.options.force_last (encoding_option)
		ensure
			encoding_option_not_void: encoding_option /= Void
		end

	create_escape_uri_attributes_option is
			-- Create and configure `escape_uri_attributes_option'.
		do
			create escape_uri_attributes_option.make ('e', "escape-uri-attributes")
			escape_uri_attributes_option.set_description ("Should (X)HTML URI-valued attributes be escaped?")
			escape_uri_attributes_option.extend ("yes")
			escape_uri_attributes_option.extend ("no")
			arguments_parser.options.force_last (escape_uri_attributes_option)
		ensure
			escape_uri_attributes_option_not_void: escape_uri_attributes_option /= Void
		end

	create_include_content_type_option is
			-- Create and configure `include_content_type_option'.
		do
			create include_content_type_option.make ('i', "include-content-type")
			include_content_type_option.set_description ("Should an (X)HTML meta tag be added specifying the ContentType?")
			include_content_type_option.extend ("yes")
			include_content_type_option.extend ("no")
			arguments_parser.options.force_last (include_content_type_option)
		ensure
			include_content_type_option_not_void: include_content_type_option /= Void
		end

invariant

	error_listener_not_void: error_listener /= Void
	encoder_factory_not_void: encoder_factory /= Void
	output_properties_not_void: output_properties /= Void
	arguments_parser_has_method_option: (arguments_parser /= Void and method_option /= Void) implies arguments_parser.options.has (method_option)
	arguments_parser_has_bom_option: (arguments_parser /= Void and bom_option /= Void) implies arguments_parser.options.has (bom_option)
	arguments_parser_has_doctype_public_option: (arguments_parser /= Void and doctype_public_option /= Void) implies arguments_parser.options.has (doctype_public_option)
	arguments_parser_has_doctype_system_option: (arguments_parser /= Void and doctype_system_option /= Void) implies arguments_parser.options.has (doctype_system_option)
	arguments_parser_has_encoding_option: (arguments_parser /= Void and encoding_option /= Void) implies arguments_parser.options.has (encoding_option)
	arguments_parser_has_escape_uri_attributes_option: (arguments_parser /= Void and escape_uri_attributes_option /= Void) implies arguments_parser.options.has (escape_uri_attributes_option)
	arguments_parser_has_include_content_type_option: (arguments_parser /= Void and include_content_type_option /= Void) implies arguments_parser.options.has (include_content_type_option)

end


indexing

	description:

		"Standard namespace URIs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STANDARD_NAMESPACES

inherit

		KL_IMPORTED_STRING_ROUTINES

	-- all INTEGERs should be INTEGER_16
	
feature -- Access

	No_namespaces, Local_namespaces, All_namespaces: INTEGER is unique

	Null_prefix_index: INTEGER is 1
			-- The numeric code representing the null namespace

	Xml_prefix_index: INTEGER is 2
			-- Numeric code representing the XML namespace

	Xml_schema_prefix_index: INTEGER is 3
			-- Numeric code representing the XML Schema namespace
	
	Xpath_defined_datatypes_prefix_index: INTEGER is 4
			-- Numeric code representing the XPath datatypes namespace

	Gexslt_uri_prefix_index: INTEGER is 5
			-- Numeric code representing the gexslt namespace

	Xslt_prefix_index: INTEGER is 6
			-- Numeric code representing the XSLT namespace

	Xml_schema_instance_prefix_index: INTEGER is 7
			-- Numeric code representing the XML Schema instance namespace

	Xhtml_prefix_index: INTEGER is 8
			-- Numeric code representing the XHTML namespace

	namespace_index_to_uri_code (a_name_space_index: INTEGER): INTEGER is
			-- Convert `a_name_space_index' to a uri code
		require
			valid_name_space: a_name_space_index > 0
		do
			Result := a_name_space_index - 1
		ensure
			valid_uri_code: Result = a_name_space_index - 1
		end

	Null_uri: STRING is ""
			-- The null namespace

	Xml_uri: STRING is "http://www.w3.org/XML/1998/namespace"
			-- The reserved namespace for XML
	
	Xslt_uri: STRING is "http://www.w3.org/1999/XSL/Transform"
			-- The XSLT namespace

	Xml_schema_uri: STRING is "http://www.w3.org/2001/XMLSchema"
			-- The XML Schemas namespace (xs)

	Xml_schema_datatypes_uri: STRING is "http://www.w3.org/2001/XMLSchema-datatypes" 
			-- The XML Schemas datatypes namespace (xs)

	Xml_schema_instance_uri: STRING is "http://www.w3.org/2001/XMLSchema-instance"
			-- The XML Schema instance document namespace (xsi)

	Xpath_defined_datatypes_uri: STRING is "http://www.w3.org/2003/11/xpath-datatypes"
			-- Namespace for additional XPath-defined data types (xdt)

	Xpath_functions_uri: STRING is "http://www.w3.org/2003/11/xpath-functions"
			-- XPath functions and operators (fn)

	Microsoft_uri: STRING is "http://www.w3.org/TR/WD-xsl"
			-- Recognize the Microsoft namespace so we can give a suitably sarcastic error message
	
	Xhtml_uri: STRING is "http://www.w3.org/1999/xhtml"
			-- XHTML namespace

	Gexslt_eiffel_type_uri: STRING is "http://www.gobosoft.com/eiffel/gobo/gexslt/extension"
			-- Namespace for extension functions, etc. written in Eiffel


			-- The following codes are 3-bit values for building a fingerprint

	Default_uri_code: INTEGER is 0
	Xml_uri_code: INTEGER is 1
	Xml_schema_uri_code: INTEGER is 2
	Xpath_defined_datatypes_uri_code: INTEGER is 3	
	Gexslt_uri_code: INTEGER is 4
	Xslt_uri_code: INTEGER is 5
	Xml_schema_instance_uri_code: INTEGER is 6
	Xhtml_uri_code: INTEGER is 7

			-- The following codes are fingerprints

			-- Codes in XML namespace (`Xml_uri_code' * 128 + 1..n)

	Xml_base_type_code: INTEGER is 129
	Xml_space_type_code: INTEGER is 130
	Xml_lang_type_code: INTEGER is 131

			-- Codes in XML Schema namespace (`Xslt_uri_code' * 128 + 1..n)

	String_type_code: INTEGER is 257
	Boolean_type_code: INTEGER is 258
	Decimal_type_code: INTEGER is 259
	Float_type_code: INTEGER is 260
	Double_type_code: INTEGER is 261
	Duration_type_code: INTEGER is 262
	Date_time_type_code: INTEGER is 263
	Time_type_code: INTEGER is 264
	Date_type_code: INTEGER is 265	
	G_year_month_type_code: INTEGER is 266
	G_year_type_code: INTEGER is 267
	G_month_day_type_code: INTEGER is 268
	G_day_type_code: INTEGER is 269
	G_month_type_code: INTEGER is 270
	Hex_binary_type_code: INTEGER is 271
	Base64_binary_type_code: INTEGER is 272
	Any_uri_type_code: INTEGER is 273
	Qname_type_code: INTEGER is 274
	Notation_type_code: INTEGER is 275
	Integer_type_code: INTEGER is 276

			-- Note that any type code <= Integer_type_code is considered to represent a
			-- primitive type: see {XM_XPATH_TYPE}.is_primitive_type

	Non_positive_integer_type_code: INTEGER is 277
	Negative_integer_type_code: INTEGER is 278
	Long_type_code: INTEGER is 279
	Int_type_code: INTEGER is 280
	Short_type_code: INTEGER is 281
	Byte_type_code: INTEGER is 282
	Non_negative_integer_type_code: INTEGER is 283
	Positive_integer_type_code: INTEGER is 284
	Unsigned_long_type_code: INTEGER is 285
	Unsigned_int_type_code: INTEGER is 286
	Unsigned_short_type_code: INTEGER is 287
	Unsigned_byte_type_code: INTEGER is 288
	Normalized_string_type_code: INTEGER is 289
	Token_type_code: INTEGER is 290
	Language_type_code: INTEGER is 291
	Nmtoken_type_code: INTEGER is 292
	Nmtokens_type_code: INTEGER is 293
	Name_type_code: INTEGER is 294
	Ncname_type_code: INTEGER is 295
	Id_type_code: INTEGER is 296
	Idref_type_code: INTEGER is 297
	Idrefs_type_code: INTEGER is 298
	Entity_type_code: INTEGER is 299
	Entities_type_code: INTEGER is 300
	
	Any_type_code: INTEGER is 336
	Any_simple_type_code: INTEGER is 337

			-- Codes in XPath datatypes namespace (`Xpath_defined_datatypes_uri_code' * 128 + 1..n)

	Untyped_type_code: INTEGER is 385
	Untyped_atomic_type_code: INTEGER is 386
	Any_atomic_type_code: INTEGER is 387
	Year_month_duration_type_code: INTEGER is 388
	Day_time_duration_type_code: INTEGER is 389

			-- Codes in Gobo XPath/XSLT namespace (`Gexslt_uri_code' * 128 + 1..n)

	Numeric_type_code: INTEGER is 513
	Object_type_code: INTEGER is 514
	Explain_type_code: INTEGER is 515
	Indent_spaces_type_code: INTEGER is 516
	Character_representation_type_code: INTEGER is 517
	Byte_order_mark_type_code: INTEGER is 518
	
			-- Codes in XSLT namespace (`Xslt_uri_code' * 128 + 0..n)

	Xslt_analyze_string_type_code: INTEGER is 640
	Xslt_apply_imports_type_code: INTEGER is 641
	Xslt_apply_templates_type_code: INTEGER is 642
	Xslt_attribute_type_code: INTEGER is 643
	Xslt_attribute_set_type_code: INTEGER is 644
	Xslt_call_template_type_code: INTEGER is 645
	Xslt_character_map_type_code: INTEGER is 646
	Xslt_choose_type_code: INTEGER is 647
	Xslt_comment_type_code: INTEGER is 648
	Xslt_copy_type_code: INTEGER is 649
	Xslt_copy_of_type_code: INTEGER is 650
	Xslt_decimal_format_type_code: INTEGER is 651
	Xslt_document_type_code: INTEGER is 652
	Xslt_element_type_code: INTEGER is 653
	Xslt_fallback_type_code: INTEGER is 654
	Xslt_for_each_type_code: INTEGER is 655
	Xslt_for_each_group_type_code: INTEGER is 656
	Xslt_function_type_code: INTEGER is 657
	Xslt_if_type_code: INTEGER is 658
	Xslt_import_type_code: INTEGER is 659
	Xslt_import_schema_type_code: INTEGER is 660
	Xslt_include_type_code: INTEGER is 661
	Xslt_key_type_code: INTEGER is 662
	Xslt_matching_substring_type_code: INTEGER is 663
	Xslt_message_type_code: INTEGER is 664
	Xslt_next_match_type_code: INTEGER is 665
	Xslt_number_type_code: INTEGER is 666
	Xslt_namespace_type_code: INTEGER is 667
	Xslt_namespace_alias_type_code: INTEGER is 668
	Xslt_non_matching_substring_type_code: INTEGER is 669
	Xslt_otherwise_type_code: INTEGER is 670
	Xslt_output_type_code: INTEGER is 671
	Xslt_output_character_type_code: INTEGER is 672
	Xslt_param_type_code: INTEGER is 673
	Xslt_perform_sort_type_code: INTEGER is 674
	Xslt_preserve_space_type_code: INTEGER is 675
	Xslt_processing_instruction_type_code: INTEGER is 676
	Xslt_result_document_type_code: INTEGER is 677
	Xslt_sequence_type_code: INTEGER is 678
	Xslt_sort_type_code: INTEGER is 679
	Xslt_strip_space_type_code: INTEGER is 680
	Xslt_stylesheet_type_code: INTEGER is 681
	Xslt_template_type_code: INTEGER is 682
	Xslt_text_type_code: INTEGER is 683
	Xslt_transform_type_code: INTEGER is 684
	Xslt_value_of_type_code: INTEGER is 685
	Xslt_variable_type_code: INTEGER is 686
	Xslt_with_param_type_code: INTEGER is 687
	Xslt_when_type_code: INTEGER is 688
	Xslt_xpath_default_namespace_type_code: INTEGER is 689
	Xslt_exclude_result_prefixes_type_code: INTEGER is 690
	Xslt_extension_element_prefixes_type_code: INTEGER is 691
	Xslt_type_type_code: INTEGER is 692
	Xslt_use_attribute_sets_type_code: INTEGER is 693
	Xslt_validation_type_code: INTEGER is 694
	Xslt_version_type_code: INTEGER is 695

			-- Codes in XML Schema Instance namespace (`Xml_schema_instance_uri_code' * 128 + 1..n)

	Xsi_type_type_code: INTEGER is 769
	Xsi_nil_type_code: INTEGER is 770
	Xsi_schema_location_type_code: INTEGER is 771
	Xsi_no_namespace_schema_location_type_code: INTEGER is 772

			-- XSLT Attribute names

	As_attribute: STRING is "as"
	Case_order_attribute: STRING is "case-order"
	Cdata_section_elements_attribute: STRING is "cdata-section-elements"
	Collation_attribute: STRING is "collation"
	Copy_namespaces_attribute: STRING is "copy-namespaces"
	Count_attribute: STRING is "count"
	Data_type_attribute: STRING is "data-type"
	Decimal_separator_attribute: STRING is "decimal-separator"
	Default_validation_attribute: STRING is "default-validation"
	Digit_attribute: STRING is "digit"
	Disable_output_escaping_attribute: STRING is	"disable-output-escaping"
	Doctype_public_attribute: STRING is "doctype-public"
	Doctype_system_attribute: STRING is "doctype-system"
	Elements_attribute: STRING is "elements"
	Encoding_attribute: STRING is "encoding"
	Escape_uri_attributes_attribute: STRING is "escape-uri-attributes"
	Exclude_result_prefixes_attribute: STRING is "exclude-result-prefixes"
	Extension_element_prefixes_attribute: STRING is "extension-element-prefixes"
	Format_attribute: STRING is "format"
	From_attribute: STRING is "from"
	Group_adjacent_attribute: STRING is "group-adjacent"
	Group_by_attribute: STRING is "group-by"
	Group_ending_with_attribute: STRING is "group-ending-with"
	Group_starting_with_attribute: STRING is "group-starting-with"
	Grouping_separator_attribute: STRING is "grouping-separator"
	Grouping_size_attribute: STRING is "grouping-size"
	Href_attribute: STRING is "href"
	Id_attribute: STRING is "id"
	Include_content_type_attribute: STRING is "include-content-type"
	Indent_attribute: STRING is "indent"
	Infinity_attribute: STRING is "infinity"
	Lang_attribute: STRING is "lang"
	Letter_value_attribute: STRING is "letter-value"
	Level_attribute: STRING is "level"
	Match_attribute: STRING is "match"
	Media_type_attribute: STRING is "media-type"
	Method_attribute: STRING is "method"
	Minus_sign_attribute: STRING is "minus-sign"
	Mode_attribute: STRING is "mode"
	Name_attribute: STRING is "name"
	Namespace_attribute: STRING is "namespace"
	Nan_attribute: STRING is "NaN"
	Omit_xml_declaration_attribute: STRING is "omit-xml-declaration"
	Order_attribute: STRING is "order"
	Ordinal_attribute: STRING is "ordinal"
	Override_attribute: STRING is "override"
	Pattern_separator_attribute: STRING is "pattern-separator"
	Per_mille_attribute: STRING is "per-mille"
	Percent_attribute: STRING is "percent"
	Priority_attribute: STRING is "priority"
	Required_attribute: STRING is "required"
	Select_attribute: STRING is "select"
	Separator_attribute: STRING is "separator"
	Standalone_attribute: STRING is "standalone"
	Terminate_attribute: STRING is "terminate"
	Test_attribute: STRING is "test"
	Tunnel_attribute: STRING is "tunnel"
	Type_attribute: STRING is "type"
	Undeclare_namespaces_attribute: STRING is "undeclare-namespaces"
	Use_attribute: STRING is "use"
	Use_attribute_sets_attribute: STRING is "use-attribute-sets"
	Use_character_maps_attribute: STRING is "use-character-maps"
	Validation_attribute: STRING is "validation"
	Value_attribute: STRING is "value"
	Version_attribute: STRING is "version"
	Xpath_default_namespace_attribute: STRING is "xpath-default-namespace"
	Zero_digit_attribute: STRING is "zero-digit"	
	
	
	Xslt_extension_element_prefixes_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Extension_element_prefixes_attribute
		end
	Xslt_exclude_result_prefixes_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Exclude_result_prefixes_attribute
		end
	Xslt_version_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Version_attribute
		end
	Xslt_xpath_default_namespace_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Xpath_default_namespace_attribute
		end

	Gexslt_character_representation_attribute: STRING is
		once
				Result := "{" + Gexslt_eiffel_type_uri + "}character-representation"
		end

	Gexslt_explain_attribute: STRING is
		once
			Result := "{" + Gexslt_eiffel_type_uri + "}explain"
		end

	Gexslt_indent_spaces_attribute: STRING is
		once
			Result := "{" + Gexslt_eiffel_type_uri + "}indent-spaces"
		end

	Gexslt_byte_order_mark_attribute: STRING is
		once
			Result := "{" + Gexslt_eiffel_type_uri + "}byte-order-mark"
		end

feature -- Status report

	is_reserved_namespace (a_uri: STRING): BOOLEAN is
			-- Is `a_uri' a reserved namespace?
		require
			uri_not_void: a_uri /= Void
		do
			Result := STRING_.same_string (a_uri, Xslt_uri)
				or else STRING_.same_string (a_uri, Xpath_functions_uri)
				or else STRING_.same_string (a_uri, Xml_uri)
				or else STRING_.same_string (a_uri, Xml_schema_uri)
				or else STRING_.same_string (a_uri, Xml_schema_datatypes_uri)
				or else STRING_.same_string (a_uri, Xpath_defined_datatypes_uri)
				or else STRING_.same_string (a_uri, Xml_schema_instance_uri)
		end

end


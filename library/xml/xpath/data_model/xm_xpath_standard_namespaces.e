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

	Null_prefix_index: INTEGER is 1
			-- The numeric code representing the null namespace

	Xml_prefix_index: INTEGER is 2
			-- Numeric code representing the XML namespace

	Xslt_prefix_index: INTEGER is 3
			-- Numeric code representing the XSLT namespace

	Xml_schema_prefix_index: INTEGER is 4
			-- Numeric code representing the XML Schema namespace
	
	Xpath_defined_datatypes_prefix_index: INTEGER is 5
			-- Numeric code representing the XPath datatypes namespace

	Gexslt_uri_prefix_index: INTEGER is 6
			-- Numeric code representing the gexslt namespace

	Xml_schema_instance_prefix_index: INTEGER is 7
			-- Numeric code representing the XML Schema instance namespace
	
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

	Gexslt_eiffel_type_uri: STRING is "http://www.gobosoft.com/gexslt/eiffel-type"
			-- Namespace for extension functions written in Eiffel


			-- The following codes are 3-bit values for building a fingerprint

	Default_uri_code: INTEGER is 0
	Xml_uri_code: INTEGER is 1
	Xml_schema_uri_code: INTEGER is 2
	Xpath_defined_datatypes_uri_code: INTEGER is 3	
	Gexslt_uri_code: INTEGER is 4
	Xslt_uri_code: INTEGER is 5
	Xml_schema_instance_uri_code: INTEGER is 6

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

	Name_attribute: STRING is "name"
	Use_attribute: STRING is "use"
	Match_attribute: STRING is "match"
	Collation_attribute: STRING is "collation"
	Extension_element_prefixes_attribute: STRING is "extension-element-prefixes"
	Exclude_result_prefixes_attribute: STRING is "exclude-result-prefixes"
	Version_attribute: STRING is "version"
	Xpath_default_namespace_attribute: STRING is "xpath-default-namespace"
	Id_attribute: STRING is "id"
	Default_validation_attribute: STRING is "default-validation"
	Decimal_separator_attribute: STRING is "decimal-separator"
	Pattern_separator_attribute: STRING is "pattern-separator"
	Infinity_attribute: STRING is "infinity"
	Minus_sign_attribute: STRING is "minus-sign"
	Nan_attribute: STRING is "NaN"
	Percent_attribute: STRING is "percent"
	Per_mille_attribute: STRING is "per-mille"
	Zero_digit_attribute: STRING is "zero-digit"
	Digit_attribute: STRING is "digit"
	Select_attribute: STRING is "select"
	As_attribute: STRING is "as"
	Required_attribute: STRING is "required"
	Tunnel_attribute: STRING is "tunnel"
	Mode_attribute: STRING is "mode"
	Priority_attribute: STRING is "priority"
	Disable_output_escaping_attribute: STRING is	"disable-output-escaping"
	Separator_attribute: STRING is "separator"
	Test_attribute: STRING is "test"
	Order_attribute: STRING is "order"
	Case_order_attribute: STRING is "case-order"
	Lang_attribute: STRING is "lang"
	Data_type_attribute: STRING is "data-type"
	Group_by_attribute: STRING is "group-by"
	Group_adjacent_attribute: STRING is "group-adjacent"
	Group_starting_with_attribute: STRING is "group-starting-with"
	Group_ending_with_attribute: STRING is "group-ending-with"
	Value_attribute: STRING is "value"
	Count_attribute: STRING is "count"
	From_attribute: STRING is "from"
	Level_attribute: STRING is "level"
	Letter_value_attribute: STRING is "letter-value"
	Grouping_size_attribute: STRING is "grouping-size"
	Grouping_separator_attribute: STRING is "grouping-separator"
	Ordinal_attribute: STRING is "ordinal"
	Format_attribute: STRING is "format"

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

	Gexslt_explain_attribute: STRING is
		once
			Result := "{" + Gexslt_eiffel_type_uri + "}explain"
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


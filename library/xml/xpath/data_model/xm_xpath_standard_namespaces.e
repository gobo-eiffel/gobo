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

	XM_MARKUP_CONSTANTS
	
	KL_IMPORTED_STRING_ROUTINES

	-- all INTEGERs should be INTEGER_16

feature -- Access

	No_namespaces: INTEGER is 1
	Local_namespaces: INTEGER is 2
	All_namespaces: INTEGER is 3

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

	Xpath_standard_functions_prefix_index: INTEGER is 8
			-- Numeric code the XPath standard functions namespace
	
	Xhtml_prefix_index: INTEGER is 9
			-- Numeric code representing the XHTML namespace

	Xpath_errors_prefix_index: INTEGER is 10
			-- Numeric code representing the XPath errors namespace

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

	Xpath_defined_datatypes_uri: STRING is "http://www.w3.org/2005/04/xpath-datatypes"
			-- Namespace for additional XPath-defined data types (xdt)

	Xpath_standard_functions_uri: STRING is "http://www.w3.org/2005/04/xpath-functions"
			-- XPath standard functions and operators (fn)

	Xpath_errors_uri: STRING is "http://www.w3.org/2004/07/xqt-errors"
			-- XPath errors

	Microsoft_uri: STRING is "http://www.w3.org/TR/WD-xsl"
			-- Recognize the Microsoft namespace so we can give a suitably sarcastic error message
	
	Xhtml_uri: STRING is "http://www.w3.org/1999/xhtml"
			-- XHTML namespace

	Gexslt_eiffel_type_uri: STRING is "http://www.gobosoft.com/eiffel/gobo/gexslt/extension"
			-- Namespace for extension functions, etc. written in Eiffel

	Gexslt_examples_uri: STRING is "http://www.gobosoft.com/eiffel/gobo/gexslt/extension/example"
			-- Namespace for examples provided in the library, but not regarded as standard extensions

	Exslt_date_uri: STRING is "http://exslt.org/dates-and-times"
			-- EXSLT dates

	Exslt_environment_uri: STRING is "http://exslt.org/environment-variables"
			-- EXSLT environment variables
	
	Xmlns_uri: STRING is "http://www.w3.org/2000/xmlns/"
			-- Xmlns

	Unicode_codepoint_collation_uri: STRING is "http://www.w3.org/2004/10/xpath-functions/collation/codepoint"
			-- Unicode codepoint collation

			-- The following codes are 3-bit values for building a fingerprint

	Default_uri_code: INTEGER is 0
	Xml_uri_code: INTEGER is 1
	Xml_schema_uri_code: INTEGER is 2
	Xpath_defined_datatypes_uri_code: INTEGER is 3	
	Gexslt_uri_code: INTEGER is 4
	Xslt_uri_code: INTEGER is 5
	Xml_schema_instance_uri_code: INTEGER is 6
	Xpath_standard_functions_uri_code: INTEGER is 7

			-- The remaining ones aren't

	Xhtml_uri_code: INTEGER is 8

	Null_namespace_code: INTEGER is 0 -- 65536 * (Null_prefix_index - 1) + Default_uri_code
			-- Code for no namespace;
			-- This works because it is not possible to define
			--  a prefix to and empty-string namespace.

	Xml_namespace_code: INTEGER is
			-- Pre-computed_namespace code for xmlns:xml
		once
			Result := (Xml_prefix_index - 1) * 65536 + Xml_uri_code
		ensure
			correct_value: Result = 0x00010001
			-- This works because of the rule that ONLY the prefix xml may
			--  be allocated to xml namespace.
		end

			-- The following codes are fingerprints

			-- Codes in XML namespace (`Xml_uri_code' * 128 + 1..n)

	Xml_base_type_code: INTEGER is 129
	Xml_space_type_code: INTEGER is 130
	Xml_lang_type_code: INTEGER is 131
	Xml_id_type_code: INTEGER is 133

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
	Gexslt_collation_type_code: INTEGER is 519
	Memo_function_type_code: INTEGER is 520
	Next_in_chain_type_code: INTEGER is 521

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
	Xslt_use_when_type_code: INTEGER is 694
	Xslt_validation_type_code: INTEGER is 695
	Xslt_version_type_code: INTEGER is 696
	Xslt_default_collation_type_code: INTEGER is 697
	Xslt_inherit_namespaces_type_code: INTEGER is 698

			-- Codes in XML Schema Instance namespace (`Xml_schema_instance_uri_code' * 128 + 1..n)

	Xsi_type_type_code: INTEGER is 769
	Xsi_nil_type_code: INTEGER is 770
	Xsi_schema_location_type_code: INTEGER is 771
	Xsi_no_namespace_schema_location_type_code: INTEGER is 772

			-- Codes in XPath functions namespace (`Xpath_standard_functions_uri_code' * 128 + 1..n)

	Abs_function_type_code: INTEGER is 897
	Adjust_date_to_timezone_function_type_code: INTEGER is 898
	Adjust_datetime_to_timezone_function_type_code: INTEGER is 899
	Adjust_time_to_timezone_function_type_code: INTEGER is 900
	Avg_function_type_code: INTEGER is 901
	Base_uri_function_type_code: INTEGER is 902
	Boolean_function_type_code: INTEGER is 903
	Ceiling_function_type_code: INTEGER is 904
	Codepoints_to_string_function_type_code: INTEGER is 905
	Collection_function_type_code: INTEGER is 906
	Compare_function_type_code: INTEGER is 907
	Concat_function_type_code: INTEGER is 908
	Contains_function_type_code: INTEGER is 909
	Count_function_type_code: INTEGER is 910
	Current_date_function_type_code: INTEGER is 911
	Current_datetime_function_type_code: INTEGER is 912
	Current_time_function_type_code: INTEGER is 913
	Data_function_type_code: INTEGER is 914
	Datetime_function_type_code: INTEGER is 915
	Day_from_date_function_type_code: INTEGER is 916
	Day_from_datetime_function_type_code: INTEGER is 917
	Days_from_duration_function_type_code: INTEGER is 918
	Deep_equal_function_type_code: INTEGER is 919
	Default_collation_function_type_code: INTEGER is 920
	Distinct_values_function_type_code: INTEGER is 921
	Doc_function_type_code: INTEGER is 922
	Document_uri_function_type_code: INTEGER is 923
	Empty_function_type_code: INTEGER is 924
	Ends_with_function_type_code: INTEGER is 925
	Error_function_type_code: INTEGER is 926
	Escape_uri_function_type_code: INTEGER is 927
	Exactly_one_function_type_code: INTEGER is 928
	Exists_function_type_code: INTEGER is 929
	False_function_type_code: INTEGER is 930
	Floor_function_type_code: INTEGER is 931
	Hours_from_datetime_function_type_code: INTEGER is 932
	Hours_from_time_function_type_code: INTEGER is 933
	Hours_from_duration_function_type_code: INTEGER is 934
	Id_function_type_code: INTEGER is 935
	Idref_function_type_code: INTEGER is 936
	Implicit_timezone_function_type_code: INTEGER is 937
	In_scope_prefixes_function_type_code: INTEGER is 938
	Index_of_function_type_code: INTEGER is 939
	Insert_before_function_type_code: INTEGER is 940
	Lang_function_type_code: INTEGER is 941
	Last_function_type_code: INTEGER is 942
	Local_name_function_type_code: INTEGER is 943
	Local_name_from_qname_function_type_code: INTEGER is 944
	Lower_case_function_type_code: INTEGER is 945
	Matches_function_type_code: INTEGER is 946
	Max_function_type_code: INTEGER is 947
	Min_function_type_code: INTEGER is 948
	Minutes_from_datetime_function_type_code: INTEGER is 949
	Minutes_from_duration_function_type_code: INTEGER is 950
	Minutes_from_time_function_type_code: INTEGER is 951
	Month_from_date_function_type_code: INTEGER is 952
	Month_from_datetime_function_type_code: INTEGER is 953
	Month_from_duration_function_type_code: INTEGER is 954
	Name_function_type_code: INTEGER is 955
	Namespace_uri_function_type_code: INTEGER is 956
	Namespace_uri_for_prefix_function_type_code: INTEGER is 957
	Namespace_uri_from_qname_function_type_code: INTEGER is 958
	Nilled_function_type_code: INTEGER is 959
	Node_name_function_type_code: INTEGER is 960
	Normalize_space_function_type_code: INTEGER is 961
	Normalize_unicode_function_type_code: INTEGER is 962
	Not_function_type_code: INTEGER is 963
	Number_function_type_code: INTEGER is 964
	One_or_more_function_type_code: INTEGER is 965
	Position_function_type_code: INTEGER is 966
	Qname_function_type_code: INTEGER is 967
	Remove_function_type_code: INTEGER is 968
	Replace_function_type_code: INTEGER is 969
	Resolve_qname_function_type_code: INTEGER is 970
	Resolve_uri_function_type_code: INTEGER is 971
	Reverse_function_type_code: INTEGER is 972
	Root_function_type_code: INTEGER is 973
	Round_function_type_code: INTEGER is 974
	Round_half_to_even_function_type_code: INTEGER is 975
	Seconds_from_datetime_function_type_code: INTEGER is 976
	Seconds_from_duration_function_type_code: INTEGER is 977
	Seconds_from_time_function_type_code: INTEGER is 978
	Starts_with_function_type_code: INTEGER is 979
	Static_base_uri_function_type_code: INTEGER is 980
	String_function_type_code: INTEGER is 981
	String_join_function_type_code: INTEGER is 982
	String_length_function_type_code: INTEGER is 983
	String_to_codepoints_function_type_code: INTEGER is 984
	Subsequence_function_type_code: INTEGER is 985
	Substring_function_type_code: INTEGER is 986
	Substring_after_function_type_code: INTEGER is 987
	Substring_before_function_type_code: INTEGER is 988
	Sum_function_type_code: INTEGER is 989
	Timezone_from_date_function_type_code: INTEGER is 990
	Timezone_from_datetime_function_type_code: INTEGER is 991
	Timezone_from_time_function_type_code: INTEGER is 992
	Tokenize_function_type_code: INTEGER is 993
	Trace_function_type_code: INTEGER is 994
	Translate_function_type_code: INTEGER is 995
	True_function_type_code: INTEGER is 996
	Unordered_function_type_code: INTEGER is 997
	Upper_case_function_type_code: INTEGER is 998
	Year_from_date_function_type_code: INTEGER is 999
	Year_from_datetime_function_type_code: INTEGER is 1000
	Years_from_duration_function_type_code: INTEGER is 1001
	Zero_or_one_function_type_code: INTEGER is 1002

			-- Functions provided by XSLT

	Current_function_type_code: INTEGER is 1003
	Current_group_function_type_code: INTEGER is 1004
	Current_grouping_key_function_type_code: INTEGER is 1005
	Document_function_type_code: INTEGER is 1006
	Element_available_function_type_code: INTEGER is 1007
	Format_date_function_type_code: INTEGER is 1008
	Format_datetime_function_type_code: INTEGER is 1009
	Format_time_function_type_code: INTEGER is 1010
	Format_number_function_type_code: INTEGER is 1011
	Function_available_function_type_code: INTEGER is 1012
	Generate_id_function_type_code: INTEGER is 1013
	Key_function_type_code: INTEGER is 1014
	Regex_group_function_type_code: INTEGER is 1015
	System_property_function_type_code: INTEGER is 1016
	Unparsed_entity_public_id_function_type_code: INTEGER is 1017
	Unparsed_entity_uri_function_type_code: INTEGER is 1018
	Unparsed_text_function_type_code: INTEGER is 1019

	
			-- XSLT Attribute names

	As_attribute: STRING is "as"
	Byte_order_mark_attribute: STRING is "byte-order-mark"
	Case_order_attribute: STRING is "case-order"
	Cdata_section_elements_attribute: STRING is "cdata-section-elements"
	Character_attribute: STRING is "character"
	Collation_attribute: STRING is "collation"
	Copy_namespaces_attribute: STRING is "copy-namespaces"
	Count_attribute: STRING is "count"
	Data_type_attribute: STRING is "data-type"
	Decimal_separator_attribute: STRING is "decimal-separator"
	Default_collation_attribute: STRING is "default-collation"
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
	Inherit_namespaces_attribute: STRING is "inherit-namespaces"
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
	Output_version_attribute: STRING is "output-version"
	Override_attribute: STRING is "override"
	Pattern_separator_attribute: STRING is "pattern-separator"
	Per_mille_attribute: STRING is "per-mille"
	Percent_attribute: STRING is "percent"
	Priority_attribute: STRING is "priority"
	Required_attribute: STRING is "required"
	Result_prefix_attribute: STRING is "result-prefix"
	Select_attribute: STRING is "select"
	Separator_attribute: STRING is "separator"
	Standalone_attribute: STRING is "standalone"
	String_attribute: STRING is "string"
	Stylesheet_prefix_attribute: STRING is "stylesheet-prefix"
	Terminate_attribute: STRING is "terminate"
	Test_attribute: STRING is "test"
	Tunnel_attribute: STRING is "tunnel"
	Type_attribute: STRING is "type"
	Undeclare_namespaces_attribute: STRING is "undeclare-namespaces"
	Use_attribute: STRING is "use"
	Use_attribute_sets_attribute: STRING is "use-attribute-sets"
	Use_character_maps_attribute: STRING is "use-character-maps"
	Use_when_attribute: STRING is "use-when"
	Validation_attribute: STRING is "validation"
	Value_attribute: STRING is "value"
	Version_attribute: STRING is "version"
	Xpath_default_namespace_attribute: STRING is "xpath-default-namespace"
	Zero_digit_attribute: STRING is "zero-digit"	
	

	Xslt_expanded_namespace: STRING is
		once
			Result := "{" + Xslt_uri + "}"
		end

	Xslt_default_collation_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Default_collation_attribute
		end

	Xslt_extension_element_prefixes_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Extension_element_prefixes_attribute
		end

	Xslt_exclude_result_prefixes_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Exclude_result_prefixes_attribute
		end

	Xslt_use_when_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Use_when_attribute
		end

	Xslt_version_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Version_attribute
		end

	Xslt_xpath_default_namespace_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Xpath_default_namespace_attribute
		end

	Xslt_inherit_namespaces_attribute: STRING is
		once
			Result := "{" + Xslt_uri + "}" + Xslt_inherit_namespaces_attribute
		end

	Gexslt_expanded_namespace: STRING is
		once
				Result := "{" + Gexslt_eiffel_type_uri + "}"
		end

	Gexslt_character_representation_name: STRING is "character-representation"
	Gexslt_character_representation_attribute: STRING is
		once
				Result := "{" + Gexslt_eiffel_type_uri + "}" + Gexslt_character_representation_name
		end

	Gexslt_next_in_chain_name: STRING is "next-in-chain"
	Gexslt_next_in_chain_attribute: STRING is
		once
				Result := "{" + Gexslt_eiffel_type_uri + "}" + Gexslt_next_in_chain_name
		end

	Gexslt_memo_function_attribute: STRING is
		once
			Result := "{" + Gexslt_eiffel_type_uri + "}memo-function"
		end

	Gexslt_explain_attribute: STRING is
		once
			Result := "{" + Gexslt_eiffel_type_uri + "}explain"
		end

	Gexslt_indent_spaces_name: STRING is "indent-spaces"
	Gexslt_indent_spaces_attribute: STRING is
		once
			Result := "{" + Gexslt_eiffel_type_uri + "}" + Gexslt_indent_spaces_name
		end

	Gexslt_name_pseudo_attribute: STRING is "gexslt-name"
			-- Pseudo-attribute used in tracing

	Gexslt_expression_name_pseudo_attribute: STRING is "gexslt-expression-name"
			-- Pseudo-attribute used in tracing

feature -- Status report

	is_reserved_namespace (a_uri: STRING): BOOLEAN is
			-- Is `a_uri' a reserved namespace?
		require
			uri_not_void: a_uri /= Void
		do
			Result := STRING_.same_string (a_uri, Xslt_uri)
				or else STRING_.same_string (a_uri, Xpath_standard_functions_uri)
				or else STRING_.same_string (a_uri, Xml_uri)
				or else STRING_.same_string (a_uri, Xml_schema_uri)
				or else STRING_.same_string (a_uri, Xml_schema_datatypes_uri)
				or else STRING_.same_string (a_uri, Xpath_defined_datatypes_uri)
				or else STRING_.same_string (a_uri, Xml_schema_instance_uri)
		end

end


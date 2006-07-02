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

	XM_XPATH_NAME_UTILITIES

	KL_IMPORTED_STRING_ROUTINES

	-- all INTEGERs should be INTEGER_16

feature -- Access

	Maximum_built_in_fingerprint: INTEGER is 2048
			-- Exclusive upper limit on fingerprints for built-in types

	Minimum_built_in_fingerprint: INTEGER is 256
			-- Exclusive lower limit on fingerprints for built-in types

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

	Xpath_defined_datatypes_uri: STRING is "http://www.w3.org/2005/xpath-datatypes"
			-- Namespace for additional XPath-defined data types (xdt)

	Xpath_standard_functions_uri: STRING is "http://www.w3.org/2005/xpath-functions"
			-- XPath standard functions and operators (fn)

	Xpath_errors_uri: STRING is "http://www.w3.org/2005/xqt-errors"
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

	Unicode_codepoint_collation_uri: STRING is "http://www.w3.org/2005/xpath-functions/collation/codepoint"
			-- Unicode codepoint collation

	Default_collection_scheme: STRING is "gobo-default-collection"
			-- URI scheme for default collection

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
			correct_value: True -- Result = 0x00010001
			-- This works because of the rule that ONLY the prefix xml may
			--  be allocated to xml namespace.
		end

			-- The following codes are fingerprints

			-- Codes in XML namespace (`Xml_uri_code' * 256 + 1..n)

	Xml_base_type_code: INTEGER is 257
	Xml_space_type_code: INTEGER is 258
	Xml_lang_type_code: INTEGER is 259
	Xml_id_type_code: INTEGER is 260

			-- Codes in XML Schema namespace (`Xml_schema_uri_code' * 256 + 1..n)

	String_type_code: INTEGER is 513
	Boolean_type_code: INTEGER is 514
	Decimal_type_code: INTEGER is 515
	Float_type_code: INTEGER is 516
	Double_type_code: INTEGER is 517
	Duration_type_code: INTEGER is 518
	Date_time_type_code: INTEGER is 519
	Time_type_code: INTEGER is 520
	Date_type_code: INTEGER is 521	
	G_year_month_type_code: INTEGER is 522
	G_year_type_code: INTEGER is 523
	G_month_day_type_code: INTEGER is 524
	G_day_type_code: INTEGER is 525
	G_month_type_code: INTEGER is 526
	Hex_binary_type_code: INTEGER is 527
	Base64_binary_type_code: INTEGER is 528
	Any_uri_type_code: INTEGER is 529
	Qname_type_code: INTEGER is 530
	Notation_type_code: INTEGER is 531
	Integer_type_code: INTEGER is 532

			-- Note that any type code <= Integer_type_code is considered to represent a
			-- primitive type: see {XM_XPATH_TYPE}.is_primitive_type

	Non_positive_integer_type_code: INTEGER is 533
	Negative_integer_type_code: INTEGER is 534
	Long_type_code: INTEGER is 535
	Int_type_code: INTEGER is 536
	Short_type_code: INTEGER is 537
	Byte_type_code: INTEGER is 538
	Non_negative_integer_type_code: INTEGER is 539
	Positive_integer_type_code: INTEGER is 540
	Unsigned_long_type_code: INTEGER is 541
	Unsigned_int_type_code: INTEGER is 542
	Unsigned_short_type_code: INTEGER is 543
	Unsigned_byte_type_code: INTEGER is 544
	Normalized_string_type_code: INTEGER is 545
	Token_type_code: INTEGER is 546
	Language_type_code: INTEGER is 547
	Nmtoken_type_code: INTEGER is 548
	Nmtokens_type_code: INTEGER is 549
	Name_type_code: INTEGER is 550
	Ncname_type_code: INTEGER is 551
	Id_type_code: INTEGER is 552
	Idref_type_code: INTEGER is 553
	Idrefs_type_code: INTEGER is 554
	Entity_type_code: INTEGER is 555
	Entities_type_code: INTEGER is 556
	
	Any_type_code: INTEGER is 557
	Any_simple_type_code: INTEGER is 558

			-- Codes in XPath datatypes namespace (`Xpath_defined_datatypes_uri_code' * 256 + 1..n)

	Untyped_type_code: INTEGER is 769
	Untyped_atomic_type_code: INTEGER is 770
	Any_atomic_type_code: INTEGER is 771
	Year_month_duration_type_code: INTEGER is 772
	Day_time_duration_type_code: INTEGER is 773

			-- Codes in Gobo XPath/XSLT namespace (`Gexslt_uri_code' * 256 + 1..n)

	Numeric_type_code: INTEGER is 1025
	Object_type_code: INTEGER is 1026
	Explain_type_code: INTEGER is 1027
	Indent_spaces_type_code: INTEGER is 1028
	Character_representation_type_code: INTEGER is 1029
	Byte_order_mark_type_code: INTEGER is 1030
	Gexslt_collation_type_code: INTEGER is 1031
	Memo_function_type_code: INTEGER is 1032
	Next_in_chain_type_code: INTEGER is 1033
	Gexslt_isolation_level_type_code: INTEGER is 1034

			-- Codes in XSLT namespace (`Xslt_uri_code' * 256 + 0..n)

	Xslt_analyze_string_type_code: INTEGER is 1281
	Xslt_apply_imports_type_code: INTEGER is 1282
	Xslt_apply_templates_type_code: INTEGER is 1283
	Xslt_attribute_type_code: INTEGER is 1284
	Xslt_attribute_set_type_code: INTEGER is 1285
	Xslt_call_template_type_code: INTEGER is 1286
	Xslt_character_map_type_code: INTEGER is 1287
	Xslt_choose_type_code: INTEGER is 1288
	Xslt_comment_type_code: INTEGER is 1289
	Xslt_copy_type_code: INTEGER is 1290
	Xslt_copy_of_type_code: INTEGER is 1291
	Xslt_decimal_format_type_code: INTEGER is 1292
	Xslt_document_type_code: INTEGER is 1293
	Xslt_element_type_code: INTEGER is 1294
	Xslt_fallback_type_code: INTEGER is 1295
	Xslt_for_each_type_code: INTEGER is 1296
	Xslt_for_each_group_type_code: INTEGER is 1297
	Xslt_function_type_code: INTEGER is 1298
	Xslt_if_type_code: INTEGER is 1299
	Xslt_import_type_code: INTEGER is 1300
	Xslt_import_schema_type_code: INTEGER is 1301
	Xslt_include_type_code: INTEGER is 1302
	Xslt_key_type_code: INTEGER is 1303
	Xslt_matching_substring_type_code: INTEGER is 1304
	Xslt_message_type_code: INTEGER is 1305
	Xslt_next_match_type_code: INTEGER is 1306
	Xslt_number_type_code: INTEGER is 1307
	Xslt_namespace_type_code: INTEGER is 1308
	Xslt_namespace_alias_type_code: INTEGER is 1309
	Xslt_non_matching_substring_type_code: INTEGER is 1310
	Xslt_otherwise_type_code: INTEGER is 1311
	Xslt_output_type_code: INTEGER is 1312
	Xslt_output_character_type_code: INTEGER is 1313
	Xslt_param_type_code: INTEGER is 1314
	Xslt_perform_sort_type_code: INTEGER is 1315
	Xslt_preserve_space_type_code: INTEGER is 1316
	Xslt_processing_instruction_type_code: INTEGER is 1317
	Xslt_result_document_type_code: INTEGER is 1318
	Xslt_sequence_type_code: INTEGER is 1319
	Xslt_sort_type_code: INTEGER is 1320
	Xslt_strip_space_type_code: INTEGER is 1321
	Xslt_stylesheet_type_code: INTEGER is 1322
	Xslt_template_type_code: INTEGER is 1323
	Xslt_text_type_code: INTEGER is 1324
	Xslt_transform_type_code: INTEGER is 1325
	Xslt_value_of_type_code: INTEGER is 1326
	Xslt_variable_type_code: INTEGER is 1327
	Xslt_with_param_type_code: INTEGER is 1328
	Xslt_when_type_code: INTEGER is 1329
	Xslt_xpath_default_namespace_type_code: INTEGER is 1330
	Xslt_exclude_result_prefixes_type_code: INTEGER is 1331
	Xslt_extension_element_prefixes_type_code: INTEGER is 1332
	Xslt_type_type_code: INTEGER is 1333
	Xslt_use_attribute_sets_type_code: INTEGER is 1334
	Xslt_use_when_type_code: INTEGER is 1335
	Xslt_validation_type_code: INTEGER is 1336
	Xslt_version_type_code: INTEGER is 1337
	Xslt_default_collation_type_code: INTEGER is 1338
	Xslt_inherit_namespaces_type_code: INTEGER is 1339

			-- Codes in XML Schema Instance namespace (`Xml_schema_instance_uri_code' * 256 + 1..n)

	Xsi_type_type_code: INTEGER is 1537
	Xsi_nil_type_code: INTEGER is 1538
	Xsi_schema_location_type_code: INTEGER is 1539
	Xsi_no_namespace_schema_location_type_code: INTEGER is 1540

			-- Codes in XPath functions namespace (`Xpath_standard_functions_uri_code' * 256 + 1..n)

	Abs_function_type_code: INTEGER is 1793
	Adjust_date_to_timezone_function_type_code: INTEGER is 1794
	Adjust_datetime_to_timezone_function_type_code: INTEGER is 1795
	Adjust_time_to_timezone_function_type_code: INTEGER is 1796
	Avg_function_type_code: INTEGER is 1797
	Base_uri_function_type_code: INTEGER is 1798
	Boolean_function_type_code: INTEGER is 1799
	Ceiling_function_type_code: INTEGER is 1800
	Codepoint_equal_function_type_code: INTEGER is 1801
	Codepoints_to_string_function_type_code: INTEGER is 1802
	Collection_function_type_code: INTEGER is 1803
	Compare_function_type_code: INTEGER is 1804
	Concat_function_type_code: INTEGER is 1805
	Contains_function_type_code: INTEGER is 1806
	Count_function_type_code: INTEGER is 1807
	Current_date_function_type_code: INTEGER is 1808
	Current_datetime_function_type_code: INTEGER is 1809
	Current_time_function_type_code: INTEGER is 1810
	Data_function_type_code: INTEGER is 1811
	Datetime_function_type_code: INTEGER is 1812
	Day_from_date_function_type_code: INTEGER is 1813
	Day_from_datetime_function_type_code: INTEGER is 1814
	Days_from_duration_function_type_code: INTEGER is 1815
	Deep_equal_function_type_code: INTEGER is 1816
	Default_collation_function_type_code: INTEGER is 1817
	Distinct_values_function_type_code: INTEGER is 1818
	Doc_available_function_type_code: INTEGER is 1819
	Doc_function_type_code: INTEGER is 1820
	Document_uri_function_type_code: INTEGER is 1821
	Empty_function_type_code: INTEGER is 1822
	Ends_with_function_type_code: INTEGER is 1823
	Error_function_type_code: INTEGER is 1824
	Encode_for_uri_function_type_code: INTEGER is 1825
	Escape_html_uri_function_type_code: INTEGER is 1826
	Exactly_one_function_type_code: INTEGER is 1827
	Exists_function_type_code: INTEGER is 1828
	False_function_type_code: INTEGER is 1829
	Floor_function_type_code: INTEGER is 1830
	Hours_from_datetime_function_type_code: INTEGER is 1831
	Hours_from_time_function_type_code: INTEGER is 1832
	Hours_from_duration_function_type_code: INTEGER is 1833
	Id_function_type_code: INTEGER is 1834
	Idref_function_type_code: INTEGER is 1835
	Implicit_timezone_function_type_code: INTEGER is 1836
	In_scope_prefixes_function_type_code: INTEGER is 1837
	Index_of_function_type_code: INTEGER is 1838
	Insert_before_function_type_code: INTEGER is 1839
	Iri_to_uri_function_type_code: INTEGER is 1840
	Lang_function_type_code: INTEGER is 1841
	Last_function_type_code: INTEGER is 1842
	Local_name_function_type_code: INTEGER is 1843
	Local_name_from_qname_function_type_code: INTEGER is 1844
	Lower_case_function_type_code: INTEGER is 1845
	Matches_function_type_code: INTEGER is 1846
	Max_function_type_code: INTEGER is 1847
	Min_function_type_code: INTEGER is 1848
	Minutes_from_datetime_function_type_code: INTEGER is 1849
	Minutes_from_duration_function_type_code: INTEGER is 1850
	Minutes_from_time_function_type_code: INTEGER is 1851
	Month_from_date_function_type_code: INTEGER is 1852
	Month_from_datetime_function_type_code: INTEGER is 1853
	Months_from_duration_function_type_code: INTEGER is 1854
	Name_function_type_code: INTEGER is 1855
	Namespace_uri_function_type_code: INTEGER is 1856
	Namespace_uri_for_prefix_function_type_code: INTEGER is 1857
	Namespace_uri_from_qname_function_type_code: INTEGER is 1858
	Nilled_function_type_code: INTEGER is 1859
	Node_name_function_type_code: INTEGER is 1860
	Normalize_space_function_type_code: INTEGER is 1861
	Normalize_unicode_function_type_code: INTEGER is 1862
	Not_function_type_code: INTEGER is 1863
	Number_function_type_code: INTEGER is 1864
	One_or_more_function_type_code: INTEGER is 1865
	Prefix_from_qname_function_type_code: INTEGER is 1866
	Position_function_type_code: INTEGER is 1867
	Qname_function_type_code: INTEGER is 1868
	Remove_function_type_code: INTEGER is 1869
	Replace_function_type_code: INTEGER is 1870
	Resolve_qname_function_type_code: INTEGER is 1871
	Resolve_uri_function_type_code: INTEGER is 1872
	Reverse_function_type_code: INTEGER is 1873
	Root_function_type_code: INTEGER is 1874
	Round_function_type_code: INTEGER is 1875
	Round_half_to_even_function_type_code: INTEGER is 1876
	Seconds_from_datetime_function_type_code: INTEGER is 1877
	Seconds_from_duration_function_type_code: INTEGER is 1878
	Seconds_from_time_function_type_code: INTEGER is 1879
	Starts_with_function_type_code: INTEGER is 1880
	Static_base_uri_function_type_code: INTEGER is 1881
	String_function_type_code: INTEGER is 1882
	String_join_function_type_code: INTEGER is 1883
	String_length_function_type_code: INTEGER is 1884
	String_to_codepoints_function_type_code: INTEGER is 1885
	Subsequence_function_type_code: INTEGER is 1886
	Substring_function_type_code: INTEGER is 1887
	Substring_after_function_type_code: INTEGER is 1888
	Substring_before_function_type_code: INTEGER is 1889
	Sum_function_type_code: INTEGER is 1890
	Timezone_from_date_function_type_code: INTEGER is 1891
	Timezone_from_datetime_function_type_code: INTEGER is 1892
	Timezone_from_time_function_type_code: INTEGER is 1893
	Tokenize_function_type_code: INTEGER is 1894
	Trace_function_type_code: INTEGER is 1895
	Translate_function_type_code: INTEGER is 1896
	True_function_type_code: INTEGER is 1897
	Unordered_function_type_code: INTEGER is 1898
	Upper_case_function_type_code: INTEGER is 1899
	Year_from_date_function_type_code: INTEGER is 1900
	Year_from_datetime_function_type_code: INTEGER is 1901
	Years_from_duration_function_type_code: INTEGER is 1902
	Zero_or_one_function_type_code: INTEGER is 1903

			-- Functions provided by XSLT

	Current_function_type_code: INTEGER is 1920
	Current_group_function_type_code: INTEGER is 1921
	Current_grouping_key_function_type_code: INTEGER is 1922
	Document_function_type_code: INTEGER is 1923
	Element_available_function_type_code: INTEGER is 1924
	Format_date_function_type_code: INTEGER is 1925
	Format_datetime_function_type_code: INTEGER is 1926
	Format_time_function_type_code: INTEGER is 1927
	Format_number_function_type_code: INTEGER is 1928
	Function_available_function_type_code: INTEGER is 1929
	Generate_id_function_type_code: INTEGER is 1930
	Key_function_type_code: INTEGER is 1931
	Regex_group_function_type_code: INTEGER is 1932
	System_property_function_type_code: INTEGER is 1933
	Type_available_function_type_code: INTEGER is 1934
	Unparsed_entity_public_id_function_type_code: INTEGER is 1935
	Unparsed_entity_uri_function_type_code: INTEGER is 1936
	Unparsed_text_function_type_code: INTEGER is 1937
	Unparsed_text_available_function_type_code: INTEGER is 1938





	
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
	Flags_attribute: STRING is "flags"
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
	Input_type_annotations_attribute: STRING is "input-type-annotations"
	Isolation_level_attribute: STRING is "isolation-level"
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
	Normalization_form_attribute: STRING is "normalization-form"
	Omit_xml_declaration_attribute: STRING is "omit-xml-declaration"
	Order_attribute: STRING is "order"
	Ordinal_attribute: STRING is "ordinal"
	Output_version_attribute: STRING is "output-version"
	Override_attribute: STRING is "override"
	Pattern_separator_attribute: STRING is "pattern-separator"
	Per_mille_attribute: STRING is "per-mille"
	Percent_attribute: STRING is "percent"
	Priority_attribute: STRING is "priority"
	Regex_attribute: STRING is "regex"
	Required_attribute: STRING is "required"
	Result_prefix_attribute: STRING is "result-prefix"
	Select_attribute: STRING is "select"
	Separator_attribute: STRING is "separator"
	Stable_attribute: STRING is "stable"
	Standalone_attribute: STRING is "standalone"
	String_attribute: STRING is "string"
	Stylesheet_prefix_attribute: STRING is "stylesheet-prefix"
	Terminate_attribute: STRING is "terminate"
	Test_attribute: STRING is "test"
	Tunnel_attribute: STRING is "tunnel"
	Type_attribute: STRING is "type"
	Undeclare_prefixes_attribute: STRING is "undeclare-prefixes"
	Use_attribute: STRING is "use"
	Use_attribute_sets_attribute: STRING is "use-attribute-sets"
	Use_character_maps_attribute: STRING is "use-character-maps"
	Use_when_attribute: STRING is "use-when"
	Validation_attribute: STRING is "validation"
	Value_attribute: STRING is "value"
	Version_attribute: STRING is "version"
	Xpath_default_namespace_attribute: STRING is "xpath-default-namespace"
	Zero_digit_attribute: STRING is "zero-digit"	

	Xslt_default_collation_attribute: STRING is
		once
			Result := expanded_name_from_components (Xslt_uri, Default_collation_attribute)
		end

	Xslt_extension_element_prefixes_attribute: STRING is
		once
			Result := expanded_name_from_components (Xslt_uri, Extension_element_prefixes_attribute)
		end

	Xslt_exclude_result_prefixes_attribute: STRING is
		once
			Result := expanded_name_from_components (Xslt_uri, Exclude_result_prefixes_attribute)
		end

	Xslt_use_when_attribute: STRING is
		once
			Result := expanded_name_from_components (Xslt_uri, Use_when_attribute)
		end

	Xslt_version_attribute: STRING is
		once
			Result := expanded_name_from_components (Xslt_uri, Version_attribute)
		end

	Xslt_xpath_default_namespace_attribute: STRING is
		once
			Result := expanded_name_from_components (Xslt_uri, Xpath_default_namespace_attribute)
		end

	Xslt_inherit_namespaces_attribute: STRING is
		once
			Result := expanded_name_from_components (Xslt_uri, Xslt_inherit_namespaces_attribute)
		end

	Gexslt_character_representation_name: STRING is "character-representation"
	Gexslt_character_representation_attribute: STRING is
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_character_representation_name)
		end

	Gexslt_next_in_chain_name: STRING is "next-in-chain"
	Gexslt_next_in_chain_attribute: STRING is
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_next_in_chain_name)
		end

	Gexslt_memo_function_attribute: STRING is
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, "memo-function")
		end

	Gexslt_explain_name: STRING is "explain"

	Gexslt_explain_attribute: STRING is
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_explain_name)
		end

	Gexslt_indent_spaces_name: STRING is "indent-spaces"
	Gexslt_indent_spaces_attribute: STRING is
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_indent_spaces_name)
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


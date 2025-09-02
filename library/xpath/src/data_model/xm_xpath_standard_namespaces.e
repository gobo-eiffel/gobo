note

	description:

		"Standard namespace URIs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_STANDARD_NAMESPACES

inherit

	XM_MARKUP_CONSTANTS

	XM_XPATH_NAME_UTILITIES

	KL_IMPORTED_STRING_ROUTINES

	-- all INTEGERs should be INTEGER_16

feature -- Access

	Maximum_built_in_fingerprint: INTEGER = 2048
			-- Exclusive upper limit on fingerprints for built-in types

	Minimum_built_in_fingerprint: INTEGER = 256
			-- Exclusive lower limit on fingerprints for built-in types

	No_namespaces: INTEGER = 1
	Local_namespaces: INTEGER = 2
	All_namespaces: INTEGER = 3

	Null_prefix_index: INTEGER = 1
			-- The numeric code representing the null namespace

	Xml_prefix_index: INTEGER = 2
			-- Numeric code representing the XML namespace

	Xml_schema_prefix_index: INTEGER = 3
			-- Numeric code representing the XML Schema namespace

	Xpath_defined_datatypes_prefix_index: INTEGER = 3
			-- Numeric code representing the XML Schema namespace

	Gexslt_uri_prefix_index: INTEGER = 5
			-- Numeric code representing the gexslt namespace

	Xslt_prefix_index: INTEGER = 6
			-- Numeric code representing the XSLT namespace

	Xml_schema_instance_prefix_index: INTEGER = 7
			-- Numeric code representing the XML Schema instance namespace

	Xpath_standard_functions_prefix_index: INTEGER = 8
			-- Numeric code the XPath standard functions namespace

	Xhtml_prefix_index: INTEGER = 9
			-- Numeric code representing the XHTML namespace

	Xpath_errors_prefix_index: INTEGER = 10
			-- Numeric code representing the XPath errors namespace

	namespace_index_to_uri_code (a_name_space_index: INTEGER): INTEGER
			-- Convert `a_name_space_index' to a uri code
		require
			valid_name_space: a_name_space_index > 0
		do
			Result := a_name_space_index - 1
		ensure
			valid_uri_code: Result = a_name_space_index - 1
		end

	Null_uri: STRING = ""
			-- The null namespace

	Xml_uri: STRING = "http://www.w3.org/XML/1998/namespace"
			-- The reserved namespace for XML

	Xslt_uri: STRING = "http://www.w3.org/1999/XSL/Transform"
			-- The XSLT namespace

	Xml_schema_uri: STRING = "http://www.w3.org/2001/XMLSchema"
			-- The XML Schemas namespace (xs)

	Xml_schema_instance_uri: STRING = "http://www.w3.org/2001/XMLSchema-instance"
			-- The XML Schema instance document namespace (xsi)

	Xpath_defined_datatypes_uri: STRING = "http://www.w3.org/2001/XMLSchema"
			-- former namespace for additional XPath-defined data types (was xdt - now xs)

	Xpath_standard_functions_uri: STRING = "http://www.w3.org/2005/xpath-functions"
			-- XPath standard functions and operators (fn)

	Xpath_errors_uri: STRING = "http://www.w3.org/2005/xqt-errors"
			-- XPath errors

	Xhtml_uri: STRING = "http://www.w3.org/1999/xhtml"
			-- XHTML namespace

	Gexslt_eiffel_type_uri: STRING = "https://www.gobosoft.com/eiffel/gobo/tool/gexslt/doc/extension"
			-- Namespace for extension functions, etc. written in Eiffel

	Gexslt_examples_uri: STRING = "https://www.gobosoft.com/eiffel/gobo/tool/gexslt/doc/extension/example"
			-- Namespace for examples provided in the library, but not regarded as standard extensions

	Exslt_environment_uri: STRING = "http://exslt.org/system/environment"
			-- EXSLT environment variables

	Xmlns_uri: STRING = "http://www.w3.org/2000/xmlns/"
			-- Xmlns

	Unicode_codepoint_collation_uri: STRING = "http://www.w3.org/2005/xpath-functions/collation/codepoint"
			-- Unicode codepoint collation

	Default_collection_scheme: STRING = "gobo-default-collection"
			-- URI scheme for default collection

			-- The following codes are 3-bit values for building a fingerprint

	Default_uri_code: INTEGER = 0
	Xml_uri_code: INTEGER = 1
	Xml_schema_uri_code: INTEGER = 2
	Xpath_defined_datatypes_uri_code: INTEGER = 3
	Gexslt_uri_code: INTEGER = 4
	Xslt_uri_code: INTEGER = 5
	Xml_schema_instance_uri_code: INTEGER = 6
	Xpath_standard_functions_uri_code: INTEGER = 7

			-- The remaining ones aren't

	Xhtml_uri_code: INTEGER = 8

	Null_namespace_code: INTEGER = 0 -- 65536 * (Null_prefix_index - 1) + Default_uri_code
			-- Code for no namespace;
			-- This works because it is not possible to define
			--  a prefix to and empty-string namespace.

	Xml_namespace_code: INTEGER
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

	Xml_base_type_code: INTEGER = 257
	Xml_space_type_code: INTEGER = 258
	Xml_lang_type_code: INTEGER = 259
	Xml_id_type_code: INTEGER = 260

			-- Codes in XML Schema namespace (`Xml_schema_uri_code' * 256 + 1..n)

	String_type_code: INTEGER = 513
	Boolean_type_code: INTEGER = 514
	Decimal_type_code: INTEGER = 515
	Float_type_code: INTEGER = 516
	Double_type_code: INTEGER = 517
	Duration_type_code: INTEGER = 518
	Date_time_type_code: INTEGER = 519
	Time_type_code: INTEGER = 520
	Date_type_code: INTEGER = 521
	G_year_month_type_code: INTEGER = 522
	G_year_type_code: INTEGER = 523
	G_month_day_type_code: INTEGER = 524
	G_day_type_code: INTEGER = 525
	G_month_type_code: INTEGER = 526
	Hex_binary_type_code: INTEGER = 527
	Base64_binary_type_code: INTEGER = 528
	Any_uri_type_code: INTEGER = 529
	Qname_type_code: INTEGER = 530
	Notation_type_code: INTEGER = 531
	Integer_type_code: INTEGER = 532

			-- Note that any type code <= Integer_type_code is considered to represent a
			-- primitive type: see {XM_XPATH_TYPE}.is_primitive_type

	Non_positive_integer_type_code: INTEGER = 533
	Negative_integer_type_code: INTEGER = 534
	Long_type_code: INTEGER = 535
	Int_type_code: INTEGER = 536
	Short_type_code: INTEGER = 537
	Byte_type_code: INTEGER = 538
	Non_negative_integer_type_code: INTEGER = 539
	Positive_integer_type_code: INTEGER = 540
	Unsigned_long_type_code: INTEGER = 541
	Unsigned_int_type_code: INTEGER = 542
	Unsigned_short_type_code: INTEGER = 543
	Unsigned_byte_type_code: INTEGER = 544
	Normalized_string_type_code: INTEGER = 545
	Token_type_code: INTEGER = 546
	Language_type_code: INTEGER = 547
	Nmtoken_type_code: INTEGER = 548
	Nmtokens_type_code: INTEGER = 549
	Name_type_code: INTEGER = 550
	Ncname_type_code: INTEGER = 551
	Id_type_code: INTEGER = 552
	Idref_type_code: INTEGER = 553
	Idrefs_type_code: INTEGER = 554
	Entity_type_code: INTEGER = 555
	Entities_type_code: INTEGER = 556

	Any_type_code: INTEGER = 557
	Any_simple_type_code: INTEGER = 558
	Untyped_type_code: INTEGER = 559
	Untyped_atomic_type_code: INTEGER = 560
	Any_atomic_type_code: INTEGER = 561
	Year_month_duration_type_code: INTEGER = 562
	Day_time_duration_type_code: INTEGER = 563

			-- Codes in Gobo XPath/XSLT namespace (`Gexslt_uri_code' * 256 + 1..n)

	Numeric_type_code: INTEGER = 1025
	Object_type_code: INTEGER = 1026
	Explain_type_code: INTEGER = 1027
	Indent_spaces_type_code: INTEGER = 1028
	Character_representation_type_code: INTEGER = 1029
	Byte_order_mark_type_code: INTEGER = 1030
	Gexslt_collation_type_code: INTEGER = 1031
	Memo_function_type_code: INTEGER = 1032
	Next_in_chain_type_code: INTEGER = 1033
	Gexslt_isolation_level_type_code: INTEGER = 1034
	Gexslt_transformation_function_type_code: INTEGER = 1035
	Gexslt_memo_function_type_code: INTEGER = 1036
	Gexslt_file_element_type_code: INTEGER = 1037
	Gexslt_directory_element_type_code: INTEGER = 1038
	Gexslt_method_type_code: INTEGER = 1039
	Gexslt_response_body_function_type_code: INTEGER = 1040

			-- Codes in XSLT namespace (`Xslt_uri_code' * 256 + 0..n)

	Xslt_analyze_string_type_code: INTEGER = 1281
	Xslt_apply_imports_type_code: INTEGER = 1282
	Xslt_apply_templates_type_code: INTEGER = 1283
	Xslt_attribute_type_code: INTEGER = 1284
	Xslt_attribute_set_type_code: INTEGER = 1285
	Xslt_call_template_type_code: INTEGER = 1286
	Xslt_character_map_type_code: INTEGER = 1287
	Xslt_choose_type_code: INTEGER = 1288
	Xslt_comment_type_code: INTEGER = 1289
	Xslt_copy_type_code: INTEGER = 1290
	Xslt_copy_of_type_code: INTEGER = 1291
	Xslt_decimal_format_type_code: INTEGER = 1292
	Xslt_document_type_code: INTEGER = 1293
	Xslt_element_type_code: INTEGER = 1294
	Xslt_fallback_type_code: INTEGER = 1295
	Xslt_for_each_type_code: INTEGER = 1296
	Xslt_for_each_group_type_code: INTEGER = 1297
	Xslt_function_type_code: INTEGER = 1298
	Xslt_if_type_code: INTEGER = 1299
	Xslt_import_type_code: INTEGER = 1300
	Xslt_import_schema_type_code: INTEGER = 1301
	Xslt_include_type_code: INTEGER = 1302
	Xslt_key_type_code: INTEGER = 1303
	Xslt_matching_substring_type_code: INTEGER = 1304
	Xslt_message_type_code: INTEGER = 1305
	Xslt_next_match_type_code: INTEGER = 1306
	Xslt_number_type_code: INTEGER = 1307
	Xslt_namespace_type_code: INTEGER = 1308
	Xslt_namespace_alias_type_code: INTEGER = 1309
	Xslt_non_matching_substring_type_code: INTEGER = 1310
	Xslt_otherwise_type_code: INTEGER = 1311
	Xslt_output_type_code: INTEGER = 1312
	Xslt_output_character_type_code: INTEGER = 1313
	Xslt_param_type_code: INTEGER = 1314
	Xslt_perform_sort_type_code: INTEGER = 1315
	Xslt_preserve_space_type_code: INTEGER = 1316
	Xslt_processing_instruction_type_code: INTEGER = 1317
	Xslt_result_document_type_code: INTEGER = 1318
	Xslt_sequence_type_code: INTEGER = 1319
	Xslt_sort_type_code: INTEGER = 1320
	Xslt_strip_space_type_code: INTEGER = 1321
	Xslt_stylesheet_type_code: INTEGER = 1322
	Xslt_template_type_code: INTEGER = 1323
	Xslt_text_type_code: INTEGER = 1324
	Xslt_transform_type_code: INTEGER = 1325
	Xslt_value_of_type_code: INTEGER = 1326
	Xslt_variable_type_code: INTEGER = 1327
	Xslt_with_param_type_code: INTEGER = 1328
	Xslt_when_type_code: INTEGER = 1329
	Xslt_xpath_default_namespace_type_code: INTEGER = 1330
	Xslt_exclude_result_prefixes_type_code: INTEGER = 1331
	Xslt_extension_element_prefixes_type_code: INTEGER = 1332
	Xslt_type_type_code: INTEGER = 1333
	Xslt_use_attribute_sets_type_code: INTEGER = 1334
	Xslt_use_when_type_code: INTEGER = 1335
	Xslt_validation_type_code: INTEGER = 1336
	Xslt_version_type_code: INTEGER = 1337
	Xslt_default_collation_type_code: INTEGER = 1338
	Xslt_inherit_namespaces_type_code: INTEGER = 1339

			-- Codes in XML Schema Instance namespace (`Xml_schema_instance_uri_code' * 256 + 1..n)

	Xsi_type_type_code: INTEGER = 1537
	Xsi_nil_type_code: INTEGER = 1538
	Xsi_schema_location_type_code: INTEGER = 1539
	Xsi_no_namespace_schema_location_type_code: INTEGER = 1540

			-- Codes in XPath functions namespace (`Xpath_standard_functions_uri_code' * 256 + 1..n)

	Abs_function_type_code: INTEGER = 1793
	Adjust_date_to_timezone_function_type_code: INTEGER = 1794
	Adjust_datetime_to_timezone_function_type_code: INTEGER = 1795
	Adjust_time_to_timezone_function_type_code: INTEGER = 1796
	Avg_function_type_code: INTEGER = 1797
	Base_uri_function_type_code: INTEGER = 1798
	Boolean_function_type_code: INTEGER = 1799
	Ceiling_function_type_code: INTEGER = 1800
	Codepoint_equal_function_type_code: INTEGER = 1801
	Codepoints_to_string_function_type_code: INTEGER = 1802
	Collection_function_type_code: INTEGER = 1803
	Compare_function_type_code: INTEGER = 1804
	Concat_function_type_code: INTEGER = 1805
	Contains_function_type_code: INTEGER = 1806
	Count_function_type_code: INTEGER = 1807
	Current_date_function_type_code: INTEGER = 1808
	Current_datetime_function_type_code: INTEGER = 1809
	Current_time_function_type_code: INTEGER = 1810
	Data_function_type_code: INTEGER = 1811
	Datetime_function_type_code: INTEGER = 1812
	Day_from_date_function_type_code: INTEGER = 1813
	Day_from_datetime_function_type_code: INTEGER = 1814
	Days_from_duration_function_type_code: INTEGER = 1815
	Deep_equal_function_type_code: INTEGER = 1816
	Default_collation_function_type_code: INTEGER = 1817
	Distinct_values_function_type_code: INTEGER = 1818
	Doc_available_function_type_code: INTEGER = 1819
	Doc_function_type_code: INTEGER = 1820
	Document_uri_function_type_code: INTEGER = 1821
	Empty_function_type_code: INTEGER = 1822
	Ends_with_function_type_code: INTEGER = 1823
	Error_function_type_code: INTEGER = 1824
	Encode_for_uri_function_type_code: INTEGER = 1825
	Escape_html_uri_function_type_code: INTEGER = 1826
	Exactly_one_function_type_code: INTEGER = 1827
	Exists_function_type_code: INTEGER = 1828
	False_function_type_code: INTEGER = 1829
	Floor_function_type_code: INTEGER = 1830
	Hours_from_datetime_function_type_code: INTEGER = 1831
	Hours_from_time_function_type_code: INTEGER = 1832
	Hours_from_duration_function_type_code: INTEGER = 1833
	Id_function_type_code: INTEGER = 1834
	Idref_function_type_code: INTEGER = 1835
	Implicit_timezone_function_type_code: INTEGER = 1836
	In_scope_prefixes_function_type_code: INTEGER = 1837
	Index_of_function_type_code: INTEGER = 1838
	Insert_before_function_type_code: INTEGER = 1839
	Iri_to_uri_function_type_code: INTEGER = 1840
	Lang_function_type_code: INTEGER = 1841
	Last_function_type_code: INTEGER = 1842
	Local_name_function_type_code: INTEGER = 1843
	Local_name_from_qname_function_type_code: INTEGER = 1844
	Lower_case_function_type_code: INTEGER = 1845
	Matches_function_type_code: INTEGER = 1846
	Max_function_type_code: INTEGER = 1847
	Min_function_type_code: INTEGER = 1848
	Minutes_from_datetime_function_type_code: INTEGER = 1849
	Minutes_from_duration_function_type_code: INTEGER = 1850
	Minutes_from_time_function_type_code: INTEGER = 1851
	Month_from_date_function_type_code: INTEGER = 1852
	Month_from_datetime_function_type_code: INTEGER = 1853
	Months_from_duration_function_type_code: INTEGER = 1854
	Name_function_type_code: INTEGER = 1855
	Namespace_uri_function_type_code: INTEGER = 1856
	Namespace_uri_for_prefix_function_type_code: INTEGER = 1857
	Namespace_uri_from_qname_function_type_code: INTEGER = 1858
	Nilled_function_type_code: INTEGER = 1859
	Node_name_function_type_code: INTEGER = 1860
	Normalize_space_function_type_code: INTEGER = 1861
	Normalize_unicode_function_type_code: INTEGER = 1862
	Not_function_type_code: INTEGER = 1863
	Number_function_type_code: INTEGER = 1864
	One_or_more_function_type_code: INTEGER = 1865
	Prefix_from_qname_function_type_code: INTEGER = 1866
	Position_function_type_code: INTEGER = 1867
	Qname_function_type_code: INTEGER = 1868
	Remove_function_type_code: INTEGER = 1869
	Replace_function_type_code: INTEGER = 1870
	Resolve_qname_function_type_code: INTEGER = 1871
	Resolve_uri_function_type_code: INTEGER = 1872
	Reverse_function_type_code: INTEGER = 1873
	Root_function_type_code: INTEGER = 1874
	Round_function_type_code: INTEGER = 1875
	Round_half_to_even_function_type_code: INTEGER = 1876
	Seconds_from_datetime_function_type_code: INTEGER = 1877
	Seconds_from_duration_function_type_code: INTEGER = 1878
	Seconds_from_time_function_type_code: INTEGER = 1879
	Starts_with_function_type_code: INTEGER = 1880
	Static_base_uri_function_type_code: INTEGER = 1881
	String_function_type_code: INTEGER = 1882
	String_join_function_type_code: INTEGER = 1883
	String_length_function_type_code: INTEGER = 1884
	String_to_codepoints_function_type_code: INTEGER = 1885
	Subsequence_function_type_code: INTEGER = 1886
	Substring_function_type_code: INTEGER = 1887
	Substring_after_function_type_code: INTEGER = 1888
	Substring_before_function_type_code: INTEGER = 1889
	Sum_function_type_code: INTEGER = 1890
	Timezone_from_date_function_type_code: INTEGER = 1891
	Timezone_from_datetime_function_type_code: INTEGER = 1892
	Timezone_from_time_function_type_code: INTEGER = 1893
	Tokenize_function_type_code: INTEGER = 1894
	Trace_function_type_code: INTEGER = 1895
	Translate_function_type_code: INTEGER = 1896
	True_function_type_code: INTEGER = 1897
	Unordered_function_type_code: INTEGER = 1898
	Upper_case_function_type_code: INTEGER = 1899
	Year_from_date_function_type_code: INTEGER = 1900
	Year_from_datetime_function_type_code: INTEGER = 1901
	Years_from_duration_function_type_code: INTEGER = 1902
	Zero_or_one_function_type_code: INTEGER = 1903

			-- Functions provided by XSLT

	Current_function_type_code: INTEGER = 1920
	Current_group_function_type_code: INTEGER = 1921
	Current_grouping_key_function_type_code: INTEGER = 1922
	Document_function_type_code: INTEGER = 1923
	Element_available_function_type_code: INTEGER = 1924
	Format_date_function_type_code: INTEGER = 1925
	Format_datetime_function_type_code: INTEGER = 1926
	Format_time_function_type_code: INTEGER = 1927
	Format_number_function_type_code: INTEGER = 1928
	Function_available_function_type_code: INTEGER = 1929
	Generate_id_function_type_code: INTEGER = 1930
	Key_function_type_code: INTEGER = 1931
	Regex_group_function_type_code: INTEGER = 1932
	System_property_function_type_code: INTEGER = 1933
	Type_available_function_type_code: INTEGER = 1934
	Unparsed_entity_public_id_function_type_code: INTEGER = 1935
	Unparsed_entity_uri_function_type_code: INTEGER = 1936
	Unparsed_text_function_type_code: INTEGER = 1937
	Unparsed_text_available_function_type_code: INTEGER = 1938

			-- XSLT Attribute names

	Xslt_default_collation_attribute: STRING
			-- "default-collation" attribute name prefixed with the XSLT namespace
		once
			Result := expanded_name_from_components (Xslt_uri, {XM_XPATH_XSLT_STYLE_CONSTANTS}.Default_collation_attribute)
		ensure
			xslt_default_collation_attribute_not_void: Result /= Void
		end

	Xslt_extension_element_prefixes_attribute: STRING
			-- "extension-element-prefixes" attribute name prefixed with the XSLT namespace
		once
			Result := expanded_name_from_components (Xslt_uri, {XM_XPATH_XSLT_STYLE_CONSTANTS}.Extension_element_prefixes_attribute)
		ensure
			xslt_extension_element_prefixes_attribute_not_void: Result /= Void
		end

	Xslt_exclude_result_prefixes_attribute: STRING
			-- "exclude-result-prefixes" attribute name prefixed with the XSLT namespace
		once
			Result := expanded_name_from_components (Xslt_uri, {XM_XPATH_XSLT_STYLE_CONSTANTS}.Exclude_result_prefixes_attribute)
		ensure
			xslt_exclude_result_prefixes_attribute_not_void: Result /= Void
		end

	Xslt_use_when_attribute: STRING
			-- "use-when" attribute name prefixed with the XSLT namespace
		once
			Result := expanded_name_from_components (Xslt_uri, {XM_XPATH_XSLT_STYLE_CONSTANTS}.Use_when_attribute)
		ensure
			xslt_use_when_attribute_not_void: Result /= Void
		end

	Xslt_version_attribute: STRING
			-- "version" attribute name prefixed with the XSLT namespace
		once
			Result := expanded_name_from_components (Xslt_uri, {XM_XPATH_XSLT_STYLE_CONSTANTS}.Version_attribute)
		ensure
			xslt_version_attribute_not_void: Result /= Void
		end

	Xslt_xpath_default_namespace_attribute: STRING
			-- "xpath-default-namespace" attribute name prefixed with the XSLT namespace
		once
			Result := expanded_name_from_components (Xslt_uri, {XM_XPATH_XSLT_STYLE_CONSTANTS}.Xpath_default_namespace_attribute)
		ensure
			xslt_xpath_default_namespace_attribute_not_void: Result /= Void
		end

	Xslt_inherit_namespaces_attribute: STRING
			-- "inherit-namespaces" attribute name prefixed with the XSLT namespace
		once
			Result := expanded_name_from_components (Xslt_uri, {XM_XPATH_XSLT_STYLE_CONSTANTS}.inherit_namespaces_attribute)
		ensure
			xslt_inherit_namespaces_attribute_not_void: Result /= Void
		end

	Gexslt_character_representation_name: STRING = "character-representation"

	Gexslt_character_representation_attribute: STRING
			-- "character-representation" attribute name prefixed with the
			-- namespace for extension functions, etc. written in Eiffel
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_character_representation_name)
		ensure
			gexslt_character_representation_attribute_not_void: Result /= Void
		end

	Gexslt_next_in_chain_name: STRING = "next-in-chain"

	Gexslt_next_in_chain_attribute: STRING
			-- "next-in-chain" attribute name prefixed with the
			-- namespace for extension functions, etc. written in Eiffel
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_next_in_chain_name)
		ensure
			gexslt_next_in_chain_attribute_not_void: Result /= Void
		end

	Gexslt_memo_function_name: STRING = "memo-function"

	Gexslt_memo_function_attribute: STRING
			-- "memo-function" attribute name prefixed with the
			-- namespace for extension functions, etc. written in Eiffel
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_memo_function_name)
		ensure
			gexslt_memo_function_attribute_not_void: Result /= Void
		end

	Gexslt_method_name: STRING = "method"

	Gexslt_method_attribute: STRING
			-- "method" attribute name prefixed with the
			-- namespace for extension functions, etc. written in Eiffel
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_method_name)
		ensure
			gexslt_method_attribute_not_void: Result /= Void
		end

	Gexslt_explain_name: STRING = "explain"

	Gexslt_explain_attribute: STRING
			-- "explain" attribute name prefixed with the
			-- namespace for extension functions, etc. written in Eiffel
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_explain_name)
		ensure
			gexslt_explain_attribute_not_void: Result /= Void
		end

	Gexslt_indent_spaces_name: STRING = "indent-spaces"

	Gexslt_indent_spaces_attribute: STRING
			-- "indent-spaces" attribute name prefixed with the
			-- namespace for extension functions, etc. written in Eiffel
		once
			Result := expanded_name_from_components (Gexslt_eiffel_type_uri, Gexslt_indent_spaces_name)
		ensure
			gexslt_indent_spaces_attribute_not_void: Result /= Void
		end

	Gexslt_name_pseudo_attribute: STRING = "gexslt-name"
			-- Pseudo-attribute used in tracing

	Gexslt_expression_name_pseudo_attribute: STRING = "gexslt-expression-name"
			-- Pseudo-attribute used in tracing

feature -- Status report

	is_reserved_namespace (a_uri: STRING): BOOLEAN
			-- Is `a_uri' a reserved namespace?
		require
			uri_not_void: a_uri /= Void
		do
			Result := STRING_.same_string (a_uri, Xslt_uri) or
				STRING_.same_string (a_uri, Xpath_standard_functions_uri) or
				STRING_.same_string (a_uri, Xml_uri) or
				STRING_.same_string (a_uri, Xml_schema_uri) or
				STRING_.same_string (a_uri, Xml_schema_instance_uri)
		end

end


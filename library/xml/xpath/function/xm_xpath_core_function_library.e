indexing

	description:

		"Objects that provide access to core XPath functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CORE_FUNCTION_LIBRARY

inherit

	XM_XPATH_FUNCTION_LIBRARY

	XM_XPATH_STANDARD_NAMESPACES

create

	make

feature {NONE} -- Initialization

	make is
			-- Nothing to do.
		do
		end

feature -- Access

	is_function_available (a_fingerprint, an_arity: INTEGER; is_restricted: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent an available function with `an_arity'?
		do
			inspect a_fingerprint
			when Abs_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Adjust_date_to_timezone_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when Adjust_datetime_to_timezone_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when Adjust_time_to_timezone_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when Avg_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Base_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when Boolean_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Ceiling_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Codepoint_equal_function_type_code then
				Result := an_arity = -1 or else an_arity = 2
			when Codepoints_to_string_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Collection_function_type_code then
				Result := an_arity = -1 or else an_arity = 0  or else an_arity = 1
			when Compare_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Concat_function_type_code then
				Result := an_arity = -1 or else an_arity > 1
			when Contains_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Count_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Current_date_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Current_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Current_time_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Data_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Datetime_function_type_code then
				Result := an_arity = 2
			when Day_from_date_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Day_from_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Days_from_duration_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Deep_equal_function_type_code then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 3
			when Default_collation_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Doc_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Doc_available_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Document_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Distinct_values_function_type_code then
				Result := an_arity = -1 or else an_arity = 1 or else an_arity = 2
			when Empty_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Encode_for_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Ends_with_function_type_code then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 3
			when Error_function_type_code then
				Result := an_arity < 4
			when Escape_html_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Exists_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Exactly_one_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when False_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Floor_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Hours_from_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Hours_from_time_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Hours_from_duration_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Id_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when Idref_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when In_scope_prefixes_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Implicit_timezone_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Index_of_function_type_code then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 3
			when Insert_before_function_type_code then
				Result := an_arity = -1 or else an_arity = 3
			when Iri_to_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Lang_function_type_code then
				Result := an_arity = -1 or else an_arity = 1 or else an_arity = 2
			when Last_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Local_name_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when Local_name_from_qname_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Lower_case_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Matches_function_type_code then
				Result := an_arity = -1 or else an_arity = 3	or else an_arity = 2
			when Max_function_type_code then
				Result := an_arity = -1 or else an_arity = 1	or else an_arity = 2
			when Min_function_type_code then
				Result := an_arity = -1 or else an_arity = 1	or else an_arity = 2
			when Minutes_from_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Minutes_from_time_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Minutes_from_duration_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Month_from_date_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Month_from_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Months_from_duration_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Name_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when Namespace_uri_from_qname_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Nilled_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Node_name_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Namespace_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when Namespace_uri_for_prefix_function_type_code then
				Result := an_arity = -1 or else an_arity = 2
			when Normalize_space_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when Normalize_unicode_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when Not_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Number_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when One_or_more_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Position_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Prefix_from_qname_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Qname_function_type_code then
				Result := an_arity = -1 or else an_arity = 2
			when Remove_function_type_code then
				Result := an_arity = -1 or else an_arity = 2
			when Reverse_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Replace_function_type_code then
				Result := an_arity = -1 or else an_arity = 3 or else an_arity = 4
			when Resolve_qname_function_type_code then
				Result := an_arity = -1 or else an_arity = 2
			when Resolve_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 1 or else an_arity = 2
			when Root_function_type_code then
				Result := an_arity = -1 or else an_arity = 0  or else an_arity = 1
			when Round_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Round_half_to_even_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when Seconds_from_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Seconds_from_time_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Seconds_from_duration_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Starts_with_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Static_base_uri_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when String_length_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when String_function_type_code then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			when String_to_codepoints_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when String_join_function_type_code then
				Result := an_arity = -1 or else an_arity = 2
			when Subsequence_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Substring_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Substring_before_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Substring_after_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Sum_function_type_code then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			when Timezone_from_date_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Timezone_from_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Timezone_from_time_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Tokenize_function_type_code then
				Result := an_arity = -1 or else an_arity = 2  or else an_arity = 3
			when Trace_function_type_code then
				Result := an_arity = -1 or else an_arity = 2
			when Translate_function_type_code then
				Result := an_arity = -1 or else an_arity = 3
			when True_function_type_code then
				Result := an_arity = -1 or else an_arity = 0
			when Unordered_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Upper_case_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Year_from_date_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Year_from_datetime_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Years_from_duration_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			when Zero_or_one_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			else
				Result := False
			end
		end

feature -- Element change

	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function'.
		local
			a_function_call: XM_XPATH_FUNCTION_CALL
		do
			inspect a_fingerprint
			when Abs_function_type_code then
				create {XM_XPATH_ABS} a_function_call.make
			when Adjust_date_to_timezone_function_type_code then
				create {XM_XPATH_ADJUST_DATE_TO_TIMEZONE} a_function_call.make
			when Adjust_datetime_to_timezone_function_type_code then
				create {XM_XPATH_ADJUST_DATETIME_TO_TIMEZONE} a_function_call.make
			when Adjust_time_to_timezone_function_type_code then
				create {XM_XPATH_ADJUST_TIME_TO_TIMEZONE} a_function_call.make
			when Avg_function_type_code then
				create {XM_XPATH_AVG} a_function_call.make
			when Base_uri_function_type_code then
				create {XM_XPATH_BASE_URI} a_function_call.make
			when Boolean_function_type_code then
				create {XM_XPATH_BOOLEAN} a_function_call.make
			when Ceiling_function_type_code then
				create {XM_XPATH_CEILING} a_function_call.make
			when Codepoint_equal_function_type_code then
				create {XM_XPATH_CODEPOINT_EQUAL} a_function_call.make
			when Codepoints_to_string_function_type_code then
				create {XM_XPATH_CODEPOINTS_TO_STRING} a_function_call.make
			when Collection_function_type_code then
				create {XM_XPATH_COLLECTION} a_function_call.make
			when Compare_function_type_code then
				create {XM_XPATH_COMPARE} a_function_call.make
			when Concat_function_type_code then
				create {XM_XPATH_CONCAT} a_function_call.make
			when Contains_function_type_code then
				create {XM_XPATH_CONTAINS} a_function_call.make
			when Count_function_type_code then
				create {XM_XPATH_COUNT} a_function_call.make
			when Current_date_function_type_code then
				create {XM_XPATH_CURRENT_DATE} a_function_call.make
			when Current_datetime_function_type_code then
				create {XM_XPATH_CURRENT_DATETIME} a_function_call.make
			when Current_time_function_type_code then
				create {XM_XPATH_CURRENT_TIME} a_function_call.make
			when Data_function_type_code then
				create {XM_XPATH_DATA} a_function_call.make
			when Datetime_function_type_code then
				create {XM_XPATH_DATE_TIME} a_function_call.make
			when Day_from_date_function_type_code then
				create {XM_XPATH_DAY_FROM_DATE} a_function_call.make
			when Day_from_datetime_function_type_code then
				create {XM_XPATH_DAY_FROM_DATETIME} a_function_call.make
			when Days_from_duration_function_type_code then
				create {XM_XPATH_DAYS_FROM_DURATION} a_function_call.make
			when Deep_equal_function_type_code then
				create {XM_XPATH_DEEP_EQUALS} a_function_call.make
			when Default_collation_function_type_code then
				create {XM_XPATH_DEFAULT_COLLATION} a_function_call.make
			when Distinct_values_function_type_code then
				create {XM_XPATH_DISTINCT_VALUES} a_function_call.make
			when Doc_function_type_code then
				create {XM_XPATH_DOC} a_function_call.make
			when Doc_available_function_type_code then
				create {XM_XPATH_DOC_AVAILABLE} a_function_call.make
			when Document_uri_function_type_code then
				create {XM_XPATH_DOCUMENT_URI} a_function_call.make
			when Empty_function_type_code then
				create {XM_XPATH_EMPTY} a_function_call.make
			when Encode_for_uri_function_type_code then
				create {XM_XPATH_ESCAPE_URI} a_function_call.make_encode_for_uri
			when Ends_with_function_type_code then
				create {XM_XPATH_ENDS_WITH} a_function_call.make
			when Error_function_type_code then
				create {XM_XPATH_ERROR} a_function_call.make
			when Escape_html_uri_function_type_code then
				create {XM_XPATH_ESCAPE_URI} a_function_call.make_escape_html_uri
			when Exists_function_type_code then
				create {XM_XPATH_EXISTS} a_function_call.make
			when Exactly_one_function_type_code then
				create {XM_XPATH_EXACTLY_ONE} a_function_call.make
			when False_function_type_code then
				create {XM_XPATH_FALSE} a_function_call.make
			when Floor_function_type_code then
				create {XM_XPATH_FLOOR} a_function_call.make
			when Hours_from_datetime_function_type_code then
				create {XM_XPATH_HOURS_FROM_DATETIME} a_function_call.make
			when Hours_from_time_function_type_code then
				create {XM_XPATH_HOURS_FROM_TIME} a_function_call.make
			when Hours_from_duration_function_type_code then
				create {XM_XPATH_HOURS_FROM_DURATION} a_function_call.make
			when Id_function_type_code then
				create {XM_XPATH_ID} a_function_call.make
			when Idref_function_type_code then
				create {XM_XPATH_IDREF} a_function_call.make
			when Implicit_timezone_function_type_code then
				create {XM_XPATH_IMPLICIT_TIMEZONE} a_function_call.make
			when In_scope_prefixes_function_type_code then
				create {XM_XPATH_IN_SCOPE_PREFIXES} a_function_call.make
			when Index_of_function_type_code then
				create {XM_XPATH_INDEX_OF} a_function_call.make
			when Insert_before_function_type_code then
				create {XM_XPATH_INSERT_BEFORE} a_function_call.make
			when Iri_to_uri_function_type_code then
				create {XM_XPATH_ESCAPE_URI} a_function_call.make_iri_to_uri
			when Last_function_type_code then
				create {XM_XPATH_LAST} a_function_call.make
			when Lang_function_type_code then
				create {XM_XPATH_LANG} a_function_call.make
			when Local_name_function_type_code then
				create {XM_XPATH_LOCAL_NAME} a_function_call.make
			when Local_name_from_qname_function_type_code then
				create {XM_XPATH_LOCAL_NAME_FROM_QNAME} a_function_call.make
			when Lower_case_function_type_code then
				create {XM_XPATH_LOWER_CASE} a_function_call.make
			when Matches_function_type_code then
				create {XM_XPATH_MATCHES} a_function_call.make
			when Max_function_type_code then
				create {XM_XPATH_MAX} a_function_call.make
			when Min_function_type_code then
				create {XM_XPATH_MIN} a_function_call.make
			when Minutes_from_datetime_function_type_code then
				create {XM_XPATH_MINUTES_FROM_DATETIME} a_function_call.make
			when Minutes_from_time_function_type_code then
				create {XM_XPATH_MINUTES_FROM_TIME} a_function_call.make
			when Minutes_from_duration_function_type_code then
				create {XM_XPATH_MINUTES_FROM_DURATION} a_function_call.make
			when Month_from_date_function_type_code then
				create {XM_XPATH_MONTH_FROM_DATE} a_function_call.make
			when Month_from_datetime_function_type_code then
				create {XM_XPATH_MONTH_FROM_DATETIME} a_function_call.make
			when Months_from_duration_function_type_code then
				create {XM_XPATH_MONTHS_FROM_DURATION} a_function_call.make
			when Name_function_type_code then
				create {XM_XPATH_NAME} a_function_call.make
			when Nilled_function_type_code then
				create {XM_XPATH_NILLED} a_function_call.make
			when Node_name_function_type_code then
				create {XM_XPATH_NODE_NAME} a_function_call.make
			when Namespace_uri_function_type_code then
				create {XM_XPATH_NAMESPACE_URI} a_function_call.make
			when Namespace_uri_for_prefix_function_type_code then
				create {XM_XPATH_NAMESPACE_URI_FOR_PREFIX} a_function_call.make
			when Namespace_uri_from_qname_function_type_code then
				create {XM_XPATH_NAMESPACE_URI_FROM_QNAME} a_function_call.make
			when Normalize_space_function_type_code then
				create {XM_XPATH_NORMALIZE_SPACE} a_function_call.make
			when Normalize_unicode_function_type_code then
				create {XM_XPATH_NORMALIZE_UNICODE} a_function_call.make
			when Not_function_type_code then
				create {XM_XPATH_NOT} a_function_call.make
			when Number_function_type_code then
				create {XM_XPATH_NUMBER} a_function_call.make
			when One_or_more_function_type_code then
				create {XM_XPATH_ONE_OR_MORE} a_function_call.make
			when Position_function_type_code then
				create {XM_XPATH_POSITION} a_function_call.make
			when Prefix_from_qname_function_type_code then
				create {XM_XPATH_PREFIX_FROM_QNAME} a_function_call.make
			when Qname_function_type_code then
				create {XM_XPATH_QNAME} a_function_call.make
			when Replace_function_type_code then
				create {XM_XPATH_REPLACE} a_function_call.make
			when Remove_function_type_code then
				create {XM_XPATH_REMOVE} a_function_call.make
			when Resolve_qname_function_type_code then
				create {XM_XPATH_RESOLVE_QNAME} a_function_call.make
			when Resolve_uri_function_type_code then
				create {XM_XPATH_RESOLVE_URI} a_function_call.make
			when Reverse_function_type_code then
				create {XM_XPATH_REVERSE} a_function_call.make
			when Root_function_type_code then
				create {XM_XPATH_ROOT} a_function_call.make
			when Round_function_type_code then
				create {XM_XPATH_ROUND} a_function_call.make
			when Round_half_to_even_function_type_code then
				create {XM_XPATH_ROUND_HALF_EVEN} a_function_call.make
			when Seconds_from_datetime_function_type_code then
				create {XM_XPATH_SECONDS_FROM_DATETIME} a_function_call.make
			when Seconds_from_time_function_type_code then
				create {XM_XPATH_SECONDS_FROM_TIME} a_function_call.make
			when Seconds_from_duration_function_type_code then
				create {XM_XPATH_SECONDS_FROM_DURATION} a_function_call.make
			when Static_base_uri_function_type_code then
				create {XM_XPATH_STATIC_BASE_URI} a_function_call.make
			when Starts_with_function_type_code then
				create {XM_XPATH_STARTS_WITH} a_function_call.make
			when String_length_function_type_code then
				create {XM_XPATH_STRING_LENGTH} a_function_call.make
			when String_function_type_code then
				create {XM_XPATH_STRING} a_function_call.make
			when String_to_codepoints_function_type_code then
				create {XM_XPATH_STRING_TO_CODEPOINTS} a_function_call.make
			when String_join_function_type_code then
				create {XM_XPATH_STRING_JOIN} a_function_call.make
			when Subsequence_function_type_code then
				create {XM_XPATH_SUBSEQUENCE} a_function_call.make
			when Substring_function_type_code then
				create {XM_XPATH_SUBSTRING} a_function_call.make
			when Substring_before_function_type_code then
				create {XM_XPATH_SUBSTRING_BEFORE} a_function_call.make
			when Substring_after_function_type_code then
				create {XM_XPATH_SUBSTRING_AFTER} a_function_call.make
			when Sum_function_type_code then
				create {XM_XPATH_SUM} a_function_call.make
			when Timezone_from_date_function_type_code then
				create {XM_XPATH_TIMEZONE_FROM_DATE} a_function_call.make
			when Timezone_from_datetime_function_type_code then
				create {XM_XPATH_TIMEZONE_FROM_DATETIME} a_function_call.make
			when Timezone_from_time_function_type_code then
				create {XM_XPATH_TIMEZONE_FROM_TIME} a_function_call.make
			when Tokenize_function_type_code then
				create {XM_XPATH_TOKENIZE} a_function_call.make
			when Trace_function_type_code then
				create {XM_XPATH_TRACE} a_function_call.make
			when Translate_function_type_code then
				create {XM_XPATH_TRANSLATE} a_function_call.make
			when True_function_type_code then
				create {XM_XPATH_TRUE} a_function_call.make
			when Upper_case_function_type_code then
				create {XM_XPATH_UPPER_CASE} a_function_call.make
			when Unordered_function_type_code then
				create {XM_XPATH_UNORDERED} a_function_call.make
			when Year_from_date_function_type_code then
				create {XM_XPATH_YEAR_FROM_DATE} a_function_call.make
			when Year_from_datetime_function_type_code then
				create {XM_XPATH_YEAR_FROM_DATETIME} a_function_call.make
			when Years_from_duration_function_type_code then
				create {XM_XPATH_YEARS_FROM_DURATION} a_function_call.make
			when Zero_or_one_function_type_code then
				create {XM_XPATH_ZERO_OR_ONE} a_function_call.make
			end
			check
				function_bound: a_function_call /= Void
				-- From pre-condition
			end
			a_function_call.set_arguments (some_arguments)
			last_bound_function := a_function_call
		end

end


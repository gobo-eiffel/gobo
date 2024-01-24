note

	description:

		"Objects that create built-in types, and make them accessible"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_TYPE_FACTORY

inherit

	XM_XPATH_STANDARD_NAMESPACES

feature -- Access

	schema_type (a_fingerprint: INTEGER): detachable XM_XPATH_SCHEMA_TYPE
			-- Schema type with fingerprint of `a_fingerprint'
		require
			valid_fingerprint: is_built_in_fingerprint (a_fingerprint)
		deferred
		end

	standard_fingerprint (a_uri, a_local_name: STRING): INTEGER
			-- Fingerprint of a standard name
		require
			standard_namespace: a_uri /= Void and then is_reserved_namespace (a_uri) or else STRING_.same_string (a_uri, Gexslt_eiffel_type_uri)
			local_name_not_void: a_local_name /= Void
		deferred
		ensure
			fingerprint_in_range: Result /= -1 implies is_built_in_fingerprint (Result)
		end

	standard_uri_code (a_fingerprint: INTEGER): INTEGER
			-- Extracted URI code
		require
			standard_name: is_built_in_fingerprint (a_fingerprint)
		do
			Result := a_fingerprint // bits_8
		ensure
			result_in_range: Default_uri_code <= Result and then Result <= Xpath_standard_functions_uri_code
		end

	standard_local_name (a_fingerprint: INTEGER): STRING
			-- Extracted local name
		require
			standard_name: is_built_in_fingerprint (a_fingerprint)
		deferred
		ensure
			result_not_void: Result /= Void
		end

	standard_uri (a_fingerprint: INTEGER): STRING
			-- Namespace-URI for `a_fingerprint'
		require
			standard_name: is_built_in_fingerprint (a_fingerprint)
		do
			inspect
				a_fingerprint // bits_8
			when Default_uri_code then
				Result := Null_uri
			when Xml_uri_code then
				Result := Xml_uri
			when Xml_schema_uri_code then
				Result := Xml_schema_uri
			when Gexslt_uri_code then
				Result := Gexslt_eiffel_type_uri
			when Xslt_uri_code then
				Result := Xslt_uri
			when Xml_schema_instance_uri_code then
				Result := Xml_schema_instance_uri
			end
		ensure
			uri_not_void: Result /= Void
		end

	standard_prefix (a_fingerprint: INTEGER): STRING
			-- Conventional prefix for `a_fingerprint'
		require
			standard_name: is_built_in_fingerprint (a_fingerprint)
		do
			Result := conventional_prefix (a_fingerprint)
			if Result.count > 0 then
				Result := Result.substring (1, Result.count - 1) -- Strip off trainling colon
			end
		ensure
			prefix_not_void: Result /= Void
		end

	display_name  (a_fingerprint: INTEGER): STRING
			-- Conventional expanded name for `a_fingerprint'
		require
			standard_name: is_built_in_fingerprint (a_fingerprint)
		do
			Result := STRING_.appended_string (conventional_prefix (a_fingerprint), standard_local_name (a_fingerprint))
		ensure
			name_not_void: Result /= Void
		end

	any_simple_type: detachable XM_XPATH_ANY_SIMPLE_TYPE
			-- xs:anySimpleType
		deferred
		ensure
			any_simple_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	any_atomic_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:anyAtomicType
		deferred
		ensure
			any_atomic_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	numeric_type: detachable XM_XPATH_ATOMIC_TYPE
			-- Implementation convenience type
		deferred
		ensure
			numeric_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	string_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:string
		deferred
		ensure
			string_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	boolean_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:boolean
		deferred
		ensure
			boolean_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	duration_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:duration
		deferred
		ensure
			duration_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	date_time_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:dateTime
		deferred
		ensure
			date_time_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	date_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:date
		deferred
		ensure
			date_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	time_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:time
		deferred
		ensure
			time_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	g_year_month_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:gYearMonth
		deferred
		ensure
			g_year_month_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	g_month_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:gMonth
		deferred
		ensure
			g_month_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	g_month_day_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:gMonthDay
		deferred
		ensure
			g_month_day_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	g_year_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:gYear
		deferred
		ensure
			g_year_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	g_day_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:gDay
		deferred
		ensure
			g_day_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	hex_binary_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:hexBinary
		deferred
		ensure
			hex_binary_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	base64_binary_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:base64Binary
		deferred
		ensure
			base64_binary_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	any_uri_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:anyURI
		deferred
		ensure
			any_uri_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	qname_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:QName
		deferred
		ensure
			qname_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	notation_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:NOTATION
		deferred
		ensure
			notation_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	untyped_atomic_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:untypedAtomic
		deferred
		ensure
			untyped_atomic_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	decimal_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:decimal
		deferred
		ensure
			decimal_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	float_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:float
		deferred
		ensure
			float_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	double_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:double
		deferred
		ensure
			double_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:integer
		deferred
		ensure
			integer_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	non_positive_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:nonPositiveInteger
		deferred
		ensure
			non_positive_integer_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	negative_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:negativeInteger
		deferred
		ensure
			negative_integer_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	long_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:long
		deferred
		ensure
			long_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	int_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:int
		deferred
		ensure
			int_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	short_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:short
		deferred
		ensure
			short_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	byte_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:byte
		deferred
		ensure
			byte_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	non_negative_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:nonNegativeInteger
		deferred
		ensure
			non_negative_integer_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	positive_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:positiveInteger
		deferred
		ensure
			positive_integer_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	unsigned_long_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedLong
		deferred
		ensure
			unsigned_long_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	unsigned_int_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedInt
		deferred
		ensure
			unsigned_int_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	unsigned_short_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedShort
		deferred
		ensure
			unsigned_short_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	unsigned_byte_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedByte
		deferred
		ensure
			unsigned_byte_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	year_month_duration_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:yearMonthDuration
		deferred
		ensure
			year_month_duration_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	day_time_duration_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:dayTimeDuration
		deferred
		ensure
			day_time_duration_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	normalized_string_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:normalizedString
		deferred
		ensure
			normalized_string_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	token_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:token
		deferred
		ensure
			token_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	language_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:language
		deferred
		ensure
			language_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	nmtoken_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:NMTOKEN
		deferred
		ensure
			nmtoken_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	name_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:Name
		deferred
		ensure
			name_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	ncname_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:NCName
		deferred
		ensure
			ncname_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	id_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:ID
		deferred
		ensure
			id_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	idref_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:IDREF
		deferred
		ensure
			idref_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	entity_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:ENTITY
		deferred
		ensure
			entity_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	idrefs_type: detachable XM_XPATH_LIST_TYPE
			-- xs:IDREFS
		deferred
		ensure
			idrefs_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	entities_type: detachable XM_XPATH_LIST_TYPE
			-- xs:ENTITIES
		deferred
		ensure
			entities_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	nmtokens_type: detachable XM_XPATH_LIST_TYPE
			-- xs:NMTOKENS
		deferred
		ensure
			nmtokens_type_not_necessarily_present: Result /= Void implies is_built_in_fingerprint (Result.fingerprint)
		end

	any_type: detachable XM_XPATH_ANY_TYPE
			-- xs:anyType
		deferred
		ensure
			any_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

	untyped_type: detachable XM_XPATH_UNTYPED_TYPE
			-- xs:untyped
		deferred
		ensure
			untyped_type_not_void: Result /= Void and then is_built_in_fingerprint (Result.fingerprint)
		end

feature -- Status report

	is_built_in_fingerprint (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a built-in type?
		do
			Result := Minimum_built_in_fingerprint < a_fingerprint and then a_fingerprint < Maximum_built_in_fingerprint
		end

	is_primitive_type (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a primitive type?
		do
			Result := (a_fingerprint > 0 and then a_fingerprint <= Integer_type_code) or
				a_fingerprint = Numeric_type_code or
				a_fingerprint = Untyped_atomic_type_code or
				a_fingerprint = Any_atomic_type_code or
				a_fingerprint = Day_time_duration_type_code or
				a_fingerprint = Year_month_duration_type_code or
				a_fingerprint = Any_simple_type_code
		end

	conventional_prefix (a_fingerprint: INTEGER): STRING
			-- Conventional prefix for a standard namespace, with colon
		require
			standard_namespace: is_built_in_fingerprint (a_fingerprint)
		local
			a_namespace: INTEGER
		do
			a_namespace := a_fingerprint // bits_8
			inspect
				a_namespace
			when Default_uri_code then
				Result := ""
			when Xml_uri_code then
				Result := "xml:"
			when Xml_schema_uri_code then
				Result := "xs:"
			when Gexslt_uri_code then
				Result := "gexslt:"
			when Xslt_uri_code then
				Result := "xsl:"
			when Xml_schema_instance_uri_code then
				Result := "xsi:"
			end
		ensure
			conventional_prefix_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	bits_8: INTEGER = 256

end


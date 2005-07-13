indexing

	description:

		"Objects that create built-in types for a schema-aware processor, and make them accessible"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SCHEMA_AWARE_TYPE_FACTORY

inherit

	XM_XPATH_COMMON_TYPE_FACTORY

create

	make

feature -- Access

	duration_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:duration
		once
			create Result.make (Xml_schema_uri, "duration", any_atomic_type, Duration_type_code)
			--type_map.put (Result, Duration_type_code)
		end

	g_year_month_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:gYearMonth
		once
			create Result.make (Xml_schema_uri, "gYearMonth", any_atomic_type, G_year_month_type_code)
			--type_map.put (Result, G_year_month_type_code)
		end

	g_month_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:gMonth
		once
			create Result.make (Xml_schema_uri, "gMonth", any_atomic_type, G_month_type_code)
			--type_map.put (Result, G_month_type_code)
		end

	g_month_day_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:gMonthDay
		once
			create Result.make (Xml_schema_uri, "gMonthDay", any_atomic_type, G_month_day_type_code)
			--type_map.put (Result, G_month_day_type_code)
		end

	g_year_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:gYear
		once
			create Result.make (Xml_schema_uri, "gYear", any_atomic_type, G_year_type_code)
			--type_map.put (Result, G_year_type_code)
		end

	g_day_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:gDay
		once
			create Result.make (Xml_schema_uri, "gDay", any_atomic_type, G_day_type_code)
			--type_map.put (Result, G_day_type_code)
		end

	hex_binary_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:hexBinary
		once
			create Result.make (Xml_schema_uri, "hexBinary", any_atomic_type, Hex_binary_type_code)
			--type_map.put (Result, Hex_binary_type_code)
		end

	base64_binary_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:base64Binary
		once
			create Result.make (Xml_schema_uri, "base64Binary", any_atomic_type, Base64_binary_type_code)
			--type_map.put (Result, Base64_binary_type_code)
		end

	notation_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:NOTATION
		once
			create Result.make (Xml_schema_uri, "NOTATION", any_atomic_type, Notation_type_code)
			--type_map.put (Result, Notation_type_code)
		end

	float_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:float
		once
			create Result.make (Xml_schema_uri, "float", numeric_type, Float_type_code)
			--type_map.put (Result, Float_type_code)
		end

	non_positive_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:nonPositiveInteger
		once
			create Result.make (Xml_schema_uri, "nonPositiveInteger", integer_type, Non_positive_integer_type_code)
			--type_map.put (Result, Non_positive_integer_type_code)
		end

	negative_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:negativeInteger
		once
			create Result.make (Xml_schema_uri, "negativeInteger", non_positive_integer_type, Negative_integer_type_code)
			--type_map.put (Result, Negative_integer_type_code)
		end

	long_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:long
		once
			create Result.make (Xml_schema_uri, "long", integer_type, Long_type_code)
			--type_map.put (Result, Long_type_code)
		end

	int_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:int
		once
			create Result.make (Xml_schema_uri, "int", long_type, Int_type_code)
			--type_map.put (Result, Int_type_code)
		end

	short_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:short
		once
			create Result.make (Xml_schema_uri, "short", int_type, Short_type_code)
			--type_map.put (Result, Short_type_code)
		end

	byte_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:byte
		once
			create Result.make (Xml_schema_uri, "byte", short_type, Byte_type_code)
			--type_map.put (Result, Byte_type_code)
		end

	non_negative_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:nonNegativeInteger
		once
			create Result.make (Xml_schema_uri, "nonNegativeInteger", integer_type, Non_negative_integer_type_code)
			--type_map.put (Result, Non_negative_integer_type_code)
		end

	positive_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:positiveInteger
		once
			create Result.make (Xml_schema_uri, "positiveInteger", non_negative_integer_type, Positive_integer_type_code)
			--type_map.put (Result, Positive_integer_type_code)
		end

	unsigned_long_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedLong
		once
			create Result.make (Xml_schema_uri, "unsignedLong", non_negative_integer_type, Unsigned_long_type_code)
			--type_map.put (Result, Unsigned_long_type_code)
		end

	unsigned_int_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedInt
		once
			create Result.make (Xml_schema_uri, "unsignedInt", unsigned_long_type, Unsigned_int_type_code)
			--type_map.put (Result, Unsigned_int_type_code)
		end

	unsigned_short_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedShort
		once
			create Result.make (Xml_schema_uri, "unsignedShort", unsigned_int_type, Unsigned_short_type_code)
			--type_map.put (Result, Unsigned_short_type_code)
		end

	unsigned_byte_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedByte
		once
			create Result.make (Xml_schema_uri, "unsignedByte", unsigned_short_type, Unsigned_byte_type_code)
			--type_map.put (Result, Unsigned_byte_type_code)
		end

	year_month_duration_type: XM_XPATH_ATOMIC_TYPE is
			-- xdt:yearMonthDuration
		once
			create Result.make (Xpath_defined_datatypes_uri, "yearMonthDuration", duration_type, Year_month_duration_type_code)
			--type_map.put (Result, Year_month_duration_type_code)
		end

	day_time_duration_type: XM_XPATH_ATOMIC_TYPE is
			-- xdt:dayTimeDuration
		once
			create Result.make (Xpath_defined_datatypes_uri, "dayTimeDuration", duration_type, Day_time_duration_type_code)
			--type_map.put (Result, Day_time_duration_type_code)
		end

	normalized_string_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:normalizedString
		once
			create Result.make (Xml_schema_uri, "normalizedString", string_type, Normalized_string_type_code)
			--type_map.put (Result, Normalized_string_type_code)
		end

	token_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:token
		once
			create Result.make (Xml_schema_uri, "token", normalized_string_type, Token_type_code)
			--type_map.put (Result, Token_type_code)
		end

	language_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:language
		once
			create Result.make (Xml_schema_uri, "language", token_type, Language_type_code)
			--type_map.put (Result, Language_type_code)
		end

	nmtoken_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:NMTOKEN
		once
			create Result.make (Xml_schema_uri, "NMTOKEN", token_type, Nmtoken_type_code)
			--type_map.put (Result, Nmtoken_type_code)
		end

	name_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:Name
		once
			create Result.make (Xml_schema_uri, "Name", token_type, Name_type_code)
			--type_map.put (Result, Name_type_code)
		end

	ncname_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:NCName
		once
			create Result.make (Xml_schema_uri, "NCName", name_type, Ncname_type_code)
			--type_map.put (Result, Ncname_type_code)
		end

	id_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:ID
		once
			create Result.make (Xml_schema_uri, "ID", ncname_type, Id_type_code)
			--type_map.put (Result, Id_type_code)
		end

	idref_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:IDREF
		once
			create Result.make (Xml_schema_uri, "IDREF", ncname_type, Idref_type_code)
			--type_map.put (Result, Idref_type_code)
		end

	entity_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:ENTITY
		once
			create Result.make (Xml_schema_uri, "ENTITY", ncname_type, Entity_type_code)
			--type_map.put (Result, Entity_type_code)
		end

	idrefs_type: XM_XPATH_LIST_TYPE is
			-- xs:IDREFS
		once
			-- TODO			create Result.make ("IDREFS", any_simple_type, Idrefs_type_code)
			--			--type_map.put (Result, Idrefs_type_code)
		end

	entities_type: XM_XPATH_LIST_TYPE is
			-- xs:ENTITIES
		once
			-- TODO create Result.make ("ENTITIES", any_simple_type, Entities_type_code)
			-- --type_map.put (Result, Entities_type_code)
		end

	nmtokens_type: XM_XPATH_LIST_TYPE is
			-- xs:NMTOKENS
		once
			-- TODO create Result.make ("NMTOKENS", any_simple_type, Nmtokens_type_code)
			-- --type_map.put (Result, Nmtokens_type_code)
		end

end
	

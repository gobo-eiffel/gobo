note

	description:

		"Objects that create built-in types for a schema-aware processor, and make them accessible"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SCHEMA_AWARE_TYPE_FACTORY

inherit

	XM_XPATH_COMMON_TYPE_FACTORY

create

	make

feature -- Access

	notation_type: XM_XPATH_ATOMIC_TYPE
			-- xs:NOTATION
		once
			create Result.make (Xml_schema_uri, "NOTATION", any_atomic_type, Notation_type_code)
		end

	non_positive_integer_type: XM_XPATH_ATOMIC_TYPE
			-- xs:nonPositiveInteger
		once
			create Result.make (Xml_schema_uri, "nonPositiveInteger", integer_type, Non_positive_integer_type_code)
		end

	negative_integer_type: XM_XPATH_ATOMIC_TYPE
			-- xs:negativeInteger
		once
			create Result.make (Xml_schema_uri, "negativeInteger", non_positive_integer_type, Negative_integer_type_code)
		end

	long_type: XM_XPATH_ATOMIC_TYPE
			-- xs:long
		once
			create Result.make (Xml_schema_uri, "long", integer_type, Long_type_code)
		end

	int_type: XM_XPATH_ATOMIC_TYPE
			-- xs:int
		once
			create Result.make (Xml_schema_uri, "int", long_type, Int_type_code)
		end

	short_type: XM_XPATH_ATOMIC_TYPE
			-- xs:short
		once
			create Result.make (Xml_schema_uri, "short", int_type, Short_type_code)
		end

	byte_type: XM_XPATH_ATOMIC_TYPE
			-- xs:byte
		once
			create Result.make (Xml_schema_uri, "byte", short_type, Byte_type_code)
		end

	non_negative_integer_type: XM_XPATH_ATOMIC_TYPE
			-- xs:nonNegativeInteger
		once
			create Result.make (Xml_schema_uri, "nonNegativeInteger", integer_type, Non_negative_integer_type_code)
		end

	positive_integer_type: XM_XPATH_ATOMIC_TYPE
			-- xs:positiveInteger
		once
			create Result.make (Xml_schema_uri, "positiveInteger", non_negative_integer_type, Positive_integer_type_code)
		end

	unsigned_long_type: XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedLong
		once
			create Result.make (Xml_schema_uri, "unsignedLong", non_negative_integer_type, Unsigned_long_type_code)
		end

	unsigned_int_type: XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedInt
		once
			create Result.make (Xml_schema_uri, "unsignedInt", unsigned_long_type, Unsigned_int_type_code)
		end

	unsigned_short_type: XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedShort
		once
			create Result.make (Xml_schema_uri, "unsignedShort", unsigned_int_type, Unsigned_short_type_code)
		end

	unsigned_byte_type: XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedByte
		once
			create Result.make (Xml_schema_uri, "unsignedByte", unsigned_short_type, Unsigned_byte_type_code)
		end

	normalized_string_type: XM_XPATH_ATOMIC_TYPE
			-- xs:normalizedString
		once
			create Result.make (Xml_schema_uri, "normalizedString", string_type, Normalized_string_type_code)
		end

	token_type: XM_XPATH_ATOMIC_TYPE
			-- xs:token
		once
			create Result.make (Xml_schema_uri, "token", normalized_string_type, Token_type_code)
		end

	language_type: XM_XPATH_ATOMIC_TYPE
			-- xs:language
		once
			create Result.make (Xml_schema_uri, "language", token_type, Language_type_code)
		end

	nmtoken_type: XM_XPATH_ATOMIC_TYPE
			-- xs:NMTOKEN
		once
			create Result.make (Xml_schema_uri, "NMTOKEN", token_type, Nmtoken_type_code)
		end

	name_type: XM_XPATH_ATOMIC_TYPE
			-- xs:Name
		once
			create Result.make (Xml_schema_uri, "Name", token_type, Name_type_code)
		end

	ncname_type: XM_XPATH_ATOMIC_TYPE
			-- xs:NCName
		once
			create Result.make (Xml_schema_uri, "NCName", name_type, Ncname_type_code)
		end

	id_type: XM_XPATH_ATOMIC_TYPE
			-- xs:ID
		once
			create Result.make (Xml_schema_uri, "ID", ncname_type, Id_type_code)
		end

	idref_type: XM_XPATH_ATOMIC_TYPE
			-- xs:IDREF
		once
			create Result.make (Xml_schema_uri, "IDREF", ncname_type, Idref_type_code)
		end

	entity_type: XM_XPATH_ATOMIC_TYPE
			-- xs:ENTITY
		once
			create Result.make (Xml_schema_uri, "ENTITY", ncname_type, Entity_type_code)
		end

	idrefs_type: detachable XM_XPATH_LIST_TYPE
			-- xs:IDREFS
		once
			-- TODO			create Result.make ("IDREFS", any_simple_type, Idrefs_type_code)
		end

	entities_type: detachable XM_XPATH_LIST_TYPE
			-- xs:ENTITIES
		once
			-- TODO create Result.make ("ENTITIES", any_simple_type, Entities_type_code)
		end

	nmtokens_type: detachable XM_XPATH_LIST_TYPE
			-- xs:NMTOKENS
		once
			-- TODO create Result.make ("NMTOKENS", any_simple_type, Nmtokens_type_code)
		end

end


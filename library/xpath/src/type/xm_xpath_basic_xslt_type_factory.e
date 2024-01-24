note

	description:

		"Objects that create built-in types for a Basic XSLT processor, and make them accessible"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_BASIC_XSLT_TYPE_FACTORY

inherit

	XM_XPATH_COMMON_TYPE_FACTORY

create

	make

feature -- Access

	notation_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:NOTATION
		once
			Result := Void
		end

	non_positive_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:nonPositiveInteger
		once
			Result := Void
		end

	negative_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:negativeInteger
		once
			Result := Void
		end

	long_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:long
		once
			Result := Void
		end

	int_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:int
		once
			Result := Void
		end

	short_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:short
		once
			Result := Void
		end

	byte_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:byte
		once
			Result := Void
		end

	non_negative_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:nonNegativeInteger
		once
			Result := Void
		end

	positive_integer_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:positiveInteger
		once
			Result := Void
		end

	unsigned_long_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedLong
		once
			Result := Void
		end

	unsigned_int_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedInt
		once
			Result := Void
		end

	unsigned_short_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedShort
		once
			Result := Void
		end

	unsigned_byte_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:unsignedByte
		once
			Result := Void
		end

	normalized_string_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:normalizedString
		once
			Result := Void
		end

	token_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:token
		once
			Result := Void
		end

	language_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:language
		once
			Result := Void
		end

	nmtoken_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:NMTOKEN
		once
			Result := Void
		end

	name_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:Name
		once
			Result := Void
		end

	ncname_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:NCName
		once
			Result := Void
		end

	id_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:ID
		once
			Result := Void
		end

	idref_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:IDREF
		once
			Result := Void
		end

	entity_type: detachable XM_XPATH_ATOMIC_TYPE
			-- xs:ENTITY
		once
			Result := Void
		end

	idrefs_type: detachable XM_XPATH_LIST_TYPE
			-- xs:IDREFS
		once
			Result := Void
		end

	entities_type: detachable XM_XPATH_LIST_TYPE
			-- xs:ENTITIES
		once
			Result := Void
		end

	nmtokens_type: detachable XM_XPATH_LIST_TYPE
			-- xs:NMTOKENS
		once
			Result := Void
		end

end


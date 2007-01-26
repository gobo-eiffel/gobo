indexing

	description:

		"Objects that create built-in types for a Basic XSLT processor, and make them accessible"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BASIC_XSLT_TYPE_FACTORY

inherit

	XM_XPATH_COMMON_TYPE_FACTORY

create

	make

feature -- Access
	
	notation_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:NOTATION
		once
			Result := Void
		end

	non_positive_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:nonPositiveInteger
		once
			Result := Void
		end

	negative_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:negativeInteger
		once
			Result := Void
		end

	long_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:long
		once
			Result := Void
		end

	int_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:int
		once
			Result := Void
		end

	short_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:short
		once
			Result := Void
		end

	byte_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:byte
		once
			Result := Void
		end

	non_negative_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:nonNegativeInteger
		once
			Result := Void
		end

	positive_integer_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:positiveInteger
		once
			Result := Void
		end

	unsigned_long_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedLong
		once
			Result := Void
		end

	unsigned_int_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedInt
		once
			Result := Void
		end

	unsigned_short_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedShort
		once
			Result := Void
		end

	unsigned_byte_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:unsignedByte
		once
			Result := Void
		end

	normalized_string_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:normalizedString
		once
			Result := Void
		end

	token_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:token
		once
			Result := Void
		end

	language_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:language
		once
			Result := Void
		end

	nmtoken_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:NMTOKEN
		once
			Result := Void
		end

	name_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:Name
		once
			Result := Void
		end

	ncname_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:NCName
		once
			Result := Void
		end

	id_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:ID
		once
			Result := Void
		end

	idref_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:IDREF
		once
			Result := Void
		end

	entity_type: XM_XPATH_ATOMIC_TYPE is
			-- xs:ENTITY
		once
			Result := Void
		end

	idrefs_type: XM_XPATH_LIST_TYPE is
			-- xs:IDREFS
		once
			Result := Void
		end

	entities_type: XM_XPATH_LIST_TYPE is
			-- xs:ENTITIES
		once
			Result := Void
		end

	nmtokens_type: XM_XPATH_LIST_TYPE is
			-- xs:NMTOKENS
		once
			Result := Void
		end

end
	

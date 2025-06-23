note

	description:

		"Constants used to read Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_CONSTANTS

feature -- Storable kinds

	Basic_store_3_1: NATURAL_8 = 0x00
			-- Basic store version 3.1
			-- (From file eif_store.h)

	Basic_store_3_2: NATURAL_8 = 0x02
			-- Basic store version 3.2
			-- (From file eif_store.h)

	Basic_store_4_0: NATURAL_8 = 0x06
			-- Basic store version 4.0
			-- (From file eif_store.h)

	Basic_store_6_6: NATURAL_8 = 0x13
			-- Basic store version 6.6
			-- (From file eif_store.h)

	General_store_3_1: NATURAL_8 = 0x01
			-- General store version 3.1
			-- (From file eif_store.h)

	General_store_3_2: NATURAL_8 = 0x03
			-- General store version 3.2
			-- (From file eif_store.h)

	General_store_3_3: NATURAL_8 = 0x05
			-- General store version 3.3
			-- (From file eif_store.h)

	General_store_4_0: NATURAL_8 = 0x07
			-- General store version 4.0
			-- (From file eif_store.h)

	General_store_6_4: NATURAL_8 = 0x11
			-- General store version 6.4
			-- (From file eif_store.h)

	General_store_6_6: NATURAL_8 = 0x14
			-- General store version 6.6
			-- (From file eif_store.h)

	Independent_store_3_2: NATURAL_8 = 0x04
			-- Independent store version 3.2
			-- (From file eif_store.h)

	Independent_store_4_0: NATURAL_8 = 0x08
			-- Independent store version 4.0
			-- (From file eif_store.h)

	Independent_store_4_3: NATURAL_8 = 0x09
			-- Independent store version 4.3
			-- (From file eif_store.h)

	Independent_store_4_4: NATURAL_8 = 0x0A
			-- Independent store version 4.4
			-- (From file eif_store.h)

	Independent_store_5_0: NATURAL_8 = 0x0B
			-- Independent store version 5.0
			-- (From file eif_store.h)

	Recoverable_store_5_3: NATURAL_8 = 0x0C
			-- Recoverable storable version 5.3
			-- (From file eif_store.h)

	Intermediate_store_5_5: NATURAL_8 = 0x0D
			-- Intermediate store version 5.5
			-- (From file eif_store.h)

	Independent_store_5_5: NATURAL_8 = 0x0E
			-- Independent store version 5.5
			-- (From file eif_store.h)

	Independent_store_6_0: NATURAL_8 = 0x0F
			-- Independent store version 6.0
			-- (From file eif_store.h)

	Independent_store_6_2: NATURAL_8 = 0xEF
			-- Independent store version 6.2
			-- Note that even though the version number of the independent_store format has not been
			-- upgraded from 6.0 to 6.2, the values of 'Attr_*' when used to encode the types of
			-- objects have been turned to positive numbers in EiffelStudio 6.2 (they used to be
			-- negative numbers in the original format independent_store 6.0). See
			-- SB_INDEPENDENT_STORE_6_2_CONSTANTS.
			--
			-- This number does not exist in ISE's STORABLE, only in the Storable Browser.

	Independent_store_6_3: NATURAL_8 = 0x10
			-- Independent store version 6.3
			-- (From file eif_store.h)

	Independent_store_6_4: NATURAL_8 = 0x12
			-- Independent store version 6.4
			-- (From file eif_store.h)

	Independent_store_6_6: NATURAL_8 = 0x15
			-- Independent store version 6.6
			-- (From file eif_store.h)

feature -- Attribute kinds

-- Values used to encode the type of each attribute. Dynamic type is encoded on
-- 16 bits, so this leaves the upper 16 bits to encode simple types or flag the
-- expandeds. Following are the flags used. The 31th bit is used to mark an
-- expanded type. The SK_SIMPLE mask can be used to check for simple types,
-- and SK_REF to check for reference type. The dynamic type value (if not a
-- simple type) is available with SK_DTYPE. Values marked as "sensible" have
-- been especially computed for the interpreter, so it should not be wise
-- modifying them: (value >> 27) - 1 directly yields the corresponding IT_xxxx
-- value.

	Sk_exp: NATURAL_32 = 0x80000000
			-- Type is an expanded
			-- (From file eif_struct.h)

	Sk_mask: NATURAL_32 = 0x7fffffff
			-- Mask to get real type
			-- (From file eif_struct.h)

	Sk_bool: NATURAL_32 = 0x04000000
			-- Simple boolean type
			-- (From file eif_struct.h)

	Sk_char: NATURAL_32 = 0x08000000
			-- Simple character type
			-- (From file eif_struct.h)

	Sk_int8: NATURAL_32 = 0x0c000000
			-- Simple integer 8 type
			-- (From file eif_struct.h)

	Sk_int32: NATURAL_32 = 0x10000000
			-- Simple integer 32 type
			-- (From file eif_struct.h)

	Sk_int16: NATURAL_32 = 0x14000000
			-- Simple integer 16 type
			-- (From file eif_struct.h)

	Sk_real_32: NATURAL_32 = 0x18000000
			-- Simple real_32 type
			-- (From file eif_struct.h)

	Sk_wchar: NATURAL_32 = 0x1c000000
			-- Simple unicode character type
			-- (From file eif_struct.h)

	Sk_real_64: NATURAL_32 = 0x20000000
			-- Simple real_64 type
			-- (From file eif_struct.h)

	Sk_int64: NATURAL_32 = 0x24000000
			-- Simple integer 64 types
			-- (From file eif_struct.h)

	Sk_uint8: NATURAL_32 = 0x30000000
			-- Simple unsigned integer 8 type
			-- (From file eif_struct.h)

	Sk_uint16: NATURAL_32 = 0x34000000
			-- Simple unsigned integer 16 type
			-- (From file eif_struct.h)

	Sk_uint32: NATURAL_32 = 0x38000000
			-- Simple unsigned integer 32 type
			-- (From file eif_struct.h)

	Sk_uint64: NATURAL_32 = 0x3c000000
			-- Simple unsigned integer 64 type
			-- (From file eif_struct.h)

	Sk_pointer: NATURAL_32 = 0x40000000
			-- Simple pointer type
			-- (From file eif_struct.h)

	Sk_char32: NATURAL_32 = 0x44000000
			-- Simple 32 bits character type
			-- (From file eif_struct.h)

	Sk_bmask: NATURAL_32 = 0x00007fff
			-- Bits number (coded on 15 bits)
			-- (From file eif_struct.h)

	Sk_simple: NATURAL_32 = 0x7c000000
			-- Mask to test for simple type
			-- (From file eif_struct.h)

	Sk_ref: NATURAL_32 = 0xf8000000
			-- Mask to test for reference type
			-- (From file eif_struct.h)

	Sk_void: NATURAL_32 = 0x00000000
			-- Mask for void type
			-- (From file eif_struct.h)

	Sk_dtype: NATURAL_32 = 0x0000ffff
			-- Value of reference type
			-- (From file eif_struct.h)

	Sk_head: NATURAL_32 = 0xff000000
			-- Mask for header value
			-- (From file eif_struct.h)

	Sk_invalid: NATURAL_32 = 0xffffffff
			-- Invalid value, may be used as flag
			-- (From file eif_struct.h)

feature -- Sk Head

	Skh_exp: NATURAL_8 = 0x80
			-- Type is an expanded
			-- (From file eif_struct.h)

	Skh_bool: NATURAL_8 = 0x04
			-- Simple boolean type
			-- (From file eif_struct.h)

	Skh_char: NATURAL_8 = 0x08
			-- Simple character type
			-- (From file eif_struct.h)

	Skh_int8: NATURAL_8 = 0x0c
			-- Simple integer 8 type
			-- (From file eif_struct.h)

	Skh_int32: NATURAL_8 = 0x10
			-- Simple integer 32 type
			-- (From file eif_struct.h)

	Skh_int16: NATURAL_8 = 0x14
			-- Simple integer 16 type
			-- (From file eif_struct.h)

	Skh_real_32: NATURAL_8 = 0x18
			-- Simple real_32 type
			-- (From file eif_struct.h)

	Skh_wchar: NATURAL_8 = 0x1c
			-- Simple unicode character type
			-- (From file eif_struct.h)

	Skh_real_64: NATURAL_8 = 0x20
			-- Simple real_64 type
			-- (From file eif_struct.h)

	Skh_int64: NATURAL_8 = 0x24
			-- Simple integer 64 types
			-- (From file eif_struct.h)

	Skh_uint8: NATURAL_8 = 0x30
			-- Simple unsigned integer 8 type
			-- (From file eif_struct.h)

	Skh_uint16: NATURAL_8 = 0x34
			-- Simple unsigned integer 16 type
			-- (From file eif_struct.h)

	Skh_uint32: NATURAL_8 = 0x38
			-- Simple unsigned integer 32 type
			-- (From file eif_struct.h)

	Skh_uint64: NATURAL_8 = 0x3c
			-- Simple unsigned integer 64 type
			-- (From file eif_struct.h)

	Skh_pointer: NATURAL_8 = 0x40
			-- Simple pointer type
			-- (From file eif_struct.h)

	Skh_char32: NATURAL_8 = 0x44
			-- Simple 32 bits character type
			-- (From file eif_struct.h)

	Skh_simple: NATURAL_8 = 0x7c
			-- Mask to test for simple type
			-- (From file eif_struct.h)

	Skh_ref: NATURAL_8 = 0xf8
			-- Mask to test for reference type
			-- (From file eif_struct.h)

	Skh_void: NATURAL_8 = 0x00
			-- Mask for void type
			-- (From file eif_struct.h)

	Skh_invalid: NATURAL_8 = 0xff
			-- Invalid value, may be used as flag
			-- (From file eif_struct.h)

feature -- Flags

	Eo_type: NATURAL_32 = 0x0000ffff
			-- Mask to get the dynamic type
			-- (From file eif_garcol.h)

	Eo_spec: NATURAL_32 = 0x01000000
			-- Object is special (C area)
			-- (From file eif_garcol.h)

feature -- Class flags

	Eif_is_deferred_flag: NATURAL_32 = 0x1000
			-- (From file rt_struct.h)

	Eif_is_composite_flag: NATURAL_32 = 0x0800
			-- (From file rt_struct.h)

	Eif_has_dispose_flag: NATURAL_32 = 0x0400
			-- (From file rt_struct.h)

	Eif_is_expanded_flag: NATURAL_32 = 0x0200
			-- (From file rt_struct.h)

	Eif_is_declared_expanded_flag: NATURAL_32 = 0x0100
			-- (From file rt_struct.h)

feature -- Empty containers

	empty_attribute_list: SB_ATTRIBUTE_LIST
			-- Empty attribute list
		once
			create Result.make
		ensure
			attribute_list_not_void: Result /= Void
			attribute_list_empty: Result.is_empty
		end

	empty_type_list: SB_TYPE_LIST
			-- Empty type list
		once
			create Result.make
		ensure
			type_list_not_void: Result /= Void
			type_list_empty: Result.is_empty
		end

feature -- Class names

	unknown_class_name: STRING = "**UNKNOWN**"
			-- Dummy name of an unknown class

	boolean_class_name: STRING = "BOOLEAN"
			-- Name of Eiffel class "BOOLEAN"

	character_8_class_name: STRING = "CHARACTER_8"
			-- Name of Eiffel class "CHARACTER_8"

	character_32_class_name: STRING = "CHARACTER_32"
			-- Name of Eiffel class "CHARACTER_32"

	real_32_class_name: STRING = "REAL_32"
			-- Name of Eiffel class "REAL_32"

	real_64_class_name: STRING = "REAL_64"
			-- Name of Eiffel class "REAL_64"

	pointer_class_name: STRING = "POINTER"
			-- Name of Eiffel class "POINTER"

	none_class_name: STRING = "NONE"
			-- Name of Eiffel class "NONE"

	integer_32_class_name: STRING = "INTEGER_32"
			-- Name of Eiffel class "INTEGER_32"

	integer_8_class_name: STRING = "INTEGER_8"
			-- Name of Eiffel class "INTEGER_8"

	integer_16_class_name: STRING = "INTEGER_16"
			-- Name of Eiffel class "INTEGER_16"

	integer_64_class_name: STRING = "INTEGER_64"
			-- Name of Eiffel class "INTEGER_64"

	natural_8_class_name: STRING = "NATURAL_8"
			-- Name of Eiffel class "NATURAL_8"

	natural_16_class_name: STRING = "NATURAL_16"
			-- Name of Eiffel class "NATURAL_16"

	natural_32_class_name: STRING = "NATURAL_32"
			-- Name of Eiffel class "NATURAL_32"

	natural_64_class_name: STRING = "NATURAL_64"
			-- Name of Eiffel class "NATURAL_64"

	special_class_name: STRING = "SPECIAL"
			-- Name of Eiffel class "SPECIAL"

end

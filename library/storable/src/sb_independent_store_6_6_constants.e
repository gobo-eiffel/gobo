note

	description:

		"Constants used to read Storable files with independent store 6.6 format"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_INDEPENDENT_STORE_6_6_CONSTANTS

inherit

	SB_CONSTANTS

feature -- Attribute types

	Attr_terminator: INTEGER_16 = 0xFFFF
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_none_type: INTEGER_16 = 0xFFFE
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_tuple_type: INTEGER_16 = 0xFFF9
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_formal_type: INTEGER_16 = 0xFFF8
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_attached_type: INTEGER_16 = 0xFF01
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_detachable_type: INTEGER_16 = 0xFF02
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_separate_type: INTEGER_16 = 0xFF04
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_frozen_type: INTEGER_16 = 0xFF20
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_old_attached_type: INTEGER_16 = 0xFF11
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_old_detachable_type: INTEGER_16 = 0xFF12
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_old_frozen_type: INTEGER_16 = 0xFF14
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

	Attr_annotation_type_mask: INTEGER_16
				-- (From file rt_gen_types.h)
				-- Note that this is a negative number (on purpose: positive numbers are for class ids).
				-- That's why this constant is not declared as NATURAL_16.
			once
				Result := {INTEGER_16} 0xFF00 | ({INTEGER_16} 0x007F).bit_not
			end

	has_annotation_type (a_type: INTEGER_16): BOOLEAN
				-- Does `a_type' contain a type annotation (such as attached, detachable or frozen)?
			do
				Result := (a_type & Attr_annotation_type_mask) = {INTEGER_16} 0xFF00
			end

	is_attached_type (a_type: INTEGER_16): BOOLEAN
				-- Does `a_type' contain an attached mark?
			do
				Result := (a_type & Attr_attached_type) = Attr_attached_type or (a_type & Attr_old_attached_type) = Attr_old_attached_type
			end

	is_detachable_type (a_type: INTEGER_16): BOOLEAN
				-- Does `a_type' contain a detachable mark?
			do
				Result := (a_type & Attr_detachable_type) = Attr_detachable_type or (a_type & Attr_old_detachable_type) = Attr_old_detachable_type
			end

	is_frozen_type (a_type: INTEGER_16): BOOLEAN
				-- Does `a_type' contain a frozen mark?
			do
				Result := (a_type & Attr_frozen_type) = Attr_frozen_type or (a_type & Attr_old_frozen_type) = Attr_old_frozen_type
			end

	Attr_max_dtype: INTEGER_16 = 0xFF00
			-- (From file rt_gen_types.h)
			-- Note that this is a negative number (on purpose: positive numbers are for class ids).
			-- That's why this constant is not declared as NATURAL_16.

feature -- Tuple parameter types

	Eif_tuple_code_mask: NATURAL_8 = 0x0F
			-- (From file rt_gen_types.h)

	Eif_reference_code: NATURAL_8 = 0x00
			-- (From file rt_gen_types.h)

	Eif_boolean_code: NATURAL_8 = 0x01
			-- (From file rt_gen_types.h)

	Eif_character_code: NATURAL_8 = 0x02
			-- (From file rt_gen_types.h)

	Eif_double_code: NATURAL_8 = 0x03
			-- (From file rt_gen_types.h)

	Eif_real_code: NATURAL_8 = 0x04
			-- (From file rt_gen_types.h)

	Eif_pointer_code: NATURAL_8 = 0x05
			-- (From file rt_gen_types.h)

	Eif_integer_8_code: NATURAL_8 = 0x06
			-- (From file rt_gen_types.h)

	Eif_integer_16_code: NATURAL_8 = 0x07
			-- (From file rt_gen_types.h)

	Eif_integer_32_code: NATURAL_8 = 0x08
			-- (From file rt_gen_types.h)

	Eif_integer_64_code: NATURAL_8 = 0x09
			-- (From file rt_gen_types.h)

	Eif_natural_8_code: NATURAL_8 = 0x0A
			-- (From file rt_gen_types.h)

	Eif_natural_16_code: NATURAL_8 = 0x0B
			-- (From file rt_gen_types.h)

	Eif_natural_32_code: NATURAL_8 = 0x0C
			-- (From file rt_gen_types.h)

	Eif_natural_64_code: NATURAL_8 = 0x0D
			-- (From file rt_gen_types.h)

	Eif_wide_char_code: NATURAL_8 = 0x0E
			-- (From file rt_gen_types.h)

feature -- Formal parameters

	Sk_formal: NATURAL_32
			-- Code for formal parameters
		once
			Result := Sk_ref
		end

end

note

	description:

		"Regular objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_REGULAR_OBJECT

inherit

	SB_REFERENCE_OBJECT
		redefine
			type,
			is_regular,
			reset,
			has_reference
		end

	SB_COMPOSITE_OBJECT
		undefine
			is_equal
		redefine
			is_regular,
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_flags: like flags; an_address: like address)
			-- Create a new empty regular object.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
			flags := a_flags
			address := an_address
			create items.make_filled (Void, storable_class.attributes.count)
		ensure
			type_set: type = a_type
			flags_set: flags = a_flags
			address_set: address = an_address
		end

feature -- Access

	type: SB_CLASS_TYPE
			-- Type

	storable_class: SB_CLASS
			-- Base class of `type'
		do
			Result := type.storable_class
		end

	item (i: INTEGER): detachable SB_OBJECT
			-- `i'-th attribute (in the same order as in `type')
		do
			Result := items.item (i - 1)
		end

feature -- Measurement

	lower: INTEGER_32 = 1
			-- Minimum index

feature -- Status report

	is_regular: BOOLEAN = True
			-- Is current object a regular object?

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid attribute index?
		do
			Result := (i >= 1 and i <= count)
		ensure then
			definition: Result = (i >= 1 and i <= count)
		end

	has_reference (a_object: SB_REFERENCE_OBJECT): BOOLEAN
			-- Does current object have `a_object' in one of its attributes?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i) = a_object then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	put (a_value: like item; i: INTEGER)
			-- Assign `a_value' to `i'-th attribute.
		do
			items.put (a_value, i - 1)
		end

	reset
			-- Set to Void extra fields, or add missing
			-- fields and set them to their default values.
		local
			i, nb: INTEGER
			l_attributes: SB_ATTRIBUTE_LIST
			l_attribute: SB_ATTRIBUTE
			l_type: SB_TYPE
		do
			l_attributes := storable_class.attributes
			nb := l_attributes.count
			if nb > count then
				items := items.aliased_resized_area_with_default (Void, nb)
			end
			from i := 1 until i > nb loop
				l_attribute := l_attributes.item (i)
				if item (i) = Void and then l_attribute.is_added then
					l_type := l_attribute.type
					if l_type.is_expanded then
						if l_type.is_boolean then
							put (create {SB_BOOLEAN_OBJECT}.make (l_type, False), i)
						elseif l_type.is_character_8 then
							put (create {SB_CHARACTER_8_OBJECT}.make (l_type, '%U'), i)
						elseif l_type.is_character_32 then
							put (create {SB_CHARACTER_32_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_integer_8 then
							put (create {SB_INTEGER_8_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_integer_16 then
							put (create {Sb_INTEGER_16_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_integer_32 then
							put (create {SB_INTEGER_32_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_integer_64 then
							put (create {SB_INTEGER_64_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_natural_8 then
							put (create {SB_NATURAL_8_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_natural_16 then
							put (create {SB_NATURAL_16_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_natural_32 then
							put (create {SB_NATURAL_32_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_natural_64 then
							put (create {SB_NATURAL_64_OBJECT}.make (l_type, 0), i)
						elseif l_type.is_real_32 then
							put (create {SB_REAL_32_OBJECT}.make (l_type, 0.0), i)
						elseif l_type.is_real_64 then
							put (create {SB_REAL_64_OBJECT}.make (l_type, 0.0), i)
						elseif l_type.is_pointer then
							put (create {SB_POINTER_OBJECT}.make (l_type, 0), i)
						else
							-- Leave this field Void.
						end
					else
						-- Leave this field Void.
					end
				end
				i := i + 1
			end
			if nb < count then
				from
					i := nb
					nb := count - 1
				until
					i > nb
				loop
					items.put (Void, i)
					i := i + 1
				end
			end
		end

end

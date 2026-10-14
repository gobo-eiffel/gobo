note

	description:

		"Eiffel choice interval type bounds of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_CHOICE_TYPE_BOUNDS

inherit

	ET_CHOICE_BOUNDS

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make,
	make_with_lower_value

feature {NONE} -- Initialization

	make (a_lower_value: like lower_value; a_upper_value: like upper_value; a_system_processor: like system_processor)
			-- Create a new choice bounds.
		require
			a_lower_value_not_void: a_lower_value /= Void
			a_lower_value_is_base_type: a_lower_value.is_base_type
			a_upper_value_not_void: a_upper_value /= Void
			a_upper_value_is_base_type: a_upper_value.is_base_type
			a_system_processor_not_void: a_system_processor /= Void
		do
			lower_value := a_lower_value
			upper_value := a_upper_value
			system_processor := a_system_processor
		ensure
			lower_value_set: lower_value = a_lower_value
			upper_value_set: upper_value = a_upper_value
			system_processor_set: system_processor = a_system_processor
		end

	make_with_lower_value (a_value: like lower_value; a_system_processor: like system_processor)
			-- Create a new choice bounds.
		require
			a_value_not_void: a_value /= Void
			a_system_processor_not_void: a_system_processor /= Void
		do
			lower_value := a_value
			upper_value := a_value
			system_processor := a_system_processor
		ensure
			lower_value_set: lower_value = a_value
			upper_value_set: upper_value = a_value
			system_processor_set: system_processor = a_system_processor
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no value in `Current`?
		local
			l_any_type: ET_CLASS_TYPE
		do
			if attached {ET_BASE_TYPE} lower_value as l_base_type then
				l_any_type := l_base_type.base_class.current_system.any_type
				Result := not lower_value.conforms_to_type (upper_value, l_any_type, l_any_type, system_processor)
			else
				Result := True
			end
		end

	overlaps (other: ET_CHOICE_BOUNDS): BOOLEAN
			-- Does `other` contain values of `Current`?
		local
			l_any_type: ET_CLASS_TYPE
		do
			if attached {ET_CHOICE_TYPE_BOUNDS} other as l_type_bounds and attached {ET_BASE_TYPE} lower_value as l_base_type then
				l_any_type := l_base_type.base_class.current_system.any_type
				Result := l_type_bounds.lower_value.conforms_to_type (upper_value, l_any_type, l_any_type, system_processor) and
					lower_value.conforms_to_type (l_type_bounds.upper_value, l_any_type, l_any_type, system_processor)
			end
		end

feature -- Access

	lower_value: ET_TYPE
			-- Lower bound value

	upper_value: ET_TYPE
			-- Upper bound value

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Setting

	set_lower_value (a_value: like lower_value)
			-- Set `lower_value` to `a_value`.
		require
			a_value_not_void: a_value /= Void
			a_value_is_base_type: a_value.is_base_type
		do
			lower_value := a_value
		ensure
			lower_value_set: lower_value = a_value
		end

	set_upper_value (a_value: like upper_value)
			-- Set `upper_value` to `a_value`.
		require
			a_value_not_void: a_value /= Void
			a_value_is_base_type: a_value.is_base_type
		do
			upper_value := a_value
		ensure
			upper_value_set: upper_value = a_value
		end

invariant

	lower_value_not_void: lower_value /= Void
	lower_value_is_base_type: lower_value.is_base_type
	upper_value_not_void: upper_value /= Void
	upper_value_is_base_type: upper_value.is_base_type
	system_processor_not_void: system_processor /= Void

end

note

	description:

		"Eiffel classes used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_CLASS

inherit

	COMPARABLE

	SB_SHARED_CONSTANTS
		export
			{NONE} all
		undefine
			is_equal
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

create

	make,
	make_unknown

feature {NONE} -- Initialization

	make (a_name: like name; an_index: like index)
			-- Create a new storable class.
		require
			a_name_not_void: a_name /= Void
		do
			set_name (a_name)
			index := an_index
			formal_parameters := storable_constants.empty_type_list
			attributes := storable_constants.empty_attribute_list
		ensure
			name_set: name = a_name
			index_set: index = an_index
		end

	make_unknown (an_index: like index)
			-- Create a new unknown storable class.
		do
			make (storable_constants.unknown_class_name, an_index)
		ensure
			index_set: index = an_index
			is_unknown: is_unknown
		end

feature -- Status report

	has_name (a_name: like name): BOOLEAN
			-- Is the name of current class `a_name'?
			-- (Note: this is a case-insensitive comparison.)
		require
			a_name_not_void: a_name /= Void
		do
			Result := STRING_.same_case_insensitive (name, a_name)
		end

	is_unknown: BOOLEAN
			-- Is current class not present in the schema?
		do
			Result := (name = storable_constants.unknown_class_name)
		end

	has_unknown: BOOLEAN
			-- Is the type of one of the attributes based on some
			-- classes which are not known by the schema, or is
			-- current class itself unknown?
		do
			Result := is_unknown or attributes.has_unknown
		end

	is_added: BOOLEAN
			-- Has current class been added to schema?

	is_removed: BOOLEAN
			-- Has current class been removed from schema?

	is_visible: BOOLEAN
			-- Should current class be shown?

	has_attribute_type_error: BOOLEAN
			-- Has an error occurred when resolving types of `attributes'?
			-- Some older versions of Eiffel stored Storable files with incorrect
			-- values for the number of parameters in Tuple types, therefore
			-- we need to be tolerant on this kind of error. So the error is
			-- reported but the error handler is not set and
			-- `has_attribute_type_error' is set instead.
		local
			i, nb: INTEGER
		do
			nb := attributes.count
			from i := 1 until i > nb loop
				if attributes.item (i).has_type_error then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	is_boolean: BOOLEAN
			-- Is current class the BOOLEAN class?

	is_character_8: BOOLEAN
			-- Is current class the CHARACTER_8 class?

	is_character_32: BOOLEAN
			-- Is current class the CHARACTER_32 class?

	is_integer_32: BOOLEAN
			-- Is current class the INTEGER_32 class?

	is_integer_8: BOOLEAN
			-- Is current class the INTEGER_8 class?

	is_integer_16: BOOLEAN
			-- Is current class the INTEGER_16 class?

	is_integer_64: BOOLEAN
			-- Is current class the INTEGER_64 class?

	is_natural_8: BOOLEAN
			-- Is current class the NATURAL_8 class?

	is_natural_16: BOOLEAN
			-- Is current class the NATURAL_16 class?

	is_natural_32: BOOLEAN
			-- Is current class the NATURAL_32 class?

	is_natural_64: BOOLEAN
			-- Is current class the NATURAL_64 class?

	is_real_32: BOOLEAN
			-- Is current class the REAL_32 class?

	is_real_64: BOOLEAN
			-- Is current class the REAL_64 class?

	is_pointer: BOOLEAN
			-- Is current class the POINTER class?

	is_special: BOOLEAN
			-- Is current class the SPECIAL class?

	is_none: BOOLEAN
			-- Is current class the NONE class?

	is_expanded: BOOLEAN
			-- Is current class expanded?
		do
			Result := ((flags & storable_constants.Eif_is_expanded_flag) = storable_constants.Eif_is_expanded_flag)
		end

	is_declared_expanded: BOOLEAN
			-- Is associated Eiffel class declared expanded?
		do
			Result := ((flags & storable_constants.Eif_is_declared_expanded_flag) = storable_constants.Eif_is_declared_expanded_flag)
		end

	is_frozen: BOOLEAN
			-- Is current class frozen?

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current class considered less than `other'?
		do
			Result := name < other.name
		end

feature -- Access

	name: STRING
			-- Name of current class

	full_name: STRING
			-- Name of current class with its formal generic parameters
		local
			i, nb: INTEGER
		do
			nb := formal_parameters.count
			if nb = 0 then
				if is_expanded then
					if is_declared_expanded then
						if is_frozen then
							create Result.make (name.count + 7)
							Result.append_string ("frozen ")
							Result.append_string (name)
						else
							Result := name
						end
					else
						if is_frozen then
							create Result.make (name.count + 16)
							Result.append_string ("frozen ")
						else
							create Result.make (name.count + 9)
						end
						Result.append_string ("expanded ")
						Result.append_string (name)
					end
				else
					if is_declared_expanded then
						if is_frozen then
							create Result.make (name.count + 17)
							Result.append_string ("frozen ")
						else
							create Result.make (name.count + 10)
						end
						Result.append_string ("reference ")
						Result.append_string (name)
					elseif is_frozen then
						create Result.make (name.count + 7)
						Result.append_string ("frozen ")
						Result.append_string (name)
					else
						Result := name
					end
				end
			else
				create Result.make (30)
				if is_frozen then
					Result.append_string ("frozen ")
				end
				if is_expanded then
					if not is_declared_expanded then
						Result.append_string ("expanded ")
					end
				elseif is_declared_expanded then
					Result.append_string ("reference ")
				end
				Result.append_string (name)
				Result.append_character (' ')
				Result.append_character ('[')
				Result.append_string (formal_parameters.item (1).name)
				from i := 2 until i > nb loop
					Result.append_character (',')
					Result.append_character (' ')
					Result.append_string (formal_parameters.item (i).name)
					i := i + 1
				end
				Result.append_character (']')
			end
		ensure
			full_name_not_void: Result /= Void
		end

	index: INTEGER
			-- Index in schema
			-- (int16)

	flags: NATURAL_32
			-- Class flags
			-- (int32)

	storable_version: detachable STRING
			-- Storable version

	formal_parameters: SB_TYPE_LIST
			-- Formal generic parameters

	attributes: SB_ATTRIBUTE_LIST
			-- Attributes

	class_type: SB_CLASS_TYPE
			-- Class type associated with current class;
			-- Return a new object at each call if current
			-- class has formal generic parameters, always
			-- return the same object otherwise
		do
			if is_unknown then
					-- Not cached.
				create Result.make (Current)
			elseif formal_parameters.is_empty then
				if attached cached_class_type as l_cached_class_type then
					Result := l_cached_class_type
				else
					create Result.make (Current)
					cached_class_type := Result
				end
			else
				create Result.make (Current)
			end
		ensure
			class_type_not_void: Result /= Void
		end

	attached_class_type: SB_CLASS_TYPE
			-- Attached class type associated with current class;
			-- Return a new object at each call if current
			-- class has formal generic parameters, always
			-- return the same object otherwise
		do
			if is_unknown then
					-- Not cached.
				create Result.make (Current)
			elseif formal_parameters.is_empty then
				if attached cached_attached_class_type as l_cached_attached_class_type then
					Result := l_cached_attached_class_type
				else
					create Result.make (Current)
					cached_attached_class_type := Result
				end
			else
				create Result.make (Current)
			end
			Result.set_attached (True)
		ensure
			attached_class_type_not_void: Result /= Void
		end

	detachable_class_type: SB_CLASS_TYPE
			-- Detachable class type associated with current class;
			-- Return a new object at each call if current
			-- class has formal generic parameters, always
			-- return the same object otherwise
		do
			if is_unknown then
					-- Not cached.
				create Result.make (Current)
			elseif formal_parameters.is_empty then
				if attached cached_detachable_class_type as l_cached_detachable_class_type then
					Result := l_cached_detachable_class_type
				else
					create Result.make (Current)
					cached_detachable_class_type := Result
				end
			else
				create Result.make (Current)
			end
			Result.set_detachable (True)
		ensure
			detachable_class_type_not_void: Result /= Void
		end

	class_type_template: SB_CLASS_TYPE
			-- Class type associated with current class
			-- (Does not have actual generic parameters even when current class is generic.)
		do
			if attached cached_class_type as l_cached_class_type then
				Result := l_cached_class_type
			else
				create Result.make (Current)
				cached_class_type := Result
			end
		end

	attached_class_type_template: SB_CLASS_TYPE
			-- Attached class type associated with current class
			-- (Does not have actual generic parameters even when current class is generic.)
		do
			if attached cached_attached_class_type as l_cached_attached_class_type then
				Result := l_cached_attached_class_type
			else
				create Result.make (Current)
				Result.set_attached (True)
				cached_attached_class_type := Result
			end
		end

	detachable_class_type_template: SB_CLASS_TYPE
			-- Detachable class type associated with current class
			-- (Does not have actual generic parameters even when current class is generic.)
		do
			if attached cached_detachable_class_type as l_cached_detachable_class_type then
				Result := l_cached_detachable_class_type
			else
				create Result.make (Current)
				Result.set_detachable (True)
				cached_detachable_class_type := Result
			end
		end

	tuple_type_template (an_actual_count: INTEGER): SB_TUPLE_TYPE
			-- Tuple type associated with current tuple class, with `an_actual_count' actual paramaters
			-- (Does not have actual generic parameters even when current class is generic.)
		require
			an_actual_count_not_negative: an_actual_count >= 0
		local
			l_tuple_type_templates: like tuple_type_templates
		do
			l_tuple_type_templates := tuple_type_templates
			if l_tuple_type_templates = Void then
				create l_tuple_type_templates.make_map (10)
				tuple_type_templates := l_tuple_type_templates
			end
			l_tuple_type_templates.search (an_actual_count)
			if l_tuple_type_templates.found then
				Result := l_tuple_type_templates.found_item
			else
				create Result.make (Current, an_actual_count)
				l_tuple_type_templates.force_last (Result, an_actual_count)
			end
		ensure
			tuple_type_template_not_void: Result /= Void
		end

	attached_tuple_type_template (an_actual_count: INTEGER): SB_TUPLE_TYPE
			-- Attached tuple type associated with current tuple class, with `an_actual_count' actual paramaters
			-- (Does not have actual generic parameters even when current class is generic.)
		require
			an_actual_count_not_negative: an_actual_count >= 0
		local
			l_attached_tuple_type_templates: like attached_tuple_type_templates
		do
			l_attached_tuple_type_templates := attached_tuple_type_templates
			if l_attached_tuple_type_templates = Void then
				create l_attached_tuple_type_templates.make_map (10)
				attached_tuple_type_templates := l_attached_tuple_type_templates
			end
			l_attached_tuple_type_templates.search (an_actual_count)
			if l_attached_tuple_type_templates.found then
				Result := l_attached_tuple_type_templates.found_item
			else
				create Result.make (Current, an_actual_count)
				Result.set_attached (True)
				l_attached_tuple_type_templates.force_last (Result, an_actual_count)
			end
		ensure
			attached_tuple_type_template_not_void: Result /= Void
		end

	detachable_tuple_type_template (an_actual_count: INTEGER): SB_TUPLE_TYPE
			-- Detachable tuple type associated with current tuple class, with `an_actual_count' actual paramaters
			-- (Does not have actual generic parameters even when current class is generic.)
		require
			an_actual_count_not_negative: an_actual_count >= 0
		local
			l_detachable_tuple_type_templates: like detachable_tuple_type_templates
		do
			l_detachable_tuple_type_templates := detachable_tuple_type_templates
			if l_detachable_tuple_type_templates = Void then
				create l_detachable_tuple_type_templates.make_map (10)
				detachable_tuple_type_templates := l_detachable_tuple_type_templates
			end
			l_detachable_tuple_type_templates.search (an_actual_count)
			if l_detachable_tuple_type_templates.found then
				Result := l_detachable_tuple_type_templates.found_item
			else
				create Result.make (Current, an_actual_count)
				Result.set_detachable (True)
				l_detachable_tuple_type_templates.force_last (Result, an_actual_count)
			end
		ensure
			detachable_tuple_type_template_not_void: Result /= Void
		end

	class_type_derivations: detachable DS_ARRAYED_LIST [SB_CLASS_TYPE]
			-- Class type generic derivations

	tuple_type_derivations: detachable DS_ARRAYED_LIST [SB_TUPLE_TYPE]
			-- Tuple type generic derivations

feature -- Measurement

	instance_count: INTEGER
			-- Number of instances

feature -- Element change

	add_class_type_derivation (a_type: SB_CLASS_TYPE)
			-- Add `a_type' to `class_type_derivations'.
		require
			a_type_not_void: a_type /= Void
			valid_type: a_type.storable_class = Current
		local
			l_class_type_derivations: like class_type_derivations
		do
			l_class_type_derivations := class_type_derivations
			if l_class_type_derivations = Void then
				create l_class_type_derivations.make (10)
				class_type_derivations := l_class_type_derivations
			end
			l_class_type_derivations.force_last (a_type)
		end

	add_tuple_type_derivation (a_type: SB_TUPLE_TYPE)
			-- Add `a_type' to `tuple_type_derivations'.
		require
			a_type_not_void: a_type /= Void
			valid_type: a_type.storable_class = Current
		local
			l_tuple_type_derivations: like tuple_type_derivations
		do
			l_tuple_type_derivations := tuple_type_derivations
			if l_tuple_type_derivations = Void then
				create l_tuple_type_derivations.make (50)
				tuple_type_derivations := l_tuple_type_derivations
			end
			l_tuple_type_derivations.force_last (a_type)
		end

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			is_boolean := False
			is_character_8 := False
			is_character_32 := False
			is_integer_8 := False
			is_integer_16 := False
			is_integer_32 := False
			is_integer_64 := False
			is_natural_8 := False
			is_natural_16 := False
			is_natural_32 := False
			is_natural_64 := False
			is_real_32 := False
			is_real_64 := False
			is_pointer := False
			is_special := False
			is_none := False
			if has_name (storable_constants.none_class_name) then
				is_none := True
			elseif has_name (storable_constants.special_class_name) then
				is_special := True
			elseif not is_expanded then
				-- Basic types are expanded.
			elseif has_name (storable_constants.boolean_class_name) then
				is_boolean := True
			elseif has_name (storable_constants.character_8_class_name) then
				is_character_8 := True
			elseif has_name (storable_constants.character_32_class_name) then
				is_character_32 := True
			elseif has_name (storable_constants.integer_8_class_name) then
				is_integer_8 := True
			elseif has_name (storable_constants.integer_16_class_name) then
				is_integer_16 := True
			elseif has_name (storable_constants.integer_32_class_name) then
				is_integer_32 := True
			elseif has_name (storable_constants.integer_64_class_name) then
				is_integer_64 := True
			elseif has_name (storable_constants.natural_8_class_name) then
				is_natural_8 := True
			elseif has_name (storable_constants.natural_16_class_name) then
				is_natural_16 := True
			elseif has_name (storable_constants.natural_32_class_name) then
				is_natural_32 := True
			elseif has_name (storable_constants.natural_64_class_name) then
				is_natural_64 := True
			elseif has_name (storable_constants.real_32_class_name) then
				is_real_32 := True
			elseif has_name (storable_constants.real_64_class_name) then
				is_real_64 := True
			elseif has_name (storable_constants.pointer_class_name) then
				is_pointer := True
			end
		ensure
			name_set: name = a_name
		end

	set_flags (a_flags: NATURAL_32)
			-- Set `a_flags' to `flags'.
		do
			flags := a_flags
				-- Force the detection of basic types again.
			set_name (name)
		ensure
			flags_set: flags = a_flags
		end

	set_storable_version (a_storable_version: like storable_version)
			-- Set `storable_version' to `a_storable_version'.
		do
			storable_version := a_storable_version
		ensure
			storable_version_set: storable_version = a_storable_version
		end

	set_formal_parameters (a_parameters: like formal_parameters)
			-- Set `formal_parameters' to `a_parameters'.
		require
			a_parameters_not_void: a_parameters /= Void
		do
			formal_parameters := a_parameters
		ensure
			formal_parameters_set: formal_parameters = a_parameters
		end

	set_attributes (an_attributes: like attributes)
			-- Set `attributes' to `an_attributes'.
		require
			an_attributes_not_void: an_attributes /= Void
		do
			attributes := an_attributes
		ensure
			attributes_set: attributes = an_attributes
		end

	set_instance_count (i: INTEGER)
			-- Set `instance_count' to `i'.
		require
			i_positive: i >= 0
		do
			instance_count := i
			if instance_count > 0 then
				set_visible (True)
			end
		ensure
			instance_count_set: instance_count = i
		end

	set_index (i: INTEGER)
			-- Set `index' to `i'.
		do
			index := i
		ensure
			index_set: index = i
		end

feature -- Status setting

	set_added (b: BOOLEAN)
			-- Set `is_added' to `b'.
		do
			is_added := b
		ensure
			is_added_set: is_added = b
		end

	set_removed (b: BOOLEAN)
			-- Set `is_removed' to `b'.
		do
			is_removed := b
		ensure
			is_removed_set: is_removed = b
		end

	set_visible (b: BOOLEAN)
			-- Set `is_visible' to `b'.
		require
			no_instances: not b implies instance_count = 0
		do
			is_visible := b
		ensure
			is_visible_set: is_visible = b
		end

	set_boolean (b: BOOLEAN)
			-- Set `is_boolean' to `b'.
		do
			is_boolean := b
		ensure
			is_boolean_set: is_boolean = b
		end

	set_character_8 (b: BOOLEAN)
			-- Set `is_character_8' to `b'.
		do
			is_character_8 := b
		ensure
			is_character_8_set: is_character_8 = b
		end

	set_character_32 (b: BOOLEAN)
			-- Set `is_character_32' to `b'.
		do
			is_character_32 := b
		ensure
			is_character_32_set: is_character_32 = b
		end

	set_integer_32 (b: BOOLEAN)
			-- Set `is_integer_32' to `b'.
		do
			is_integer_32 := b
		ensure
			is_integer_32_set: is_integer_32 = b
		end

	set_integer_8 (b: BOOLEAN)
			-- Set `is_integer_8' to `b'.
		do
			is_integer_8 := b
		ensure
			is_integer_8_set: is_integer_8 = b
		end

	set_integer_16 (b: BOOLEAN)
			-- Set `is_integer_16' to `b'.
		do
			is_integer_16 := b
		ensure
			is_integer_16_set: is_integer_16 = b
		end

	set_integer_64 (b: BOOLEAN)
			-- Set `is_integer_64' to `b'.
		do
			is_integer_64 := b
		ensure
			is_integer_64_set: is_integer_64 = b
		end

	set_natural_8 (b: BOOLEAN)
			-- Set `is_natural_8' to `b'.
		do
			is_natural_8 := b
		ensure
			is_natural_8_set: is_natural_8 = b
		end

	set_natural_16 (b: BOOLEAN)
			-- Set `is_natural_16' to `b'.
		do
			is_natural_16 := b
		ensure
			is_natural_16_set: is_natural_16 = b
		end

	set_natural_32 (b: BOOLEAN)
			-- Set `is_natural_32' to `b'.
		do
			is_natural_32 := b
		ensure
			is_natural_32_set: is_natural_32 = b
		end

	set_natural_64 (b: BOOLEAN)
			-- Set `is_natural_64' to `b'.
		do
			is_natural_64 := b
		ensure
			is_natural_64_set: is_natural_64 = b
		end

	set_real_32 (b: BOOLEAN)
			-- Set `is_real_32' to `b'.
		do
			is_real_32 := b
		ensure
			is_real_32_set: is_real_32 = b
		end

	set_real_64 (b: BOOLEAN)
			-- Set `is_real_64' to `b'.
		do
			is_real_64 := b
		ensure
			is_real_64_set: is_real_64 = b
		end

	set_pointer (b: BOOLEAN)
			-- Set `is_pointer' to `b'.
		do
			is_pointer := b
		ensure
			is_pointer_set: is_pointer = b
		end

	set_none (b: BOOLEAN)
			-- Set `is_none' to `b'.
		do
			is_none := b
		ensure
			is_none_set: is_none = b
		end

	set_expanded (b: BOOLEAN)
			-- Set `is_expanded' to `b'.
		do
			if b then
				flags := flags | storable_constants.Eif_is_expanded_flag
			else
				flags := flags & (storable_constants.Eif_is_expanded_flag.bit_not)
			end
				-- Force the detection of basic types again.
			set_name (name)
		ensure
			is_expanded_set: is_expanded = b
		end

	set_declared_expanded (b: BOOLEAN)
			-- Set `is_declared_expanded' to `b'.
		do
			if b then
				flags := flags | storable_constants.Eif_is_declared_expanded_flag
			else
				flags := flags & (storable_constants.Eif_is_declared_expanded_flag.bit_not)
			end
				-- Force the detection of basic types again.
			set_name (name)
		ensure
			is_declared_expanded_set: is_declared_expanded = b
		end

	set_frozen (b: BOOLEAN)
			-- Set `is_frozen' to `b'.
		do
			is_frozen := b
		ensure
			frozen_set: is_frozen = b
		end

feature -- Renaming

	rename_attribute (old_name, new_name: STRING)
			-- Rename attribute `old_name' as `new_name'.
		require
			old_name_not_void: old_name /= Void
			old_name_not_empty: not old_name.is_empty
			new_name_not_void: new_name /= Void
			new_name_not_empty: not new_name.is_empty
		local
			l_attribute: SB_ATTRIBUTE
		do
			l_attribute := attributes.attribute_by_name (old_name)
			if l_attribute /= Void then
				l_attribute.set_name (new_name)
			end
		end

feature -- Initialization

	reset
			-- Reset current class.
		do
			set_added (False)
			set_removed (False)
			set_visible (instance_count > 0)
			attributes.reset
		end

feature -- Comparison

	same_class (other: SB_CLASS): BOOLEAN
			-- Are current class and `other' the same class?
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			other_parameters: like formal_parameters
		do
			if not is_unknown and not other.is_unknown then
				if (is_expanded = other.is_expanded) and (is_frozen = other.is_frozen) and has_name (other.name) then
					other_parameters := other.formal_parameters
					nb := other_parameters.count
					if formal_parameters.count = nb then
						Result := True
						from i := 1 until i > nb loop
							if not formal_parameters.item (i).same_storable_type (other_parameters.item (i)) then
								Result := False
								i := nb + 1 -- Jump out of the loop.
							else
								i := i + 1
							end
						end
					end
				end
			end
		end

feature -- Output

	print_class (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current class to `a_file' in
			-- a human readable format.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
		do
			a_file.put_string ("Class ")
			if is_frozen then
				a_file.put_string ("frozen ")
			end
			if is_expanded then
				if not is_declared_expanded then
					a_file.put_string ("expanded ")
				end
			elseif is_declared_expanded then
				a_file.put_string ("reference ")
			end
			a_file.put_string (name)
			nb := formal_parameters.count
			if nb > 0 then
				a_file.put_character (' ')
				a_file.put_character ('[')
				formal_parameters.item (1).print_type (a_file)
				from i := 2 until i > nb loop
					a_file.put_character (',')
					a_file.put_character (' ')
					formal_parameters.item (i).print_type (a_file)
					i := i + 1
				end
				a_file.put_character (']')
			end
			a_file.put_new_line
			nb := attributes.count
			from i := 1 until i > nb loop
				a_file.put_string ("    ")
				attributes.item (i).print_attribute (a_file)
				a_file.put_new_line
				i := i + 1
			end
			a_file.put_new_line
		end

feature {NONE} -- Implementation

	cached_class_type: detachable SB_CLASS_TYPE
			-- Cached class type

	cached_attached_class_type: detachable SB_CLASS_TYPE
			-- Cached attached class type

	cached_detachable_class_type: detachable SB_CLASS_TYPE
			-- Cached detachable class type

	tuple_type_templates: detachable DS_HASH_TABLE [SB_TUPLE_TYPE, INTEGER]
			-- Templates for tuple types

	attached_tuple_type_templates: detachable DS_HASH_TABLE [SB_TUPLE_TYPE, INTEGER]
			-- Templates for attached tuple types

	detachable_tuple_type_templates: detachable DS_HASH_TABLE [SB_TUPLE_TYPE, INTEGER]
			-- Templates for detachable tuple types

invariant

	name_not_void: name /= Void
	formal_parameters_not_void: formal_parameters /= Void
	attributes_not_void: attributes /= Void
	instance_count_non_negative: instance_count >= 0
	is_visible: instance_count > 0 implies is_visible
	class_type_template_not_void: class_type_template /= Void
	attached_class_type_template_not_void: attached_class_type_template /= Void
	detachable_class_type_template_not_void: detachable_class_type_template /= Void

end

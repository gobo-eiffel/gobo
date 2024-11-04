note

	description:

		"ECF Groups of Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ECF_GROUP

inherit

	ET_ECF_CONDITIONED

feature -- Status report

	is_read_only: BOOLEAN
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe?
		deferred
		end

feature -- Access

	name: STRING
			-- Name
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

	lower_name: STRING
			-- Lower-name of group
			-- (May return the same object as `name' if already in lower case.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := name
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				if c >= 'A' and c <= 'Z' then
					Result := Result.as_lower
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			lower_name_not_void: Result /= Void
			lower_name_not_empty: Result.count > 0
			definition: Result.same_string (name.as_lower)
		end

	pathname: STRING
			-- Pathname
		deferred
		ensure
			pathname_not_void: Result /= Void
		end

	options: ET_ECF_OPTIONS
			-- Options

	class_options: detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			-- Class options, indexed by class names in upper-case
			-- (may be Void)

	options_for_class (a_class: ET_CLASS): ET_ECF_OPTIONS
			-- Options applicable to `a_class'
		local
			l_upper_name: STRING
		do
			Result := options
			if attached class_options as l_class_options then
				l_upper_name := a_class.upper_name
				l_class_options.search (l_upper_name)
				if l_class_options.found then
					Result := l_class_options.found_item
				end
			end
		ensure
			options_for_class_not_void: Result /= Void
		end

	classname_prefix: detachable STRING
			-- Prefix for class names when using classes of current group
			-- (may be Void)
		deferred
		end

	class_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			-- Class renaming, indexed by old class names in upper-case,
			-- when using classes of current group
			-- (may be Void)
		deferred
		end

	description: detachable STRING
			-- Description

	notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			-- Notes

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Surrounding universe
		deferred
		ensure
			universe_not_void: Result /= Void
		end

	target: ET_ECF_TARGET
			-- Target where current group has been declared

feature -- Setting

	set_class_options (a_class_options: like class_options)
			-- Set `options' to `a_class_options'.
		require
			no_void_class_option_name: a_class_options /= Void implies not a_class_options.has_void
			no_void_class_option: a_class_options /= Void implies not a_class_options.has_void_item
		do
			class_options := a_class_options
			if a_class_options /= Void then
				across a_class_options as l_options loop
					l_options.set_secondary_options (options)
				end
			end
		ensure
			class_options_set: class_options = a_class_options
		end

	set_description (a_description: like description)
			-- Set `description' to `a_description'.
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

	set_notes (a_notes: like notes)
			-- Set `notes' to `a_notes'.
		require
			no_void_note: a_notes /= Void implies not a_notes.has_void
		do
			notes := a_notes
		ensure
			notes_set: notes = a_notes
		end

	fill_options (a_class: ET_CLASS)
			-- Fill `a_class' with option information.
		require
			a_class_not_vod: a_class /= Void
		local
			l_options: ET_ECF_OPTIONS
			l_value: detachable STRING
		do
			l_options := options_for_class (a_class)
			l_value := l_options.assertion_value ({ET_ECF_OPTION_NAMES}.assertions_precondition_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_class.set_preconditions_enabled (l_value.to_boolean)
			end
			l_value := l_options.assertion_value ({ET_ECF_OPTION_NAMES}.assertions_supplier_precondition_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_class.set_supplier_preconditions_enabled (l_value.to_boolean)
			end
			l_value := l_options.assertion_value ({ET_ECF_OPTION_NAMES}.assertions_postcondition_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_class.set_postconditions_enabled (l_value.to_boolean)
			end
			l_value := l_options.assertion_value ({ET_ECF_OPTION_NAMES}.assertions_invariant_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_class.set_invariants_enabled (l_value.to_boolean)
			end
			l_value := l_options.assertion_value ({ET_ECF_OPTION_NAMES}.assertions_check_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_class.set_check_assertions_enabled (l_value.to_boolean)
			end
			l_value := l_options.assertion_value ({ET_ECF_OPTION_NAMES}.assertions_loop_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_class.set_loop_assertions_enabled (l_value.to_boolean)
			end
		end

invariant

	no_void_old_class_renamings: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void
	no_void_new_class_renamings: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void_item
	no_void_class_option_name: attached class_options as l_class_options implies not l_class_options.has_void
	no_void_class_option: attached class_options as l_class_options implies not l_class_options.has_void_item
	no_void_note: attached notes as l_notes implies not l_notes.has_void
	target_not_void: target /= Void
	options_not_void: options /= Void

end

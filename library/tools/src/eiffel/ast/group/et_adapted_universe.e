note

	description:

		"Eiffel adapted class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ADAPTED_UNIVERSE

feature {NONE} -- Initialization

	make (a_name: STRING; a_universe: like universe)
			-- Create a new adapted view of `a_universe'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			universe := a_universe
			is_read_only := default_read_only_value
		ensure
			name_set: name = a_name
			universe_set: universe = a_universe
		end

feature -- Status report

	is_read_only: BOOLEAN
			-- Is current adapted universe a read-only universe?
			-- In other words, are changes in this universe and in its classes
			-- not taken into account when repreparsing or reparsing
			-- universes depending on it?

feature -- Access

	name: STRING
			-- Name of universe

	lower_name: STRING
			-- Lower-name of universe
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

	classname_prefix: detachable STRING
			-- Prefix for class names when exporting classes of `universe'
			-- (may be Void)

	class_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			-- Class renaming, indexed by old class names in upper-case, when exporting classes of `universe'
			-- (may be Void)

	universe: ET_UNIVERSE
			-- Eiffel class universe being adapted

feature -- Setting

	set_name (a_name: STRING)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Status setting

	set_read_only (b: BOOLEAN)
			-- Set `is_read_only' to `b'.
		do
			is_read_only := b
		ensure
			read_only_set: is_read_only = b
		end

	propagate_read_only
			-- Propagate the read-only status to `universe'.
		do
			universe.set_read_only (is_read_only)
		end

feature -- Setting

	set_classname_prefix (a_prefix: like classname_prefix)
			-- Set `classname_prefix' to `a_prefix'.
		do
			classname_prefix := a_prefix
		ensure
			classname_prefix_set: classname_prefix = a_prefix
		end

	set_class_renamings (a_renamings: like class_renamings)
			-- Set `class_renamings' to `a_renamings'.
		require
			no_void_old_class_renaming: a_renamings /= Void implies not a_renamings.has_void
			no_void_new_class_renaming: a_renamings /= Void implies not a_renamings.has_void_item
		do
			class_renamings := a_renamings
		ensure
			class_renamings_set: class_renamings = a_renamings
		end

feature -- Exporting classes

	export_classes (other_universe: ET_UNIVERSE)
			-- Export non-hidden classes locally declared in `universe'
			-- so that they can be used in classes of `other_universe'.
			-- Note that mapped classes are also exported, provided that
			-- the classes they are mapped to is also declared in
			-- `universe'.
		require
			other_universe_not_void: other_universe /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
			l_class: ET_MASTER_CLASS
			l_other_class: ET_MASTER_CLASS
			l_class_name: ET_CLASS_NAME
			l_old_class_name: STRING
			l_actual_intrinsic_class: ET_CLASS
		do
			l_cursor := universe.master_classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				l_actual_intrinsic_class := l_class.actual_intrinsic_class
				if l_actual_intrinsic_class.universe /= universe then
						-- Do not export classes not declared locally.
				elseif l_actual_intrinsic_class.group.is_hidden then
						-- Do not export classes in hidden groups.
				else
						-- Take into account class renaming and classname prefix.
					l_class_name := l_cursor.key
					l_old_class_name := l_class_name.upper_name
					if attached class_renamings as l_class_renamings and then l_class_renamings.has (l_old_class_name) then
						create {ET_IDENTIFIER} l_class_name.make (l_class_renamings.item (l_old_class_name))
					elseif attached classname_prefix as l_classname_prefix then
						create {ET_IDENTIFIER} l_class_name.make (l_classname_prefix + l_old_class_name)
					end
					l_other_class := other_universe.master_class (l_class_name)
					if not l_other_class.has_imported_class (l_class) then
						l_other_class.add_last_imported_class (l_class)
					end
				end
				l_cursor.forth
			end
		end

feature {NONE} -- Constants

	default_read_only_value: BOOLEAN
			-- Default value for `is_read_only'
		once
			Result := True
		end

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	no_void_old_class_renaming: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void
	no_void_new_class_renaming: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void_item
	universe_not_void: universe /= Void

end

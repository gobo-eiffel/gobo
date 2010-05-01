note

	description:

		"Eiffel adapted class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ADAPTED_UNIVERSE

feature {NONE} -- Initialization

	make (a_name: STRING; a_universe: like universe) is
			-- Create a new adapted view of `a_universe'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			universe := a_universe
		ensure
			name_set: name = a_name
			universe_set: universe = a_universe
		end

feature -- Access

	name: STRING
			-- Name of universe

	lower_name: STRING is
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

	classname_prefix: STRING
			-- Prefix for class names when exporting classes of `universe'
			-- (may be Void)

	class_renamings: DS_HASH_TABLE [STRING, STRING]
			-- Class renaming, indexed by old class names in upper-case, when exporting classes of `universe'
			-- (may be Void)

	universe: ET_UNIVERSE
			-- Eiffel class universe being adapted

feature -- Setting

	set_classname_prefix (a_prefix: like classname_prefix) is
			-- Set `classname_prefix' to `a_prefix'.
		do
			classname_prefix := a_prefix
		ensure
			classname_prefix_set: classname_prefix = a_prefix
		end

	set_class_renamings (a_renamings: like class_renamings) is
			-- Set `class_renamings' to `a_renamings'.
		require
			no_void_old_class_renamings: a_renamings /= Void implies not a_renamings.has (Void)
			no_void_new_class_renamings: a_renamings /= Void implies not a_renamings.has_item (Void)
		do
			class_renamings := a_renamings
		ensure
			class_renamings_set: class_renamings = a_renamings
		end

feature -- Exporting classes

	export_classes (other_universe: ET_UNIVERSE) is
			-- Export non-hidden classes locally declared in `universe'
			-- so that they can be used in classes of `other_universe'.
		require
			other_universe_not_void: other_universe /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
			l_class: ET_MASTER_CLASS
			l_other_class: ET_MASTER_CLASS
			l_class_name: ET_CLASS_NAME
			l_old_class_name: STRING
		do
			l_cursor := universe.master_classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.is_mapped then
						-- Do not export mapped classes.
						-- They will be exported under their actual name.
				elseif l_class.actual_intrinsic_class.universe = universe then
						-- Take into account class renaming and classname prefix.
					l_class_name := l_cursor.key
					l_old_class_name := l_class_name.upper_name
					if class_renamings /= Void and then class_renamings.has (l_old_class_name) then
						create {ET_IDENTIFIER} l_class_name.make (class_renamings.item (l_old_class_name))
					elseif classname_prefix /= Void then
						create {ET_IDENTIFIER} l_class_name.make (classname_prefix + l_old_class_name)
					end
					l_other_class := other_universe.master_class (l_class_name)
					if not l_other_class.has_imported_class (l_class) then
						l_other_class.add_last_imported_class (l_class)
					end
				end
				l_cursor.forth
			end
		end

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	no_void_old_class_renamings: class_renamings /= Void implies not class_renamings.has (Void)
	no_void_new_class_renamings: class_renamings /= Void implies not class_renamings.has_item (Void)
	universe_not_void: universe /= Void

end

note

	description:

		"ECF .Net namespaces"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_NAMESPACE

create

	make

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new namespace.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- Name

	classname_prefix: detachable STRING
			-- Prefix for class names
			-- (may be Void)

	class_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			-- Class renaming, indexed by old class names in upper-case
			-- (may be Void)

	description: detachable STRING
			-- Description

	notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			-- Notes

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

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	no_void_old_class_renaming: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void
	no_void_new_class_renaming: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void_item
	no_void_note: attached notes as l_notes implies not l_notes.has_void

end

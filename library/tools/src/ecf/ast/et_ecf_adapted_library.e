note

	description:

		"ECF Eiffel adapted class libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ADAPTED_LIBRARY

inherit

	ET_ADAPTED_LIBRARY
		rename
			make as make_adapted_library
		undefine
			lower_name
		end

	ET_ECF_GROUP

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: ET_IDENTIFIER; a_universe: like universe)
			-- Create a new ECF adapted library.
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			name_id := a_name
			filename_id := a_filename
			universe := a_universe
			make_adapted_library (a_name.name, tokens.unknown_library)
		ensure
			name_id_set: name_id = a_name
			name_set: name = a_name.name
			filename_id_set: filename_id = a_filename
			universe_set: universe = a_universe
		end

feature -- Status report

	use_application_options: BOOLEAN
			-- Should options defined at the application level be used?

feature -- Access

	name_id: ET_IDENTIFIER
			-- Name identifier

	filename_id: ET_IDENTIFIER
			-- ECF filename

	pathname: STRING
			-- Pathname
		do
			Result := filename_id.name
		ensure then
			definition: Result = filename_id.name
		end

	visible_classes: detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			-- Classes and features accessible from other languages

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- ECF universe containing the current reference to `library'

feature -- Status setting

	set_use_application_options (b: BOOLEAN)
			-- Set `use_application_options' to `b'.
		do
			use_application_options := b
		ensure
			use_application_options_set: use_application_options = b
		end

feature -- Setting

	set_library (a_library: like library)
			-- Set `library' to `a_library'.
		require
			a_library_not_void: a_library /= Void
		do
			library := a_library
		ensure
			library_set: library = a_library
		end

	set_visible_classes (a_visible_classes: like visible_classes)
			-- Set `visible_classes' to `a_visible_classes'.
		require
			no_void_visible_class: a_visible_classes /= Void implies not a_visible_classes.has_void
		do
			visible_classes := a_visible_classes
		ensure
			visible_classes_set: visible_classes = a_visible_classes
		end

invariant

	name_id_not_void: name_id /= Void
	filename_id_not_void: filename_id /= Void
	universe_not_void: universe /= Void
	no_void_visible_class: attached visible_classes as l_visible_classes implies not l_visible_classes.has_void

end

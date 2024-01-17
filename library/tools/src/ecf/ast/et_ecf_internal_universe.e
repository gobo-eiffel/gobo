note

	description:

		"ECF Eiffel internal universes (i.e. either systems or libraries)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ECF_INTERNAL_UNIVERSE

inherit

	ET_INTERNAL_UNIVERSE
		redefine
			name,
			is_read_only,
			universe
		end

	ET_ECF_SYSTEM_CONFIG
		rename
			make as make_system_config
		undefine
			set_read_only,
			set_name
		redefine
			name,
			is_read_only,
			universe
		end

feature {NONE} -- Initialization

	make (a_name, a_filename: STRING)
			-- Create a new ECF universe.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_filename_not_void: a_filename /= Void
		do
			name := a_name
			filename := a_filename
			universe := Current
		ensure
			name_set: name = a_name
			filename_set: filename = a_filename
		end

feature -- Status report

	is_read_only: BOOLEAN
			-- Is current universe a read-only universe?
			-- In other words, are changes in this universe and in its classes
			-- not taken into account when repreparsing or reparsing
			-- universes depending on it?

feature -- Access

	name: STRING
			-- Name of universe

	selected_target: detachable ET_ECF_TARGET
			-- Selected target

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Universe of current system config.
			-- It might be different from the current system config itself when
			-- using parent targets with an 'extension_location' attribute.

feature -- Setting

	select_target (a_target: ET_ECF_TARGET)
			-- Select `a_target'.
			-- Update `clusters' and `libraries' accordingly.
		require
			not_selected_yet: selected_target = Void
			a_target_not_void: a_target /= Void
			valid_target: attached targets as l_targets and then l_targets.has (a_target)
		do
			selected_target := a_target
		ensure
			selected_target_set: selected_target = a_target
		end

invariant

	valid_selected_target: attached selected_target as l_selected_target implies (attached targets as l_targets and then l_targets.has (l_selected_target))

end

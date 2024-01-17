note

	description:

		"ECF system configurations (systems or libraries)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2019, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_SYSTEM_CONFIG

inherit

	ET_ECF_CONFIG

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: STRING; a_universe: like universe)
			-- Create a new ECF config.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			filename := a_filename
			universe := a_universe
		ensure
			name_set: name = a_name
			filename_set: filename = a_filename
			universe_set: universe = a_universe
		end

feature -- Status report

	is_read_only: BOOLEAN
			-- Is current system a read-only system?
			-- In other words, are changes in this system and in its classes
			-- not taken into account when repreparsing or reparsing
			-- universes depending on it?

feature -- Access

	name: STRING
			-- Name

	targets: detachable ET_ECF_TARGETS
			-- Targets that appear in the ECF file

	library_target: detachable ET_ECF_TARGET
			-- Library target, if any

	target_with_name (a_target_name: detachable STRING): detachable ET_ECF_TARGET
			-- Target with name `a_target_name'.
			-- Use last target found in `targets' if `a_target_name' is Void.
			-- Void if not such target is found.
		do
			if attached targets as l_targets and then not l_targets.is_empty then
				if a_target_name /= Void then
					Result := l_targets.target_by_name (a_target_name)
				else
						-- Use last target as default target.
					Result := l_targets.target (l_targets.count)
				end
			end
		end

	description: detachable STRING
			-- Description

	notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			-- Notes

feature -- Status setting

	set_read_only (b: BOOLEAN)
			-- Set `is_read_only' to `b'.
		do
			is_read_only := b
		ensure
			read_only_set: is_read_only = b
		end

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_targets (a_targets: like targets)
			-- Set `targets' to `a_targets'.
		do
			targets := a_targets
		ensure
			targets_set: targets = a_targets
		end

	set_library_target (a_target: like library_target)
			-- Set `library_target' to `a_target'.
		do
			library_target := a_target
		ensure
			library_target_set: library_target = a_target
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

feature -- Processing

	process (a_processor: ET_ECF_CONFIG_PROCESSOR)
			-- Process current config.
		do
			a_processor.process_system_config (Current)
		end

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	no_void_note: attached notes as l_notes implies not l_notes.has_void

end

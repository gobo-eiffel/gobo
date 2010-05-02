note

	description:

		"Lace Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_CLUSTER

inherit

	ET_CLUSTER
		redefine
			parent, subclusters,
			is_valid_eiffel_filename,
			is_valid_directory_name
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_id; a_pathname: like pathname_id; a_universe: ET_UNIVERSE)
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			name_id := a_name
			pathname_id := a_pathname
			is_relative := (a_pathname = Void)
			universe := a_universe
			set_scm_mapping_constraint_enabled (True)
		ensure
			name_id_set: name_id = a_name
			pathname_id_set: pathname_id = a_pathname
			universe_set: universe = a_universe
			is_relative: is_relative = (a_pathname = Void)
			scm_mapping_constraint_enabled: scm_mapping_constraint_enabled
		end

feature -- Access

	name: STRING
			-- Name
		do
			Result := name_id.name
		end

	pathname: STRING
			-- Directory pathname (may be Void)
		do
			if pathname_id /= Void then
				Result := pathname_id.name
			end
		end

	name_id: ET_IDENTIFIER
			-- Name identifier

	pathname_id: ET_IDENTIFIER
			-- Directory pathname identifier (may be Void)

feature -- Status report

	is_valid_eiffel_filename (a_filename: STRING): BOOLEAN
			-- Is `a_filename' an Eiffel filename which has
			-- not been excluded?
		do
			if precursor (a_filename) then
				if operating_system.is_windows then
					Result := (exclude = Void or else not exclude.has_case_insensitive (a_filename))
				else
					Result := (exclude = Void or else not exclude.has (a_filename))
				end
			end
		end

	is_valid_directory_name (a_dirname: STRING): BOOLEAN
			-- Is `a_dirname' a directory name other than "." and
			-- ".." and which has not been excluded?
		do
			if precursor (a_dirname) then
				if operating_system.is_windows then
					Result := (exclude = Void or else not exclude.has_case_insensitive (a_dirname))
				else
					Result := (exclude = Void or else not exclude.has (a_dirname))
				end
			end
		end

feature -- Nested

	parent: ET_LACE_CLUSTER
			-- Parent cluster

	subclusters: ET_LACE_CLUSTERS
			-- Subclusters

feature -- Options

	exclude: ET_LACE_EXCLUDE
			-- Exclude clause

feature -- Setting

	set_exclude (an_exclude: like exclude)
			-- Set `exclude' to `an_exclude'.
		do
			exclude := an_exclude
		ensure
			exclude_set: exclude = an_exclude
		end

feature -- Output

	print_flat_cluster (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print a flattened version of current cluster in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if not is_abstract then
				a_file.put_character ('%T')
				print_flat_name (a_file)
				a_file.put_string (": %"")
				a_file.put_string (full_pathname)
				a_file.put_string ("%"%N")
			end
			if subclusters /= Void then
				subclusters.print_flat_clusters (a_file)
			end
		end

	print_flat_name (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print a flattened version of current
			-- cluster's name in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if parent /= Void then
				parent.print_flat_name (a_file)
				a_file.put_character ('_')
			end
			a_file.put_string (name)
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current
			-- New recursive cluster
		local
			a_name_id: ET_IDENTIFIER
		do
			create a_name_id.make (a_name)
			a_name_id.set_position (name_id.line, name_id.column)
			create Result.make (a_name_id, Void, universe)
			Result.set_parent (Current)
			Result.set_recursive (True)
			Result.set_implicit (True)
			Result.set_override (is_override)
			Result.set_read_only (is_read_only)
			Result.set_use_obsolete_syntax (use_obsolete_syntax)
			Result.set_exclude (exclude)
		end

invariant

	name_id_not_void: name_id /= Void

end

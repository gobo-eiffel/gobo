indexing

	description:

		"Eiffel clusters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLUSTER

inherit

	KL_IMPORTED_INPUT_STREAM_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXECUTION_ENVIRONMENT

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname) is
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			pathname := a_pathname
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
		end

feature -- Status report

	is_abstract: BOOLEAN
			-- Is there no classes in current cluster?

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	pathname: ET_IDENTIFIER
			-- Directory pathname (may be Void)

	full_name: STRING is
			-- Full name
		local
			parent_name: STRING
			a_basename: STRING
		do
			if parent /= Void then
				parent_name := parent.full_name
				a_basename := name.name
				Result := STRING_.make (parent_name.count + a_basename.count + 1)
				Result.append_string (parent_name)
				Result.append_character ('.')
				Result.append_string (a_basename)
			else
				Result := name.name
			end
		ensure
			full_name_not_void: Result /= Void
		end

	full_pathname: STRING is
			-- Full directory pathname
		local
			parent_pathname: STRING
			a_basename: STRING
		do
			if pathname /= Void then
				Result := pathname.name
			elseif parent /= Void then
				parent_pathname := parent.full_pathname
				a_basename := name.name
				Result := STRING_.make (parent_pathname.count + a_basename.count + 1)
				Result.append_string (parent_pathname)
				Result.append_character ('/')
				Result.append_string (a_basename)
			else
				Result := name.name
			end
		ensure
			full_pathname_not_void: Result /= Void
		end

feature -- Nested

	parent: ET_CLUSTER
			-- Parent cluster

	subclusters: ET_CLUSTERS
			-- Subclusters

feature -- Status setting

	set_abstract (b: BOOLEAN) is
			-- Set `is_abstract' to `b'.
		do
			is_abstract := b
		ensure
			abstract_set: is_abstract = b
		end

feature -- Setting

	set_subclusters (a_subclusters: like subclusters) is
			-- Set `subclusters' to `a_subclusters'.
		do
			if subclusters /= Void then
				subclusters.set_parent (Void)
			end
			subclusters := a_subclusters
			if subclusters /= Void then
				subclusters.set_parent (Current)
			end
		ensure
			subclusters_set: subclusters = a_subclusters
		end

feature {ET_CLUSTERS} -- Setting

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Parsing

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all classes in cluster.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
		do
			if not is_abstract then
				dir_name := Execution_environment.interpreted_string (full_pathname)
				!! dir.make (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if s.count > 2 and then (s.item (s.count) = 'e' and s.item (s.count - 1) = '.') then
							a_filename := clone (dir_name)
							a_filename.append_character ('/')
							a_filename.append_string (s)
							a_file := INPUT_STREAM_.make_file_open_read (a_filename)
							if INPUT_STREAM_.is_open_read (a_file) then
								a_universe.parse_file (a_file, a_filename, Current)
								INPUT_STREAM_.close (a_file)
							else
							end
						end
						dir.read_entry
					end
					dir.close
				else
				end
			end
			if subclusters /= Void then
				subclusters.parse_all (a_universe)
			end
		end

feature -- Output

	print_flat_cluster (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print a flattened version of current cluster in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
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

	print_flat_name (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print a flattened version of current
			-- cluster's name in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			if parent /= Void then
				parent.print_flat_name (a_file)
				a_file.put_character ('_')
			end
			a_file.put_string (name.name)
		end

feature {ET_CLUSTERS} -- Implementation

	next: ET_CLUSTER
			-- Next cluster in universe

	set_next (a_cluster: like next) is
			-- Set `next' to `a_cluster'.
		do
			next := a_cluster
		ensure
			next_set: next = a_cluster
		end

invariant

	name_not_void: name /= Void

end -- class ET_CLUSTER

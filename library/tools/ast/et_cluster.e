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
	KL_SHARED_EXECUTION_ENVIRONMENT

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname) is
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_pathname_not_void: a_pathname /= Void
		do
			name := a_name
			pathname := a_pathname
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	pathname: ET_IDENTIFIER
			-- Directory pathname

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
			dir_name := Execution_environment.interpreted_string (pathname.name)
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
	pathname_not_void: pathname /= Void

end -- class ET_CLUSTER

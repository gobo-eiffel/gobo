indexing

	description:

		"Kernel test cases"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KL_TEST_CASE

inherit

	TS_TEST_CASE
	KL_SHARED_FILE_SYSTEM

feature -- Filenames

	new_filename (a_prefix, an_extension: STRING): STRING is
			-- New unique filename
		require
			a_prefix_not_void: a_prefix /= Void
			an_extension_not_void: an_extension /= Void
		local
			nb: INTEGER
		do
			nb := counter.item + 1
			counter.put (nb)
			Result := a_prefix + nb.out + an_extension
		ensure
			filename_not_void: Result /= Void
		end

	booleans_filename: STRING is
			-- Full filename of "booleans.txt"
		once
			Result := file_system.pathname_from ("$GOBO/test/kernel/data/booleans.txt", unix_file_system)
		ensure
			booleans_filename_not_void: Result /= Void
		end

	empty_filename: STRING is
			-- Full filename of "empty.txt"
		once
			Result := file_system.pathname_from ("$GOBO/test/kernel/data/empty.txt", unix_file_system)
		ensure
			empty_filename_not_void: Result /= Void
		end

	gobo_filename: STRING is
			-- Full filename of "gobo.txt"
		once
			Result := file_system.pathname_from ("$GOBO/test/kernel/data/gobo.txt", unix_file_system)
		ensure
			gobo_filename_not_void: Result /= Void
		end

	hello_filename: STRING is
			-- Full filename of "hello.txt"
		once
			Result := file_system.pathname_from ("$GOBO/test/kernel/data/hello.txt", unix_file_system)
		ensure
			hello_filename_not_void: Result /= Void
		end

	integers_filename: STRING is
			-- Full filename of "integers.txt"
		once
			Result := file_system.pathname_from ("$GOBO/test/kernel/data/integers.txt", unix_file_system)
		ensure
			integers_filename_not_void: Result /= Void
		end

feature -- Directory names

	new_dirname (a_prefix: STRING): STRING is
			-- New unique directory name
		require
			a_prefix_not_void: a_prefix /= Void
		local
			nb: INTEGER
		do
			nb := counter.item + 1
			counter.put (nb)
			Result := a_prefix + nb.out
		ensure
			dirname_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	counter: KL_CELL [INTEGER] is
			-- Filename counter
		once
			!! Result.make (0)
		ensure
			counter_not_void: Result /= Void
		end

end -- class KL_TEST_CASE

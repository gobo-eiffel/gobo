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
			Result := file_system.pathname (data_dirname, "booleans.txt")
		ensure
			booleans_filename_not_void: Result /= Void
		end

	empty_filename: STRING is
			-- Full filename of "empty.txt"
		once
			Result := file_system.pathname (data_dirname, "empty.txt")
		ensure
			empty_filename_not_void: Result /= Void
		end

	gobo_filename: STRING is
			-- Full filename of "gobo.txt"
		once
			Result := file_system.pathname (data_dirname, "gobo.txt")
		ensure
			gobo_filename_not_void: Result /= Void
		end

	hello_filename: STRING is
			-- Full filename of "hello.txt"
		once
			Result := file_system.pathname (data_dirname, "hello.txt")
		ensure
			hello_filename_not_void: Result /= Void
		end

	integers_filename: STRING is
			-- Full filename of "integers.txt"
		once
			Result := file_system.pathname (data_dirname, "integers.txt")
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

	data_dirname: STRING is
			-- Full directory name of "$GOBO/test/kernel/data"
		once
			Result := file_system.pathname (kernel_dirname, "data")
		ensure
			data_dirname_not_void: Result /= Void
		end

	kernel_dirname: STRING is
			-- Full directory name of "$GOBO/test/kernel"
		once
			Result := file_system.nested_pathname ("$GOBO", <<"test", "kernel">>)
		ensure
			kernel_dirname_not_void: Result /= Void
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

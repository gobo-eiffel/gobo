note

	description:

		"SED test cases"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

deferred class SED_TEST_CASE

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

feature -- Filenames

	new_filename (a_prefix, an_extension: STRING): STRING
			-- New unique filename
		require
			a_prefix_not_void: a_prefix /= Void
			an_extension_not_void: an_extension /= Void
		local
			nb: INTEGER
		do
			from
				nb := counter.item + 1
				counter.put (nb)
				Result := name + "_" + a_prefix + nb.out + an_extension
			until
				not file_system.file_exists (Result)
			loop
				nb := counter.item + 1
				counter.put (nb)
				Result := name + "_" + a_prefix + nb.out + an_extension
			end
		ensure
			filename_not_void: Result /= Void
		end

	gobo_ge_sed_filename: STRING
			-- Full filename of "gobo_ge.sed"
		once
			Result := file_system.pathname (data_dirname, "gobo_ge.sed")
		ensure
			gobo_ge_sed_filename_not_void: Result /= Void
		end

	gobo_ise_sed_filename: STRING
			-- Full filename of "gobo_ise.sed"
		once
			Result := file_system.pathname (data_dirname, "gobo_ise.sed")
		ensure
			gobo_ise_sed_filename_not_void: Result /= Void
		end

	gobo_ise_debug_sed_filename: STRING
			-- Full filename of "gobo_ise_debug.sed"
		once
			Result := file_system.pathname (data_dirname, "gobo_ise_debug.sed")
		ensure
			gobo_ise_debug_sed_filename_not_void: Result /= Void
		end

feature -- Directory names

	new_dirname (a_prefix: STRING): STRING
			-- New unique directory name
		require
			a_prefix_not_void: a_prefix /= Void
		local
			nb: INTEGER
		do
			from
				nb := counter.item + 1
				counter.put (nb)
				Result := name + "_" + a_prefix + nb.out
			until
				not file_system.directory_exists (Result)
			loop
				nb := counter.item + 1
				counter.put (nb)
				Result := name + "_" + a_prefix + nb.out
			end
		ensure
			dirname_not_void: Result /= Void
		end

	data_dirname: STRING
			-- Full directory name of "$GOBO/library/free_elks/test/sed/data"
		once
			Result := file_system.pathname (sed_dirname, "data")
		ensure
			data_dirname_not_void: Result /= Void
		end

	sed_dirname: STRING
			-- Full directory name of "$GOBO/library/free_elks/test/sed"
		once
			Result := file_system.nested_pathname ("$GOBO", <<"library", "free_elks", "test", "unit", "sed">>)
		ensure
			sed_dirname_not_void: Result /= Void
		end

feature -- Execution

	set_up
			-- Setup for a test.
		local
			a_testdir: STRING
		do
			a_testdir := testdir
			-- assert (a_testdir + "_not_exists", not file_system.directory_exists (a_testdir))
			old_cwd := file_system.cwd
			file_system.create_directory (a_testdir)
			assert (a_testdir + "_exists", file_system.directory_exists (a_testdir))
			file_system.cd (a_testdir)
		end

	tear_down
			-- Tear down after a test.
		do
			if attached old_cwd as l_old_cwd then
				file_system.cd (l_old_cwd)
				-- file_system.recursive_delete_directory (testdir)
				old_cwd := Void
			end
		end

	old_cwd: detachable STRING
			-- Initial current working directory

feature {NONE} -- Implementation

	testdir: STRING = "Tsed"
			-- Name of temporary directory where to run the test

	counter: KL_CELL [INTEGER]
			-- Filename counter
		once
			create Result.make (0)
		ensure
			counter_not_void: Result /= Void
		end

end

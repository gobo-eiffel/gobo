note

	description:

		"Storable test cases"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_TEST_CASE

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

	storable_1_workbench_ise_filename: STRING
			-- Full filename of "storable_1_workbench.ise"
		once
			Result := file_system.pathname (data_dirname, "storable_1_workbench.ise")
		ensure
			storable_1_workbench_ise_filename_not_void: Result /= Void
		end

	storable_1_finalized_ise_filename: STRING
			-- Full filename of "storable_1_finalized.ise"
		once
			Result := file_system.pathname (data_dirname, "storable_1_finalized.ise")
		ensure
			storable_1_finalized_ise_filename_not_void: Result /= Void
		end

	storable_1_ge_filename: STRING
			-- Full filename of "storable_1.ge"
		once
			Result := file_system.pathname (data_dirname, "storable_1.ge")
		ensure
			storable_1_ge_filename_not_void: Result /= Void
		end

feature -- Directory names

	data_dirname: STRING
			-- Full directory name of "$GOBO/library/storable/test/unit/data"
		once
			Result := file_system.pathname (storable_dirname, "data")
		ensure
			data_dirname_not_void: Result /= Void
		end

	storable_dirname: STRING
			-- Full directory name of "$GOBO/library/storable/test/unit"
		once
			Result := file_system.nested_pathname ("$GOBO", <<"library", "storable", "test", "unit">>)
		ensure
			storable_dirname_not_void: Result /= Void
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

	testdir: STRING = "Tstorable"
			-- Name of temporary directory where to run the test

	counter: KL_CELL [INTEGER]
			-- Filename counter
		once
			create Result.make (0)
		ensure
			counter_not_void: Result /= Void
		end

end

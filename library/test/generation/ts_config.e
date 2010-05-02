note

	description:

		"Test configurations"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_CONFIG

create

	make

feature {NONE} -- Initialization

	make (a_root: like root_class; a_testgen: like testgen; a_compile: like compile; an_execute: like execute; a_clusters: like clusters)
			-- Create a new configuration.
		require
			a_root_not_void: a_root /= Void
			a_compile_not_void: a_compile /= Void
			an_execute_not_void: an_execute /= Void
			a_clusters_not_void: a_clusters /= Void
			no_void_cluster: not a_clusters.has_void
		do
			root_class := a_root
			testgen := a_testgen
			compile := a_compile
			execute := an_execute
			clusters := a_clusters
		ensure
			root_class_set: root_class = a_root
			testgen_set: testgen = a_testgen
			compile_set: compile = a_compile
			execute_set: execute = an_execute
			clusters_set: clusters = a_clusters
		end

feature -- Access

	root_class: STRING
			-- Name of test root class

	compile: STRING
			-- Compilation command-line

	execute: STRING
			-- Execution command-line

	testgen: STRING
			-- Directory where test classes will be generated;
			-- Void means current directory

	clusters: DS_LIST [TS_CLUSTER]
			-- List of clusters to be searched

feature -- Setting

	set_compile (a_compile: like compile)
			-- Set `compile' to `a_compile'.
		require
			a_compile_not_void: a_compile /= Void
		do
			compile := a_compile
		ensure
			compile_set: compile = a_compile
		end

	set_class_regexp (a_regexp: LX_REGULAR_EXPRESSION)
			-- Set class regular expression to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_regexp_compiled: a_regexp.is_compiled
		local
			a_cursor: DS_LIST_CURSOR [TS_CLUSTER]
		do
			a_cursor := clusters.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_cursor.item.set_class_regexp (a_regexp)
				a_cursor.forth
			end
		end

	set_feature_regexp (a_regexp: LX_REGULAR_EXPRESSION)
			-- Set feature regular expression to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_regexp_compiled: a_regexp.is_compiled
		local
			a_cursor: DS_LIST_CURSOR [TS_CLUSTER]
		do
			a_cursor := clusters.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_cursor.item.set_feature_regexp (a_regexp)
				a_cursor.forth
			end
		end

	set_default_test_included (b: BOOLEAN)
			-- Set to `b' whether 'default_test' should be included in generated testcases or not.
		local
			a_cursor: DS_LIST_CURSOR [TS_CLUSTER]
		do
			a_cursor := clusters.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_cursor.item.set_default_test_included (b)
				a_cursor.forth
			end
		end

feature -- Processing

	process (testcases: TS_TESTCASES; an_error_handler: TS_ERROR_HANDLER)
			-- Process current config.
		require
			testcases_not_void: testcases /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_cursor: DS_LIST_CURSOR [TS_CLUSTER]
		do
			a_cursor := clusters.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_cursor.item.process (testcases, an_error_handler)
				a_cursor.forth
			end
		end

invariant

	root_class_not_void: root_class /= Void
	compile_not_void: compile /= Void
	execute_not_void: execute /= Void
	clusters_not_void: clusters /= Void
	no_void_cluster: not clusters.has_void

end

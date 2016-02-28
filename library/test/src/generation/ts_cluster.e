note

	description:

		"Test config clusters"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #13 $"

class TS_CLUSTER

inherit

	ANY

	TS_CONFIG_CONSTANTS
		export {NONE} all end

create

	make,
	make_default

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname; cregexp: like class_regexp; fregexp: like feature_regexp; a_prefix: like class_prefix)
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_pathname_not_void: a_pathname /= Void
			cregexp_not_void: cregexp /= Void
			cregexp_compiled: cregexp.is_compiled
			fregexp_not_void: fregexp /= Void
			fregexp_compiled: fregexp.is_compiled
			a_prefix_not_void: a_prefix /= Void
		do
			name := a_name
			pathname := a_pathname
			class_regexp := cregexp
			feature_regexp := fregexp
			class_prefix := a_prefix
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			class_regexp_set: class_regexp = cregexp
			feature_regexp_set: feature_regexp = fregexp
			class_prefix_set: class_prefix = a_prefix
		end

	make_default
			-- Create a new default cluster.
		do
			name := Default_cluster_name
			pathname := Default_cluster_pathname
			class_regexp := Default_class_regexp
			feature_regexp := Default_feature_regexp
			class_prefix := Default_class_prefix
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	pathname: ET_IDENTIFIER
			-- Directory pathname

	class_regexp: LX_REGULAR_EXPRESSION
			-- Class regular expression

	feature_regexp: LX_REGULAR_EXPRESSION
			-- Feature regular expression

	class_prefix: STRING
			-- Prefix of generated testcase class names

	default_test_included: BOOLEAN
			-- Should 'default_test' be included in generated testcases?

feature -- Status report

	is_testcase_class (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' considered as a testcase class?
			-- Its name should match `class_regexp'.
		require
			a_class_not_void: a_class /= Void
		do
			Result := class_regexp.recognizes (a_class.name.name)
		end

feature -- Setting

	set_class_regexp (a_regexp: like class_regexp)
			-- Set `class_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_regexp_compiled: a_regexp.is_compiled
		do
			class_regexp := a_regexp
		ensure
			class_regexp_set: class_regexp = a_regexp
		end

	set_feature_regexp (a_regexp: like feature_regexp)
			-- Set `feature_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_regexp_compiled: a_regexp.is_compiled
		do
			feature_regexp := a_regexp
		ensure
			feature_regexp_set: feature_regexp = a_regexp
		end

	set_default_test_included (b: BOOLEAN)
			-- Set `default_test_included' to `b'.
		do
			default_test_included := b
		ensure
			default_test_included_set: default_test_included = b
		end

feature -- Processing

	process (testcases: TS_TESTCASES; an_error_handler: TS_ERROR_HANDLER)
			-- Process current cluster.
		require
			testcases_not_void: testcases /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_cluster: ET_LACE_CLUSTER
			a_clusters: ET_LACE_CLUSTERS
			a_system: ET_LACE_SYSTEM
		do
			create a_system.make ("test_generator")
			a_system.set_error_handler (an_error_handler)
			create a_cluster.make (name, pathname, a_system)
			create a_clusters.make (a_cluster)
			a_system.set_clusters (a_clusters)
			a_system.set_default_keyword_usage
			a_system.activate_processors
			a_system.parse_all_recursive
			a_system.classes_do_if_recursive (agent process_class (?, testcases), agent is_testcase_class)
		end

	process_class (a_class: ET_CLASS; testcases: TS_TESTCASES)
			-- Process `a_class'.
		require
			a_class_not_void: a_class /= Void
			testcases_not_void: testcases /= Void
		local
			l_procedures: ET_PROCEDURE_LIST
			i, nb: INTEGER
			an_identifier: ET_IDENTIFIER
			a_name: STRING
			l_default_test_name: STRING
		do
			testcases.set_class_prefix (a_class, class_prefix)
			l_procedures := a_class.procedures
			nb := l_procedures.count
			from
				i := 1
			until
				i > nb
			loop
				an_identifier ?= l_procedures.item (i).name
				if an_identifier /= Void then
					a_name := an_identifier.name
					if feature_regexp.recognizes (a_name) then
						testcases.put_testcase (a_class, an_identifier)
					end
				end
				i := i + 1
			end
			if default_test_included then
				l_default_test_name := "default_test"
				create an_identifier.make (l_default_test_name)
				if not feature_regexp.recognizes (l_default_test_name) then
					testcases.put_testcase (a_class, an_identifier)
				end
			end
		end

invariant

	name_not_void: name /= Void
	pathname_not_void: pathname /= Void
	class_regexp_not_void: class_regexp /= Void
	class_regexp_compiled: class_regexp.is_compiled
	feature_regexp_not_void: feature_regexp /= Void
	feature_regexp_compiled: feature_regexp.is_compiled
	class_prefix_not_void: class_prefix /= Void

end

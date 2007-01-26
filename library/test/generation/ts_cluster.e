indexing

	description:

		"Test config clusters"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_CLUSTER

inherit

	ANY

	TS_CONFIG_CONSTANTS
		export {NONE} all end

create

	make, make_default

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname;
		cregexp: like class_regexp; fregexp: like feature_regexp;
		a_prefix: like class_prefix) is
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

	make_default is
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

feature -- Setting

	set_class_regexp (a_regexp: like class_regexp) is
			-- Set `class_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_regexp_compiled: a_regexp.is_compiled
		do
			class_regexp := a_regexp
		ensure
			class_regexp_set: class_regexp = a_regexp
		end

	set_feature_regexp (a_regexp: like feature_regexp) is
			-- Set `feature_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_regexp_compiled: a_regexp.is_compiled
		do
			feature_regexp := a_regexp
		ensure
			feature_regexp_set: feature_regexp = a_regexp
		end

	set_default_test_included (b: BOOLEAN) is
			-- Set `default_test_included' to `b'.
		do
			default_test_included := b
		ensure
			default_test_included_set: default_test_included = b
		end

feature -- Processing

	process (testcases: TS_TESTCASES; an_error_handler: TS_ERROR_HANDLER) is
			-- Process current cluster.
		require
			testcases_not_void: testcases /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_cluster: ET_LACE_CLUSTER
			a_clusters: ET_LACE_CLUSTERS
			an_ast_factory: ET_AST_FACTORY
			a_universe: ET_LACE_UNIVERSE
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
		do
			create a_cluster.make (name, pathname)
			create a_clusters.make (a_cluster)
			create an_ast_factory.make
			create a_universe.make_with_factory (a_clusters, an_ast_factory, an_error_handler)
			a_universe.set_use_assign_keyword (True)
			a_universe.set_use_attribute_keyword (False)
			a_universe.set_use_convert_keyword (True)
			a_universe.set_use_create_keyword (True)
			a_universe.set_use_recast_keyword (False)
			a_universe.set_use_reference_keyword (True)
			a_universe.set_use_void_keyword (True)
			a_universe.parse_all
			a_cursor := a_universe.classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				if class_regexp.recognizes (a_cursor.key.name) then
					process_class (a_cursor.item, testcases)
				end
				a_cursor.forth
			end
		end

	process_class (a_class: ET_CLASS; testcases: TS_TESTCASES) is
			-- Process `a_class'.
		require
			a_class_not_void: a_class /= Void
			testcases_not_void: testcases /= Void
		local
			feature_names: DS_LINKED_LIST [STRING]
			l_procedures: ET_PROCEDURE_LIST
			i, nb: INTEGER
			an_identifier: ET_IDENTIFIER
			a_name: STRING
			l_default_test_name: STRING
		do
			create feature_names.make_equal
			l_procedures := a_class.procedures
			nb := l_procedures.count
			from i := 1 until i > nb loop
				an_identifier ?= l_procedures.item (i).name
				if an_identifier /= Void then
					a_name := an_identifier.name
					if feature_regexp.recognizes (a_name) then
						feature_names.put_last (a_name)
					end
				end
				i := i + 1
			end
			if default_test_included then
				l_default_test_name := "default_test"
				if not feature_names.has (l_default_test_name) then
					feature_names.put_last (l_default_test_name)
				end
			end
			if not feature_names.is_empty then
				testcases.put (a_class, feature_names, class_prefix)
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

indexing

	description:

		"Test config clusters"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_CLUSTER

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname;
		cregexp: like class_regexp; fregexp: like feature_regexp;
		a_prefix: like class_prefix) is
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_pathname_not_void: a_pathname /= Void
			cregexp_not_void: cregexp /= Void
			cregexp_compiled: cregexp.compiled
			fregexp_not_void: fregexp /= Void
			fregexp_compiled: fregexp.compiled
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
			!! a_cluster.make (name, pathname)
			!! a_clusters.make (a_cluster)
			!! an_ast_factory.make
			!! a_universe.make_with_factory (a_clusters, an_ast_factory, an_error_handler)
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
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
			an_identifier: ET_IDENTIFIER
			a_name: STRING
		do
			!! feature_names.make
			a_cursor := a_class.named_features.new_cursor
			from a_cursor.start until a_cursor.after loop
				an_identifier ?= a_cursor.key
				if an_identifier /= Void then
					a_name := an_identifier.name
					if feature_regexp.recognizes (a_name) then
						feature_names.put_last (a_name)
					end
				end
				a_cursor.forth
			end
			if not feature_names.is_empty then
				testcases.put (a_class.name.name, feature_names, class_prefix)
			end
		end

invariant

	name_not_void: name /= Void
	pathname_not_void: pathname /= Void
	class_regexp_not_void: class_regexp /= Void
	class_regexp_compiled: class_regexp.compiled
	feature_regexp_not_void: feature_regexp /= Void
	feature_regexp_compiled: feature_regexp.compiled
	class_prefix_not_void: class_prefix /= Void

end -- class TS_CLUSTER

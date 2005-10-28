indexing

	description:

		"Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS

inherit

	ET_CLASS_TYPE
		rename
			make as make_type,
			reset as reset_type,
			type_mark as class_mark,
			actual_parameters as formal_parameters
		export
			{ET_CLASS} eiffel_class
		redefine
			class_mark, process,
			formal_parameters,
			is_expanded, is_separate,
			first_leaf, last_leaf,
			position, break, append_to_string,
			is_named_type, is_valid_context,
			debug_output, copy, is_equal
		end

	HASHABLE
		undefine
			copy, is_equal
		end

create

	make, make_unknown

feature {NONE} -- Initialization

	make (a_name: like name; an_id: INTEGER) is
			-- Create a new class.
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id > 0
		do
			name := a_name
			id := an_id
			ancestors := tokens.empty_ancestors
			queries := tokens.empty_queries
			procedures := tokens.empty_procedures
			class_keyword := tokens.class_keyword
			end_keyword := tokens.end_keyword
			eiffel_class := Current
			master_class := Current
			time_stamp := no_time_stamp
		ensure
			name_set: name = a_name
			id_set: id = an_id
		end

	make_unknown (a_name: like name) is
			-- Create a new "*UNKNOWN*" class.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			id := 0
			ancestors := tokens.empty_ancestors
			queries := tokens.empty_queries
			procedures := tokens.empty_procedures
			class_keyword := tokens.class_keyword
			end_keyword := tokens.end_keyword
			eiffel_class := Current
			master_class := Current
			time_stamp := no_time_stamp
		ensure
			name_set: name = a_name
			id_set: id = 0
		end

feature -- Initialization

	reset is
			-- Reset current class as it was when it was first parsed.
			-- (Do not alter `overridden_class' and `master_class'.)
		do
			reset_implementation_checked
			reset_interface_checked
			reset_features_flattened
			reset_ancestors_built
			if is_preparsed then
				queries.reset
				procedures.reset
				if parents /= Void then
					parents.reset
				end
				if invariants /= Void then
					invariants.reset
				end
				if creators /= Void then
					creators.reset
				end
				if convert_features /= Void then
					convert_features.reset
				end
			else
					-- When reporting VTCT errors on a class, `is_parsed'
					-- is set to True even if it was not preparsed
					-- (and hence not actually parsed).
				has_syntax_error := False
				is_parsed := False
			end
			index := 0
			in_system := False
		ensure
			same_name: name = old name
			same_id: id = old id
		end

	reset_all is
			-- Reset current class as it was when it was created
			-- i.e. before it was preparsed or parsed).
			-- (Do not alter `overridden_class' and `master_class'.)
		do
			reset_implementation_checked
			reset_interface_checked
			reset_features_flattened
			reset_ancestors_built
			reset_parsed
			reset_preparsed
			index := 0
			in_system := False
		ensure
			same_name: name = old name
			same_id: id = old id
		end

feature -- Status report

	is_named_type: BOOLEAN is True
			-- Is current type only made up of named types?

	is_none: BOOLEAN is
			-- Is current class a "NONE" class?
		do
			Result := name.is_none
		end

feature -- Access

	obsolete_message: ET_OBSOLETE
			-- Obsolete message

	first_indexing: ET_INDEXING_LIST
			-- Indexing clause at the beginning of the class

	second_indexing: ET_INDEXING_LIST
			-- Indexing clause at the end of the class

	class_keyword: ET_KEYWORD
			-- 'class' keyword

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	id: INTEGER
			-- Class ID

	index: INTEGER
			-- Index of class in enclosing universe;
			-- Used to get dynamic information about this class.

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := id
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if first_indexing /= Void then
				Result := first_indexing.position
			elseif class_mark /= Void then
				Result := class_mark.position
			else
				Result := class_keyword.position
			end
		end

	leading_break: ET_BREAK
			-- Break that appears at the top of the file, before
			-- the class declaration

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if first_indexing /= Void then
				Result := first_indexing.first_leaf
			elseif class_mark /= Void then
				Result := class_mark
			else
				Result := class_keyword
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

	data: ANY
			-- Arbitrary user data

feature -- Setting

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			same_class_name: name.same_class_name (a_name)
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_obsolete_message (an_obsolete_message: like obsolete_message) is
			-- Set `obsolete_message' to `an_obsolete_message'.
		do
			obsolete_message := an_obsolete_message
		ensure
			obsolete_message_set: obsolete_message = an_obsolete_message
		end

	set_first_indexing (an_indexing: like first_indexing) is
			-- Set `first_indexing' to `an_indexing'
		do
			first_indexing := an_indexing
		ensure
			first_indexing_set: first_indexing = an_indexing
		end

	set_second_indexing (an_indexing: like second_indexing) is
			-- Set `second_indexing' to `an_indexing'
		do
			second_indexing := an_indexing
		ensure
			second_indexing_set: second_indexing = an_indexing
		end

	set_class_keyword (a_class: like class_keyword) is
			-- Set `class_keyword' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			class_keyword := a_class
		ensure
			class_keyword_set: class_keyword = a_class
		end

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

	set_leading_break (a_break: like leading_break) is
			-- Set `leading_break' to `a_break'.
		do
			leading_break := a_break
		ensure
			leading_break_set: leading_break = a_break
		end

	set_index (i: INTEGER) is
			-- Set `index' to `i'.
		require
			i_nonnegative: i >= 0
		do
			index := i
		ensure
			index_set: index = i
		end

	set_data (a_data: like data) is
			-- Set `data' to `a_data'.
		do
			data := a_data
		ensure
			data_set: data = a_data
		end

feature -- Preparsing

	filename: STRING
			-- Filename

	cluster: ET_CLUSTER
			-- Cluster to which current class belongs

	time_stamp: INTEGER
			-- Time stamp of the file when it was last parsed

	overridden_class: ET_CLASS
			-- Class that has the same name as current class
			-- (Name clash is resolved if current class is in an
			-- override cluster and `overridden_class' is not.)

	master_class: ET_CLASS
			-- Class known by the universe with same name as current class
			-- (This class is the current class when it is not overridden.)

	set_filename (a_name: STRING) is
			-- Set `filename' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			filename := a_name
		ensure
			filename_set: filename = a_name
		end

	set_cluster (a_cluster: like cluster) is
			-- Set `cluster' to `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			cluster := a_cluster
		ensure
			cluster_set: cluster = a_cluster
		end

	set_time_stamp (a_time_stamp: INTEGER) is
			-- Set `time_stamp' to `a_time_stamp'.
		do
			time_stamp := a_time_stamp
		ensure
			time_stamp_set: time_stamp = a_time_stamp
		end

	set_overridden_class (a_class: like overridden_class) is
			-- Set `overridden_class' to `a_class'.
		do
			if a_class /= Void then
				a_class.set_master_class (master_class)
			end
			overridden_class := a_class
		ensure
			overridden_class_set: overridden_class = a_class
			master_class_set: a_class /= Void implies a_class.master_class = master_class
		end

	set_master_class (a_class: like master_class) is
			-- Set `master_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			master_class := a_class
			if overridden_class /= Void then
				overridden_class.set_master_class (a_class)
			end
		ensure
			master_class_set: master_class = a_class
		end

feature -- Preparsing status

	is_preparsed: BOOLEAN is
			-- Has current class been preparsed (i.e. its filename
			-- and cluster are already known but the class has not
			-- necessarily been parsed yet)?
		do
			Result := (filename /= Void and cluster /= Void)
		ensure
			filename_not_void: Result implies filename /= Void
			cluster_not_void: Result implies cluster /= Void
		end

	is_in_cluster (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Is current class in `a_cluster' or recursively
			-- in one of its subclusters?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			if cluster /= Void then
				if cluster = a_cluster then
					Result := True
				else
					Result := a_cluster.has_subcluster (cluster)
				end
			end
		end

	is_override: BOOLEAN is
			-- Is current class in an override cluster?
		obsolete
			"[050911] Use `is_in_override_cluster' instead."
		do
			Result := is_in_override_cluster
		end

	is_in_override_cluster: BOOLEAN is
			-- Is current class in an override cluster?
		do
			if cluster /= Void then
				Result := cluster.is_override
			end
		end

	is_overridden: BOOLEAN is
			-- Is current class overridden by another class?
		do
			Result := (master_class /= Current)
		ensure
			definition: Result = (master_class /= Current)
		end

	is_overriding: BOOLEAN is
			-- Is current class overriding another class?
		do
			Result := (overridden_class /= Void and master_class = Current)
		ensure
			definition: Result = (overridden_class /= Void and master_class = Current)
		end

	has_name_clash: BOOLEAN is
			-- Is there two classes with the same name?
			-- (Override clusters are taken into account in order to
			-- determine whether it is a real name clash or not.)
		local
			a_class: ET_CLASS
		do
			if not is_in_override_cluster then
				Result := (overridden_class /= Void)
			else
				from
					a_class := overridden_class
				until
					a_class = Void
				loop
					if a_class.is_in_override_cluster then
						Result := True
						a_class := Void -- Jump out of the loop.
					else
						a_class := a_class.overridden_class
					end
				end
			end
		end

	reset_preparsed is
			-- Set `is_preparsed' to False.
		do
			filename := Void
			cluster := Void
			time_stamp := no_time_stamp
		ensure
			not_preparsed: not is_preparsed
		end

feature -- Parsing status

	is_parsed: BOOLEAN
			-- Has current class been parsed?

	has_syntax_error: BOOLEAN
			-- Has a fatal syntax error been detected?

	set_parsed is
			-- Set `is_parsed' to True.
		do
			is_parsed := True
		ensure
			is_parsed: is_parsed
		end

	set_syntax_error is
			-- Set `has_syntax_error' to True.
		do
			has_syntax_error := True
		ensure
			syntax_error_set: has_syntax_error
		end

	reset_parsed is
			-- Set `is_parsed' to False.
		do
			has_syntax_error := False
			is_parsed := False
			class_keyword := tokens.class_keyword
			end_keyword := tokens.end_keyword
			external_keyword := Void
			frozen_keyword := Void
			class_mark := Void
			creators := Void
			convert_features := Void
			feature_clauses := Void
			first_indexing := Void
			second_indexing := Void
			formal_parameters := Void
			invariants := Void
			obsolete_message := Void
			parents := Void
			queries := tokens.empty_queries
			procedures := tokens.empty_procedures
			leading_break := Void
			providers := Void
		ensure
			not_parsed: not is_parsed
			no_syntax_error: not has_syntax_error
		end

feature -- Class header

	is_deferred: BOOLEAN is
			-- Is current class deferred?
			-- A class is deferred if it has been marked as
			-- deferred or if is has deferred features. If
			-- it has deferred features but has not been marked
			-- as deferred then VCCH-1 is violated; if it is
			-- marked as deferred but has no deferred features
			-- then VCCH-2 is violated, although this latter
			-- validity rule has been relaxed in ETL3.
		do
			Result := has_deferred_mark or has_deferred_features
		ensure
			definition: Result = (has_deferred_mark or has_deferred_features)
		end

	is_expanded: BOOLEAN is
			-- Is current class expanded?
		do
			Result := has_expanded_mark
		ensure then
			definition: Result = has_expanded_mark
		end

	is_separate: BOOLEAN is
			-- Is current class separate?
		do
			Result := has_separate_mark
		ensure then
			definition: Result = has_separate_mark
		end

	is_frozen: BOOLEAN is
			-- Is current class frozen?
		do
			Result := has_frozen_mark
		ensure
			definition: Result = has_frozen_mark
		end

	is_external: BOOLEAN is
			-- Is current class external?
		do
			Result := has_external_mark
		ensure
			definition: Result = has_external_mark
		end

	has_deferred_features: BOOLEAN
			-- Does current class contain deferred features?

	has_deferred_mark: BOOLEAN is
			-- Has class been declared as deferred?
		do
			Result := (class_mark /= Void and then class_mark.is_deferred)
		ensure
			definition: Result = (class_mark /= Void and then class_mark.is_deferred)
		end

	has_expanded_mark: BOOLEAN is
			-- Has class been declared as expanded?
		do
			Result := (class_mark /= Void and then class_mark.is_expanded)
		ensure
			definition: Result = (class_mark /= Void and then class_mark.is_expanded)
		end

	has_reference_mark: BOOLEAN is
			-- Has class been declared as reference?
		do
			Result := (class_mark /= Void and then class_mark.is_reference)
		ensure
			definition: Result = (class_mark /= Void and then class_mark.is_reference)
		end

	has_separate_mark: BOOLEAN is
			-- Has class been declared as separate?
		do
			Result := (class_mark /= Void and then class_mark.is_separate)
		ensure
			definition: Result = (class_mark /= Void and then class_mark.is_separate)
		end

	has_frozen_mark: BOOLEAN is
			-- Has class been declared as frozen?
		do
			Result := frozen_keyword /= Void
		ensure
			definition: Result = (frozen_keyword /= Void)
		end

	has_external_mark: BOOLEAN is
			-- Has class been declared as external?
		do
			Result := external_keyword /= Void
		ensure
			definition: Result = (external_keyword /= Void)
		end

	class_mark: ET_KEYWORD
			-- 'deferred', 'expanded', 'reference' or 'separate' keyword

	set_class_mark (a_mark: like class_mark) is
			-- Set `class_mark' to `a_mark'.
		do
			class_mark := a_mark
		ensure
			class_mark_set: class_mark = a_mark
		end

	frozen_keyword: ET_KEYWORD
			-- 'frozen' keyword

	set_frozen_keyword (a_frozen: like frozen_keyword) is
			-- Set `frozen_keyword' to `a_frozen'.
		do
			frozen_keyword := a_frozen
		ensure
			frozen_keyword_set: frozen_keyword = a_frozen
		end

	external_keyword: ET_KEYWORD
			-- 'external' keyword

	set_external_keyword (an_external: like external_keyword) is
			-- Set `external_keyword' to `an_external'.
		do
			external_keyword := an_external
		ensure
			external_keyword_set: external_keyword = an_external
		end

	set_has_deferred_features (b: BOOLEAN) is
			-- Set `has_deferred_features' to `b'.
		do
			has_deferred_features := b
		ensure
			has_deferred_features: has_deferred_features = b
		end

feature -- Genericity

	formal_parameters: ET_FORMAL_PARAMETER_LIST
			-- Formal generic parameters

	set_formal_parameters (a_parameters: like formal_parameters) is
			-- Set `formal_parameters' to `a_parameters'.
		do
			formal_parameters := a_parameters
		ensure
			formal_parameters_set: formal_parameters = a_parameters
		end

	has_formal_parameter (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		do
			if formal_parameters /= Void then
				Result := formal_parameters.has_formal_parameter (a_name)
			end
		ensure
			is_generic: Result implies is_generic
		end

	formal_parameter (a_name: ET_IDENTIFIER): ET_FORMAL_PARAMETER is
			-- Formal generic parameter with name `a_name';
			-- Void if no such formal generic parameter
		require
			a_name_not_void: a_name /= Void
		do
			if formal_parameters /= Void then
				Result := formal_parameters.formal_parameter_by_name (a_name)
			end
		ensure
			has_formal_parameter: has_formal_parameter (a_name) = (Result /= Void)
			same_name: Result /= Void implies Result.name.same_identifier (a_name)
		end

feature -- Ancestors

	has_ancestor (a_class: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `a_class' an ancestor of current class in `a_universe'?
			-- (Note: you have to make sure that the ancestors have correctly
			-- been built first in order to get the correct answer.)
		require
			a_class_not_void: a_class /= Void
			a_universe_not_void: a_universe /= Void
		do
			if Current = a_universe.unknown_class then
					-- Class *UNKNOWN* has no ancestors.
				Result := False
			elseif a_class = Current then
				Result := True
			elseif Current = a_universe.none_class then
					-- NONE is a descendant of all classes.
				Result := True
			else
				Result := ancestors.has_class (a_class, a_universe)
			end
		end

	ancestor (a_type: ET_BASE_TYPE; a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Ancestor of current class with same base class
			-- as `a_type' in `a_universe'; Void if no such ancestor.
			-- (Note: you have to make sure that the ancestors have correctly
			-- been built first in order to get the correct answer.)
		require
			a_type_not_void: a_type /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_class: ET_CLASS
		do
			a_class := a_type.direct_base_class (a_universe)
			if Current = a_universe.unknown_class then
					-- Class *UNKNOWN* has no ancestors.
				Result := Void
			elseif a_class = Current then
				Result := a_type
			elseif Current = a_universe.none_class then
					-- NONE is a descendant of all classes.
				Result := a_type
			else
				Result := ancestors.base_type (a_class, a_universe)
			end
		end

	descendants (a_universe: ET_UNIVERSE): DS_ARRAYED_LIST [ET_CLASS] is
			-- Proper descendant classes in `a_universe'
		require
			a_universe_not_void: a_universe /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			other_class: ET_CLASS
		do
			if Current = a_universe.unknown_class then
					-- Class *UNKNOWN* has no descendants.
				create Result.make (0)
			elseif Current = a_universe.none_class then
					-- Class NONE has no descendants.
				create Result.make (0)
			else
				if Current = a_universe.any_class or Current = a_universe.general_class then
					create Result.make (a_universe.classes.count)
				else
					create Result.make (initial_descendants_capacity)
				end
				a_cursor := a_universe.classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					other_class := a_cursor.item
					if other_class /= Current then
						if other_class.ancestors_built then
							if other_class.has_ancestor (Current, a_universe) then
								Result.force_last (other_class)
							end
						end
					end
					a_cursor.forth
				end
			end
		ensure
			descendants_not_void: Result /= Void
			no_void_descendant: not Result.has (Void)
		end

	parents: ET_PARENT_LIST
			-- Parents

	ancestors: ET_BASE_TYPE_LIST
			-- Proper ancestors

	set_parents (a_parents: like parents) is
			-- Set `parents' to `a_parents'.
		do
			parents := a_parents
		ensure
			parents_set: parents = a_parents
		end

	set_ancestors (some_ancestors: like ancestors) is
			-- Set `ancestors' to `some_ancestors'.
		require
			some_ancestors_not_void: some_ancestors /= Void
		do
			ancestors := some_ancestors
		ensure
			ancestors_set: ancestors = some_ancestors
		end

feature -- Ancestor building status

	ancestors_built: BOOLEAN
			-- Have `ancestors' been built?

	has_ancestors_error: BOOLEAN
			-- Has a fatal error occurred when building `ancestors'?

	set_ancestors_built is
			-- Set `ancestors_built' to True.
		do
			ancestors_built := True
		ensure
			ancestors_built: ancestors_built
		end

	set_ancestors_error is
			-- Set `has_ancestors_error' to True.
		require
			ancestors_built: ancestors_built
		do
			has_ancestors_error := True
		ensure
			has_ancestors_error: has_ancestors_error
		end

	reset_ancestors_built is
			-- Set `ancestors_built' to False.
		do
			has_ancestors_error := False
			ancestors_built := False
			ancestors := tokens.empty_ancestors
		ensure
			ancestors_not_built: not ancestors_built
			no_ancestors_error: not has_ancestors_error
		end

feature -- Creation

	is_creation_exported_to (a_name: ET_FEATURE_NAME; a_client: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is feature name listed in current creation clauses
			-- and is it exported to `a_client'?
			-- (Note: Use `a_universe.ancestor_builder' on the classes whose ancestors
			-- need to be built in order to check for descendants.)
		require
			a_name_not_void: a_name /= Void
			a_client_not_void: a_client /= Void
			a_universe_not_void: a_universe /= Void
		do
			if creators /= Void then
				Result := creators.is_exported_to (a_name, a_client, a_universe)
			end
		end

	is_creation_directly_exported_to (a_name: ET_FEATURE_NAME; a_client: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clauses
			-- and is it directly exported to `a_client'?
			-- This is different from `is_creation_exported_to' where `a_client'
			-- can be a descendant of a class appearing in the list of clients.
			-- Note: The use of 'direct' in the name of this feature has not
			-- the same meaning as 'direct and indirect client' in ETL2 p.91.
		require
			a_name_not_void: a_name /= Void
			a_client_not_void: a_client /= Void
		do
			if creators /= Void then
				Result := creators.is_directly_exported_to (a_name, a_client)
			end
		end

	creators: ET_CREATOR_LIST
			-- Creation clauses

	set_creators (a_creators: like creators) is
			-- Set `creators' to `a_creators'.
		do
			creators := a_creators
		ensure
			creators_set: creators = a_creators
		end

feature -- Conversion

	convert_to_feature (other: ET_TYPE_CONTEXT; a_type: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CONVERT_FEATURE is
			-- Conversion feature, if any, to convert `a_type' to `other'
		require
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			a_type_not_void: a_type /= Void
			a_type_context_valid: a_type.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			valid_type: a_type.base_class (a_universe) = Current
		local
			i, nb: INTEGER
			a_feature: ET_CONVERT_FEATURE
			other_type: ET_TYPE
		do
			if convert_features /= Void then
				other_type := tokens.like_current
				nb := convert_features.count
				from i := 1 until i > nb loop
					a_feature := convert_features.convert_feature (i)
					if a_feature.is_convert_to then
						if a_feature.types.has_named_type (other_type, other, a_type, a_universe) then
							Result := a_feature
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
			end
		end

	convert_from_feature (other: ET_TYPE_CONTEXT; a_type: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CONVERT_FEATURE is
			-- Conversion feature, if any, to convert `a_type' from `other'
		require
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			a_type_not_void: a_type /= Void
			a_type_context_valid: a_type.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			valid_type: a_type.base_class (a_universe) = Current
		local
			i, nb: INTEGER
			a_feature: ET_CONVERT_FEATURE
			other_type: ET_TYPE
		do
			if convert_features /= Void then
				other_type := tokens.like_current
				nb := convert_features.count
				from i := 1 until i > nb loop
					a_feature := convert_features.convert_feature (i)
					if a_feature.is_convert_from then
						if a_feature.types.has_named_type (other_type, other, a_type, a_universe) then
							Result := a_feature
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
			end
		end

	convert_features: ET_CONVERT_FEATURE_LIST
			-- Conversion clauses

	set_convert_features (a_convert_features: like convert_features) is
			-- Set `convert_features' to `a_convert_features'.
		do
			convert_features := a_convert_features
		ensure
			convert_features_set: convert_features = a_convert_features
		end

feature -- Feature clauses

	feature_clauses: ET_FEATURE_CLAUSE_LIST
			-- Feature clauses

	set_feature_clauses (a_feature_clauses: like feature_clauses) is
			-- Set `feature_clauses' to `a_feature_clauses'.
		do
			feature_clauses := a_feature_clauses
		ensure
			feature_clauses_set: feature_clauses = a_feature_clauses
		end

feature -- Features

	named_query (a_name: ET_CALL_NAME): ET_QUERY is
			-- Query named `a_name';
			-- Void if no such query
		require
			a_name_not_void: a_name /= Void
		do
			Result := queries.named_feature (a_name)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	named_procedure (a_name: ET_CALL_NAME): ET_PROCEDURE is
			-- Procedure named `a_name';
			-- Void if no such procedure
		require
			a_name_not_void: a_name /= Void
		do
			Result := procedures.named_feature (a_name)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	named_feature (a_name: ET_CALL_NAME): ET_FEATURE is
			-- Feature named `a_name';
			-- Void if no such feature
		require
			a_name_not_void: a_name /= Void
		do
			Result := procedures.named_feature (a_name)
			if Result = Void then
				Result := queries.named_feature (a_name)
			end
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	seeded_query (a_seed: INTEGER): ET_QUERY is
			-- Query with seed `a_seed';
			-- Void if no such query
		do
			Result := queries.seeded_feature (a_seed)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	seeded_procedure (a_seed: INTEGER): ET_PROCEDURE is
			-- Procedure with seed `a_seed';
			-- Void if no such procedure
		do
			Result := procedures.seeded_feature (a_seed)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	queries: ET_QUERY_LIST
			-- Queries

	procedures: ET_PROCEDURE_LIST
			-- Procedures

	set_queries (a_queries: like queries) is
			-- Set `queries' to `a_queries' and
		require
			a_queries_not_void: a_queries /= Void
			-- a_features_registered: forall f in a_queries, f.is_registered
		do
			queries := a_queries
		ensure
			queries_set: queries = a_queries
		end

	set_procedures (a_procedures: like procedures) is
			-- Set `procedures' to `a_procedures' and
		require
			a_procedures_not_void: a_procedures /= Void
			-- a_features_registered: forall f in a_procedures, f.is_registered
		do
			procedures := a_procedures
		ensure
			procedures_set: procedures = a_procedures
		end

feature -- Feature flattening status

	features_flattened: BOOLEAN
			-- Have features been flattened?

	has_flattening_error: BOOLEAN
			-- Has a fatal error occurred during feature flattening?

	set_features_flattened is
			-- Set `features_flattened' to True.
		do
			features_flattened := True
		ensure
			features_flattened: features_flattened
		end

	set_flattening_error is
			-- Set `has_flattening_error' to True.
		require
			features_flattened: features_flattened
		do
			has_flattening_error := True
		ensure
			has_flattening_error: has_flattening_error
		end

	reset_features_flattened is
			-- Set `features_flattened' to False.
		do
			has_flattening_error := False
			features_flattened := False
			has_deferred_features := False
		ensure
			features_not_flattened: not features_flattened
			no_flattening_error: not has_flattening_error
		end

feature -- Interface checking status

	interface_checked: BOOLEAN
			-- Has the interface of current class been checked?

	has_interface_error: BOOLEAN
			-- Has a fatal error occurred during interface checking?

	set_interface_checked is
			-- Set `interface_checked' to True.
		do
			interface_checked := True
		ensure
			interface_checked: interface_checked
		end

	set_interface_error is
			-- Set `has_interface_error' to True.
		require
			interface_checked: interface_checked
		do
			has_interface_error := True
		ensure
			has_interface_error: has_interface_error
		end

	reset_interface_checked is
			-- Set `interface_checked' to False.
		do
			has_interface_error := False
			interface_checked := False
		ensure
			interface_not_checked: not interface_checked
			no_interface_error: not has_interface_error
		end

feature -- Suppliers/Providers

	suppliers: DS_HASH_SET [ET_CLASS]
			-- Supplier classes of current class

	set_suppliers (a_suppliers: like suppliers) is
			-- Set `suppliers' to `a_suppliers'.
		require
			no_void_supplier: a_suppliers /= Void implies not a_suppliers.has (Void)
		do
			suppliers := a_suppliers
		ensure
			suppliers_set: suppliers = a_suppliers
		end

	providers: DS_HASH_SET [ET_CLASS]
			-- Provider classes of current class
			-- (classes whose name appears in the text of current class)

	set_providers (a_providers: like providers) is
			-- Set `providers' to `a_providers'.
		require
			no_void_provider: a_providers /= Void implies not a_providers.has (Void)
		do
			providers := a_providers
		ensure
			providers_set: providers = a_providers
		end

feature -- Implementation checking status

	implementation_checked: BOOLEAN
			-- Has the implementation of current class been checked?

	has_implementation_error: BOOLEAN
			-- Has a fatal error occurred during implementation checking?

	set_implementation_checked is
			-- Set `implementation_checked' to True.
		do
			implementation_checked := True
		ensure
			implementation_checked: implementation_checked
		end

	set_implementation_error is
			-- Set `has_implementation_error' to True.
		require
			implementation_checked: implementation_checked
		do
			has_implementation_error := True
		ensure
			has_implementation_error: has_implementation_error
		end

	reset_implementation_checked is
			-- Set `implementation_checked' to False.
		do
			has_implementation_error := False
			implementation_checked := False
			suppliers := Void
		ensure
			implementation_not_checked: not implementation_checked
			no_implementation_error: not has_implementation_error
			suppliers_reset: suppliers = Void
		end

feature -- Invariant

	invariants: ET_INVARIANTS
			-- Invariants

	set_invariants (an_invariants: like invariants) is
			-- Set `invariants' to `an_invariants'.
		do
			invariants := an_invariants
		ensure
			invariants_set: invariants = an_invariants
		end

feature -- System

	in_system: BOOLEAN
			-- Is current class reachable from the root class?

	set_in_system (b: BOOLEAN) is
			-- Set `in_system' to `b'.
		do
			in_system := b
		ensure
			in_system_set: in_system = b
		end

feature -- Type context

	is_valid_context: BOOLEAN is
			-- A context is valid if the `type' of its `root_context'
			-- is only made up of class names and formal generic
			-- parameter names, and if the actual parameters of these
			-- formal parameters are themselves in current context
		do
			Result := True
		end

feature -- Duplication

	cloned_class: ET_CLASS is
			-- Clone version of current class
		do
			create Result.make_unknown (tokens.unknown_class_name)
			Result.copy (Current)
		ensure
			cloned_class_not_void: Result /= Void
		end

	copy (other: like Current) is
			-- Copy `other' to current class.
		do
			if other /= Current then
				standard_copy (other)
				eiffel_class := Current
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current class equal to `other'?
		local
			l_class: ET_CLASS
		do
			if other = Current then
				Result := True
			else
				l_class := eiffel_class
				eiffel_class := other.eiffel_class
				Result := standard_is_equal (other)
				eiffel_class := l_class
			end
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		local
			a_parameters: like formal_parameters
		do
			a_string.append_string (name.upper_name)
			a_parameters := formal_parameters
			if a_parameters /= Void and then not a_parameters.is_empty then
				a_string.append_character (' ')
				a_parameters.append_to_string (a_string)
			end
		end

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := name.name
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_class (Current)
		end

feature {NONE} -- Constants

	initial_descendants_capacity: INTEGER is
			-- Initial capacity for `descendants'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

	no_time_stamp: INTEGER is -2
			-- No time stamp marker

invariant

	id_nonnegative: id >= 0
	index_nonnegative: index >= 0
	master_class_not_void: master_class /= Void
	ancestors_not_void: ancestors /= Void
	queries_not_void: queries /= Void
	-- queries_registered: forall f in queries, f.is_registered
	procedures_not_void: procedures /= Void
	-- procedures_registered: forall f in procedures, f.is_registered
	class_keyword_not_void: class_keyword /= Void
	end_keyword_not_void: end_keyword /= Void
	named_type: is_named_type
	valid_context: is_valid_context
	no_void_supplier: suppliers /= Void implies not suppliers.has (Void)
	no_void_provider: providers /= Void implies not providers.has (Void)
	ancestors_error: has_ancestors_error implies ancestors_built
	flattening_error: has_flattening_error implies features_flattened
	interface_error: has_interface_error implies interface_checked
	implementation_error: has_implementation_error implies implementation_checked

end

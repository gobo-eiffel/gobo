indexing

	description:

		"Eiffel features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE

inherit

	ET_AST_NODE

	ET_REPLICABLE_FEATURE

	HASHABLE

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := name_item.feature_name
		ensure
			name_not_void: Result /= Void
		end

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		do
		end

	preconditions: ET_PRECONDITIONS is
			-- Preconditions;
			-- Void if not a routine or a routine with no preconditions
		do
		end

	postconditions: ET_POSTCONDITIONS is
			-- Postconditions;
			-- Void if not a routine or a routine with no postconditions
		do
		end

	id: INTEGER
			-- Feature ID

	version: INTEGER
			-- Version (feature ID of last declaration
			-- of current feature)

	first_seed: INTEGER
			-- First seed

	other_seeds: ET_FEATURE_IDS
			-- Other seeds (feature IDs of first declarations
			-- of current feature); May be Void if there
			-- is only one seed (which is then accessible
			-- through `first_seed')

	implementation_class: ET_CLASS
			-- Class where implementation of current feature
			-- has been provided (Useful for interpreting
			-- feature calls and type anchors (that might
			-- be renamed in descendant classes) when feature
			-- is inherited as-is.)

	name_item: ET_FEATURE_NAME_ITEM
			-- Feature name (possibly followed by comma for synomyms)

	frozen_keyword: ET_KEYWORD
			-- 'frozen' keyword

	feature_clause: ET_FEATURE_CLAUSE
			-- Feature clause containing current feature

	semicolon: ET_SEMICOLON_SYMBOL
			-- Optional semicolon in semicolon-separated list of features

	synonym: ET_FEATURE
			-- Next synonym if any

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := name.hash_code
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if not is_frozen then
				Result := name_item.position
			else
				Result := frozen_keyword.position
				if Result.is_null then
					Result := name_item.position
				end
			end
		end

feature -- Status report

	is_registered: BOOLEAN is
			-- Has feature been registered to the surrounding universe?
		do
			Result := (id > 0)
		ensure
			definition: Result = (id > 0)
		end

	is_frozen: BOOLEAN is
			-- Has feature been declared as frozen?
		do
			Result := (frozen_keyword /= Void)
		end

	is_deferred: BOOLEAN is
			-- Is feature deferred?
		do
			-- Result := False
		end

	is_attribute: BOOLEAN is
			-- Is feature an attribute?
		do
			-- Result := False
		end

	is_constant_attribute: BOOLEAN is
			-- Is feature a constant attribute?
		do
			-- Result := False
		end

	is_unique_attribute: BOOLEAN is
			-- Is feature a unique attribute?
		do
			-- Result := False
		end

	is_procedure: BOOLEAN is
			-- Is current feature a procedure?
		do
			Result := (type = Void)
		ensure
			definition: Result = (type = Void)
		end

	is_once: BOOLEAN is
			-- Is current feature a once feature?
		do
			-- Result := False
		end
		
	is_infixable: BOOLEAN is
			-- Can current feature have a name of
			-- the form 'infix ...'?
		do
			-- Result := False
		end

	is_prefixable: BOOLEAN is
			-- Can current feature have a name of
			-- the form 'prefix ...'?
		do
			-- Result := False
		end

	has_seed (a_seed: INTEGER): BOOLEAN is
			-- Does current feature have `a_seed'?
		do
			if first_seed = a_seed then
				Result := True
			elseif other_seeds /= Void then
				Result := other_seeds.has (a_seed)
			end
		ensure
			definition: Result = (first_seed = a_seed or (other_seeds /= Void and then other_seeds.has (a_seed)))
		end

feature -- Export status

	is_exported_to (a_client: ET_CLASS; a_processor: ET_AST_PROCESSOR): BOOLEAN is
			-- Is current feature exported to `a_client'?
			-- (Note: Use `a_processor' on the classes whose ancestors
			-- need to be built in order to check for descendants.)
		require
			a_client_not_void: a_client /= Void
			a_processor_not_void: a_processor /= Void
		do
			Result := clients.has_descendant (a_client, a_processor)
		end

	is_directly_exported_to (a_client: ET_CLASS): BOOLEAN is
			-- Does `a_client' appear in the list of clients of current feature?
			-- (This is different from `is_exported_to' where `a_client' can
			-- be a descendant of a class appearing in the list of clients.
			-- Note: The use of 'direct' in the name of this feature has not
			-- the same meaning as 'direct and indirect client' in ETL2 p.91.)
		require
			a_client_not_void: a_client /= Void
		do
			Result := clients.has_class (a_client)
		end

	is_creation_exported_to (a_client, a_class: ET_CLASS; a_processor: ET_AST_PROCESSOR): BOOLEAN is
			-- Is current feature listed in the creation clauses
			-- of `a_class' and exported to `a_client'?
			-- (Note: Use `a_processor' on the classes whose ancestors
			-- need to be built in order to check for descendants.)
		require
			a_client_not_void: a_client /= Void
			a_class_not_void: a_class /= Void
			a_processor_not_void: a_processor /= Void
		do
			Result := a_class.is_creation_exported_to (name, a_client, a_processor)
		end

	is_creation_directly_exported_to (a_client, a_class: ET_CLASS): BOOLEAN is
			-- Is current feature listed in the creation clauses
			-- of `a_class' and directly exported to `a_client'?
			-- (This is different from `is_creation_exported_to' where `a_client'
			-- can be a descendant of a class appearing in the list of clients.
			-- Note: The use of 'direct' in the name of this feature has not
			-- the same meaning as 'direct and indirect client' in ETL2 p.91.)
		require
			a_client_not_void: a_client /= Void
			a_class_not_void: a_class /= Void
		do
			Result := a_class.is_creation_directly_exported_to (name, a_client)
		end

	clients: ET_CLASS_NAME_LIST
			-- Clients to which feature is exported

	set_clients (a_clients: like clients) is
			-- Set `clients' to `a_clients'.
		require
			a_clients_not_void: a_clients /= Void
		do
			clients := a_clients
		ensure
			clients_set: clients = a_clients
		end

feature -- Comparison

	same_version (other: ET_FEATURE): BOOLEAN is
			-- Do current feature and `other' have the same version?
		require
			other_not_void: other /= Void
		do
			Result := version = other.version
		ensure
			definition: Result = (version = other.version)
		end

feature -- Setting

	set_id (an_id: INTEGER) is
			-- Set `id' to `an_id'.
		require
			an_id_positive: an_id > 0
		do
			id := an_id
			if first_seed = 0 then
				set_first_seed (an_id)
			end
			if version = 0 then
				set_version (an_id)
			end
		ensure
			id_set: id = an_id
		end

	set_feature_clause (a_feature_clause: like feature_clause) is
			-- Set `feature_clause' to `a_feature_clause'.
		do
			feature_clause := a_feature_clause
		ensure
			feature_clause_set: feature_clause = a_feature_clause
		end

	set_version (a_version: INTEGER) is
			-- Set `version' to `a_version'.
		require
			a_version_not_void: a_version > 0
		do
			version := a_version
		ensure
			version_set: version = a_version
		end

	set_implementation_class (a_class: like implementation_class) is
			-- Set `implementation_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			implementation_class := a_class
		ensure
			implementation_class_set: implementation_class = a_class
		end

	set_first_seed (a_seed: INTEGER) is
			-- Set `first_seed' to `a_seed'.
		require
			a_seed_positive: a_seed > 0
		do
			first_seed := a_seed
		ensure
			first_seed_set: first_seed = a_seed
		end

	set_other_seeds (a_seeds: like other_seeds) is
			-- Set `other_seeds' to `a_seeds'.
		do
			other_seeds := a_seeds
		ensure
			other_seeds_set: other_seeds = a_seeds
		end

	set_frozen_keyword (a_frozen: like frozen_keyword) is
			-- Set `frozen_keyword' to `a_frozen'.
		do
			frozen_keyword := a_frozen
		ensure
			frozen_keyword_set: frozen_keyword = a_frozen
		end

	set_synonym (a_synonym: like synonym) is
			-- Set `synonym' to `a_synonym'.
		do
			synonym := a_synonym
		ensure
			synonym_set: a_synonym = a_synonym
		end

	set_semicolon (a_semicolon: like semicolon) is
			-- Set `semicolon' to `a_semicolon'.
		do
			semicolon := a_semicolon
		ensure
			semicolon_set: semicolon = a_semicolon
		end

feature -- Duplication

	new_synonym (a_name: like name_item): like Current is
			-- Synonym feature
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			new_synonym_not_void: Result /= Void
			name_item_set: Result.name_item = a_name
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			renamed_feature_not_void: Result /= Void
			name_set: Result.name = a_name
		end

	undefined_feature (a_name: like name): ET_DEFERRED_ROUTINE is
			-- Undefined version of current feature
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			undefined_feature_not_void: Result /= Void
			name_set: Result.name = a_name
			version_set: Result.version = Result.id
		end

feature -- Type processing

	resolve_inherited_signature (a_parent: ET_PARENT) is
			-- Resolve arguments and type inherited from `a_parent'.
			-- Resolve any formal generic parameters of declared types
			-- with the corresponding actual parameters in `a_parent',
			-- and duplicate identifier anchored types (and clear their
			-- base types).
		require
			a_parent_not_void: a_parent /= Void
		deferred
		end

feature -- Inheritance / Feature adaptation

	is_inherited: BOOLEAN is
			-- Is current feature being inherited?
		do
			Result := parent /= Void
		ensure
			definition: Result = (parent /= Void)
		end

	is_redeclared: BOOLEAN is
			-- Is current feature being redeclared?
		deferred
		ensure
			is_inherited: Result implies is_inherited
		end

	is_flattened: BOOLEAN is
			-- Is current feature flattened?
		deferred
		ensure
			definition: Result = (flattened_feature = Current)
			not_inherited: not is_inherited implies Result
		end

	has_rename: BOOLEAN is
			-- Does current feature appear in a Rename clause?
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			Result := new_name /= Void
		ensure
			definition: Result = (new_name /= Void)
		end

	has_redefine: BOOLEAN is
			-- Does current feature appear in a Redefine clause?
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			Result := redefine_name /= Void
		ensure
			definition: Result = (redefine_name /= Void)
		end

	has_undefine: BOOLEAN is
			-- Does current feature appear in an Undefine clause?
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			Result := undefine_name /= Void
		ensure
			definition: Result = (undefine_name /= Void)
		end

	has_select: BOOLEAN is
			-- Does current feature appear in a Select clause?
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			Result := select_name /= Void
		ensure
			definition: Result = (select_name /= Void)
		end

	has_selected_feature: BOOLEAN is
			-- Does current inherited feature or one of its merged
			-- or joined features appear in a Select clause?
		require
			is_inherited: is_inherited
		do
			Result := selected_feature /= Void
		ensure
			definition: Result = (selected_feature /= Void)
		end

	is_other_seeds_shared: BOOLEAN is
			-- Is `other_seeds' object shared with one of
			-- the precursors? (If shared, then we need to
			-- clone it before modifying it.)
		require
			is_inherited: is_inherited
		do
			Result := True
		end

	new_name: ET_RENAME is
			-- New name when feature is renamed
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			-- Result := Void
		end

	undefine_name: ET_FEATURE_NAME is
			-- Name listed in undefine clause
			-- when feature is undefined
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			-- Result := Void
		end

	redefine_name: ET_FEATURE_NAME is
			-- Name listed in redefine clause
			-- when feature is redefined
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			-- Result := Void
		end

	select_name: ET_FEATURE_NAME is
			-- Name listed in select clause
			-- when feature is selected
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			-- Result := Void
		end

	selected_feature: ET_FEATURE is
			-- Either current inherited feature or one of its merged
			-- or joined features that appears in a Select clause?
		require
			is_inherited: is_inherited
		do
			-- Result := Void
		ensure
			is_inherited: Result /= Void implies Result.is_inherited
			not_redeclared: Result /= Void implies not Result.is_redeclared
			has_select: Result /= Void implies Result.has_select
		end

	precursor_feature: ET_FLATTENED_FEATURE is
			-- Feature inherited from `parent'
		require
			is_inherited: is_inherited
		deferred
		ensure
			precursor_feature_not_void: Result /= Void
		end

	inherited_feature: ET_INHERITED_FEATURE is
			-- Current feature viewed as an inherited feature
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			create Result.make (precursor_feature, parent)
		ensure
			inherited_feature_not_void: Result /= Void
			same_precursor_feature: Result.precursor_feature = precursor_feature
			same_parent: Result.parent = parent
		end

	redeclared_feature: ET_REDECLARED_FEATURE is
			-- Current feature viewed as a redeclared feature
		require
			is_redeclared: is_redeclared
		do
			check not_redeclared: not is_redeclared end
		ensure
			definition: Result = Current
		end

	merged_feature: ET_FEATURE is
			-- Inherited feature being merged or joined
			-- with current inherited feature
		require
			is_inherited: is_inherited
			not_redeclared: not is_redeclared
		do
			-- Result := Void
		ensure
			void_if_shared: is_flattened implies Result = Void
			is_inherited: Result /= Void implies Result.is_inherited
			not_redeclared: Result /= Void implies not Result.is_redeclared
		end

	seeded_feature (a_seed: INTEGER): ET_FEATURE is
			-- Either current inherited feature or one of its merged or
			-- joined features whose precursor feature has `a_seed' as seed
		require
			is_inherited: is_inherited
			has_seed: has_seed (a_seed)
		do
			Result := Current
		ensure
			seeded_feature_not_void: Result /= Void
			seeded_feature_inherited: Result.is_inherited
			seeded_feature_not_redeclared: not Result.is_redeclared
			has_seed: Result.precursor_feature.has_seed (a_seed)
		end

	flattened_feature: ET_FLATTENED_FEATURE is
			-- Feature resulting after feature adaptation
		deferred
		ensure
			flattened_feature_not_void: Result /= Void
		end

	adapted_feature: ET_ADAPTED_FEATURE is
			-- Version of current feature where none of its
			-- inherited components are flattened
		require
			is_inherited: is_inherited
		deferred
		ensure
			adapted_feature_not_void: Result /= Void
		end

	parent: ET_PARENT
			-- Parent from which current feature is being inherited

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		require
			not_inherited: not is_inherited
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

	unset_parent is
			-- Unset `parent'.
		require
			is_inherited: is_inherited
			is_flattened: is_flattened
		do
			parent := Void
		ensure
			parent_unset: parent = Void
		end

feature -- Replication

	is_selected: BOOLEAN is
			-- Has an inherited feature been selected
			-- to solve a replication conflict?
		require
			is_inherited: is_inherited
		do
			-- Result := False
		end

	is_replicated: BOOLEAN is
			-- Has current feature been replicated?
		require
			is_inherited: is_inherited
		do
			Result := replicated_seeds /= Void
		ensure
			definition: Result = (replicated_seeds /= Void)
		end

	first_feature: ET_FEATURE is
			-- First feature with a given seed
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	selected_count: INTEGER is
			-- Number of selected features
		do
			if is_inherited and then has_selected_feature then
				Result := 1
			end
		end

	replicated_seeds: ET_FEATURE_IDS is
			-- Seeds involved when current feature has been replicated
		require
			is_inherited: is_inherited
		do
			-- Result := Void
		end

invariant

	name_item_not_void: name_item /= Void
	clients_not_void: clients /= Void
	first_seed_positive: is_registered implies first_seed > 0
	implementation_class_not_void: implementation_class /= Void
	-- replicated_seeds: is_inherited and then replicated_seeds /= Void implies
	-- 	forall a_seed in replicated_seeds, has_seed (a_seed)

end

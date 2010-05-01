note

	description:

		"Eiffel features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2008/12/01 $"
	revision: "$Revision: #16 $"

deferred class ET_FEATURE

inherit

	ET_AST_NODE

	ET_FLATTENED_FEATURE
		rename
			is_immediate as is_flattened_immediate,
			is_redeclared as is_flattened_redeclared,
			is_adapted as is_flattened_adapted,
			is_inherited as is_flattened_inherited,
			immediate_feature as flattened_immediate_feature,
			redeclared_feature as flattened_redeclared_feature,
			adapted_feature as flattened_adapted_feature,
			inherited_feature as flattened_inherited_feature
		redefine
			is_flattened_immediate,
			flattened_immediate_feature
		end

	ET_STANDALONE_CLOSURE
		redefine
			is_feature,
			as_feature
		end

	DEBUG_OUTPUT

feature -- Initialization

	reset is
			-- Reset current feature as it was just after it was last parsed.
		local
			l_type: like type
			l_arguments: like arguments
		do
			name.reset
			first_seed := id
			other_seeds := Void
			version := id
			first_precursor := Void
			other_precursors := Void
			l_type := type
			if l_type /= Void then
				l_type.reset
			end
			l_arguments := arguments
			if l_arguments /= Void then
				l_arguments.reset
			end
			reset_after_features_flattened
		end

	reset_after_features_flattened is
			-- Reset current feature as it was just after it was last flattened.
		local
			l_preconditions: like preconditions
			l_postconditions: like postconditions
		do
			reset_signature_qualified_anchored_types
			if assertions_checked then
				l_preconditions := preconditions
				if l_preconditions /= Void then
					l_preconditions.reset
				end
				l_postconditions := postconditions
				if l_postconditions /= Void then
					l_postconditions.reset
				end
			end
			reset_assertions_checked
			reset_implementation_checked
		end

	reset_signature_qualified_anchored_types is
			-- Reset qualified anchored types contained in signature of
			-- current feature as they were just after they were last parsed.
		local
			l_type: like type
			l_arguments: like arguments
		do
			l_type := type
			if l_type /= Void then
				l_type.reset_qualified_anchored_types
			end
			l_arguments := arguments
			if l_arguments /= Void then
				l_arguments.reset_qualified_anchored_types
			end
		end

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := extended_name.feature_name
		end

	lower_name: STRING is
			-- Lower-name of feature
			-- (May return the same object as `name.name' if already in lower case,
			-- otherwise return a new object at each call.)
		do
			Result := name.lower_name
		ensure
			upper_name_not_void: Result /= Void
			upper_name_not_empty: Result.count > 0
			definition: Result.is_equal (name.name.as_lower)
		end

	alias_name: ET_ALIAS_NAME is
			-- Alias name, if any
		do
			Result := extended_name.alias_name
		end

	extended_name: ET_EXTENDED_FEATURE_NAME
			-- Extended feature name (possibly followed by comma for synomyms)

	overloaded_extended_name: ET_EXTENDED_FEATURE_NAME is
			-- Possibly overloaded extended Eiffel feature name
			-- (useful in .NET)
		do
			Result := extended_name
		ensure
			overloaded_extended_name_not_void: Result /= Void
		end

	overloaded_name: ET_FEATURE_NAME is
			-- Possibly overloaded Eiffel feature name
			-- (useful in .NET)
		do
			Result := overloaded_extended_name.feature_name
		ensure
			overloaded_name_not_void: Result /= Void
		end

	overloaded_alias_name: ET_ALIAS_NAME is
			-- Possibly overloaded Eiffel alias name, if any
			-- (useful in .NET)
		do
			Result := overloaded_extended_name.alias_name
		end

	header_break: ET_BREAK is
			-- Break which appears where the header comment is expected
		deferred
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

	obsolete_message: ET_OBSOLETE is
			-- Obsolete message
		do
		end

	first_indexing: ET_INDEXING_LIST
			-- Note clause at the beginning of the feature

	id: INTEGER
			-- Feature ID

	version: INTEGER
			-- Version (feature ID of last declaration
			-- of current feature)

	first_precursor: ET_FEATURE
			-- First precursor;
			-- Void if the feature has no precursor.
			-- Useful to build the flat preconditions and
			-- postconditions of the feature.

	other_precursors: ET_FEATURE_LIST
			-- Other precursors (Features from which the current
			-- feature gets parts of its preconditions and
			-- postconditions from its parents. Note that because
			-- of replication all the seeds of the precursors are not
			-- necessarily a subset of the seeds of current feature;
			-- May be Void if there is only one precursor (which is
			-- then accessible through `first_precursor') or no
			-- precursor. There can be several precursors if the
			-- current feature is the result of a merge or join of
			-- several features in the inheritance clause.

	implementation_class: ET_CLASS
			-- Class where implementation of current feature
			-- has been provided;
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.

	implementation_feature: ET_FEATURE
			-- Current feature in `implementation_class',
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.

	frozen_keyword: ET_KEYWORD
			-- 'frozen' keyword

	feature_clause: ET_FEATURE_CLAUSE
			-- Feature clause containing current feature

	semicolon: ET_SEMICOLON_SYMBOL
			-- Optional semicolon in semicolon-separated list of features

	synonym: ET_FEATURE
			-- Next synonym if any

	hash_code: INTEGER
			-- Hash code value

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if not is_frozen then
				Result := extended_name.position
			else
				Result := frozen_keyword.position
				if Result.is_null then
					Result := extended_name.position
				end
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if not is_frozen then
				Result := extended_name.first_leaf
			else
				Result := frozen_keyword
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

	has_header_comment: BOOLEAN is
			-- Does current feature have a header comment?
		local
			a_break: like break
		do
			a_break := header_break
			if a_break /= Void then
				Result := a_break.has_comment
			end
		end

	has_non_empty_header_comment: BOOLEAN is
			-- Does current feature have a non-empty header comment?
			-- (Comments only made up of white characters or minus signs are not taken into account.)
		local
			a_break: like break
		do
			a_break := header_break
			if a_break /= Void then
				Result := a_break.has_non_empty_comment
			end
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

	is_external: BOOLEAN is
			-- Is feature external?
		do
			-- Result := False
		end

	is_function: BOOLEAN is
			-- Is feature a function?
		do
			-- Result := False
		ensure
			query: Result implies is_query
		end

	is_attribute: BOOLEAN is
			-- Is feature an attribute?
		do
			-- Result := False
		ensure
			query: Result implies is_query
		end

	is_constant_attribute: BOOLEAN is
			-- Is feature a constant attribute?
		do
			-- Result := False
		ensure
			query: Result implies is_query
		end

	is_unique_attribute: BOOLEAN is
			-- Is feature a unique attribute?
		do
			-- Result := False
		ensure
			query: Result implies is_query
		end

	is_query: BOOLEAN is
			-- Is current feature a query?
		do
			Result := (type /= Void)
		ensure
			definition: Result = (type /= Void)
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
		ensure
			definition: not is_dotnet implies Result = (type /= Void and (arguments /= Void and then arguments.count = 1))
		end

	is_prefixable: BOOLEAN is
			-- Can current feature have a name of
			-- the form 'prefix ...'?
		do
			-- Result := False
		ensure
			definition: not is_dotnet implies Result = (type /= Void and (arguments = Void or else arguments.count = 0))
		end

	is_bracketable: BOOLEAN is
			-- Can current feature have a name of
			-- the form 'alias "[]"'?
		do
			-- Result := False
		ensure
			definition: Result = (type /= Void and (arguments /= Void and then arguments.count > 0))
		end

	is_flattened_immediate: BOOLEAN is True
			-- Is current feature immediate?
			--
			-- Note that this feature only make sense when flattening the features.
			-- Otherwise, features that are declared or redeclared in a class
			-- are available in ET_CLASS.queries and ET_CLASS.procedures from
			-- range 1 to `declared_count', and (non-redeclared) inherited features
			-- from range `declared_count' + 1 to `count'.

	is_redeclaration (a_class: ET_CLASS): BOOLEAN is
			-- Assuming that the current feature has been declared in `a_class'
			-- (i.e. it appears in range 1 to 'declared_count' in 'a_class.queries'
			-- or 'a_class.procedures'), is current feature the redeclaration
			-- of a feature from a parent class of `a_class'?
			--
			-- Note that features that are declared or redeclared in a class
			-- are available in ET_CLASS.queries and ET_CLASS.procedures from
			-- range 1 to 'declared_count', and (non-redeclared) inherited features
			-- from range 'declared_count' + 1 to `count'.
		require
			a_class_not_void: a_class /= Void
			declared_in_class: a_class.has_declared_feature (Current)
		do
			Result := (first_precursor /= Void)
		end

	is_join (a_class: ET_CLASS): BOOLEAN is
			-- Assuming that the current feature has been inherited without being
			-- redefined (i.e. it appears in range 'declared_count' + 1 to 'count'
			-- in 'a_class.queries' or 'a_class.procedures'), is current feature the
			-- result of a join of two or more features from the parents of `a_class'?
			--
			-- Note that features that are declared or redeclared in a class
			-- are available in ET_CLASS.queries and ET_CLASS.procedures from
			-- range 1 to 'declared_count', and (non-redeclared) inherited features
			-- from range 'declared_count' + 1 to `count'.
			--
			-- Note this may give wrong results when the current feature has been
			-- inherited from an ancestor of `a_class' without being adapted
			-- (e.g. no renaming, no join, no redeclaration, ...) and it was the
			-- result of a join in that ancestor. We will get True in that case
			-- despite the fact that there is no join in `a_class'.
		require
			a_class_not_void: a_class /= Void
			inherited_in_class: a_class.has_inherited_feature (Current)
		do
			if first_precursor /= Void then
				if implementation_feature /= Current then
					Result := other_precursors /= Void and then not other_precursors.is_empty
				end
			end
		end

	is_feature: BOOLEAN is True
			-- Is `Current' a feature?

	is_used: BOOLEAN
			-- Is current feature used in the system?
			-- For example, is it reachable from the root creation
			-- procedure through the transitive closure.

feature -- Measurement

	arguments_count: INTEGER is
			-- Number of formal arguments
		local
			l_arguments: like arguments
		do
			l_arguments := arguments
			if l_arguments /= Void then
				Result := l_arguments.count
			end
		ensure
			arguments_count_not_negative: Result >= 0
			no_argument: arguments = Void implies Result = 0
			with_arguments: arguments /= Void implies Result = arguments.count
		end

feature -- Export status

	is_exported_to (a_client: ET_CLASS): BOOLEAN is
			-- Is current feature exported to `a_client'?
			-- (Note: Use `current_system.ancestor_builder' on the classes whose ancestors
			-- need to be built in order to check for descendants.)
		require
			a_client_not_void: a_client /= Void
		do
			Result := clients.has_descendant (a_client)
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

	is_creation_exported_to (a_client, a_class: ET_CLASS): BOOLEAN is
			-- Is current feature listed in the creation clauses of `a_class'
			-- and exported to `a_client', or is current feature the version of
			-- 'default_create' in `a_class' with `a_class' being a non-deferred
			-- class with no creation clauses?
			-- (Note: Use `current_system.ancestor_builder' on the classes whose ancestors
			-- need to be built in order to check for descendants. Also use
			-- `current_system.feature_flattener' on `a_class' if needed to determine
			-- whether current feature is the version of 'default_create' in `a_class'.)
		require
			a_client_not_void: a_client /= Void
			a_class_not_void: a_class /= Void
		do
			if a_class.is_creation_exported_to (name, a_client) then
				Result := True
			elseif a_class.creators = Void and not a_class.is_deferred and a_class.is_preparsed then
				a_class.process (a_class.current_system.feature_flattener)
				Result := has_seed (a_class.current_system.default_create_seed)
			end
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

	clients: ET_CLIENT_LIST
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
			Result := (other = Current) or else (version = other.version)
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

	set_first_indexing (an_indexing: like first_indexing) is
			-- Set `first_indexing' to `an_indexing'
		do
			first_indexing := an_indexing
		ensure
			first_indexing_set: first_indexing = an_indexing
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

	set_implementation_feature (a_feature: like implementation_feature) is
			-- Set `implementation_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			implementation_feature := a_feature
		ensure
			implementation_feature_set: implementation_feature = a_feature
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

	set_first_precursor (a_precursor: like first_precursor) is
			-- Set `first_precursor' to `a_precursor'.
		do
			first_precursor := a_precursor
		ensure
			first_precursor_set: first_precursor = a_precursor
		end

	set_other_precursors (a_precursors: like other_precursors) is
			-- Set `other_precursors' to `a_precursors'.
		do
			other_precursors := a_precursors
		ensure
			other_precursors_set: other_precursors = a_precursors
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

	reset_preconditions is
			-- Set `preconditions' to Void.
		do
		ensure
			preconditions_reset: preconditions = Void
		end

	reset_postconditions is
			-- Set `postconditions' to Void.
		do
		ensure
			postconditions_reset: postconditions = Void
		end

feature -- Status setting

	set_used (b: BOOLEAN) is
			-- Set `is_used' to `b'.
		do
			is_used := b
		ensure
			used_set: is_used = b
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current is
			-- Synonym feature
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			new_synonym_not_void: Result /= Void
			extended_name_set: Result.extended_name = a_name
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current is
			-- Renamed version of current feature
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			renamed_feature_not_void: Result /= Void
			extended_name_set: Result.extended_name = a_name
			first_precursor_set: Result.first_precursor = first_precursor
			other_precursors_set: Result.other_precursors = other_precursors
		end

	undefined_feature (a_name: like extended_name): ET_DEFERRED_ROUTINE is
			-- Undefined version of current feature
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			undefined_feature_not_void: Result /= Void
			extended_name_set: Result.extended_name = a_name
			version_set: Result.version = Result.id
			first_precursor_set: Result.first_precursor = Current
			other_precursors_set: Result.other_precursors = Void
		end

feature -- Inheritance

	flattened_feature: ET_FEATURE is
			-- Feature resulting after feature flattening
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	flattened_immediate_feature: ET_FEATURE is
			-- Current feature viewed as an immediate feature
		do
			Result := Current
		end

feature -- Conversion

	as_feature: ET_FEATURE is
			-- `Current' viewed as a feature
		do
			Result := Current
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := name.name
		end

invariant

	extended_name_not_void: extended_name /= Void
	clients_not_void: clients /= Void
	hash_code_definition: hash_code = name.hash_code
	first_seed_positive: is_registered implies first_seed > 0
	implementation_class_not_void: implementation_class /= Void
	implementation_feature_not_void: implementation_feature /= Void
	is_flattened_immediate: is_flattened_immediate

end

indexing

	description:

		"Eiffel features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_FEATURE

inherit

	HASHABLE

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name

	clients: ET_CLIENTS
			-- Clients to which feature is exported

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		deferred
		end

	id: INTEGER
			-- Feature ID

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := name.hash_code
		end

	version: INTEGER
			-- Version (feature ID of last declaration
			-- of current feature)

	seeds: ET_FEATURE_SEEDS
			-- Seeds (feature IDs of first declarations
			-- of current feature)

	implementation_class: ET_CLASS
			-- Class where implementation of current feature
			-- has been provided (Useful for interpreting
			-- feature calls and type anchors (that might
			-- be renamed in descendant classes) when feature
			-- is inherited as-is.)

	signature: ET_SIGNATURE is
			-- Signature of current feature
			-- (Create a new object at each call.)
		deferred
		ensure
			signature_not_void: Result /= Void
		end

feature -- Status report

	is_frozen: BOOLEAN
			-- Has feature been declared as frozen?

	is_deferred: BOOLEAN is
			-- Is feature deferred?
		do
			Result := False
		end

	is_attribute: BOOLEAN is
			-- Is feature an attribute?
		do
			Result := False
		end

	is_constant_attribute: BOOLEAN is
			-- Is feature a constant attribute?
		do
			Result := False
		end

	is_unique_attribute: BOOLEAN is
			-- Is feature a unique attribute?
		do
			Result := False
		end

feature -- Comparison

	same_version (other: ET_FEATURE): BOOLEAN is
			-- Do current feature and `other' have
			-- the same version?
		require
			other_not_void: other /= Void
		do
			Result := version = other.version
		ensure
			definition: Result = (version = other.version)
		end

	same_signature (other: ET_FEATURE): BOOLEAN is
			-- Does current feature have the same 
			-- signature as `other'?
		require
			other_not_void: other /= Void
		do
			Result := True
		end

	signature_conforms_to (other: ET_FEATURE): BOOLEAN is
			-- Does signature of current feature
			-- conform to signature of `other'?
		require
			other_not_void: other /= Void
		do
			Result := True
		end

feature -- Setting

	set_version (a_version: INTEGER) is
			-- Set `version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
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

	set_seeds (a_seeds: like seeds) is
			-- Set `seeds' to `a_seeds'.
		require
			a_seeds_not_void: a_seeds /= Void
		do
			seeds := a_seeds
		ensure
			seeds_set: seeds = a_seeds
		end

feature -- Status setting

	set_frozen is
			-- Set `is_frozen' to true.
		do
			is_frozen := True
		ensure
			is_frozen: is_frozen
		end

feature -- Duplication

	synonym (a_name: like name; an_id: INTEGER): like Current is
			-- Synonym feature
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id >= 0
		deferred
		ensure
			synonym_not_void: Result /= Void
			name_set: Result.name = a_name
			id_set: Result.id = an_id
		end

feature -- Conversion

	renamed_feature (a_name: like name; an_id: INTEGER): like Current is
			-- Renamed version of current feature
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id >= 0
		deferred
		ensure
			renamed_feature_not_void: Result /= Void
			name_set: Result.name = a_name
			id_set: Result.id = an_id
		end

	undefined_feature (a_name: like name; an_id: INTEGER): ET_DEFERRED_ROUTINE is
			-- Undefined version of current feature
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id >= 0
		deferred
		ensure
			undefined_feature_not_void: Result /= Void
			name_set: Result.name = a_name
			version_set: Result.version = an_id
			id_set: Result.id = an_id
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current feature.
		deferred
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): BOOLEAN is
			-- Does current feature contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
			-- parameter?
		require
			actual_parameters_not_void: actual_parameters /= Void
		deferred
		end

	resolve_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS) is
			-- Replace in current feature the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter.
		require
			actual_parameters_not_void: actual_parameters /= Void
		deferred
		end

	resolve_identifier_types (a_flattener: ET_FEATURE_FLATTENER) is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of current feature by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types and check
			-- validity of arguments' name.
		require
			a_flattener_not_void: a_flattener /= Void
			immediate_or_redeclared: implementation_class = a_flattener.current_class
		deferred
		end

invariant

	name_not_void: name /= Void
	id_positive: id >= 0
	clients_not_void: clients /= Void
	seeds_not_void: seeds /= Void
	implementation_class_not_void: implementation_class /= Void

end -- class ET_FEATURE

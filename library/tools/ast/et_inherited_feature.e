indexing

	description:

		"Eiffel inherited features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INHERITED_FEATURE

creation

	make

feature {NONE} -- Initialization

	make (f: like inherited_feature; p: like parent) is
			-- Create a new inherited feature.
		require
			f_not_void: f /= Void
			p_not_void: p /= Void
		local
			generics: like actual_parameters
		do
			parent := p
			inherited_feature := f
			signature := f.signature
			signature.duplicate_types
				-- Update the formal generic parameters
				-- that appear in inherited signature.
			generics := parent.type.generic_parameters
			if generics /= Void and then generics.has_derived_parameters then
				actual_parameters := generics
				signature.resolve_formal_parameters (actual_parameters)
			end
		ensure
			inherited_feature_set: inherited_feature = f
			parent_set: parent = p
		end

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			if new_name /= Void then
				Result := new_name.new_name
			else
				Result := inherited_feature.name
			end
		ensure
			name_not_void: Result /= Void
		end

	inherited_feature: ET_FEATURE
			-- Feature inherited from `parent'

	signature: ET_SIGNATURE
			-- Feature signature

	parent: ET_PARENT
			-- Parent from which feature is inherited

	actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS
			-- Actual generic parameters of `parent';
			-- Void if the parent class is not generic
			-- or if the actual parameters are not
			-- different from their corresponding formal
			-- parameters

	seeds: ET_FEATURE_SEEDS is
			-- Seeds (feature IDs of first declarations
			-- of `inherited_feature')
		do
			Result := inherited_feature.seeds
		ensure
			seeds_not_void: Result /= Void
		end

	new_name: ET_RENAME
			-- New name when feature is renamed

	new_exports: ET_CLIENTS
			-- New export status

	undefine_name: ET_FEATURE_NAME
			-- Name listed in undefine clause
			-- when feature is undefined

	redefine_name: ET_FEATURE_NAME
			-- Name listed in redefine clause
			-- when feature is redefined

	select_name: ET_FEATURE_NAME
			-- Name listed in select clause
			-- when feature is selected

feature -- Conversion

	adapted_feature (new_version: BOOLEAN; a_class: ET_CLASS): ET_FEATURE is
			-- Inherited feature after feature adaptation
			-- in class `a_class'
		require
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			if is_undefined then
				an_id := a_class.universe.next_feature_id
				Result := inherited_feature.undefined_feature (name, an_id)
			elseif is_renamed or new_version then
				an_id := a_class.universe.next_feature_id
				Result := inherited_feature.renamed_feature (name, an_id)
			elseif actual_parameters /= Void and then inherited_feature.has_formal_parameters (actual_parameters) then
					-- We need to update some formal generic parameters
					-- in this inherited feature, hence a duplication
					-- is needed.
				an_id := a_class.universe.next_feature_id
				Result := inherited_feature.renamed_feature (name, an_id)
			else
				Result := inherited_feature
			end
			if new_version then
				Result.set_version (Result.id)
			end
			if actual_parameters /= Void then
				Result.resolve_formal_parameters (actual_parameters)
			end
		ensure
			adapted_feature_not_void: Result /= Void
			new_version: new_version implies (Result.version = Result.id)
		end

	replicated_feature (an_id: INTEGER; a_class: ET_CLASS): ET_FEATURE is
			-- Inherited feature after feature adaptation
			-- and replication in class `a_class'
		require
			an_id_positive: an_id >= 0
			a_class_not_void: a_class /= Void
		do
			if is_undefined then
				Result := inherited_feature.undefined_feature (name, an_id)
			else
				Result := inherited_feature.renamed_feature (name, an_id)
			end
			Result.set_version (an_id)
			if actual_parameters /= Void then
				Result.resolve_formal_parameters (actual_parameters)
			end
		ensure
			replicated_feature_not_void: Result /= Void
			id_set: Result.id = an_id
			new_version: Result.version = an_id
		end

feature -- Status report

	is_renamed: BOOLEAN is
			-- Is feature being renamed?
		do
			Result := new_name /= Void
		ensure
			definition: Result = (new_name /= Void)
		end

	is_redefined: BOOLEAN is
			-- Is feature being redefined?
		do
			Result := redefine_name /= Void
		ensure
			definition: Result = (redefine_name /= Void)
		end

	is_undefined: BOOLEAN is
			-- Is feature being undefined?
		do
			Result := undefine_name /= Void
		ensure
			definition: Result = (undefine_name /= Void)
		end

	is_selected: BOOLEAN is
			-- Has feature been selected?
		do
			Result := select_name /= Void
		ensure
			definition: Result = (select_name /= Void)
		end

	is_deferred: BOOLEAN is
			-- Is feature inherited as deferred?
		do
			Result := inherited_feature.is_deferred or is_undefined
		ensure
			definition: Result = (inherited_feature.is_deferred or is_undefined)
		end

feature -- Comparison

	same_version (other: ET_INHERITED_FEATURE): BOOLEAN is
			-- Do current feature and `other'
			-- have the same version?
		require
			other_not_void: other /= Void
		do
			Result := inherited_feature.same_version (other.inherited_feature)
		ensure
			definition: Result = inherited_feature.same_version (other.inherited_feature)
		end

	same_syntactical_signature (other: ET_INHERITED_FEATURE): BOOLEAN is
			-- Does current feature have syntactically the
			-- same signature as `other' (e.g. do not try
			-- to resolve anchored types)?
		require
			other_not_void: other /= Void
		do
			Result := signature.same_syntactical_signature (other.signature)
		ensure
			definition: Result = signature.same_syntactical_signature (other.signature)
		end
	
	signature_conforms_to (other: ET_INHERITED_FEATURE): BOOLEAN is
			-- Does signature of current feature
			-- conform to signature of `other'?
		require
			other_not_void: other /= Void
		do
			Result := inherited_feature.signature_conforms_to (other.inherited_feature)
		end

feature -- Validity

	check_undefine_clause (a_class: ET_CLASS) is
			-- Check validity of undefine clause.
		require
			a_class_not_void: a_class /= Void
		do
			if is_undefined then
				if inherited_feature.is_deferred then
				end
				if inherited_feature.is_frozen then
				end
				if inherited_feature.is_unique_attribute then
				elseif inherited_feature.is_constant_attribute then
				elseif inherited_feature.is_attribute then
				end
			end
		end

	check_redefine_clause (a_class: ET_CLASS) is
			-- Check validity of redefine clause.
		require
			a_class_not_void: a_class /= Void
		do
			if is_redefined then
				if inherited_feature.is_frozen then
				end
			end
		end

feature -- Setting

	set_new_name (a_name: like new_name) is
			-- Set `new_name' to `a_name'.
		do
			new_name := a_name
		ensure
			new_name_set: new_name = a_name
		end

	set_undefine_name (a_name: like undefine_name) is
			-- Set `undefine_name' to `a_name'.
		do
			undefine_name := a_name
		ensure
			undefine_name_set: undefine_name = a_name
		end

	set_redefine_name (a_name: like redefine_name) is
			-- Set `redefine_name' to `a_name'.
		do
			redefine_name := a_name
		ensure
			redefine_name_set: redefine_name = a_name
		end

	set_select_name (a_name: like select_name) is
			-- Set `select_name' to `a_name'.
		do
			select_name := a_name
		ensure
			select_name_set: select_name = a_name
		end

invariant

	inherited_feature_not_void: inherited_feature /= Void
	parent_not_void: parent /= Void
	signature_not_void: signature /= Void

end -- class ET_INHERITED_FEATURE

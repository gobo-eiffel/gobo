indexing

	description:

		"Eiffel inherited features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
			generics: like actual_parameters
		do
			parent := p
			inherited_feature := f
			signature := f.signature
			signature.duplicate_types
				-- Update the formal generic parameters
				-- that appear in inherited signature.
			a_generic_class_type ?= parent.type
			if a_generic_class_type /= Void then
				generics := a_generic_class_type.generic_parameters
				if generics /= Void and then generics.has_derived_parameters then
					actual_parameters := generics
					signature.resolve_formal_parameters (actual_parameters)
				end
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

	actual_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters of `parent';
			-- Void if the parent class is not generic
			-- or if the actual parameters are not
			-- different from their corresponding formal
			-- parameters

	first_seed: INTEGER is
			-- First seed
		do
			Result := inherited_feature.first_seed
		ensure
			first_seed_positive: Result > 0
			first_seed_definition: seeds /= Void implies Result = seeds.first
		end

	seeds: ET_FEATURE_IDS is
			-- Seeds (feature IDs of first declarations
			-- of `inherited_feature'); May be Void if there
			-- is only one seed (which is then accessible
			-- through `first_seed')
		do
			Result := inherited_feature.seeds
		end

	id: INTEGER is
			-- Feature ID
		do
			Result := inherited_feature.id
		ensure
			id_positive: Result > 0
		end

	new_name: ET_RENAME
			-- New name when feature is renamed

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

	adapted_feature (a_class: ET_CLASS): ET_FEATURE is
			-- Inherited feature after feature adaptation
			-- in class `a_class'
		require
			a_class_not_void: a_class /= Void
		do
			if is_undefined then
				Result := inherited_feature.undefined_feature (name)
			else
				Result := inherited_feature.renamed_feature (name)
			end
			a_class.universe.register_feature (Result)
			Result.set_current_class (a_class)
			Result.set_version (Result.id)
			if actual_parameters /= Void then
				Result.resolve_formal_parameters (actual_parameters)
			end
		ensure
			adapted_feature_not_void: Result /= Void
			adapted_feature_registered: Result.is_registered
			version_set: Result.version = Result.id
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

	has_seed (a_seed: INTEGER): BOOLEAN is
			-- Does inherited feature have `a_seed'?
		do
			if first_seed = a_seed then
				Result := True
			elseif seeds /= Void then
				Result := seeds.has (a_seed)
			end
		ensure
			definition: Result = (first_seed = a_seed or
				(seeds /= Void and then seeds.has (a_seed)))
		end

feature -- Exports

	add_clients_to (a_clients_list: DS_ARRAYED_LIST [ET_CLASS_NAME_LIST]) is
			-- Add client clauses relevant to current feature to
			-- `a_clients_list'. Try to avoid adding client clauses
			-- when overridden by other client clauses in the list.
		require
			a_clients_list_not_void: a_clients_list /= Void
			no_void_clients: not a_clients_list.has (Void)
		local
			nb: INTEGER
		do
			nb := a_clients_list.count
			parent.add_clients_to (name, a_clients_list)
			if a_clients_list.count = nb then
				a_clients_list.force_last (inherited_feature.clients)
			end
		ensure
			not_empty: not a_clients_list.is_empty
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

feature -- Validity

	check_rename_clause (a_class: ET_CLASS): BOOLEAN is
			-- Check validity of rename clause.
			-- Report errors if not valid.
		require
			a_class_not_void: a_class /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			Result := True
			if is_renamed then
				a_name := new_name.new_name
				if a_name.is_infix then
					if not inherited_feature.is_infixable then
						Result := False
						a_class.error_handler.report_vhrc5_error (a_class, parent, new_name, inherited_feature)
					end
				elseif a_name.is_prefix then
					if not inherited_feature.is_prefixable then
						Result := False
						a_class.error_handler.report_vhrc4_error (a_class, parent, new_name, inherited_feature)
					end
				end
			end
		end

	check_undefine_clause (a_class: ET_CLASS): BOOLEAN is
			-- Check validity of undefine clause.
			-- Report errors if not valid.
		require
			a_class_not_void: a_class /= Void
		do
			Result := True
			if is_undefined then
				if inherited_feature.is_deferred then
						-- This is not a fatal error for gelint.
					a_class.error_handler.report_vdus3_error (a_class, parent, undefine_name)
				end
				if inherited_feature.is_frozen then
					Result := False
					a_class.error_handler.report_vdus2a_error (a_class, parent, undefine_name)
				end
				if
					inherited_feature.is_attribute or
					inherited_feature.is_unique_attribute or
					inherited_feature.is_constant_attribute
				then
					Result := False
					a_class.error_handler.report_vdus2b_error (a_class, parent, undefine_name)
				end
			end
		end

	check_redefine_clause (a_class: ET_CLASS): BOOLEAN is
			-- Check validity of redefine clause.
			-- Report errors if not valid.
		require
			a_class_not_void: a_class /= Void
		do
			Result := True
			if is_redefined then
				if inherited_feature.is_frozen then
					Result := False
					a_class.error_handler.report_vdrs2a_error (a_class, parent, redefine_name)
				end
				if
					inherited_feature.is_unique_attribute or
					inherited_feature.is_constant_attribute
				then
					Result := False
					a_class.error_handler.report_vdrs2b_error (a_class, parent, redefine_name)
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

end

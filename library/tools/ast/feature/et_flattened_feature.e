indexing

	description:

		"Eiffel features being flattened"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FLATTENED_FEATURE

creation

	make, make_inherited

feature {NONE} -- Initialization

	make (a_feature: like current_feature; a_class: like current_class) is
			-- Create a new flattened feature and set
			-- `current_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			name := a_feature.name
			current_feature := a_feature
			current_class := a_class
			!! inherited_features.make
			seeds := current_feature.seeds
		ensure
			current_feature_set: current_feature = a_feature
			current_class_set: current_class = a_class
		end

	make_inherited (a_feature: ET_INHERITED_FEATURE; a_class: like current_class) is
			-- Create a new flattened feature and add
			-- `a_feature' to `inherited_features'.
		require
			a_feature_not_void: a_feature /= Void
		do
			name := a_feature.name
			current_class := a_class
			!! inherited_features.make
			put_inherited_feature (a_feature)
		ensure
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name

	current_feature: ET_FEATURE
			-- Feature declared in current class

	inherited_features: DS_LINKED_LIST [ET_INHERITED_FEATURE]
			-- Features inherited from parents

	current_class: ET_CLASS
			-- Class where current feature is flattened

	seeds: ET_FEATURE_SEEDS
			-- Seeds

	signature: ET_SIGNATURE
			-- Signature of flattened feature;
			-- Void if not yet computed

	flattened_feature: ET_FEATURE
			-- Feature resulting from current feature adaptation;
			-- Void if not computed yet or if an error occurred
			-- during compilation

	integer_constant: ET_INTEGER_CONSTANT is
			-- Constant value if current feature is an
			-- integer constant attribute, Void otherwise
		local
			a_constant_attribute: ET_CONSTANT_ATTRIBUTE
			a_cursor: DS_LINKED_LIST_CURSOR [ET_INHERITED_FEATURE]
		do
			a_constant_attribute ?= current_feature
			if a_constant_attribute /= Void then
				Result ?= a_constant_attribute.constant
			end
			if Result = Void then
				a_cursor := inherited_features.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_constant_attribute ?= a_cursor.item.inherited_feature
					if a_constant_attribute /= Void then
						Result ?= a_constant_attribute.constant
					end
					if Result /= Void then
						a_cursor.go_after -- Jump out of the loop.
					else
						a_cursor.forth
					end
				end
			end
		end

	inherited_feature_with_seed (a_seed: INTEGER): ET_INHERITED_FEATURE is
			-- Inherited feature with seed `a_seed'
		require
			has_seed: seeds.has (a_seed)
			is_inherited: is_inherited_seed (a_seed)
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
		do
			a_cursor := inherited_features.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_feature := a_cursor.item
				if a_feature.seeds.has (a_seed) then
					Result := a_feature
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			inherited_feature_not_void: Result /= Void
			has_seed: Result.seeds.has (a_seed)
		end

	selected_name: ET_FEATURE_NAME is
			-- Feature name that appears in the Select subclause
		require
			has_selected: has_selected
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
		do
			a_cursor := inherited_features.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_feature := a_cursor.item
				if a_feature.is_selected then
					Result := a_feature.select_name
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			selected_name_not_void: Result /= Void
		end

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := current_class.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Status report

	has_selected: BOOLEAN
			-- Has an inherited feature been listed in
			-- a Select subclause?

	is_selected: BOOLEAN
			-- Has an inherited feature been selected
			-- to solve a replication conflict?

	is_replicated: BOOLEAN
			-- Has current feature been replicated?

	is_inherited: BOOLEAN is
			-- Is current feature inherited from a parent?
		do
			Result := not inherited_features.is_empty
		ensure
			definition: Result = not inherited_features.is_empty
		end

	is_inherited_seed (a_seed: INTEGER): BOOLEAN is
			-- Has `a_seed' been inherited?
		require
			has_seed: seeds.has (a_seed)
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
		do
			if current_feature = Void then
				Result := True
			else
				a_cursor := inherited_features.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_feature := a_cursor.item
					if a_feature.seeds.has (a_seed) then
						Result := True
						a_cursor.go_after -- Jump out of the loop.
					else
						a_cursor.forth
					end
				end
			end
		end

feature -- Status setting

	set_replicated (a_seed: INTEGER) is
			-- Set `is_replicated' to True.
			-- `a_seed' is the seed which needs replication.
		require
			has_seed: seeds.has (a_seed)
		local
			need_twin: BOOLEAN
		do
			is_replicated := True
			feature_id := current_class.universe.next_feature_id
			need_twin := (seeds = inherited_features.first.seeds)
			if need_twin then
				seeds := clone (seeds)
			end
			seeds.replace (a_seed, feature_id)
		ensure
			is_replicated: is_replicated
		end

	set_selected is
			-- Set `is_selected' to True.
		do
			is_selected := True
		ensure
			is_selected: is_selected
		end

feature -- Element change

	put_inherited_feature (a_feature: ET_INHERITED_FEATURE) is
			-- Add `a_feature' to `inherited_features'.
		require
			a_feature_not_void: a_feature /= Void
			same_name: a_feature.name.same_feature_name (name)
		local
			other_seeds: like seeds
			a_seed: INTEGER
			i, nb: INTEGER
			need_twin: BOOLEAN
		do
			if inherited_features.is_empty then
				seeds := a_feature.seeds
			else
				need_twin := (seeds = inherited_features.first.seeds)
				other_seeds := a_feature.inherited_feature.seeds
				nb := other_seeds.count
				from i := 1 until i > nb loop
					a_seed := other_seeds.item (i)
					if not seeds.has (a_seed) then
						if need_twin then
							seeds := clone (seeds)
							need_twin := False
						end
						seeds.put (a_seed)
					end
					i := i + 1
				end
			end
			inherited_features.put_last (a_feature)
			if a_feature.is_selected then
				has_selected := True
			end
		end

feature -- Compilation

	process_flattened_feature (a_flattener: ET_FEATURE_FLATTENER) is
			-- Process current feature adaptation and
			-- put the result in `flattened_feature'.
		require
			a_flattener_not_void: a_flattener /= Void
		local
			a_parent: ET_PARENT
			a_name: ET_FEATURE_NAME
		do
			if inherited_features.is_empty then
				process_immediate_feature (a_flattener)
			else
				if has_selected and not is_selected then
						-- This is not a fatal error for gelint.
					a_parent := inherited_features.first.parent
					a_name := selected_name
					current_class.error_handler.report_vmss3_error (current_class, a_parent, a_name)
				end
				if current_feature = Void then
					process_inherited_feature (a_flattener)
				else
					process_redeclared_feature (a_flattener)
				end
			end
		ensure
			flattened_feature_not_void: flattened_feature /= Void
			signature_not_void: signature /= Void
		end

feature {NONE} -- Compilation

	process_immediate_feature (a_flattener: ET_FEATURE_FLATTENER) is
			-- Process feature that has been introduced
			-- in `current_class' (ETL2, p. 56).
		require
			immediate_feature: inherited_features.is_empty
			a_flattener_not_void: a_flattener /= Void
		do
			current_feature.resolve_identifier_types (a_flattener)
			flattened_feature := current_feature
			signature := current_feature.signature
		ensure
			flattened_feature_not_void: flattened_feature /= Void
			signature_not_void: signature /= Void
		end

	process_redeclared_feature (a_flattener: ET_FEATURE_FLATTENER) is
			-- Process an inherited feature which has been
			-- given a new declaration in `current_class'.
		require
			inherited_feature: not inherited_features.is_empty
			redeclared_feature: current_feature /= Void
			a_flattener_not_void: a_flattener /= Void
		local
			a_feature: ET_INHERITED_FEATURE
			is_deferred, has_redefined: BOOLEAN
		do
			current_feature.resolve_identifier_types (a_flattener)
			flattened_feature := current_feature
			flattened_feature.set_seeds (seeds)
			signature := current_feature.signature
				-- Check Feature_adaptation clause.
			from inherited_features.start until inherited_features.after loop
				a_feature := inherited_features.item_for_iteration
				if not a_feature.check_rename_clause (current_class) then
					a_flattener.set_flatten_error
				end
				if not a_feature.check_undefine_clause (current_class) then
					a_flattener.set_flatten_error
				end
				if not a_feature.check_redefine_clause (current_class) then
					a_flattener.set_flatten_error
				end
				if a_feature.is_redefined then
					if has_redefined then
						-- Warning: feature redefined twice.
						-- Could not find which validity rule was violated
						-- and none of the Eiffel compilers complains...
					end
					has_redefined := True
				end
				inherited_features.forth
			end
			is_deferred := current_feature.is_deferred
			from inherited_features.start until inherited_features.after loop
				a_feature := inherited_features.item_for_iteration
				if a_feature.is_redefined then
					if is_deferred /= a_feature.is_deferred then
						if is_deferred then
								-- Error: Used 'redefine' instead of 'undefine'.
								-- Need to use 'undefine' to redeclare an
								-- effective feature to a deferred feature.
								-- (Not considered as a fatal error by gelint.)
							error_handler.report_vdrd5_error (current_class, a_feature, current_feature)
						else
								-- Error: No need to 'redefine' to redeclare
								-- a deferred feature to an effective feature.
								-- (Not considered as a fatal error by gelint.)
							error_handler.report_vdrs4b_error (current_class, a_feature, current_feature)
						end
					end
				elseif is_deferred then
					if a_feature.is_deferred then
						if not has_redefined then
								-- Error: Need 'redefine' to redeclare a
								-- deferred feature to a deferred feature.
								-- (Not considered as a fatal error by gelint.)
							error_handler.report_vdrd4a_error (current_class, a_feature, current_feature)
						end
					else
							-- Error: need 'undefine' and 'redefine' to
							-- redeclare an effective feature to a deferred
							-- feature.
						error_handler.report_vmfnb_error (current_class, a_feature, current_feature)
						error_handler.report_vdrd4c_error (current_class, a_feature, current_feature)
						a_flattener.set_flatten_error
					end
				elseif not a_feature.is_deferred then
						-- Error: need 'redefine' to redeclare an effective
						-- feature to an effective feature.
					error_handler.report_vmfnb_error (current_class, a_feature, current_feature)
					error_handler.report_vdrd4b_error (current_class, a_feature, current_feature)
					a_flattener.set_flatten_error
				end
				inherited_features.forth
			end
		ensure
			flattened_feature_not_void: flattened_feature /= Void
			signature_not_void: signature /= Void
		end

	process_inherited_feature (a_flattener: ET_FEATURE_FLATTENER) is
			-- Process an inherited feature which has not been
			-- given a new declaration in `current_class'.
		require
			inherited_feature: current_feature = Void
			a_flattener_not_void: a_flattener /= Void
		local
			a_feature, effective, a_deferred: ET_INHERITED_FEATURE
			same_version, duplication_needed: BOOLEAN
		do
				-- Check Feature_adaptation clause.
			from inherited_features.start until inherited_features.after loop
				a_feature := inherited_features.item_for_iteration
				if not a_feature.check_rename_clause (current_class) then
					a_flattener.set_flatten_error
				end
				if not a_feature.check_undefine_clause (current_class) then
					a_flattener.set_flatten_error
				end
				if not a_feature.check_redefine_clause (current_class) then
					a_flattener.set_flatten_error
				end
				if a_feature.is_redefined then
						-- Error: Not a redefinition.
					error_handler.report_vdrs4a_error (current_class, a_feature)
					a_flattener.set_flatten_error
				end
				if not a_feature.is_deferred then
					if effective = Void then
						effective := a_feature
					else
						if not a_feature.same_version (effective) then
								-- Error: two effective features which
								-- are not shared.
							error_handler.report_vmfnc_error (current_class, effective, a_feature)
							a_flattener.set_flatten_error
						end
						if effective.is_renamed then
								-- Trying to choose one which is not renamed
								-- to avoid duplication.
							effective := a_feature
						end
					end
				end
				inherited_features.forth
			end
			if effective /= Void then
				a_feature := effective
				duplication_needed := False
				same_version := True
			else
				same_version := True
				from inherited_features.start until inherited_features.after loop
					a_feature := inherited_features.item_for_iteration
					if a_deferred = Void then
						a_deferred := a_feature
					else
						if not a_feature.same_version (a_deferred) then
								-- Not sharing.
							same_version := False
						end
						if a_deferred.is_renamed then
								-- Trying to choose one which is not renamed
								-- to avoid duplication.
							a_deferred := a_feature
						end
					end
					inherited_features.forth
				end
				a_feature := a_deferred
				duplication_needed := not same_version
			end
			if is_replicated then
				flattened_feature := a_feature.replicated_feature (feature_id, current_class)
			else
				if not duplication_needed then
						-- Force duplication when there is a
						-- sharing of features but the seeds
						-- have been extended.
					duplication_needed := not a_feature.seeds.is_equal (seeds)
				end
				flattened_feature := a_feature.adapted_feature (duplication_needed, current_class)
				if same_version then
					flattened_feature.set_version (a_feature.inherited_feature.version)
				end
			end
			flattened_feature.set_seeds (seeds)
			signature := a_feature.signature
		ensure
			flattened_feature_not_void: flattened_feature /= Void
			signature_not_void: signature /= Void
		end

feature -- Validity

	check_signature_validity: BOOLEAN is
			-- Check signature validity for redeclarations and joinings.
		require
			flattened_feature_not_void: flattened_feature /= Void
			signature_not_void: signature /= Void
		local
			a_feature: ET_INHERITED_FEATURE
		do
			Result := True
			if not inherited_features.is_empty then
				if current_feature /= Void then
						-- Redeclaration.
					from inherited_features.start until inherited_features.after loop
						a_feature := inherited_features.item_for_iteration
						if not a_feature.signature.signature_conforms_to (signature) then
							-- Error: VDRD-2
							Result := False
						end
						inherited_features.forth
					end
				elseif flattened_feature.is_deferred then
						-- Joining.
					from inherited_features.start until inherited_features.after loop
						a_feature := inherited_features.item_for_iteration
						if not a_feature.inherited_feature.same_version (flattened_feature) then
							if not a_feature.signature.same_signature (signature) then
								-- Error: VDJR
								Result := False
							end
						end
						inherited_features.forth
					end
				else
						-- Redeclaration.
					from inherited_features.start until inherited_features.after loop
						a_feature := inherited_features.item_for_iteration
						if a_feature.is_deferred then
							if not a_feature.signature.signature_conforms_to (signature) then
								-- Error: VDRD-2
								Result := False
							end
						end
						inherited_features.forth
					end
				end
			end
		end

feature {ET_REPLICABLE_FEATURE} -- Replication

	feature_id: INTEGER
			-- New feature ID when feature is replicated
--		require
--			is_replicated: is_replicated
--		ensure
--			id_positive: Result >= 0

invariant

	inherited_features_not_void: inherited_features /= Void
	no_void_inherited_feature: not inherited_features.has (Void)
	at_least_one: current_feature /= Void or else not inherited_features.is_empty
	current_class_not_void: current_class /= Void
	seeds_not_void: seeds /= Void

end -- class ET_FLATTENED_FEATURE

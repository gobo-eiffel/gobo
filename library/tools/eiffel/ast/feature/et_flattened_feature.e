indexing

	description:

		"Eiffel features being flattened"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
			first_seed := current_feature.first_seed
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

	first_seed: INTEGER
			-- First seed

	seeds: ET_FEATURE_IDS
			-- Seeds; May be Void if there is only one seed
			-- (which is then accessible through `first_seed')

	signature: ET_SIGNATURE
			-- Signature of flattened feature;
			-- Void if not yet computed

	flattened_feature: ET_FEATURE
			-- Feature resulting from current feature adaptation;
			-- Void if not computed yet or if an error occurred
			-- during compilation

	inherited_feature_with_seed (a_seed: INTEGER): ET_INHERITED_FEATURE is
			-- Inherited feature with seed `a_seed'
		require
			has_seed: has_seed (a_seed)
			is_inherited: is_inherited_seed (a_seed)
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
		do
			a_cursor := inherited_features.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_feature := a_cursor.item
				if a_feature.has_seed (a_seed) then
					Result := a_feature
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			inherited_feature_not_void: Result /= Void
			has_seed: Result.has_seed (a_seed)
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

	replicated_seeds: ET_FEATURE_IDS
			-- Seeds involved when current feature has been replicated

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

	is_replicated: BOOLEAN is
			-- Has current feature been replicated?
		do
			Result := replicated_seeds /= Void
		ensure
			definition: Result = (replicated_seeds /= Void)
		end

	is_inherited: BOOLEAN is
			-- Is current feature inherited from a parent?
		do
			Result := not inherited_features.is_empty
		ensure
			definition: Result = not inherited_features.is_empty
		end

	has_seed (a_seed: INTEGER): BOOLEAN is
			-- Does current feature have `a_seed'?
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

	is_inherited_seed (a_seed: INTEGER): BOOLEAN is
			-- Has `a_seed' been inherited?
		require
			has_seed: has_seed (a_seed)
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
					if a_feature.has_seed (a_seed) then
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
			has_seed: has_seed (a_seed)
		do
			if replicated_seeds = Void then
				!! replicated_seeds.make (a_seed)
			elseif not replicated_seeds.has (a_seed) then
				replicated_seeds.put (a_seed)
			end
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
				first_seed := a_feature.first_seed
				seeds := a_feature.seeds
			else
				need_twin := (seeds = inherited_features.first.seeds)
				other_seeds := a_feature.seeds
				if other_seeds = Void then
					a_seed := a_feature.first_seed
					if not has_seed (a_seed) then
						if seeds = Void then
							!! seeds.make_with_capacity (first_seed, 2)
						else
							if need_twin then
								seeds := clone (seeds)
								need_twin := False
							end
						end
						seeds.put (a_seed)
					end
				else
					nb := other_seeds.count
					from i := 1 until i > nb loop
						a_seed := other_seeds.item (i)
						if not has_seed (a_seed) then
							if seeds = Void then
								!! seeds.make_with_capacity (first_seed, 2)
							else
								if need_twin then
									seeds := clone (seeds)
									need_twin := False
								end
							end
							seeds.put (a_seed)
						end
						i := i + 1
					end
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

	resolve_identifier_types is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of current feature by the corresponding
			-- 'like feature' or 'like argument'. Also resolve
			-- 'BIT identifier' types and check validity of arguments'
			-- name. Set `a_class.has_flatten_error' to true if an error
			-- occurs.
		do
			if current_feature /= Void then
				current_feature.resolve_identifier_types (current_class)
			end
		end

feature {NONE} -- Compilation

	process_immediate_feature (a_flattener: ET_FEATURE_FLATTENER) is
			-- Process feature that has been introduced
			-- in `current_class' (ETL2, p. 56).
		require
			immediate_feature: inherited_features.is_empty
			a_flattener_not_void: a_flattener /= Void
		do
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
			a_first_precursor, a_precursor: INTEGER
			a_precursors: ET_FEATURE_IDS
			i, nb: INTEGER
			need_twin: BOOLEAN
			a_seed, new_seed: INTEGER
		do
			flattened_feature := current_feature
			if is_replicated then
				new_seed := flattened_feature.id
				if seeds /= Void then
					need_twin := (seeds = inherited_features.first.seeds)
					if need_twin then
						seeds := clone (seeds)
					end
					seeds.replace (replicated_seeds.first, new_seed)
					nb := replicated_seeds.count
					from i := 2 until i > nb loop
						a_seed := replicated_seeds.item (i)
						seeds.remove (a_seed)
						i := i + 1
					end
					first_seed := seeds.first
				else
					first_seed := new_seed
				end
				replicated_seeds := Void
			end
			if seeds /= Void and then seeds.count > 1 then
				flattened_feature.set_seeds (seeds)
			else
				flattened_feature.set_first_seed (first_seed)
			end
			signature := current_feature.signature
				-- Check Feature_adaptation clause.
			a_first_precursor := inherited_features.first.id
			from inherited_features.start until inherited_features.after loop
				a_feature := inherited_features.item_for_iteration
				a_precursor := a_feature.id
				if a_precursor = a_first_precursor then
					-- Do nothing.
				elseif a_precursors = Void or else not a_precursors.has (a_precursor) then
					if a_precursors = Void then
						!! a_precursors.make_with_capacity (a_first_precursor, inherited_features.count)
					end
					a_precursors.put (a_precursor)
				end
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
			if a_precursors /= Void and then a_precursors.count > 1 then
				flattened_feature.set_precursors (a_precursors)
			else
				flattened_feature.set_first_precursor (a_first_precursor)
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
			same_version: BOOLEAN
			a_first_precursor, a_precursor: INTEGER
			a_precursors: ET_FEATURE_IDS
			i, nb: INTEGER
			need_twin: BOOLEAN
			a_seed, new_seed: INTEGER
			a_clients_list: DS_ARRAYED_LIST [ET_CLASS_NAME_LIST]
			a_clients1, a_clients2: ET_CLASS_NAME_LIST
			nb_clients: INTEGER
		do
				-- Check Feature_adaptation clause.
			a_clients_list := a_flattener.clients_list
			a_clients_list.wipe_out
			a_first_precursor := inherited_features.first.id
			from inherited_features.start until inherited_features.after loop
				a_feature := inherited_features.item_for_iteration
				a_precursor := a_feature.id
				if a_precursor = a_first_precursor then
					-- Do nothing.
				elseif a_precursors = Void or else not a_precursors.has (a_precursor) then
					if a_precursors = Void then
						!! a_precursors.make_with_capacity (a_first_precursor, inherited_features.count)
					end
					a_precursors.put (a_precursor)
				end
				a_feature.add_clients_to (a_clients_list)
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
			end
			flattened_feature := a_feature.adapted_feature (current_class)
			if is_replicated then
				new_seed := flattened_feature.id
				if seeds /= Void then
					need_twin := (seeds = inherited_features.first.seeds)
					if need_twin then
						seeds := clone (seeds)
					end
					seeds.replace (replicated_seeds.first, new_seed)
					nb := replicated_seeds.count
					from i := 2 until i > nb loop
						a_seed := replicated_seeds.item (i)
						seeds.remove (a_seed)
						i := i + 1
					end
					first_seed := seeds.first
				else
					first_seed := new_seed
				end
				replicated_seeds := Void
			else
				if same_version then
					flattened_feature.set_version (a_feature.inherited_feature.version)
				end
			end
			a_clients1 := a_clients_list.first
			nb := a_clients_list.count
			from i := 1 until i > nb loop
				a_clients2 := a_clients_list.item (i)
				if a_clients2.is_none then
					a_clients_list.remove (i)
					nb := nb - 1
				else
					nb_clients := nb_clients + a_clients2.count
					i := i + 1
				end
			end
			if a_clients_list.is_empty then
				-- Keep `a_clients1'.
			elseif a_clients_list.count = 1 then
				a_clients1 := a_clients_list.first
			else
				!! a_clients1.make_with_capacity (nb_clients)
				nb := a_clients_list.count
				from i := 1 until i > nb loop
					a_clients2 := a_clients_list.item (i)
					a_clients1.extend_first (a_clients2)
					i := i + 1
				end
			end
			a_clients_list.wipe_out
			flattened_feature.set_clients (a_clients1)
			if seeds /= Void and then seeds.count > 1 then
				flattened_feature.set_seeds (seeds)
			else
				flattened_feature.set_first_seed (first_seed)
			end
			if a_precursors /= Void and then a_precursors.count > 1 then
				flattened_feature.set_precursors (a_precursors)
			else
				flattened_feature.set_first_precursor (a_first_precursor)
			end
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

invariant

	inherited_features_not_void: inherited_features /= Void
	no_void_inherited_feature: not inherited_features.has (Void)
	at_least_one: current_feature /= Void or else not inherited_features.is_empty
	current_class_not_void: current_class /= Void
	first_seed_positive: first_seed > 0
	first_seed_definition: seeds /= Void implies first_seed = seeds.first
	-- replicated_seeds: replicated_seeds /= Void implies forall a_seed in replicated_seeds, has_seed (a_seed)

end

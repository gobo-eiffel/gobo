indexing

	description:

		"Eiffel feature signature checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SIGNATURE_CHECKER

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new signature checker for features of classes in `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			create parent_context.make_with_capacity (a_universe.any_class, 1)
		ensure
			universe_set: universe = a_universe
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last feature signature?

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Signature validity

	check_signature_validity (a_feature: ET_FLATTENED_FEATURE; a_class: ET_CLASS) is
			-- Check signature validity of `a_feature' for redeclarations and joinings.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			a_flattened_feature: ET_FEATURE
--			an_inherited_flattened_feature: ET_PARENT_FEATURE
			a_redeclared_feature: ET_REDECLARED_FEATURE
			an_inherited_feature: ET_INHERITED_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_adapted_feature: ET_ADAPTED_FEATURE
			a_replicated_features: DS_LINKED_LIST [ET_PARENT_FEATURE]
			a_cursor: DS_LINKED_LIST_CURSOR [ET_PARENT_FEATURE]
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			if a_feature.is_redeclared then
					-- Redeclaration.
				a_redeclared_feature := a_feature.redeclared_feature
				from
					a_parent_feature := a_redeclared_feature.parent_feature
				until
					a_parent_feature = Void
				loop
					check_redeclared_signature_validity (a_redeclared_feature, a_parent_feature)
					a_parent_feature := a_parent_feature.merged_feature
				end
			elseif a_feature.is_inherited then
				an_inherited_feature := a_feature.inherited_feature
				a_flattened_feature := an_inherited_feature.flattened_feature
--				an_inherited_flattened_feature := an_inherited_feature.flattened_parent
				if a_flattened_feature.is_deferred then
						-- Joining (merging deferred features together).
					from
						a_parent_feature := an_inherited_feature.parent_feature
					until
						a_parent_feature = Void
					loop
--						if not a_parent_feature.same_version (an_inherited_flattened_feature) then
							check_joined_signature_validity (an_inherited_feature, a_parent_feature)
--						end
						a_parent_feature := a_parent_feature.merged_feature
					end
				else
						-- Redeclaration (merging deferred features into an effective one).
					from
						a_parent_feature := an_inherited_feature.parent_feature
					until
						a_parent_feature = Void
					loop
						if a_parent_feature.is_deferred then
							check_redeclared_signature_validity (an_inherited_feature, a_parent_feature)
						end
						a_parent_feature := a_parent_feature.merged_feature
					end
				end
			else
				check_immediate_signature_validity (a_feature.flattened_feature)
			end
			if a_feature.is_adapted then
				an_adapted_feature := a_feature.adapted_feature
				if an_adapted_feature.is_selected then
					a_replicated_features := an_adapted_feature.replicated_features
					if a_replicated_features /= Void then
						a_cursor := a_replicated_features.new_cursor
						from a_cursor.start until a_cursor.after loop
							check_selected_signature_validity (an_adapted_feature, a_cursor.item)
							a_cursor.forth
						end
					end
				end
			end
			current_class := old_class
		end

feature {NONE} -- Signature validity

	check_immediate_signature_validity (a_feature: ET_FEATURE) is
			-- Check whether `a_feature' has correctly been declared
			-- as having arguments which can possibly be redefined
			-- covariantly in descendant classes?
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			if universe.anchored_cat_features then
				if not universe.all_cat_features and not a_feature.is_cat then
					an_arguments := a_feature.arguments
					if an_arguments /= Void then
						nb := an_arguments.count
						from i := 1 until i > nb loop
							a_type := an_arguments.formal_argument (i).type
							if a_type.has_anchored_type (current_class, universe) then
								if universe.searching_cat_features then
									a_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
									i := nb + 1 -- Jump out of the loop.
								else
									set_fatal_error
-- TODO:
									error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_feature.name.name + " should be marked as covariant")
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	check_redeclared_signature_validity (a_feature: ET_ADAPTED_FEATURE; other: ET_PARENT_FEATURE) is
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is a redeclaration in `current_class'
			-- of the inherited feature `other', or when the inherited
			-- feature `other' is deferred and is merged to the other
			-- inherted feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			other_not_void: other /= Void
		local
			a_type: ET_TYPE
			other_type: ET_TYPE
			other_precursor: ET_FEATURE
			a_flattened_feature: ET_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			other_arguments: ET_FORMAL_ARGUMENT_LIST
			a_resolver: ET_AST_PROCESSOR
			b: BOOLEAN
			i, nb: INTEGER
			l_cat: BOOLEAN
			l_other_cat: BOOLEAN
			l_mark_cat: BOOLEAN
			l_mark_other_cat: BOOLEAN
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			a_cat_feature: ET_FEATURE
			a_seeds: ET_FEATURE_IDS
			j, nb2: INTEGER
		do
				-- We don't want the qualified anchored types in signatures to be resolved yet.
			a_resolver := universe.qualified_signature_resolver
			universe.set_qualified_signature_resolver (universe.null_processor)
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_type = Void then
				set_fatal_error
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
				end
			elseif not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
				if
					a_type.has_qualified_type (current_class, universe) or
					other_type.has_qualified_type (parent_context, universe)
				then
						-- We have to delay until qualified
						-- anchored types have been resolved.
					has_qualified_type := True
				else
					set_fatal_error
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			elseif a_feature.is_redeclared and other_precursor.is_attribute then
				if not a_flattened_feature.is_attribute then
					-- We already checked in `check_redeclaration_validity' whether
					-- `a_flattened_feature' was an attribute and reported
					-- an error otherwise.
				elseif a_type.type.is_type_expanded (current_class, universe) /= other_type.is_type_expanded (current_class, universe) then
						-- VDRD-6 says that the types of the two attributes should
						-- be both expanded or both non-expanded.
					set_fatal_error
					error_handler.report_vdrd6b_error (current_class, other, a_flattened_feature)
				end
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error
				error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
			else
				l_cat := universe.all_cat_features or a_flattened_feature.is_cat
				l_other_cat := universe.all_cat_features or other_precursor.is_cat
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					if universe.anchored_cat_features then
						if not l_cat and a_feature.is_redeclared then
							if a_type.has_anchored_type (current_class, universe) then
								if universe.searching_cat_features then
									l_mark_cat := True
									l_cat := True
								else
									set_fatal_error
-- TODO:
									error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_flattened_feature.name.name + " should be marked as covariant")
								end
							end
						end
					end
					other_type := other_arguments.formal_argument (i).type
					if not l_other_cat then
						if universe.searching_cat_features then
							if l_cat then
								l_mark_other_cat := True
								l_other_cat := True
							elseif not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								l_mark_other_cat := True
								l_other_cat := True
							end
						else
							if l_cat then
								set_fatal_error
-- TODO:
								error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_flattened_feature.name.name + " is marked as covariant but is the redeclaration of an no-variant feature")
							end
							if not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								if
									a_type.has_qualified_type (current_class, universe) or
									other_type.has_qualified_type (parent_context, universe)
								then
										-- We have to delay until qualified
										-- anchored types have been resolved.
									has_qualified_type := True
								else
									set_fatal_error
									if a_feature.is_inherited then
										a_parent_feature := a_feature.inherited_feature.flattened_parent
										error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
									else
										error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
									end
								end
							end
						end
					end
					if l_other_cat then
						if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
							if
								a_type.has_qualified_type (current_class, universe) or
								other_type.has_qualified_type (parent_context, universe)
							then
									-- We have to delay until qualified
									-- anchored types have been resolved.
								has_qualified_type := True
							else
								set_fatal_error
								if a_feature.is_inherited then
									a_parent_feature := a_feature.inherited_feature.flattened_parent
									error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
								else
									error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
								end
							end
						elseif universe.searching_dog_types then
								-- Force the redeclared type to be non-cat when the two
								-- types are the same except for their cat-ness. This
								-- trick may prevent this feature from having to be
								-- marked as cat.
							b := a_type.same_syntactical_type (other_type, parent_context, current_class, universe)
						end
					end
					i := i + 1
				end
				if l_mark_cat then
					a_flattened_feature.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := current_class.ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (a_flattened_feature.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := a_flattened_feature.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				elseif l_mark_other_cat then
					other_precursor.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := other.parent.type.direct_base_class (universe).ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (other_precursor.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := other_precursor.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				end
			end
			universe.set_qualified_signature_resolver (a_resolver)
		end

	check_selected_signature_validity (a_feature: ET_ADAPTED_FEATURE; other: ET_PARENT_FEATURE) is
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is the selected version in `current_class'
			-- of the inherited replicated feature `other'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_selected: a_feature.is_selected
			other_not_void: other /= Void
		local
			a_type: ET_TYPE
			other_type: ET_TYPE
			other_precursor: ET_FEATURE
			a_flattened_feature: ET_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			other_arguments: ET_FORMAL_ARGUMENT_LIST
			a_resolver: ET_AST_PROCESSOR
			b: BOOLEAN
			i, nb: INTEGER
			l_cat: BOOLEAN
			l_other_cat: BOOLEAN
			l_mark_cat: BOOLEAN
			l_mark_other_cat: BOOLEAN
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			a_cat_feature: ET_FEATURE
			a_seeds: ET_FEATURE_IDS
			j, nb2: INTEGER
		do
				-- We don't want the qualified anchored types in signatures to be resolved yet.
			a_resolver := universe.qualified_signature_resolver
			universe.set_qualified_signature_resolver (universe.null_processor)
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_type = Void then
				set_fatal_error
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
				end
			elseif not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
				if
					a_type.has_qualified_type (current_class, universe) or
					other_type.has_qualified_type (parent_context, universe)
				then
						-- We have to delay until qualified
						-- anchored types have been resolved.
					has_qualified_type := True
				else
					set_fatal_error
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
				end
			else
				l_cat := universe.all_cat_features or a_flattened_feature.is_cat
				l_other_cat := universe.all_cat_features or other_precursor.is_cat
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					other_type := other_arguments.formal_argument (i).type
					if not l_other_cat then
						if universe.searching_cat_features then
							if l_cat then
								l_mark_other_cat := True
								l_other_cat := True
							elseif not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								l_mark_other_cat := True
								l_other_cat := True
							end
						else
							if l_cat then
								set_fatal_error
-- TODO:
								error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_flattened_feature.name.name + " is marked as covariant but is the redeclaration of an no-variant feature")
							end
							if not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								if
									a_type.has_qualified_type (current_class, universe) or
									other_type.has_qualified_type (parent_context, universe)
								then
										-- We have to delay until qualified
										-- anchored types have been resolved.
									has_qualified_type := True
								else
									set_fatal_error
									if a_feature.is_inherited then
										a_parent_feature := a_feature.inherited_feature.flattened_parent
										error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
									else
										error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
									end
								end
							end
						end
					end
					if l_other_cat then
						if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
							if
								a_type.has_qualified_type (current_class, universe) or
								other_type.has_qualified_type (parent_context, universe)
							then
									-- We have to delay until qualified
									-- anchored types have been resolved.
								has_qualified_type := True
							else
								set_fatal_error
								if a_feature.is_inherited then
									a_parent_feature := a_feature.inherited_feature.flattened_parent
									error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
								else
									error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
								end
							end
						elseif universe.searching_dog_types then
								-- Force the redeclared type to be non-cat when the two
								-- types are the same except for their cat-ness. This
								-- trick may prevent this feature from having to be
								-- marked as cat.
							b := a_type.same_syntactical_type (other_type, parent_context, current_class, universe)
						end
					end
					i := i + 1
				end
				if l_mark_cat then
					a_flattened_feature.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := current_class.ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (a_flattened_feature.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := a_flattened_feature.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				elseif l_mark_other_cat then
					other_precursor.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := other.parent.type.direct_base_class (universe).ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (other_precursor.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := other_precursor.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				end
			end
			universe.set_qualified_signature_resolver (a_resolver)
		end

	check_joined_signature_validity (a_feature: ET_INHERITED_FEATURE; other: ET_PARENT_FEATURE) is
			-- Check that `a_feature' and `other' have the same signature
			-- when viewed from `current_class'. This check has to be done
			-- when joining two or more deferred features, the `a_feature'
			-- being the result of the join in `current_class' and `other'
			-- being one of the other deferred features inherited from a
			-- parent of `current_class'. (See ETL2 page 165 about Joining.)
		require
			a_feature_not_void: a_feature /= Void
			other_not_void: other /= Void
		local
			a_joined_feature: ET_FEATURE
			other_precursor: ET_FEATURE
			an_arguments, other_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type, other_type: ET_TYPE
			i, nb: INTEGER
		do
			a_joined_feature := a_feature.flattened_feature
			a_type := a_joined_feature.type
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			parent_context.set (other.parent.type, current_class)
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error
					error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
				end
			elseif other_type = Void then
				set_fatal_error
				error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
			elseif not a_type.same_syntactical_type (other_type, parent_context, current_class, universe) then
				if
					a_type.has_qualified_type (current_class, universe) or
					other_type.has_qualified_type (parent_context, universe)
				then
						-- We have to delay until qualified
						-- anchored types have been resolved.
					has_qualified_type := True
				else
					set_fatal_error
					error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
				end
			end
			an_arguments := a_joined_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error
					error_handler.report_vdjr0a_error (current_class, a_feature.flattened_parent, other)
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error
				error_handler.report_vdjr0a_error (current_class, a_feature.flattened_parent, other)
			else
-- TODO: if one of the joined features is not argument covariant, then the
-- feature resulting of the join should be no argument covariant as well.
				nb := an_arguments.count
				from i := 1 until i > nb loop
					if not an_arguments.formal_argument (i).type.same_syntactical_type (other_arguments.formal_argument (i).type, parent_context, current_class, universe) then
						if
							a_type.has_qualified_type (current_class, universe) or
							other_type.has_qualified_type (parent_context, universe)
						then
								-- We have to delay until qualified
								-- anchored types have been resolved.
							has_qualified_type := True
						else
							set_fatal_error
							error_handler.report_vdjr0b_error (current_class, a_feature.flattened_parent, other, i)
						end
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_class: ET_CLASS
			-- Class being processed

feature {NONE} -- Implementation

	parent_context: ET_NESTED_TYPE_CONTEXT
			-- Parent context for type conformance checking

	has_qualified_type: BOOLEAN
			-- Is there a qualified anchored type in (or reachable
			-- from) the signature of the feature being analyzed?
			-- If this is the case we will have to check again the
			-- signature of this feature after the features of the
			-- corresponding classes have been flattened.

invariant

	universe_not_void: universe /= Void
	current_class_not_void: current_class /= Void
	parent_context_not_void: parent_context /= Void

end

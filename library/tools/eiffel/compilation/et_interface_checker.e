indexing

	description:

		"Eiffel class interface checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INTERFACE_CHECKER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make,
			process_class
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new interface checker for classes in `a_universe'.
		do
			precursor (a_universe)
			create parent_context.make (a_universe.any_class, a_universe.any_class)
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.set_interface_checked
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaad_error
				create a_processor.make (universe)
				a_processor.process_class (a_class)
			elseif a_class /= unknown_class then
				internal_process_class (a_class)
			else
				set_fatal_error (a_class)
			end
		ensure then
			interface_checked: a_class.interface_checked
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			a_class.set_interface_checked
			a_class.set_interface_error
		ensure then
			interface_checked: a_class.interface_checked
			has_interface_error: a_class.has_interface_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
		require
			a_class_not_void: a_class /= Void
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			a_parent_class: ET_CLASS
			i, nb: INTEGER
		do
			old_class := current_class
			current_class := a_class
			if not current_class.interface_checked then
					-- Resolve qualified anchored types in signatures of features
					-- of `current_class' if not already done.
				current_class.process (universe.qualified_signature_resolver)
				if not current_class.has_qualified_signatures_error then
					current_class.set_interface_checked
						-- Process parents first.
					a_parents := current_class.parents
					if a_parents = Void or else a_parents.is_empty then
						if current_class = universe.general_class then
							a_parents := Void
						elseif current_class = universe.any_class then
								-- ISE Eiffel has no GENERAL class anymore.
								-- Use ANY has class root now.
							a_parents := Void
						else
							a_parents := universe.any_parents
						end
					end
					if a_parents /= Void then
						nb := a_parents.count
						from i := 1 until i > nb loop
								-- This is a controlled recursive call to `internal_process_class'.
							a_parent_class := a_parents.parent (i).type.direct_base_class (universe)
							internal_process_class (a_parent_class)
							if a_parent_class.has_interface_error then
								set_fatal_error (current_class)
							end
							i := i + 1
						end
					end
					if not current_class.has_interface_error then
						error_handler.report_compilation_status (Current, current_class)
							-- Check validity rules of the parents and of formal
							-- generic parameters of `current_class'.
						--check_formal_parameters_validity
						--check_parents_validity
						check_constraint_creations_validity
						check_signatures_validity
					end
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
		ensure
			interface_checked: a_class.interface_checked
		end

feature {NONE} -- Constraint creation validity

	check_constraint_creations_validity is
			-- Check validity of the constraint creations
			-- of `current_class' if any.
		local
			a_formals: ET_FORMAL_PARAMETER_LIST
			i, nb: INTEGER
		do
			a_formals := current_class.formal_parameters
			if a_formals /= Void then
				nb := a_formals.count
				from i := 1 until i > nb loop
					check_constraint_creation_validity (a_formals.formal_parameter (i))
					i := i + 1
				end
			end
		end

	check_constraint_creation_validity (a_formal: ET_FORMAL_PARAMETER) is
			-- Check validity of the constraint creation
			-- of `a_formal' if any.
		require
			a_formal_not_void: a_formal /= Void
		local
			a_creator: ET_CONSTRAINT_CREATOR
			a_name, other_name: ET_FEATURE_NAME
			a_flattened_feature: ET_FLATTENED_FEATURE
			a_base_type: ET_BASE_TYPE
			a_feature: ET_FEATURE
			a_class: ET_CLASS
			i, j, nb: INTEGER
		do
			a_creator := a_formal.creation_procedures
			if a_creator /= Void then
				a_base_type := a_formal.constraint_base_type
				if a_base_type /= Void then
					a_class := a_base_type.direct_base_class (universe)
				else
						-- We know that the constraint is not
						-- void since we have a creation clause.
						-- So we must have something like that:
						-- "[G -> H create make end, H -> G]".
						-- We consider that the base class of the
						-- constraint in ANY in that case.
					a_class := universe.any_class
				end
					-- Build the feature table.
				a_class.process (universe.feature_flattener)
				nb := a_creator.count
				from i := 1 until i > nb loop
					a_name := a_creator.feature_name (i)
					from j := 1 until j >= i loop
						other_name := a_creator.feature_name (j)
						if other_name.same_feature_name (a_name) then
								-- Feature name appears twice in Creation clause.
								-- This is not considered as a fatal error.
							error_handler.report_vgcp3c_error (current_class, other_name, a_name)
						end
						j := j + 1
					end
					a_feature := a_class.named_feature (a_name)
					if a_feature /= Void then
						a_flattened_feature := a_feature.flattened_feature
						if a_flattened_feature.is_procedure then
								-- We finally got a valid creation
								-- procedure. Record its seed.
							a_name.set_seed (a_flattened_feature.first_seed)
						else
								-- This feature is not a procedure.
							set_fatal_error (current_class)
							error_handler.report_vtgc0b_error (current_class, a_name, a_flattened_feature, a_class)
						end
					else
							-- This name is not the final name of
							-- a feature on `current_class'.
						set_fatal_error (current_class)
						error_handler.report_vtgc0a_error (current_class, a_name, a_class)
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Signature validity

	check_signatures_validity is
			-- Check validity of redeclarations and joinings for all
			-- feature signatures of `current_class' which could not
			-- be checked before in the feature flattener because
			-- of the presence of some qualified anchired types.
		local
			a_features: ET_FEATURE_LIST
			a_feature: ET_ADAPTED_FEATURE
			i, nb: INTEGER
		do
			a_features := current_class.features
			nb := a_features.count
			from i := 1 until i > nb loop
				a_feature ?= a_features.item (i)
				if a_feature /= Void then
						-- The signature of this feature needs to be checked
						-- again. It probably contains a qualified anchored type.
					check_signature_validity (a_feature)
					a_features.put (a_feature.flattened_feature, i)
				end
				i := i + 1
			end
		end

	check_signature_validity (a_feature: ET_ADAPTED_FEATURE) is
			-- Check signature validity for redeclarations and joinings.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_flattened_feature: ET_FLATTENED_FEATURE
			an_inherited_flattened_feature: ET_FEATURE
			a_redeclared_feature: ET_REDECLARED_FEATURE
			an_inherited_feature: ET_FEATURE
			a_replicated_features: DS_LINKED_LIST [ET_FEATURE]
			a_cursor: DS_LINKED_LIST_CURSOR [ET_FEATURE]
		do
			if a_feature.is_redeclared then
					-- Redeclaration.
				a_redeclared_feature := a_feature.redeclared_feature
				from
					an_inherited_feature := a_redeclared_feature.parent_feature
				until
					an_inherited_feature = Void
				loop
					check_redeclared_signature_validity (a_feature, an_inherited_feature)
					an_inherited_feature := an_inherited_feature.merged_feature
				end
			elseif a_feature.is_inherited then
				a_flattened_feature := a_feature.flattened_feature
				an_inherited_flattened_feature := a_feature.inherited_feature.inherited_flattened_feature
				if a_flattened_feature.is_deferred then
						-- Joining (merging deferred features together).
					from
						an_inherited_feature := a_feature
					until
						an_inherited_feature = Void
					loop
						if not an_inherited_feature.same_version (an_inherited_flattened_feature.precursor_feature) then
							check_joined_signature_validity (an_inherited_flattened_feature, an_inherited_feature)
						end
						an_inherited_feature := an_inherited_feature.merged_feature
					end
				else
						-- Redeclaration (merging deferred features into
						-- an effective one).
					from
						an_inherited_feature := a_feature
					until
						an_inherited_feature = Void
					loop
						if an_inherited_feature.is_deferred then
							check_redeclared_signature_validity (a_feature, an_inherited_feature)
						end
						an_inherited_feature := an_inherited_feature.merged_feature
					end
				end
			end
			if a_feature.is_inherited and then a_feature.is_selected then
				a_replicated_features := a_feature.replicated_features
				if a_replicated_features /= Void then
					a_cursor := a_replicated_features.new_cursor
					from a_cursor.start until a_cursor.after loop
						check_selected_signature_validity (a_feature, a_cursor.item)
						a_cursor.forth
					end
				end
			end
		end

	check_redeclared_signature_validity (a_feature, other: ET_FEATURE) is
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is a redeclaration in `current_class'
			-- of the inherited feature `other', or when the inherited
			-- feature `other' is deferred and is merged to the other
			-- inherted feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			other_not_void: other /= Void
			other_inherited: other.is_inherited
			other_not_redeclared: not other.is_redeclared
		local
			a_type: ET_TYPE
			other_type: ET_TYPE
			other_precursor: ET_FLATTENED_FEATURE
			a_flattened_feature: ET_FLATTENED_FEATURE
			an_inherited_feature: ET_INHERITED_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			other_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type /= Void and other_type /= Void then
				if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
					set_fatal_error (current_class)
					if a_feature.is_redeclared then
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other.inherited_feature)
					else
						an_inherited_feature := a_feature.inherited_feature.inherited_flattened_feature.inherited_feature
						error_handler.report_vdrd2b_error (current_class, an_inherited_feature, other.inherited_feature)
					end
				end
			else
				-- This case has already been handled in the feature flattener.
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments /= Void and other_arguments /= Void then
				nb := an_arguments.count
				if other_arguments.count = nb then
					from i := 1 until i > nb loop
						a_type := an_arguments.formal_argument (i).type
						other_type := other_arguments.formal_argument (i).type
						if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
							set_fatal_error (current_class)
							if a_feature.is_redeclared then
								error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other.inherited_feature)
							else
								an_inherited_feature := a_feature.inherited_feature.inherited_flattened_feature.inherited_feature
								error_handler.report_vdrd2b_error (current_class, an_inherited_feature, other.inherited_feature)
							end
						end
						i := i + 1
					end
				else
					-- This case has already been handled in the feature flattener.
				end
			else
				-- This case has already been handled in the feature flattener.
			end
		end

	check_selected_signature_validity (a_feature, other: ET_FEATURE) is
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is the selected version in `current_class'
			-- of the inherited replicated feature `other'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_selected: a_feature.is_selected
			other_not_void: other /= Void
			other_inherited: other.is_inherited
			other_not_redeclared: not other.is_redeclared
		local
			a_type: ET_TYPE
			other_type: ET_TYPE
			other_precursor: ET_FLATTENED_FEATURE
			a_flattened_feature: ET_FLATTENED_FEATURE
			an_inherited_feature: ET_INHERITED_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			other_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type /= Void and other_type /= Void then
				if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
					set_fatal_error (current_class)
					if a_feature.is_redeclared then
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other.inherited_feature)
					else
						an_inherited_feature := a_feature.inherited_feature.inherited_flattened_feature.inherited_feature
						error_handler.report_vdrd2d_error (current_class, an_inherited_feature, other.inherited_feature)
					end
				end
			else
				-- This case has already been handled in the feature flattener.
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments /= Void and other_arguments /= Void then
				nb := an_arguments.count
				if other_arguments.count = nb then
					from i := 1 until i > nb loop
						a_type := an_arguments.formal_argument (i).type
						other_type := other_arguments.formal_argument (i).type
						if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
							set_fatal_error (current_class)
							if a_feature.is_redeclared then
								error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other.inherited_feature)
							else
								an_inherited_feature := a_feature.inherited_feature.inherited_flattened_feature.inherited_feature
								error_handler.report_vdrd2d_error (current_class, an_inherited_feature, other.inherited_feature)
							end
						end
						i := i + 1
					end
				else
					-- This case has already been handled in the feature flattener.
				end
			else
				-- This case has already been handled in the feature flattener.
			end
		end

	check_joined_signature_validity (a_feature, other: ET_FEATURE) is
			-- Check that `a_feature' and `other' have the same signature
			-- when viewed from `current_class'. This check has to be done
			-- when joining two or more deferred features, the `a_feature'
			-- being the result of the join in `current_class' and `other'
			-- being one of the other deferred features inherited from a
			-- parent of `current_class'. (See ETL2 page 165 about Joining.)
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_not_redeclared: not a_feature.is_redeclared
			other_not_void: other /= Void
			other_inherited: other.is_inherited
			other_not_redeclared: not other.is_redeclared
		local
			a_joined_feature: ET_FLATTENED_FEATURE
			other_precursor: ET_FLATTENED_FEATURE
			an_arguments, other_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type, other_type: ET_TYPE
			i, nb: INTEGER
		do
			a_joined_feature := a_feature.flattened_feature
			a_type := a_joined_feature.type
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			parent_context.set (other.parent.type, current_class)
			if a_type /= Void and other_type /= Void then
				if not a_type.same_syntactical_type (other_type, parent_context, current_class, universe) then
					set_fatal_error (current_class)
					error_handler.report_vdjr0c_error (current_class, a_feature.inherited_feature, other.inherited_feature)
				end
			else
				-- This case has already been handled in the feature flattener.
			end
			an_arguments := a_joined_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments /= Void and other_arguments /= Void then
				nb := an_arguments.count
				if other_arguments.count = nb then
					from i := 1 until i > nb loop
						if not an_arguments.formal_argument (i).type.same_syntactical_type (other_arguments.formal_argument (i).type, parent_context, current_class, universe) then
							set_fatal_error (current_class)
							error_handler.report_vdjr0b_error (current_class, a_feature.inherited_feature, other.inherited_feature, i)
						end
						i := i + 1
					end
				else
					-- This case has already been handled in the feature flattener.
				end
			else
				-- This case has already been handled in the feature flattener.
			end
		end

	parent_context: ET_NESTED_TYPE_CONTEXT
			-- Parent context for type conformance checking

invariant

	parent_context_not_void: parent_context /= Void

end

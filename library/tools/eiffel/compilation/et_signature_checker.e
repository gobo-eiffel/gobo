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

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_bit_feature,
			process_bit_n,
			process_class,
			process_class_type,
			process_generic_class_type,
			process_tuple_type
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new signature checker for features of classes in `a_universe'.
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			create parent_context.make_with_capacity (a_universe.any_class, 1)
		end

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last feature signature?

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
				check_signature_vtct_validity (a_feature.flattened_feature)
				if not has_fatal_error then
					a_redeclared_feature := a_feature.redeclared_feature
					from
						a_parent_feature := a_redeclared_feature.parent_feature
					until
						a_parent_feature = Void
					loop
						check_redeclared_signature_validity (a_redeclared_feature, a_parent_feature)
						a_parent_feature := a_parent_feature.merged_feature
					end
				end
			elseif a_feature.is_inherited then
				an_inherited_feature := a_feature.inherited_feature
				if an_inherited_feature.parent_feature.merged_feature /= Void then
						-- No need to check the signature when there is no
						-- Joining nor merging.
					a_flattened_feature := an_inherited_feature.flattened_feature
--					an_inherited_flattened_feature := an_inherited_feature.flattened_parent
					if a_flattened_feature.is_deferred then
							-- Joining (merging deferred features together).
						from
							a_parent_feature := an_inherited_feature.parent_feature
						until
							a_parent_feature = Void
						loop
--							if not a_parent_feature.same_version (an_inherited_flattened_feature) then
								check_joined_signature_validity (an_inherited_feature, a_parent_feature)
--							end
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
				end
			else
				check_signature_vtct_validity (a_feature.flattened_feature)
				-- check_immediate_signature_validity (a_feature.flattened_feature)
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
			-- Check whether `a_feature' has correctly been declared.
		require
			a_feature_not_void: a_feature /= Void
		do
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
			i, nb: INTEGER
		do
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
				set_fatal_error
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
				end
			elseif a_feature.is_redeclared and other_precursor.is_attribute then
				if not a_flattened_feature.is_attribute then
					-- We already checked in `check_redeclaration_validity' whether
					-- `a_flattened_feature' was an attribute and reported
					-- an error otherwise.
				elseif a_type.is_type_expanded (current_class, universe) then
					if not other_type.is_type_expanded (parent_context, universe) then
							-- VDRD-6 says that the types of the two attributes should
							-- be both expanded or both non-expanded.
						set_fatal_error
						error_handler.report_vdrd6b_error (current_class, other, a_flattened_feature)
					end
				elseif a_type.is_type_reference (current_class, universe) then
					if not other_type.is_type_reference (parent_context, universe) then
							-- VDRD-6 says that the types of the two attributes should
							-- be both expanded or both non-expanded.
						set_fatal_error
						error_handler.report_vdrd6b_error (current_class, other, a_flattened_feature)
					end
				else
						-- Here we don't know about the expandedness of the type:
						-- it has to be a formal generic parameter for which we don't
						-- know yet whether the actual generic parameter will be
						-- expanded or not.
					if not a_type.same_named_type (other_type, parent_context, current_class, universe) then
							-- VDRD-6 says that the types of the two attributes should
							-- be both expanded or both non-expanded.
						set_fatal_error
						error_handler.report_vdrd6b_error (current_class, other, a_flattened_feature)
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
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error
				error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
			else
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					other_type := other_arguments.formal_argument (i).type
					if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
						set_fatal_error
						if a_feature.is_inherited then
							a_parent_feature := a_feature.inherited_feature.flattened_parent
							error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
						else
							error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
						end
					end
					i := i + 1
				end
			end
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
			i, nb: INTEGER
		do
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
				set_fatal_error
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
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
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					other_type := other_arguments.formal_argument (i).type
					if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
						set_fatal_error
						if a_feature.is_inherited then
							a_parent_feature := a_feature.inherited_feature.flattened_parent
							error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
						else
							error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
						end
					end
					i := i + 1
				end
			end
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
				set_fatal_error
				error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
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
				nb := an_arguments.count
				from i := 1 until i > nb loop
					if not an_arguments.formal_argument (i).type.same_syntactical_type (other_arguments.formal_argument (i).type, parent_context, current_class, universe) then
						set_fatal_error
						error_handler.report_vdjr0b_error (current_class, a_feature.flattened_parent, other, i)
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- VTCT Validity checking

	check_signature_vtct_validity (a_feature: ET_FEATURE) is
			-- Check whether the types in the signature of `a_feature'
			-- (declared in `current_class') are based on known classes.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_type: ET_TYPE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			l_type := a_feature.type
			if l_type /= Void then
				l_type.process (Current)
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				nb := l_arguments.count
				from i := 1 until i > nb loop
					l_type := l_arguments.formal_argument (i).type
					l_type.process (Current)
					i := i + 1
				end
			end
		end

	check_bit_feature_vtct_validity (a_type: ET_BIT_FEATURE) is
			-- Check whether `a_type' is based on known classes.
		require
			a_type_not_void: a_type /= Void
		do
-- TODO: should we check whether class BIT is in the universe or not?
			-- No validity rule to be checked.
		end

	check_bit_n_vtct_validity (a_type: ET_BIT_N) is
			-- Check whether `a_type' is based on known classes.
		require
			a_type_not_void: a_type /= Void
		do
-- TODO: should we check whether class BIT is in the universe or not?
			-- No validity rule to be checked.
		end

	check_class_type_vtct_validity (a_type: ET_CLASS_TYPE) is
			-- Check whether `a_type' is based on known classes.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_class: ET_CLASS
		do
			a_class := a_type.direct_base_class (universe)
			if a_class = universe.none_class then
				-- OK.
			else
				if not a_class.is_preparsed then
					a_class.process (universe.eiffel_parser)
				end
				if not a_class.is_preparsed then
					set_fatal_error
					error_handler.report_vtct0a_error (current_class, a_type)
				end
				if a_type.is_generic then
					an_actuals := a_type.actual_parameters
					check a_type_generic: an_actuals /= Void end
					nb := an_actuals.count
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						an_actual.process (Current)
						i := i + 1
					end
				end
			end
		end

	check_tuple_type_vtct_validity (a_type: ET_TUPLE_TYPE) is
			-- Check whether `a_type' is based on known classes.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
-- TODO: should we check whether class TUPLE is in the universe or not?
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_parameters.type (i).process (Current)
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			check_bit_feature_vtct_validity (a_type)
		end

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
		do
			check_bit_n_vtct_validity (a_type)
		end

	process_class (a_type: ET_CLASS) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
			check_class_type_vtct_validity (a_type)
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
			check_tuple_type_vtct_validity (a_type)
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

invariant

	universe_not_void: universe /= Void
	current_class_not_void: current_class /= Void
	parent_context_not_void: parent_context /= Void

end

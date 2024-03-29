﻿note

	description:

		"Eiffel feature signature checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2017, Eric Bezault and others"
	license: "MIT License"

class ET_SIGNATURE_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class,
			process_class_type,
			process_qualified_like_type,
			process_qualified_like_braced_type,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new signature checker for features of given classes.
		do
			precursor (a_system_processor)
			create parent_context.make_with_capacity (current_class, 1)
		end

feature -- Signature validity

	check_signature_vtct_validity (a_feature: ET_FEATURE; a_class: ET_CLASS)
			-- Check whether the types in the signature of `a_feature'
			-- (declared in `a_class') are based on known classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			l_type, l_previous_type: detachable ET_TYPE
			i, nb: INTEGER
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			l_type := a_feature.type
			if l_type /= Void then
				l_type.process (Current)
			end
			if attached a_feature.arguments as l_arguments then
				nb := l_arguments.count
				from i := 1 until i > nb loop
					l_type := l_arguments.formal_argument (i).type
					if l_type /= l_previous_type then
						l_type.process (Current)
						l_previous_type := l_type
					end
					i := i + 1
				end
			end
			current_class := old_class
		end

	check_signature_validity (a_feature: ET_FLATTENED_FEATURE; a_class: ET_CLASS; a_report: BOOLEAN)
			-- Check signature validity of `a_feature' for redeclarations and joinings in `a_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
			-- `a_report' indicates whether error messages should be emitted or not.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			-- no_cycle: no cycle in anchored types involved.
		local
			a_flattened_feature: ET_FEATURE
			a_redeclared_feature: ET_REDECLARED_FEATURE
			an_inherited_feature: ET_INHERITED_FEATURE
			a_parent_feature: detachable ET_PARENT_FEATURE
			an_adapted_feature: ET_ADAPTED_FEATURE
			a_cursor: DS_LINKED_LIST_CURSOR [ET_PARENT_FEATURE]
			old_class: ET_CLASS
			old_processing_mode: INTEGER
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			old_processing_mode := processing_mode
			processing_mode := check_vtct_validity_mode
			if a_feature.is_redeclared then
					-- Redeclaration.
				if not has_fatal_error then
					a_redeclared_feature := a_feature.redeclared_feature
					from
						a_parent_feature := a_redeclared_feature.parent_feature
					until
						a_parent_feature = Void
					loop
						check_redeclared_signature_validity (a_redeclared_feature, a_parent_feature, a_report)
						a_parent_feature := a_parent_feature.merged_feature
					end
				end
			elseif a_feature.is_inherited then
				an_inherited_feature := a_feature.inherited_feature
				if an_inherited_feature.parent_feature.merged_feature /= Void then
						-- No need to check the signature when there is no
						-- Joining nor merging.
					a_flattened_feature := an_inherited_feature.flattened_feature
					if a_flattened_feature.is_deferred then
							-- Joining (merging deferred features together).
						from
							a_parent_feature := an_inherited_feature.parent_feature
						until
							a_parent_feature = Void
						loop
							check_joined_signature_validity (an_inherited_feature, a_parent_feature, a_report)
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
								check_redeclared_signature_validity (an_inherited_feature, a_parent_feature, a_report)
							end
							a_parent_feature := a_parent_feature.merged_feature
						end
					end
				end
			end
			if a_feature.is_adapted then
				an_adapted_feature := a_feature.adapted_feature
				if an_adapted_feature.is_selected then
					if attached an_adapted_feature.replicated_features as a_replicated_features then
						a_cursor := a_replicated_features.new_cursor
						from a_cursor.start until a_cursor.after loop
							check_selected_signature_validity (an_adapted_feature, a_cursor.item, a_report)
							a_cursor.forth
						end
					end
				end
			end
			processing_mode := old_processing_mode
			current_class := old_class
		end

feature {NONE} -- Signature validity

	check_redeclared_signature_validity (a_feature: ET_ADAPTED_FEATURE; other: ET_PARENT_FEATURE; a_report: BOOLEAN)
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is a redeclaration in `current_class'
			-- of the inherited feature `other', or when the inherited
			-- feature `other' is deferred and is merged to the other
			-- inherted feature `a_feature'.
			-- `a_report' indicates whether error messages should be emitted or not.
		require
			a_feature_not_void: a_feature /= Void
			other_not_void: other /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			a_type: detachable ET_TYPE
			other_type: detachable ET_TYPE
			other_precursor: ET_FEATURE
			a_flattened_feature: ET_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			other_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			l_conforms: BOOLEAN
		do
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error
					if a_report then
						if a_feature.is_inherited then
							a_parent_feature := a_feature.inherited_feature.flattened_parent
							error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
						else
							error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
						end
					end
				end
			elseif other_type = Void then
				set_fatal_error
				if a_report then
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			else
					-- The test below is useful in expanded types which contains for
					-- example 'like Current' in the signature. In that case 'like Current'
					-- in the context of the current expanded class does not conform to
					-- 'like Current' in the context of the parent, but the types are
					-- identical so we want to accept this particular case anyway.
					--
					-- Note that we won't need that trick anymore with ECMA Eiffel where
					-- expanded types conforms to reference parents.
					-- But the reverse is still true: when 'like Current' appears in
					-- an expanded parent, and the current class is not expanded.
					--
					-- There is also a bug in EiffelStudio 6.8 where it allows a feature
					-- of type 'attached like Current' to be redefined as 'detachable like Current'.
					-- That's why we use `same_syntactical_type_with_type_marks' and not just
					-- `same_syntactical_type' below.
				l_conforms := attached {ET_LIKE_CURRENT} a_type and then a_type.same_syntactical_type_with_type_marks (other_type, tokens.attached_keyword, parent_context, tokens.attached_keyword, current_class)
				if not l_conforms then
					if not a_report then
						check_tuple_actual_parameters_unfolded (a_type, a_flattened_feature.implementation_class)
						check_tuple_actual_parameters_unfolded (other_type, other_precursor.implementation_class)
					end
					l_conforms := a_type.conforms_to_type (other_type, parent_context, current_class, system_processor)
				end
				if not l_conforms then
					set_fatal_error
					if a_report then
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
					elseif a_type.is_type_expanded (current_class) then
						if not other_type.is_type_expanded (parent_context) then
								-- VDRD-6 says that the types of the two attributes should
								-- be both expanded or both non-expanded.
							set_fatal_error
							if a_report then
								error_handler.report_vdrd6b_error (current_class, other, a_flattened_feature)
							end
						end
					elseif a_type.is_type_reference (current_class) then
						if not other_type.is_type_reference (parent_context) then
								-- VDRD-6 says that the types of the two attributes should
								-- be both expanded or both non-expanded.
							set_fatal_error
							if a_report then
								error_handler.report_vdrd6b_error (current_class, other, a_flattened_feature)
							end
						end
					else
							-- Here we don't know about the expandedness of the type:
							-- it has to be a formal generic parameter for which we don't
							-- know yet whether the actual generic parameter will be
							-- expanded or not.
						if not a_type.same_named_type (other_type, parent_context, current_class) then
								-- VDRD-6 says that the types of the two attributes should
								-- be both expanded or both non-expanded.
							set_fatal_error
							if a_report then
								error_handler.report_vdrd6b_error (current_class, other, a_flattened_feature)
							end
						end
					end
				end
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error
					if a_report then
						if a_feature.is_inherited then
							a_parent_feature := a_feature.inherited_feature.flattened_parent
							error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
						else
							error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
						end
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error
				if a_report then
					error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
				end
			else
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					other_type := other_arguments.formal_argument (i).type
						-- The test below is useful in expanded types which contains for
						-- example 'like Current' in the signature. In that case 'like Current'
						-- in the context of the current expanded class does not conform to
						-- 'like Current' in the context of the parent, but the types are
						-- identical so we want to accept this particular case anyway.
						--
						-- Note that we won't need that trick anymore with ECMA Eiffel where
						-- expanded types conforms to reference parents.
						-- But the reverse is still true: when 'like Current' appears in
						-- an expanded parent, and the current class is not expanded.
						--
						-- There is also a bug in EiffelStudio 6.8 where it allows a feature
						-- of type 'attached like Current' to be redefined as 'detachable like Current'.
						-- That's why we use `same_syntactical_type_with_type_marks' and not just
						-- `same_syntactical_type' below.
					l_conforms := attached {ET_LIKE_CURRENT} a_type and then a_type.same_syntactical_type_with_type_marks (other_type, tokens.attached_keyword, parent_context, tokens.attached_keyword, current_class)
					if not l_conforms then
						if not a_report then
							check_tuple_actual_parameters_unfolded (a_type, a_flattened_feature.implementation_class)
							check_tuple_actual_parameters_unfolded (other_type, other_precursor.implementation_class)
						end
						l_conforms := a_type.conforms_to_type (other_type, parent_context, current_class, system_processor)
					end
					if not l_conforms then
						set_fatal_error
						if a_report then
							if a_feature.is_inherited then
								a_parent_feature := a_feature.inherited_feature.flattened_parent
								error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
							else
								error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
							end
						end
					end
					i := i + 1
				end
			end
		end

	check_selected_signature_validity (a_feature: ET_ADAPTED_FEATURE; other: ET_PARENT_FEATURE; a_report: BOOLEAN)
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is the selected version in `current_class'
			-- of the inherited replicated feature `other'.
			-- `a_report' indicates whether error messages should be emitted or not.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_selected: a_feature.is_selected
			other_not_void: other /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			a_type: detachable ET_TYPE
			other_type: detachable ET_TYPE
			other_precursor: ET_FEATURE
			a_flattened_feature: ET_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			other_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			l_conforms: BOOLEAN
		do
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error
					if a_report then
						if a_feature.is_inherited then
							a_parent_feature := a_feature.inherited_feature.flattened_parent
							error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
						else
							error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
						end
					end
				end
			elseif other_type = Void then
				set_fatal_error
				if a_report then
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			else
					-- The test below is useful in expanded types which contains for
					-- example 'like Current' in the signature. In that case 'like Current'
					-- in the context of the current expanded class does not conform to
					-- 'like Current' in the context of the parent, but the types are
					-- identical so we want to accept this particular case anyway.
					--
					-- Note that we won't need that trick anymore with ECMA Eiffel where
					-- expanded types conforms to reference parents.
					-- But the reverse is still true: when 'like Current' appears in
					-- an expanded parent, and the current class is not expanded.
					--
					-- There is also a bug in EiffelStudio 6.8 where it allows a feature
					-- of type 'attached like Current' to be redefined as 'detachable like Current'.
					-- That's why we use `same_syntactical_type_with_type_marks' and not just
					-- `same_syntactical_type' below.
				l_conforms := attached {ET_LIKE_CURRENT} a_type and then a_type.same_syntactical_type_with_type_marks (other_type, tokens.attached_keyword, parent_context, tokens.attached_keyword, current_class)
				if not l_conforms then
					if not a_report then
						check_tuple_actual_parameters_unfolded (a_type, a_flattened_feature.implementation_class)
						check_tuple_actual_parameters_unfolded (other_type, other_precursor.implementation_class)
					end
					l_conforms := a_type.conforms_to_type (other_type, parent_context, current_class, system_processor)
				end
				if not l_conforms then
					set_fatal_error
					if a_report then
						if a_feature.is_inherited then
							a_parent_feature := a_feature.inherited_feature.flattened_parent
							error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
						else
							error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
						end
					end
				end
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error
					if a_report then
						if a_feature.is_inherited then
							a_parent_feature := a_feature.inherited_feature.flattened_parent
							error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
						else
							error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
						end
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error
				if a_report then
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			else
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					other_type := other_arguments.formal_argument (i).type
						-- The test below is useful in expanded types which contains for
						-- example 'like Current' in the signature. In that case 'like Current'
						-- in the context of the current expanded class does not conform to
						-- 'like Current' in the context of the parent, but the types are
						-- identical so we want to accept this particular case anyway.
						--
						-- Note that we won't need that trick anymore with ECMA Eiffel where
						-- expanded types conforms to reference parents.
						-- But the reverse is still true: when 'like Current' appears in
						-- an expanded parent, and the current class is not expanded.
						--
						-- There is also a bug in EiffelStudio 6.8 where it allows a feature
						-- of type 'attached like Current' to be redefined as 'detachable like Current'.
						-- That's why we use `same_syntactical_type_with_type_marks' and not just
						-- `same_syntactical_type' below.
					l_conforms := attached {ET_LIKE_CURRENT} a_type and then a_type.same_syntactical_type_with_type_marks (other_type, tokens.attached_keyword, parent_context, tokens.attached_keyword, current_class)
					if not l_conforms then
						if not a_report then
							check_tuple_actual_parameters_unfolded (a_type, a_flattened_feature.implementation_class)
							check_tuple_actual_parameters_unfolded (other_type, other_precursor.implementation_class)
						end
						l_conforms := a_type.conforms_to_type (other_type, parent_context, current_class, system_processor)
					end
					if not l_conforms then
						set_fatal_error
						if a_report then
							if a_feature.is_inherited then
								a_parent_feature := a_feature.inherited_feature.flattened_parent
								error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
							else
								error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
							end
						end
					end
					i := i + 1
				end
			end
		end

	check_joined_signature_validity (a_feature: ET_INHERITED_FEATURE; other: ET_PARENT_FEATURE; a_report: BOOLEAN)
			-- Check that `a_feature' and `other' have the same signature
			-- when viewed from `current_class'. This check has to be done
			-- when joining two or more deferred features, the `a_feature'
			-- being the result of the join in `current_class' and `other'
			-- being one of the other deferred features inherited from a
			-- parent of `current_class'. (See ETL2 page 165 about Joining.)
			-- `a_report' indicates whether error messages should be emitted or not.
		require
			a_feature_not_void: a_feature /= Void
			other_not_void: other /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			a_joined_feature: ET_FEATURE
			other_precursor: ET_FEATURE
			an_arguments, other_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_type, other_type: detachable ET_TYPE
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
					if a_report then
						error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
					end
				end
			elseif other_type = Void then
				set_fatal_error
				if a_report then
					error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
				end
			else
				if not a_report then
					check_tuple_actual_parameters_unfolded (a_type, a_joined_feature.implementation_class)
					check_tuple_actual_parameters_unfolded (other_type, other_precursor.implementation_class)
				end
				if not a_type.same_syntactical_type (other_type, parent_context, current_class) then
					set_fatal_error
					if a_report then
						error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
					end
				end
			end
			an_arguments := a_joined_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error
					if a_report then
						error_handler.report_vdjr0a_error (current_class, a_feature.flattened_parent, other)
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error
				if a_report then
					error_handler.report_vdjr0a_error (current_class, a_feature.flattened_parent, other)
				end
			else
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					other_type := other_arguments.formal_argument (i).type
					if not a_report then
						check_tuple_actual_parameters_unfolded (a_type, a_joined_feature.implementation_class)
						check_tuple_actual_parameters_unfolded (other_type, other_precursor.implementation_class)
					end
					if not a_type.same_syntactical_type (other_type, parent_context, current_class) then
						set_fatal_error
						if a_report then
							error_handler.report_vdjr0b_error (current_class, a_feature.flattened_parent, other, i)
						end
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- VTCT Validity checking

	check_class_type_vtct_validity (a_type: ET_CLASS_TYPE)
			-- Check whether `a_type' is based on known classes.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actual: ET_TYPE
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if not a_class.is_preparsed then
				set_fatal_error
				error_handler.report_vtct0a_error (current_class, a_type)
			end
			if a_type.is_generic and then attached a_type.actual_parameters as an_actuals then
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.type (i)
					an_actual.process (Current)
					i := i + 1
				end
			end
		end

	check_qualified_like_identifier_vtct_validity (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Check whether `a_type' is based on known classes.
		require
			a_type_not_void: a_type /= Void
		do
			a_type.target_type.process (Current)
		end

	check_tuple_type_vtct_validity (a_type: ET_TUPLE_TYPE)
			-- Check whether `a_type' is based on known classes.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
		do
-- TODO: should we check whether class TUPLE is in the universe or not?
			if attached a_type.actual_parameters as a_parameters then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_parameters.type (i).process (Current)
					i := i + 1
				end
			end
		end

feature {NONE} -- Tuple-type-unfolding

	check_tuple_actual_parameters_unfolded (a_type: ET_TYPE; a_class: ET_CLASS)
			-- Check whether both phases of Tuple-type-unfolding have been performed
			-- on actual parameters of class types in `a_type' written in `a_class'.
			-- Set `has_fatal_error' if this is not the case.
		require
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
		local
			l_old_current_class: ET_CLASS
			l_old_processing_mode: INTEGER
		do
			l_old_current_class := current_class
			current_class := a_class
			l_old_processing_mode := processing_mode
			processing_mode := check_tuple_actual_parameters_unfolded_mode
			a_type.process (Current)
			processing_mode := l_old_processing_mode
			current_class := l_old_current_class
		end

	check_class_type_tuple_actual_parameters_unfolded (a_type: ET_CLASS_TYPE)
			-- Check whether both phases of Tuple-type-unfolding have been performed
			-- on actual parameters of class types in `a_type'.
			-- Set `has_fatal_error' if this is not the case.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actual: ET_TYPE
		do
			if attached a_type.actual_parameters as an_actuals then
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.type (i)
					an_actual.process (Current)
					i := i + 1
				end
				if not a_type.tuple_actual_parameters_unfolded_2 then
					set_fatal_error
				end
			end
		end

	check_qualified_like_identifier_tuple_actual_parameters_unfolded (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Check whether both phases of Tuple-type-unfolding have been performed
			-- on actual parameters of class types in `a_type'.
			-- Set `has_fatal_error' if this is not the case.
		require
			a_type_not_void: a_type /= Void
		do
			a_type.target_type.process (Current)
		end

	check_tuple_type_tuple_actual_parameters_unfolded (a_type: ET_TUPLE_TYPE)
			-- Check whether both phases of Tuple-type-unfolding have been performed
			-- on actual parameters of class types in `a_type'.
			-- Set `has_fatal_error' if this is not the case.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actual: ET_TYPE
		do
			if attached a_type.actual_parameters as an_actuals then
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.type (i)
					an_actual.process (Current)
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_class (a_type: ET_CLASS)
			-- Process `a_type'.
		do
			if processing_mode = check_vtct_validity_mode then
				process_class_type (a_type)
			end
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if processing_mode = check_vtct_validity_mode then
				check_class_type_vtct_validity (a_type)
			elseif processing_mode = check_tuple_actual_parameters_unfolded_mode then
				check_class_type_tuple_actual_parameters_unfolded (a_type)
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			if processing_mode = check_vtct_validity_mode then
				check_qualified_like_identifier_vtct_validity (a_type)
			elseif processing_mode = check_tuple_actual_parameters_unfolded_mode then
				check_qualified_like_identifier_tuple_actual_parameters_unfolded (a_type)
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			if processing_mode = check_vtct_validity_mode then
				check_qualified_like_identifier_vtct_validity (a_type)
			elseif processing_mode = check_tuple_actual_parameters_unfolded_mode then
				check_qualified_like_identifier_tuple_actual_parameters_unfolded (a_type)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if processing_mode = check_vtct_validity_mode then
				check_tuple_type_vtct_validity (a_type)
			elseif processing_mode = check_tuple_actual_parameters_unfolded_mode then
				check_tuple_type_tuple_actual_parameters_unfolded (a_type)
			end
		end

	processing_mode: INTEGER
			-- Mode in which `process_*' routines are called

	check_vtct_validity_mode: INTEGER = 1
			-- VTCT validity checking mode

	check_tuple_actual_parameters_unfolded_mode: INTEGER = 2
			-- Tuple-type-unfolded checking mode

feature {NONE} -- Implementation

	parent_context: ET_NESTED_TYPE_CONTEXT
			-- Parent context for type conformance checking

invariant

	parent_context_not_void: parent_context /= Void

end

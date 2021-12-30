note

	description:

		"Eiffel adapted base class checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ADAPTED_BASE_CLASS_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new adapted class checker.
		do
			precursor (a_system_processor)
			current_class_impl := tokens.unknown_class
		end

feature -- Validity checking

	check_adapted_base_classes_validity (a_name: ET_CALL_NAME; a_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_context: ET_TYPE_CONTEXT; a_current_class, a_current_class_impl: ET_CLASS)
			-- Check validity of `a_adapted_base_classes' in case of multiple generic constraints
			-- when they are the possible base classes of a target of call name `a_name'.
			-- `a_context' represents the type of the target of the call.
			-- Keep in that list:
			-- * only one class when processing `a_name' in the class where the call
			--   was written, or
			-- * all applicable classes when `a_name' was already resolved in a proper
			--   ancestor (or in another generic derivation) of `current_class' where
			--   the call was written.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_adapted_base_classes_not_void: a_adapted_base_classes /= Void
			no_void_adapted_base_class: not a_adapted_base_classes.has_void
			a_context_not_void: a_context /= Void
			a_context_is_valid: a_context.is_valid_context
			a_current_class_not_void: a_current_class /= Void
			a_current_class_preparsed: a_current_class.is_preparsed
			a_current_class_impl_not_void: a_current_class_impl /= Void
			a_current_class_impl_preparsed: a_current_class_impl.is_preparsed
		local
			l_old_current_class: like current_class
			l_old_current_class_impl: like current_class_impl
			i, nb: INTEGER
			l_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_found_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_found_feature: detachable ET_FEATURE
			l_tuple_label_index: INTEGER
			l_found_tuple_label_index: INTEGER
			l_seed: INTEGER
		do
			has_fatal_error := False
			l_old_current_class := current_class
			current_class := a_current_class
			l_old_current_class_impl := current_class_impl
			current_class_impl := a_current_class_impl
			l_seed := a_name.seed
			nb := a_adapted_base_classes.count
			from i := 1 until i > nb loop
				l_class := a_adapted_base_classes.item (i).base_class
				if feature_flattening_error_only then
					l_class.process (system_processor.feature_flattener)
					if not l_class.features_flattened_successfully then
						set_fatal_error
					end
				else
					l_class.process (system_processor.interface_checker)
					if not l_class.interface_checked_successfully then
						set_fatal_error
					end
				end
				i := i + 1
			end
			if has_fatal_error then
				if current_class = current_class_impl or l_seed = 0 then
					a_adapted_base_classes.keep_first (1)
				else
					a_adapted_base_classes.wipe_out
				end
			elseif (current_class /= current_class_impl and l_seed /= 0) or nb > 1 then
				l_adapted_base_class := a_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
				if l_seed /= 0 then
						-- The seed was already computed in a proper ancestor (or in another
						-- generic derivation) of `current_class' where the call was written.
						-- Only keep the adapted classes which have a feature with this seed.
					if a_name.is_tuple_label then
						if nb = 1 and then l_class.is_none then
							-- Keep it: "NONE" conforms to "TUPLE".
						elseif nb = 1 and then l_class.is_tuple_class then
							-- If there is exactly one adapted class and it is a Tuple class,
							-- then keep this one because the index of the labeled actual
							-- parameter cannot be out of bound since for a Tuple type to
							-- conform to another Tuple type it needs to have the same number
							-- or more actual parameters.
						else
							from i := nb until i < 1 loop
								l_adapted_base_class := a_adapted_base_classes.item (i)
								l_class := l_adapted_base_class.base_class
								if l_class.is_none then
									-- Keep it: "NONE" conforms to "TUPLE".
								elseif not l_class.is_tuple_class or else l_adapted_base_class.base_type.actual_parameter_count < l_seed then
									a_adapted_base_classes.remove (i)
								end
								i := i - 1
							end
						end
					else
						from i := nb until i < 1 loop
							l_adapted_base_class := a_adapted_base_classes.item (i)
							l_class := l_adapted_base_class.base_class
							if l_class.is_none then
									-- Keep it: "NONE" conforms to all reference types.
							elseif l_class.seeded_feature (l_seed) = Void then
								a_adapted_base_classes.remove (i)
							end
							i := i - 1
						end
					end
					nb := a_adapted_base_classes.count
				end
				if current_class = current_class_impl then
					if nb = 0 then
						a_adapted_base_classes.put_last (l_adapted_base_class)
					elseif nb > 1 then
							-- Multiple generic constraint.
						from i := 1 until i > nb loop
							l_adapted_base_class := a_adapted_base_classes.item (i)
							l_class := l_adapted_base_class.base_class
							if attached l_adapted_base_class.named_feature (a_name) as l_feature then
								if l_found_adapted_base_class /= Void then
									if l_found_feature /= Void then
										if l_found_feature /= l_feature or not l_found_adapted_base_class.base_type.same_named_type (l_adapted_base_class.base_type, current_class, current_class) then
												-- We have two features with the same name.
												-- This is not considered as an error if this is the same feature and
												-- the constraint types are the same (with the same type marks).
											set_fatal_error
											if l_seed = 0 then
												if not feature_flattening_error_only and not class_interface_error_only then
													error_handler.report_vgmc0b_error (current_class, current_class_impl, a_name, l_found_feature, l_found_adapted_base_class, l_feature, l_adapted_base_class)
												end
											else
													-- Internal error: this should not happen when the seed
													-- has already been successfully determined.
												error_handler.report_giaaa_error
											end
										end
									elseif l_found_tuple_label_index /= 0 then
											-- We have a feature and a tuple label with the same name.
										set_fatal_error
										if l_seed = 0 then
											if not feature_flattening_error_only and not class_interface_error_only then
												error_handler.report_vgmc0c_error (current_class, current_class_impl, a_name, l_feature, l_adapted_base_class, l_found_tuple_label_index, l_found_adapted_base_class)
											end
										else
												-- Internal error: this should not happen when the seed
												-- has already been successfully determined.
											error_handler.report_giaaa_error
										end
									end
								else
									l_found_adapted_base_class := l_adapted_base_class
									l_found_feature := l_feature
								end
							elseif l_class.is_tuple_class and then attached {ET_IDENTIFIER} a_name as l_label then
								l_tuple_label_index := l_adapted_base_class.base_type_index_of_label (l_label, a_context)
								if l_tuple_label_index = 0 then
										-- This is not a tuple label.
								elseif l_found_adapted_base_class /= Void then
									if l_found_feature /= Void then
											-- We have a feature and a tuple label with the same name.
										set_fatal_error
										if l_seed = 0 then
											if not feature_flattening_error_only and not class_interface_error_only then
												error_handler.report_vgmc0c_error (current_class, current_class_impl, a_name, l_found_feature, l_found_adapted_base_class, l_tuple_label_index, l_adapted_base_class)
											end
										else
												-- Internal error: this should not happen when the seed
												-- has already been successfully determined.
											error_handler.report_giaaa_error
										end
									elseif l_found_tuple_label_index /= 0 then
										if l_found_tuple_label_index /= l_tuple_label_index or not l_found_adapted_base_class.base_type.same_named_type (l_adapted_base_class.base_type, current_class, current_class) then
												-- We have two tuple labels with the same name.
												-- This is not considered as an error if this is the same tuple index and
												-- the constraint types are the same (with the same type marks).
											set_fatal_error
											if l_seed = 0 then
												if not feature_flattening_error_only and not class_interface_error_only then
													error_handler.report_vgmc0d_error (current_class, current_class_impl, a_name, l_found_tuple_label_index, l_found_adapted_base_class, l_tuple_label_index, l_adapted_base_class)
												end
											else
													-- Internal error: this should not happen when the seed
													-- has already been successfully determined.
												error_handler.report_giaaa_error
											end
										end
									end
								else
									l_found_adapted_base_class := l_adapted_base_class
									l_found_tuple_label_index := l_tuple_label_index
								end
							end
							i := i + 1
						end
						if l_found_adapted_base_class /= Void then
							a_adapted_base_classes.wipe_out
							a_adapted_base_classes.put_last (l_found_adapted_base_class)
						else
								-- We are in the case of multiple generic constraints where `a_name'
								-- is not the name of a feature in any of the adapted classes corresponding
								-- to the generic constraints.
							set_fatal_error
							if l_seed = 0 then
								if not feature_flattening_error_only and not class_interface_error_only then
									error_handler.report_vgmc0a_error (current_class, current_class_impl, a_name, a_adapted_base_classes)
								end
							else
									-- Internal error: this should not happen when the seed
									-- has already been successfully determined.
								error_handler.report_giaaa_error
							end
							a_adapted_base_classes.keep_first (1)
						end
					end
				end
			end
			current_class := l_old_current_class
			current_class_impl := l_old_current_class_impl
		ensure
			in_implementation_class: (a_current_class_impl = a_current_class or a_name.seed = 0) implies a_adapted_base_classes.count = 1
			not_in_implementation_class: (a_current_class_impl /= a_current_class and a_name.seed /= 0) implies across a_adapted_base_classes as i_adapted_base_class all a_name.is_tuple_label or else (not i_adapted_base_class.base_class.is_none implies i_adapted_base_class.base_class.seeded_feature (a_name.seed) /= Void) end
		end

feature -- Type contexts

	reset_context_if_multiple_constraints (a_has_multiple_constraints: BOOLEAN; a_adapted_base_class: ET_ADAPTED_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- When `a_has_multiple_constraints' is True, the named type of `a_context'
			-- is expected to be a formal generic parameter, and `a_adapted_base_class' is
			-- one of its generic constraints. In that case, append to the content of
			-- `a_context' a "like_0" (to point to the root context) followed by the
			-- base type of `a_adapted_base_class', with the necessary type mark so that the
			-- attachment status of `a_context' is not changed.
		require
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_context_not_void: a_context /= Void
		local
			l_constraint_type_mark: detachable ET_TYPE
		do
			if a_has_multiple_constraints then
				if a_context.is_type_attached then
					l_constraint_type_mark := tokens.attached_like_current
				elseif a_context.is_type_detachable then
					l_constraint_type_mark := tokens.detachable_like_current
				end
				a_context.force_last (tokens.like_0)
				a_context.force_last (a_adapted_base_class.base_type)
				if l_constraint_type_mark /= Void then
					a_context.force_last (l_constraint_type_mark)
				end
			end
		ensure
			instance_free: class
		end

feature -- Error reporting

	feature_flattening_error_only: BOOLEAN
			-- Should only the errors found when flattening features (and before) be reported?

	class_interface_error_only: BOOLEAN
			-- Should only the errors found when checking class interface (and before) be reported?

	set_feature_flattening_error_only (b: BOOLEAN)
			-- Set `feature_flattening_error_only' to `b'.
		do
			feature_flattening_error_only := b
		ensure
			feature_flattening_error_only_set: feature_flattening_error_only = b
		end

	set_class_interface_error_only (b: BOOLEAN)
			-- Set `class_interface_error_only' to `b'.
		do
			class_interface_error_only := b
		ensure
			class_interface_error_only_set: class_interface_error_only = b
		end

feature {NONE} -- Access

	current_class_impl: ET_CLASS
			-- Class where the code has been written
			-- (May be different from `current_class' when the
			-- code has been inherited from an ancestor)

invariant

	current_class_impl_not_void: current_class_impl /= Void

end

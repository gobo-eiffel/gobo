indexing

	description:

		"Eiffel class interface checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
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

	ET_SHARED_FEATURE_NAME_TESTER

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new interface checker for classes in `a_universe'.
		do
			precursor (a_universe)
			conformance_checked := False
			create parent_checker2.make (a_universe)
			create parent_checker3.make (a_universe)
			create formal_parameter_checker.make (a_universe)
			create signature_checker.make (a_universe)
			create feature_adaptation_resolver.make (a_universe)
			create named_features.make_map (400)
			named_features.set_key_equality_tester (feature_name_tester)
		end

feature -- Status report

	conformance_checked: BOOLEAN
			-- Can conformance checks be performed in this processor?

feature -- Status setting

	set_conformance_checked (b: BOOLEAN) is
			-- Set `conformance_checked' to `b'.
		do
			conformance_checked := b
		ensure
			conformance_checked_set: conformance_checked = b
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
								-- Use ANY as class root now.
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
						check_constraint_creations_validity
						if conformance_checked then
							check_signatures_validity
							check_formal_parameters_validity
						end
						check_parents_validity
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
			a_flattened_feature: ET_FEATURE
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
			i, nb: INTEGER
			a_named_feature: ET_FLATTENED_FEATURE
			a_features: ET_FEATURE_LIST
			a_feature: ET_FEATURE
		do
			resolve_feature_adaptations
			a_features := current_class.features
			nb := a_features.count
			from i := 1 until i > nb loop
				a_feature := a_features.item (i)
				a_named_feature := named_features.item (a_feature.name)
				if a_named_feature.is_inherited then
					a_named_feature.inherited_feature.set_flattened_feature (a_feature)
				end
				check_signature_validity (a_named_feature)
				i := i + 1
			end
			named_features.wipe_out
		end

	check_signature_validity (a_feature: ET_FLATTENED_FEATURE) is
			-- Check signature validity for redeclarations and joinings.
		require
			a_feature_not_void: a_feature /= Void
		do
			signature_checker.check_signature_validity (a_feature, current_class)
			if signature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	signature_checker: ET_SIGNATURE_CHECKER
			-- Signature validity checker

feature {NONE} -- Feature adaptation

	feature_adaptation_resolver: ET_FEATURE_ADAPTATION_RESOLVER
			-- Feature adaptation resolver

	named_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	resolve_feature_adaptations is
			-- Resolve the feature adaptations of the inheritance clause of
			-- `current_class' and put resulting features in `named_features'.
		do
			feature_adaptation_resolver.resolve_feature_adaptations (current_class, named_features)
			if feature_adaptation_resolver.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

feature {NONE} -- Formal parameters validity

	check_formal_parameters_validity is
			-- Check validity of formal parameters of `current_class'.
		local
			old_class: ET_CLASS
		do
				-- There might be controlled recursive calls
				-- to `process', hence the following precaution
				-- with `current_class'.
			old_class := current_class
			current_class := unknown_class
			formal_parameter_checker.check_formal_parameters_validity (old_class)
			current_class := old_class
			if formal_parameter_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	formal_parameter_checker: ET_FORMAL_PARAMETER_CHECKER2
			-- Formal parameter validity checker

feature {NONE} -- Parents validity

	check_parents_validity is
			-- Check validity of parents of `current_class'.
		local
			old_class: ET_CLASS
		do
				-- There might be controlled recursive calls
				-- to `process', hence the following precaution
				-- with `current_class'.
			old_class := current_class
			current_class := unknown_class
			parent_checker2.check_parents_validity (old_class)
			if parent_checker2.has_fatal_error then
				set_fatal_error (old_class)
			elseif conformance_checked then
				parent_checker3.check_parents_validity (old_class)
				if parent_checker3.has_fatal_error then
					set_fatal_error (old_class)
				end
			end
			current_class := old_class
		end

	parent_checker2: ET_PARENT_CHECKER2
			-- Parent validity checker (second pass)

	parent_checker3: ET_PARENT_CHECKER3
			-- Parent validity checker (third pass)

invariant

	named_features_not_void: named_features /= Void
	no_void_named_feature: not named_features.has_item (Void)
	feature_adaptation_resolver_not_void: feature_adaptation_resolver /= Void
	signature_checker_not_void: signature_checker /= Void
	parent2_checker_not_void: parent_checker2 /= Void
	parent3_checker_not_void: parent_checker3 /= Void
	formal_parameter_checker_not_void: formal_parameter_checker /= Void

end

indexing

	description:

		"Eiffel formal parameter validity second pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_CHECKER2

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			process_class,
			process_class_type,
			process_generic_class_type,
			process_tuple_type
		end

creation

	make

feature -- Validity checking

	check_formal_parameters_validity is
			-- Second pass of the validity check of the formal generic
			-- parameters of `current_class'. Do not try to check the
			-- creation procedures of formal parameters (this is done
			-- after the features have been flattened during the third pass).
		local
			i, nb: INTEGER
			a_parameters: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
		do
			a_parameters := current_class.formal_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_formal := a_parameters.formal_parameter (i)
					check_constraint_validity (a_formal)
					i := i + 1
				end
			end
		end

feature {NONE} -- Constraint validity

	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether the constraint of `a_formal' is a valid
			-- constraint in `current_class'. Check whether the actual
			-- generic parameters of the constraint of `a_formal' conform
			-- to their corresponding formal parameters' constraints.
			-- Do not check for the validity of the creation procedures
			-- of these constraints (this is done after the features have
			-- been flattened).
		require
			a_formal_not_void: a_formal /= Void
		local
			a_constraint: ET_TYPE
		do
			a_constraint := a_formal.constraint
			if a_constraint /= Void then
				internal_call := True
				a_constraint.process (Current)
				internal_call := False
			end
		end

	check_class_type_constraint (a_type: ET_CLASS_TYPE) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of a formal parameter in `current_class'.
			-- Check whether the actual generic parameters of `a_type'
			-- conform to their corresponding formal parameters' constraints.
			-- Do not check for the validity of the creation procedures
			-- of these constraints (this is done after the features have
			-- been flattened).
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			a_formals: ET_FORMAL_PARAMETER_LIST
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: ET_TYPE
			a_class: ET_CLASS
			a_resolver: ET_AST_PROCESSOR
		do
			a_class := a_type.direct_base_class (universe)
			if a_class.is_generic then
				a_formals := a_class.formal_parameters
				check a_class_generic: a_formals /= Void end
				an_actuals := a_type.actual_parameters
				if an_actuals = Void or else an_actuals.count /= a_formals.count then
					-- Error already reported during first pass of
					-- formal generic parameters validity checking.
				else
						-- We don't want the qualified anchored to be resolved here.
					a_resolver := universe.qualified_signature_resolver
					universe.set_qualified_signature_resolver (universe.null_processor)
					nb := an_actuals.count
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						internal_call := True
						an_actual.process (Current)
						internal_call := False
						a_formal := a_formals.formal_parameter (i)
						a_constraint := a_formal.constraint
						if a_constraint /= Void then
								-- If we have:
								--    class A [G, H -> LIST [G]] ...
								--    class X [G -> A [ANY, LIST [STRING]] ...
								-- we need to check that "LIST[STRING]" conforms to
								-- "LIST[ANY]", not just "LIST[G]". Hence the necessary
								-- resolving of formal parameters in the constraint.
							a_constraint := a_constraint.resolved_formal_parameters (an_actuals)
						else
							a_constraint := universe.any_type
						end
						if not an_actual.conforms_to_type (a_constraint, current_class, current_class, universe) then
								-- The actual parameter does not conform to the
								-- constraint of its corresponding formal parameter.
							set_fatal_error (current_class)
							error_handler.report_vtcg0a_error (current_class, an_actual, a_constraint)
						end
						i := i + 1
					end
					universe.set_qualified_signature_resolver (a_resolver)
				end
			end
		end

	check_tuple_type_constraint (a_type: ET_TUPLE_TYPE) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of a formal parameter in `current_class'.
			-- Check whether the actual generic parameters of `a_type'
			-- conform to their corresponding formal parameters' constraints.
			-- Do not check for the validity of the creation procedures
			-- of these constraints (this is done after the features have
			-- been flattened).
		require
			a_type_not_void: a_type /= Void
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			i, nb: INTEGER
		do
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					internal_call := True
					a_parameters.type (i).process (Current)
					internal_call := False
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_class (a_type: ET_CLASS) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_class_type_constraint (a_type)
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				check_tuple_type_constraint (a_type)
			end
		end

feature {NONE} -- Implementation

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

end

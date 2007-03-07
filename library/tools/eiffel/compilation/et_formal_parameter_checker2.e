indexing

	description:

		"Eiffel formal parameter validity checkers, second pass"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_CHECKER2

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_class,
			process_class_type,
			process_generic_class_type,
			process_tuple_type
		end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new formal parameter second pass checker.
		do
			precursor (a_universe)
			current_class := a_universe.unknown_class
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

feature -- Validity checking

	check_formal_parameters_validity (a_class: ET_CLASS) is
			-- Second pass of the validity check of the formal generic
			-- parameters of `a_class'. Do not try to check the
			-- creation procedures of formal parameters (this is done
			-- only for parent types, creation types and expanded
			-- types). Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			a_parameters: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			a_parameters := current_class.formal_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_formal := a_parameters.formal_parameter (i)
					check_constraint_validity (a_formal)
					i := i + 1
				end
			end
			current_class := old_class
		end

feature {NONE} -- Constraint validity

	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether the constraint of `a_formal' is a valid
			-- constraint in `current_class'. Check whether the actual
			-- generic parameters of the constraint of `a_formal' conform
			-- to their corresponding formal parameters' constraints.
			-- Do not check for the validity of the creation procedures
			-- of these constraints (this is done only for parent types,
			-- creation types and expanded types). Set `has_fatal_error'
			-- if an error occurred.
		require
			a_formal_not_void: a_formal /= Void
		local
			a_constraint: ET_TYPE
		do
			a_constraint := a_formal.constraint
			if a_constraint /= Void then
				a_constraint.process (Current)
			end
		end

	check_class_type_constraint (a_type: ET_CLASS_TYPE) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of a formal parameter in `current_class'.
			-- Check whether the actual generic parameters of `a_type'
			-- conform to their corresponding formal parameters' constraints.
			-- Do not check for the validity of the creation procedures
			-- of these constraints (this is done only for parent types,
			-- creation types and expanded types). Set `has_fatal_error'
			-- if an error occurred.
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
		do
			a_class := a_type.direct_base_class (universe)
			if a_class.is_generic then
				a_formals := a_class.formal_parameters
				check a_class_generic: a_formals /= Void end
				an_actuals := a_type.actual_parameters
				if an_actuals = Void or else an_actuals.count /= a_formals.count then
						-- Error already reported during first pass of
						-- formal generic parameters validity checking.
					set_fatal_error
				else
					nb := an_actuals.count
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						an_actual.process (Current)
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
							a_constraint := universe.any_class
						end
						if universe.is_ise and then universe.ise_version <= ise_5_6_latest then
								-- Test below uses conformance of reference types for compatibility with ISE 5.6.0610.
								-- the reference version of the actual generic parameter should conform to the
								-- reference version of the constraint, and the actual generic parameter should
								-- either conform or convert to the constraint (the latter condition is not checked here).
							if not an_actual.reference_conforms_to_type (a_constraint, current_class, current_class, universe) then
									-- The actual parameter does not conform to the
									-- constraint of its corresponding formal parameter.
								set_fatal_error
								error_handler.report_vtcg3a_error (current_class, current_class, a_type, an_actual, a_constraint)
							end
						elseif not an_actual.conforms_to_type (a_constraint, current_class, current_class, universe) then
								-- The actual parameter does not conform to the
								-- constraint of its corresponding formal parameter.
							set_fatal_error
							error_handler.report_vtcg3a_error (current_class, current_class, a_type, an_actual, a_constraint)
						end
						i := i + 1
					end
				end
			end
		end

	check_tuple_type_constraint (a_type: ET_TUPLE_TYPE) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of a formal parameter in `current_class'.
			-- Check whether the actual generic parameters of `a_type'
			-- conform to their corresponding formal parameters' constraints.
			-- Do not check for the validity of the creation procedures
			-- of these constraints (this is done for parent types,
			-- creation types and expanded types). Set `has_fatal_error'
			-- if an error occurred.
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
					a_parameters.type (i).process (Current)
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
			check_class_type_constraint (a_type)
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
			check_tuple_type_constraint (a_type)
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

invariant

	current_class_not_void: current_class /= Void

end

note

	description:

		"Eiffel formal parameter validity checkers, second pass"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_CHECKER2

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
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new signature checker for features of given classes.
		do
			precursor (a_system_processor)
			create constraint_context.make_with_capacity (current_class, 1)
		end

feature -- Validity checking

	check_formal_parameters_validity (a_class: ET_CLASS)
			-- Second pass of the validity check of the formal generic
			-- parameters of `a_class'. Do not try to check the
			-- creation procedures of formal parameters (this is done
			-- only for parent types, creation types and expanded
			-- types). Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			i, nb: INTEGER
			a_formal: ET_FORMAL_PARAMETER
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			if attached current_class.formal_parameters as a_parameters then
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

	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER)
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
			i, nb: INTEGER
		do
			if attached a_formal.constraint as a_constraint then
				nb := a_constraint.count
				from i := 1 until i > nb loop
					a_constraint.type_constraint (i).type.process (Current)
					i := i + 1
				end
			end
		end

	check_class_type_constraint (a_type: ET_CLASS_TYPE)
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
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: detachable ET_CONSTRAINT
			l_actuals: detachable ET_ACTUAL_PARAMETERS
			a_class: ET_CLASS
			l_conforms: BOOLEAN
		do
			a_class := a_type.base_class
			if a_class.is_generic and then attached a_class.formal_parameters as a_formals then
				a_type.resolve_unfolded_tuple_actual_parameters_1 (current_universe)
				l_actuals := a_type.actual_parameters
				if l_actuals = Void or else l_actuals.count /= a_formals.count then
						-- Error already reported during first pass of
						-- formal generic parameters validity checking.
					set_fatal_error
				else
					nb := l_actuals.count
						-- We need to process all actual parameters (and hence finish performing
						-- all Tuple-type-unfolding) before trying to run the second phase of
						-- Tuple-type-unfolding. Indeed, we might have a case like
						-- that:
						--
						--  class AA [G -> TUPLE [H], H]
						--
						--  a: AA [TUPLE [PROCEDURE [TUPLE [BB]]], PROCEDURE [BB]]
						--
						-- This should be resolved as:
						--
						--  a: AA [TUPLE [PROCEDURE [TUPLE [BB]]], PROCEDURE [TUPLE [BB]]]
						--
						-- But if we had not processed the second actual parameter of AA beforehand,
						-- we would have ended up with this erroneously resolved type:
						--
						--  a: AA [TUPLE [TUPLE [PROCEDURE [TUPLE [BB]]]], PROCEDURE [TUPLE [BB]]]
						--
						-- which is not valid. Hence the two loops below.
					from i := 1 until i > nb loop
						an_actual := l_actuals.type (i)
						an_actual.process (Current)
						i := i + 1
					end
					from i := 1 until i > nb loop
						an_actual := l_actuals.type (i)
						a_formal := a_formals.formal_parameter (i)
						a_constraint := a_formal.constraint
						if a_constraint = Void then
							a_constraint := current_universe.detachable_any_type
						end
							-- If we have:
							--    class A [G, H -> LIST [G]] ...
							--    class X [G -> A [ANY, LIST [STRING]] ...
							-- we need to check that "LIST [STRING]" conforms to
							-- "LIST [ANY]", not just "LIST [G]". So, the constraint
							-- needs to be handled in the correct type context.
						constraint_context.set (a_type, current_class)
						l_conforms := an_actual.conforms_to_constraint (a_constraint, constraint_context, current_class, system_processor)
						if not l_conforms then
							if a_class.tuple_constraint_position = i then
								a_type.resolve_unfolded_tuple_actual_parameters_2 (current_class, constraint_context, system_processor)
								if attached a_type.actual_parameters as l_actual_parameters and then l_actual_parameters /= l_actuals then
									l_actuals := l_actual_parameters
									an_actual := l_actuals.type (i)
									l_conforms := an_actual.conforms_to_constraint (a_constraint, constraint_context, current_class, system_processor)
								end
							end
						end
						if not l_conforms then
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

	check_tuple_type_constraint (a_type: ET_TUPLE_TYPE)
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
			i, nb: INTEGER
		do
			if attached a_type.actual_parameters as a_parameters then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_parameters.type (i).process (Current)
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			check_class_type_constraint (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			check_tuple_type_constraint (a_type)
		end

feature {NONE} -- Implementation

	constraint_context: ET_NESTED_TYPE_CONTEXT
			-- Constraint context for type conformance checking

invariant

	constraint_context_not_void: constraint_context /= Void

end

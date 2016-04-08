note

	description:

		"Eiffel parent validity second pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT_CHECKER2

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_class,
			process_class_type,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new signature checker for features of  given classes.
		do
			precursor {ET_CLASS_SUBPROCESSOR}
			create constraint_context.make_with_capacity (current_class, 1)
		end

feature -- Validity checking

	check_parents_validity (a_class: ET_CLASS)
			-- Second pass of the validity check of parents of `a_class'.
			-- Do not try to check the creation procedures of formal parameters
			-- (this is done after the features have been flattened during
			-- the third pass). Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			i, nb: INTEGER
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			if attached current_class.parent_clause as a_parents then
				nb := a_parents.count
				from i := 1 until i > nb loop
					a_parents.parent (i).type.process (Current)
					i := i + 1
				end
			end
			current_class := old_class
		end

feature {NONE} -- Parent validity

	check_class_type_validity (a_type: ET_CLASS_TYPE)
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Check whether the
			-- actual generic parameters of `a_type' conform to their
			-- corresponding formal parameters' constraints. Do not check
			-- for the validity of the creation procedures of these constraints
			-- (this is done after the features have been flattened).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actuals: detachable ET_ACTUAL_PARAMETERS
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: detachable ET_TYPE
			a_class: ET_CLASS
			l_conforms: BOOLEAN
		do
			a_class := a_type.base_class
			if a_class.is_generic and then attached a_class.formal_parameters as a_formals then
				an_actuals := a_type.actual_parameters
				if an_actuals = Void or else an_actuals.count /= a_formals.count then
						-- Error already reported during first pass of
						-- parent validity checking.
					set_fatal_error
				else
					nb := an_actuals.count
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
						an_actual := an_actuals.type (i)
						an_actual.process (Current)
						i := i + 1
					end
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						a_formal := a_formals.formal_parameter (i)
						a_constraint := a_formal.constraint
						if a_constraint = Void then
							a_constraint := current_system.detachable_any_type
						end
							-- If we have:
							--    class A [G, H -> LIST [G]] ...
							--    class X inherit A [ANY, LIST [STRING]] ...
							-- we need to check that "LIST[STRING]" conforms to
							-- "LIST[ANY]", not just "LIST[G]". So, the constraint
							-- needs to be handled in the correct type context.
						constraint_context.set (a_type, current_class)
						l_conforms := an_actual.conforms_to_type (a_constraint, constraint_context, current_class)
						if not l_conforms then
							if a_class.tuple_constraint_position = i then
								a_type.resolve_unfolded_tuple_actual_parameters_2 (current_class, constraint_context)
								if attached a_type.actual_parameters as l_actual_parameters and then l_actual_parameters /= an_actuals then
									an_actuals := l_actual_parameters
									an_actual := an_actuals.type (i)
									l_conforms := an_actual.conforms_to_type (a_constraint, constraint_context, current_class)
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

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE)
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Check whether the
			-- actual generic parameters of `a_type' conform to their
			-- corresponding formal parameters' constraints. Do not check
			-- for the validity of the creation procedures of these constraints
			-- (this is done after the features have been flattened).
			-- Set `has_fatal_error' if an error occurred.
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
			check_class_type_validity (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			check_tuple_type_validity (a_type)
		end

feature {NONE} -- Implementation

	constraint_context: ET_NESTED_TYPE_CONTEXT
			-- Constraint context for type conformance checking

invariant

	constraint_context_not_void: constraint_context /= Void

end

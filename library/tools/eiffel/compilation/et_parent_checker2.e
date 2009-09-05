indexing

	description:

		"Eiffel parent validity second pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT_CHECKER2

inherit

	ET_CLASS_SUBPROCESSOR

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_class,
			process_class_type,
			process_generic_class_type,
			process_tuple_type
		end

create

	make

feature -- Validity checking

	check_parents_validity (a_class: ET_CLASS) is
			-- Second pass of the validity check of parents of `a_class'.
			-- Do not try to check the creation procedures of formal parameters
			-- (this is done after the features have been flattened during
			-- the third pass). Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			a_parents: ET_PARENT_LIST
			i, nb: INTEGER
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			a_parents := current_class.parent_clause
			if a_parents /= Void then
				nb := a_parents.count
				from i := 1 until i > nb loop
					a_parents.parent (i).type.process (Current)
					i := i + 1
				end
			end
			current_class := old_class
		end

feature {NONE} -- Parent validity

	check_class_type_validity (a_type: ET_CLASS_TYPE) is
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
			a_formals: ET_FORMAL_PARAMETER_LIST
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: ET_TYPE
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if a_class.is_generic then
				a_formals := a_class.formal_parameters
				check a_class_generic: a_formals /= Void end
				an_actuals := a_type.actual_parameters
				if an_actuals = Void or else an_actuals.count /= a_formals.count then
						-- Error already reported during first pass of
						-- parent validity checking.
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
								--    class X inherit A [ANY, LIST [STRING]] ...
								-- we need to check that "LIST[STRING]" conforms to
								-- "LIST[ANY]", not just "LIST[G]". Hence the necessary
								-- resolving of formal parameters in the constraint.
							a_constraint := a_constraint.resolved_formal_parameters (an_actuals)
						else
							a_constraint := current_system.any_type
						end
						if not an_actual.conforms_to_type (a_constraint, current_class, current_class) then
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

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE) is
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
			check_class_type_validity (a_type)
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
			check_tuple_type_validity (a_type)
		end

end

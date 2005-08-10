indexing

	description:

		"Eiffel parent validity first pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT_CHECKER1

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_bit_feature,
			process_bit_n,
			process_class,
			process_class_type,
			process_generic_class_type,
			process_like_current,
			process_like_feature,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new parent first pass checker.
		do
			precursor (a_universe)
			current_class := a_universe.unknown_class
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

feature -- Validity checking

	check_parents_validity (a_class: ET_CLASS) is
			-- Check validity of parents of `a_class'. Do not check
			-- whether the actual generic parameters of the types held in
			-- the parents conform to their corresponding formal parameters'
			-- constraints (this is done after the ancestors for the involved
			-- classes have been built). Set `has_fatal_error' if an error
			-- occurred.
		local
			a_parents: ET_PARENT_LIST
			i, nb: INTEGER
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			a_parents := current_class.parents
			if a_parents /= Void then
				nb := a_parents.count
				from i := 1 until i > nb loop
					current_parent := a_parents.parent (i)
					current_parent.type.process (Current)
					current_parent := Void
					i := i + 1
				end
			end
			current_class := old_class
		end

feature {NONE} -- Parent validity

	check_bit_feature_validity (a_type: ET_BIT_FEATURE; a_parent: ET_PARENT) is
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Do not check whether
			-- the actual generic parameters of `a_type' conform to their
			-- corresponding formal parameters' constraints (this is done
			-- after the ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_parent_not_void: a_parent /= Void
		do
				-- It is not valid to have "BIT name" in parent clauses.
			set_fatal_error
			error_handler.report_vhpr3a_error (current_class, a_type)
		end

	check_bit_n_validity (a_type: ET_BIT_N; a_parent: ET_PARENT) is
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Do not check whether
			-- the actual generic parameters of `a_type' conform to their
			-- corresponding formal parameters' constraints (this is done
			-- after the ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_parent_not_void: a_parent /= Void
		do
			if a_type = a_parent.type then
					-- Cannot inherit from 'BIT N'.
				set_fatal_error
				error_handler.report_gvhpr4a_error (current_class, a_type)
			else
					-- Not considered as a fatal error by gelint.
				error_handler.report_vhpr3b_error (current_class, a_type)
			end
		end

	check_class_type_validity (a_type: ET_CLASS_TYPE; a_parent: ET_PARENT) is
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Do not check whether
			-- the actual generic parameters of `a_type' conform to their
			-- corresponding formal parameters' constraints (this is done
			-- after the ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_parent_not_void: a_parent /= Void
		local
			i, nb: INTEGER
			a_formals: ET_FORMAL_PARAMETER_LIST
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			an_actual: ET_TYPE
			a_class: ET_CLASS
		do
			a_class := a_type.direct_base_class (universe)
			a_class.process (universe.eiffel_parser)
			if not a_class.is_preparsed then
				set_fatal_error
				if a_type = a_parent.type then
					-- Error already reported when building the ancestors
					-- of `current_class'.
				else
					error_handler.report_vtct0a_error (current_class, a_type)
				end
			elseif not a_class.is_parsed or else a_class.has_syntax_error then
					-- Error should already have been
					-- reported somewhere else.
				set_fatal_error
			elseif not a_class.is_generic then
				if a_type.is_generic then
					set_fatal_error
					error_handler.report_vtug1a_error (current_class, a_type)
				end
			elseif not a_type.is_generic then
				set_fatal_error
				error_handler.report_vtug2a_error (current_class, a_type)
			else
				a_formals := a_class.formal_parameters
				an_actuals := a_type.actual_parameters
				check
					a_class_generic: a_formals /= Void
					a_type_generic: an_actuals /= Void
				end
				if an_actuals.count /= a_formals.count then
					set_fatal_error
					error_handler.report_vtug2a_error (current_class, a_type)
				else
					nb := an_actuals.count
					from i := 1 until i > nb loop
						an_actual := an_actuals.type (i)
						a_formal := a_formals.formal_parameter (i)
						if a_formal.is_expanded then
							if not an_actual.is_type_expanded (current_class, universe) then
								error_handler.report_gvtcg5b_error (current_class, an_actual, a_formal)
								set_fatal_error
							end
						elseif a_formal.is_reference then
							if not an_actual.is_type_reference (current_class, universe) then
								error_handler.report_gvtcg5a_error (current_class, an_actual, a_formal)
								set_fatal_error
							end
						end
						an_actual.process (Current)
						i := i + 1
					end
				end
			end
		end

	check_like_type_validity (a_type: ET_LIKE_TYPE; a_parent: ET_PARENT) is
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Do not check whether
			-- the actual generic parameters of `a_type' conform to their
			-- corresponding formal parameters' constraints (this is done
			-- after the ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_parent_not_void: a_parent /= Void
		do
				-- It is not valid to have anchored types in parent clauses.
			set_fatal_error
			error_handler.report_vhpr3c_error (current_class, a_type)
		end

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE; a_parent: ET_PARENT) is
			-- Check validity of `a_type' when it appears in the parent
			-- clause `a_parent' in `current_class'. Do not check whether
			-- the actual generic parameters of `a_type' conform to their
			-- corresponding formal parameters' constraints (this is done
			-- after the ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_parent_not_void: a_parent /= Void
		local
			i, nb: INTEGER
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if a_type = a_parent.type then
					-- Cannot inherit from 'TUPLE'.
					-- ISE allows that though!
				set_fatal_error
				error_handler.report_gvhpr5a_error (current_class, a_type)
			else
				a_parameters := a_type.actual_parameters
				if a_parameters /= Void then
					nb := a_parameters.count
					from i := 1 until i > nb loop
						a_parameters.type (i).process (Current)
						i := i + 1
					end
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			if current_parent /= Void then
				check_bit_feature_validity (a_type, current_parent)
			end
		end

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
		do
			if current_parent /= Void then
				check_bit_n_validity (a_type, current_parent)
			end
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
			if current_parent /= Void then
				check_class_type_validity (a_type, current_parent)
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_like_current (a_type: ET_LIKE_CURRENT) is
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_type (a_type: ET_LIKE_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			if current_parent /= Void then
				check_like_type_validity (a_type, current_parent)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
			if current_parent /= Void then
				check_tuple_type_validity (a_type, current_parent)
			end
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

	current_parent: ET_PARENT
			-- Parent being processed

invariant

	current_class_not_void: current_class /= Void

end

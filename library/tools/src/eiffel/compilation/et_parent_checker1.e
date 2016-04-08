note

	description:

		"Eiffel parent validity first pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #11 $"

class ET_PARENT_CHECKER1

inherit

	ET_CLASS_SUBPROCESSOR

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_bit_feature,
			process_bit_n,
			process_class,
			process_class_type,
			process_like_current,
			process_like_feature,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

create

	make

feature -- Validity checking

	check_parents_validity (a_class: ET_CLASS)
			-- Check validity of parents of `a_class'. Do not check
			-- whether the actual generic parameters of the types held in
			-- the parents conform to their corresponding formal parameters'
			-- constraints (this is done after the ancestors for the involved
			-- classes have been built). Set `has_fatal_error' if an error
			-- occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			i, nb: INTEGER
			old_class: ET_CLASS
			l_parent: ET_PARENT
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			if attached current_class.parent_clause as l_parents then
				nb := l_parents.count
				from i := 1 until i > nb loop
					l_parent := l_parents.parent (i)
					current_parent := l_parent
					l_parent.type.process (Current)
					current_parent := Void
					i := i + 1
				end
			end
			current_class := old_class
		end

feature {NONE} -- Parent validity

	check_bit_feature_validity (a_type: ET_BIT_FEATURE; a_parent: ET_PARENT)
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

	check_bit_n_validity (a_type: ET_BIT_N; a_parent: ET_PARENT)
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

	check_class_type_validity (a_type: ET_CLASS_TYPE; a_parent: ET_PARENT)
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
			a_formal: ET_FORMAL_PARAMETER
			an_actual: ET_TYPE
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			a_class.process (current_system.eiffel_parser)
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
			elseif not attached a_class.formal_parameters as l_formals or else l_formals.is_empty then
				check class_not_generic: not a_class.is_generic end
				if a_type.is_generic then
					set_fatal_error
					error_handler.report_vtug1a_error (current_class, a_type)
				end
			else
				a_type.resolve_unfolded_tuple_actual_parameters_1 (current_universe)
				if not attached a_type.actual_parameters as l_actuals or else l_actuals.is_empty then
					check type_not_generic: not a_type.is_generic end
					set_fatal_error
					error_handler.report_vtug2a_error (current_class, a_type)
				else
					if l_actuals.count /= l_formals.count then
						set_fatal_error
						error_handler.report_vtug2a_error (current_class, a_type)
					else
						nb := l_actuals.count
						from i := 1 until i > nb loop
							an_actual := l_actuals.type (i)
							an_actual.process (Current)
							a_formal := l_formals.formal_parameter (i)
							if a_formal.is_expanded then
								if not an_actual.is_type_expanded (current_class) then
									set_fatal_error
									error_handler.report_gvtcg5b_error (current_class, current_class, a_type, an_actual, a_formal)
								end
							elseif a_formal.is_reference then
								if not an_actual.is_type_reference (current_class) then
									set_fatal_error
									error_handler.report_gvtcg5a_error (current_class, current_class, a_type, an_actual, a_formal)
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	check_like_type_validity (a_type: ET_LIKE_TYPE; a_parent: ET_PARENT)
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

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE; a_parent: ET_PARENT)
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
		do
			if a_type = a_parent.type then
					-- Cannot inherit from 'TUPLE'.
					-- ISE allows that though!
				set_fatal_error
				error_handler.report_gvhpr5a_error (current_class, a_type)
			elseif attached a_type.actual_parameters as l_parameters then
				nb := l_parameters.count
				from i := 1 until i > nb loop
					l_parameters.type (i).process (Current)
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_bit_feature (a_type: ET_BIT_FEATURE)
			-- Process `a_type'.
		do
			if attached current_parent as l_current_parent then
				check_bit_feature_validity (a_type, l_current_parent)
			end
		end

	process_bit_n (a_type: ET_BIT_N)
			-- Process `a_type'.
		do
			if attached current_parent as l_current_parent then
				check_bit_n_validity (a_type, l_current_parent)
			end
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached current_parent as l_current_parent then
				check_class_type_validity (a_type, l_current_parent)
			end
		end

	process_like_current (a_type: ET_LIKE_CURRENT)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_type (a_type: ET_LIKE_TYPE)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			if attached current_parent as l_current_parent then
				check_like_type_validity (a_type, l_current_parent)
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if attached current_parent as l_current_parent then
				check_tuple_type_validity (a_type, l_current_parent)
			end
		end

feature {NONE} -- Access

	current_parent: detachable ET_PARENT
			-- Parent being processed

end

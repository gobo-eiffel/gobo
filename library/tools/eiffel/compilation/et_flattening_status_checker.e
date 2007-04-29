indexing

	description:

		"Checkers to see whether features of a class need to be flattened again %
		%or not after some classes have been modified in the universe."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FLATTENING_STATUS_CHECKER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make,
			process_class
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new flattening status checker for classes in `a_universe'.
		do
			precursor (a_universe)
			create class_type_checker.make (a_universe)
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Check whether the features of `a_class' need to be flattened
			-- again after some classes have been modified in the universe. Also
			-- check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- If `has_flattening_error' is True, it means that this class
			-- has not been checked yet. False means that it has already
			-- been checked. Parent classes will be checked recursively.
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.unset_flattening_error
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make (universe)
				a_processor.process_class (a_class)
			elseif a_class /= unknown_class then
				internal_process_class (a_class)
			else
				set_fatal_error (a_class)
			end
		ensure then
			flattening_checked: not a_class.features_flattened or else not a_class.has_flattening_error
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			a_class.reset_after_ancestors_built
		ensure then
			features_not_flattened: not a_class.features_flattened
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Check whether the features of `a_class' need to be flattened
			-- again after some classes have been modified in the universe. Also
			-- check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- If `has_flattening_error' is True, it means that this class
			-- has not been checked yet. False means that it has already
			-- been checked. Parent classes will be checked recursively.
		require
			a_class_not_void: a_class /= Void
		local
			old_class: ET_CLASS
			i, nb: INTEGER
			l_reset_needed: BOOLEAN
			a_parents: ET_PARENT_LIST
			a_parent_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
			if current_class.features_flattened and then current_class.has_flattening_error then
					-- The class has been mark with a flattening error to indicate that
					-- we need to check whether its features need to be flattened again
					-- or not. It might happen if other classes on which it depends have
					-- been modified or recursively made invalid. If its flattened
					-- features are still valid then the error flag will be cleared.
					-- Otherwise the class will be reset to the previous processing step.
				current_class.unset_flattening_error
					-- Process parents first.
				a_parents := current_class.parents
				if a_parents = Void or else a_parents.is_empty then
					if current_class = universe.general_class then
						a_parents := Void
					elseif current_class = universe.any_class then
							-- ISE Eiffel has no GENERAL class anymore.
							-- Use ANY as class root now.
						a_parents := Void
					elseif current_class.is_dotnet and current_class /= universe.system_object_class then
						a_parents := universe.system_object_parents
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
						if not a_parent_class.features_flattened then
							l_reset_needed := True
						end
						i := i + 1
					end
				end
				if l_reset_needed then
					set_fatal_error (current_class)
				else
					if not current_class.is_dotnet then
							-- No need to check validity of .NET classes.
						check_formal_parameters_validity
						check_parents_validity
					end
					check_signatures_validity
				end
			end
			current_class := old_class
		ensure
			flattening_checked: not a_class.features_flattened or else not a_class.has_flattening_error
		end

feature {NONE} -- Formal parameters, parents and signatures validity

	check_formal_parameters_validity is
			-- Check whether none of the classes appearing in the
			-- formal generic parameter constraints of `current_class'
			-- have been modified.
		local
			i, nb: INTEGER
			l_parameters: ET_FORMAL_PARAMETER_LIST
			l_constraint: ET_TYPE
		do
			if current_class.features_flattened then
				l_parameters := current_class.formal_parameters
				if l_parameters /= Void then
					nb := l_parameters.count
					from i := 1 until i > nb loop
						l_constraint := l_parameters.formal_parameter (i).constraint
						if l_constraint /= Void then
							class_type_checker.check_type_validity (l_constraint)
							if class_type_checker.has_fatal_error then
								set_fatal_error (current_class)
								i := nb + 1 -- Jump out of the loop.
							end
						end
						i := i + 1
					end
				end
			end
		end

	check_parents_validity is
			-- Check whether none of the classes appearing in the
			-- parent types of `current_class' have been modified.
		local
			l_parents: ET_PARENT_LIST
			i, nb: INTEGER
		do
			if current_class.features_flattened then
				l_parents := current_class.parents
				if l_parents /= Void then
					nb := l_parents.count
					from i := 1 until i > nb loop
						class_type_checker.check_type_validity (l_parents.parent (i).type)
						if class_type_checker.has_fatal_error then
							set_fatal_error (current_class)
							i := nb + 1 -- Jump out of the loop.
						end
						i := i + 1
					end
				end
			end
		end

	check_signatures_validity is
			-- Check whether none of the classes appearing in the
			-- signatures of features of `current_class' have been modified.
		local
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			if current_class.features_flattened then
				l_procedures := current_class.procedures
				nb := l_procedures.declared_count
				from i := 1 until i > nb loop
					l_procedure := l_procedures.item (i)
					l_arguments := l_procedure.arguments
					if l_arguments /= Void then
						nb2 := l_arguments.count
						from j := 1 until j > nb2 loop
							class_type_checker.check_type_validity (l_arguments.formal_argument (j).type)
							if class_type_checker.has_fatal_error then
								set_fatal_error (current_class)
								j := nb2 + 1 -- Jump out of the inner loop.
								i := nb + 1 -- Jump out of the outer loop.
							end
							j := j + 1
						end
					end
					i := i + 1
				end
			end
			if current_class.features_flattened then
				l_queries := current_class.queries
				nb := l_queries.declared_count
				from i := 1 until i > nb loop
					l_query := l_queries.item (i)
					class_type_checker.check_type_validity (l_query.type)
					if class_type_checker.has_fatal_error then
						set_fatal_error (current_class)
						i := nb + 1 -- Jump out of the loop.
					else
						l_arguments := l_query.arguments
						if l_arguments /= Void then
							nb2 := l_arguments.count
							from j := 1 until j > nb2 loop
								class_type_checker.check_type_validity (l_arguments.formal_argument (j).type)
								if class_type_checker.has_fatal_error then
									set_fatal_error (current_class)
									j := nb2 + 1 -- Jump out of the inner loop.
									i := nb + 1 -- Jump out of the outer loop.
								end
								j := j + 1
							end
						end
					end
					i := i + 1
				end
			end
		end

	class_type_checker: ET_CLASS_TYPE_CHECKER2
			-- Class type checker

invariant

	class_type_checker_not_void: class_type_checker /= Void

end

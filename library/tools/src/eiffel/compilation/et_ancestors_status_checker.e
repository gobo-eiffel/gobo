note

	description:

	"[
		Checkers to see whether ancestor tables of classes need to be rebuilt
		or not after some classes have been modified in the Eiffel system.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ANCESTORS_STATUS_CHECKER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new ancestor builder status checker for given classes.
		do
			precursor (a_system_processor)
			create class_type_checker.make
		end

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Check whether the ancestor table of `a_class' needs to be rebuilt
			-- after some classes have been modified in the Eiffel system. Also
			-- check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- Parent classes will be checked recursively beforehand.
			--
			-- It is assumed that if `a_class.has_ancestors_error' is True, then
			-- this class has not been checked yet. False means that it has already
			-- been checked.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.unset_ancestors_error
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make (system_processor)
				a_processor.process_class (a_class)
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				internal_process_class (a_class)
			end
		ensure then
			ancestors_checked: not a_class.ancestors_built or else not a_class.has_ancestors_error
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.reset_after_parsed
		ensure
			ancestors_not_built: not a_class.ancestors_built
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Check whether the ancestor table of `a_class' needs to be rebuilt
			-- after some classes have been modified in the Eiffel system. Also
			-- check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- Parent classes will be checked recursively beforehand.
			--
			-- It is assumed that if `a_class.has_ancestors_error' is True, then
			-- this class has not been checked yet. False means that it has already
			-- been checked.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			i1, nb1: INTEGER
			i2, nb2: INTEGER
			l_parent_clause: ET_PARENT_LIST
			l_reset_needed: BOOLEAN
			a_parent_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
			if current_class.ancestors_built and then current_class.has_ancestors_error then
					-- The class has been marked with an ancestors error to indicate that we
					-- need to check whether its ancestor tables need to be rebuilt or not.
					-- It might happen if other classes on which it depends have been
					-- modified or recursively made invalid. If its ancestor table is
					-- still valid then the error flag will be cleared. Otherwise the
					-- class will be reset to the previous processing step.
				current_class.unset_ancestors_error
					-- Process parents first.
				nb1 := current_class.parents_count
				from i1 := 1 until i1 > nb1 loop
					l_parent_clause := current_class.parents (i1)
					nb2 := l_parent_clause.count
					from i2 := 1 until i2 > nb2 loop
						a_parent_class := l_parent_clause.parent (i2).type.base_class
						if a_parent_class.is_preparsed then
								-- This is a controlled recursive call to `internal_process_class'.
							internal_process_class (a_parent_class)
							if not a_parent_class.ancestors_built then
								l_reset_needed := True
							end
						else
							l_reset_needed := True
						end
						i2 := i2 + 1
					end
					i1 := i1 + 1
				end
				if l_reset_needed then
					set_fatal_error (current_class)
				else
					if not current_class.is_dotnet then
							-- No need to check validity of .NET classes.
						check_formal_parameters_validity
						check_parents_validity
					end
				end
			end
			current_class := old_class
		ensure
			ancestors_checked: not a_class.ancestors_built or else not a_class.has_ancestors_error
		end

feature {NONE} -- Formal parameters and parents validity

	check_formal_parameters_validity
			-- Check whether none of the classes appearing in the
			-- formal generic parameter constraints of `current_class'
			-- has been modified.
		local
			i, nb: INTEGER
		do
			if current_class.ancestors_built then
				if attached current_class.formal_parameters as l_parameters then
					nb := l_parameters.count
					from i := 1 until i > nb loop
						if attached l_parameters.formal_parameter (i).constraint as l_constraint then
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

	check_parents_validity
			-- Check whether none of the classes appearing in the
			-- parent types of `current_class' has been modified.
		local
			i1, nb1: INTEGER
			i2, nb2: INTEGER
			l_parent_clause: ET_PARENT_LIST
		do
			if current_class.ancestors_built then
				nb1 := current_class.parents_count
				from i1 := 1 until i1 > nb1 loop
					l_parent_clause := current_class.parents (i1)
					nb2 := l_parent_clause.count
					from i2 := 1 until i2 > nb2 loop
						class_type_checker.check_type_validity (l_parent_clause.parent (i2).type)
						if class_type_checker.has_fatal_error then
							set_fatal_error (current_class)
								-- Jump out of the loops.
							i2 := nb2 + 1
							i1 := nb1 + 1
						end
						i2 := i2 + 1
					end
					i1 := i1 + 1
				end
			end
		end

	class_type_checker: ET_CLASS_TYPE_STATUS_CHECKER1
			-- Class type checker

invariant

	class_type_checker_not_void: class_type_checker /= Void

end

note

	description:

	"[
		Checkers to see whether the interface of a class need to be checked again
		or not after some classes have been modified in the Eiffel system.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2008-09-08 13:38:07 +0200 (Mon, 08 Sep 2008) $"
	revision: "$Revision: 6501 $"

class ET_INTERFACE_STATUS_CHECKER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_class
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new interface status checker for given classes.
		do
			precursor {ET_CLASS_PROCESSOR}
			create qualified_anchored_type_checker.make
			create class_type_checker.make
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Check whether the interface of `a_class' needs to be checked again
			-- after some classes have been modified in the Eiffel system.
			-- Check whether none of the base classes of the anchors of qualified anchored types
			-- appearing in the types of all signatures of `a_class' have been modified.
			-- Also, check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- Parent classes will be checked recursively beforehand.
			--
			-- It is assumed that if `a_class.has_interface_error' is True, then
			-- this class has not been checked yet. False means that it has already
			-- been checked.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.unset_interface_error
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make
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
			interface_checked: not a_class.interface_checked or else not a_class.has_interface_error
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.reset_after_features_flattened
		ensure
			interface_not_checked: not a_class.interface_checked
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Check whether the interface of `a_class' needs to be checked again
			-- after some classes have been modified in the Eiffel system.
			-- Check whether none of the base classes of the anchors of qualified anchored types
			-- appearing in the types of all signatures of `a_class' have been modified.
			-- Also, check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- Parent classes will be checked recursively beforehand.
			--
			-- It is assumed that if `a_class.has_interface_error' is True, then
			-- this class has not been checked yet. False means that it has already
			-- been checked.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			i, nb: INTEGER
			l_reset_needed: BOOLEAN
			a_parents: ET_PARENT_LIST
			a_parent_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
			if current_class.interface_checked and then current_class.has_interface_error then
					-- The class has been marked with an interface error to indicate that
					-- we need to check whether its interface needs to be checked again
					-- or not. It might happen if other classes on which it depends have
					-- been modified or recursively made invalid. If its interface is still
					-- valid then the error flag will be cleared. Otherwise the class will
					-- be reset to the previous processing step.
				current_class.unset_interface_error
					-- Process parents first.
				a_parents := current_class.parents
				if a_parents /= Void then
					nb := a_parents.count
					from i := 1 until i > nb loop
						a_parent_class := a_parents.parent (i).type.base_class
						if not a_parent_class.is_preparsed then
							l_reset_needed := True
						else
								-- This is a controlled recursive call to `internal_process_class'.
							internal_process_class (a_parent_class)
							if not a_parent_class.interface_checked then
								l_reset_needed := True
							end
						end
						i := i + 1
					end
				end
				if l_reset_needed then
					set_fatal_error (current_class)
				else
					check_qualified_anchored_signatures_validity
					if not current_class.is_dotnet then
							-- No need to check validity of .NET classes.
						check_formal_parameters_validity
						check_parents_validity
					end
				end
			end
			current_class := old_class
		ensure
			interface_checked: not a_class.interface_checked or else not a_class.has_interface_error
		end

feature {NONE} -- Signature validity

	check_qualified_anchored_signatures_validity is
			-- Check whether none of the base classes of the anchors of qualified anchored types
			-- appearing in the types of all signatures of `current_class' has been modified.
		do
			qualified_anchored_type_checker.check_signatures_validity (current_class)
			if qualified_anchored_type_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	qualified_anchored_type_checker: ET_QUALIFIED_ANCHORED_TYPE_STATUS_CHECKER
			-- Qualified anchored type status checker

feature {NONE} -- Formal parameters and parents validity

	check_formal_parameters_validity is
			-- Check whether none of the classes appearing in the
			-- formal generic parameter constraints of `current_class'
			-- has been modified.
		local
			i, nb: INTEGER
			l_parameters: ET_FORMAL_PARAMETER_LIST
			l_constraint: ET_TYPE
		do
			if current_class.interface_checked then
				l_parameters := current_class.formal_parameters
				if l_parameters /= Void then
					nb := l_parameters.count
					from i := 1 until i > nb loop
						l_constraint := l_parameters.formal_parameter (i).constraint
						if l_constraint /= Void then
								-- This check is probably too strong in many cases. What we
								-- really need to check is whether the creation clause of
								-- of the constraint if any is still valid. But that would
								-- be too long to check. We don't need such level of
								-- fine-grained checking here.
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
			-- parent types of `current_class' has been modified.
		local
			l_parents: ET_PARENT_LIST
			i, nb: INTEGER
		do
			if current_class.interface_checked then
				l_parents := current_class.parents
				if l_parents /= Void then
					nb := l_parents.count
					from i := 1 until i > nb loop
							-- This check is probably too strong in many cases. What we
							-- really need to check is whether the type of the parent
							-- is valid as a creation type, in particular when some of
							-- the corresponding formal generic parameters have a constraint
							-- with a creation clause. But that would be too long to check.
							-- We don't need such level of fine-grained checking here.
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

	class_type_checker: ET_CLASS_TYPE_STATUS_CHECKER3
			-- Class type checker

invariant

	class_type_checker_not_void: class_type_checker /= Void
	qualified_anchored_type_checker_not_void: qualified_anchored_type_checker /= Void

end

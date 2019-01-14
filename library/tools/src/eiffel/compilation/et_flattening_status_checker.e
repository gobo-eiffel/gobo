note

	description:

	"[
		Checkers to see whether features of a class need to be flattened again
		or not after some classes have been modified in the Eiffel system.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FLATTENING_STATUS_CHECKER

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
			-- Create a new flattening status checker for given classes.
		do
			precursor (a_system_processor)
			create class_type_checker.make
		end

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Check whether the features of `a_class' need to be flattened again
			-- after some classes have been modified in the Eiffel system. Also
			-- check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- Parent classes will be checked recursively beforehand.
			--
			-- It is assumed that if `a_class.has_flattening_error' is True, then
			-- this class has not been checked yet. False means that it has already
			-- been checked.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.unset_flattening_error
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
			flattening_checked: not a_class.features_flattened or else not a_class.has_flattening_error
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.reset_after_ancestors_built
		ensure
			features_not_flattened: not a_class.features_flattened
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Check whether the features of `a_class' need to be flattened again
			-- after some classes have been modified in the Eiffel system. Also
			-- check whether none of the classes appearing in the parent types
			-- or formal generic parameter constraints have been modified.
			-- Parent classes will be checked recursively beforehand.
			--
			-- It is assumed that if `a_class.has_flattening_error' is True, then
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
			if current_class.features_flattened and then current_class.has_flattening_error then
					-- The class has been marked with a flattening error to indicate that
					-- we need to check whether its features need to be flattened again
					-- or not. It might happen if other classes on which it depends have
					-- been modified or recursively made invalid. If its flattened
					-- features are still valid then the error flag will be cleared.
					-- Otherwise the class will be reset to the previous processing step.
				current_class.unset_flattening_error
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
							if not a_parent_class.features_flattened then
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
					check_signatures_validity
				end
			end
			current_class := old_class
		ensure
			flattening_checked: not a_class.features_flattened or else not a_class.has_flattening_error
		end

feature {NONE} -- Formal parameters, parents and signatures validity

	check_formal_parameters_validity
			-- Check whether none of the classes appearing in the
			-- formal generic parameter constraints of `current_class'
			-- has been modified.
		local
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			if current_class.features_flattened then
				if attached current_class.formal_parameters as l_parameters then
					nb := l_parameters.count
					from i := 1 until i > nb loop
						if attached l_parameters.formal_parameter (i).constraint as l_constraint then
							nb2 := l_constraint.count
							from j := 1 until j > nb2 loop
								class_type_checker.check_type_validity (l_constraint.type_constraint (j).type)
								if class_type_checker.has_fatal_error then
									set_fatal_error (current_class)
									j := nb2 -- Jump out of the inner loop.
									i := nb -- Jump out of the outer loop.
								end
								j := j + 1
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
			if current_class.features_flattened then
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

	check_signatures_validity
			-- Check whether none of the classes appearing in the
			-- signatures of features of `current_class' has been modified.
		do
			if current_class.features_flattened then
				check_feature_signatures_validity (current_class.procedures)
			end
			if current_class.features_flattened then
				check_feature_signatures_validity (current_class.queries)
			end
		end

	check_feature_signatures_validity (a_features: ET_FEATURE_LIST)
			-- Check whether none of the classes appearing in the
			-- signatures of `a_features' has been modified.
		require
			a_features_not_void: a_features /= Void
		local
			l_type, l_previous_type: detachable ET_TYPE
			i, nb: INTEGER
			j, nb2: INTEGER
			l_feature: ET_FEATURE
			l_has_error: BOOLEAN
		do
			nb := a_features.declared_count
			from i := 1 until i > nb loop
				l_feature := a_features.item (i)
				l_type := l_feature.type
				if l_type /= Void then
					class_type_checker.check_type_validity (l_type)
					if class_type_checker.has_fatal_error then
						set_fatal_error (current_class)
						l_has_error := True
						i := nb + 1 -- Jump out of the loop.
					end
				end
				if not l_has_error then
					if attached l_feature.arguments as l_arguments then
						l_previous_type := Void
						nb2 := l_arguments.count
						from j := 1 until j > nb2 loop
							l_type := l_arguments.formal_argument (j).type
							if l_type /= l_previous_type then
								class_type_checker.check_type_validity (l_type)
								if class_type_checker.has_fatal_error then
									set_fatal_error (current_class)
									j := nb2 + 1 -- Jump out of the inner loop.
									i := nb + 1 -- Jump out of the outer loop.
								end
								l_previous_type := l_type
							end
							j := j + 1
						end
					end
				end
				i := i + 1
			end
		end

	class_type_checker: ET_CLASS_TYPE_STATUS_CHECKER2
			-- Class type checker

invariant

	class_type_checker_not_void: class_type_checker /= Void

end

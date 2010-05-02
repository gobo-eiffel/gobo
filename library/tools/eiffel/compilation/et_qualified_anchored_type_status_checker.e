note

	description:

	"[
		Eiffel qualified anchored type status checkers.
		Check whether the base classes of the anchors of qualified anchored types
		appearing in the types of all signatures of a class have their
		features already successfully flattened.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_ANCHORED_TYPE_STATUS_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_class,
			process_class_type,
			process_generic_class_type,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

create

	make

feature -- Validity checking

	check_signatures_validity (a_class: ET_CLASS)
			-- Check whether the base classes of the anchors of qualified anchored types
			-- appearing in the types of all signatures of `a_class' have their
			-- features already successfully flattened.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			check_feature_signatures_validity (current_class.queries)
			if not has_fatal_error then
				check_feature_signatures_validity (current_class.procedures)
			end
			current_class := old_class
		end

feature {NONE} -- Type validity

	check_feature_signatures_validity (a_features: ET_FEATURE_LIST)
			-- Check whether the base classes of the anchors of qualified anchored types
			-- appearing in the types of all signatures of `a_features' have their
			-- features already successfully flattened.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_features_not_void: a_features /= Void
		local
			args: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			j, nb2: INTEGER
			l_type, l_previous_type: ET_TYPE
			l_feature: ET_FEATURE
		do
			nb := a_features.count
			from i := 1 until i > nb loop
				l_feature := a_features.item (i)
				l_type := l_feature.type
				if l_type /= Void then
					l_type.process (Current)
				end
				if has_fatal_error then
					i := nb + 1 -- Jump out of the loop.
				else
					args := l_feature.arguments
					if args /= Void then
						nb2 := args.count
						from j := 1 until j > nb2 loop
							l_type := args.formal_argument (j).type
							if l_type /= l_previous_type then
								l_type.process (Current)
								if has_fatal_error then
										-- Jump out of the loops.
									j := nb2 + 1
									i := nb + 1
								end
								l_previous_type := l_type
							end
							j := j + 1
						end
						l_previous_type := Void
					end
				end
				i := i + 1
			end
		end

	check_qualified_like_identifier_validity (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Check whether the base classes of the anchors of qualified anchored types
			-- appearing in `a_type' have their features already successfully flattened.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_target_type: ET_TYPE
			l_class: ET_NAMED_CLASS
		do
			l_target_type := a_type.target_type
				-- The target type may also be made up of qualified anchored types.
			l_target_type.process (Current)
			if not has_fatal_error then
				l_class := l_target_type.named_base_class (current_class)
				if not l_class.features_flattened or else l_class.has_flattening_error then
					set_fatal_error
				end
			end
		end

	check_actual_parameters_validity (a_parameters: ET_ACTUAL_PARAMETER_LIST)
			-- Check whether the base classes of the anchors of qualified anchored types
			-- appearing in `a_parameters' have their features already successfully flattened.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_parameters_not_void: a_parameters /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
		do
			nb := a_parameters.count
			from i := 1 until i > nb loop
				a_parameters.type (i).process (Current)
				if has_fatal_error then
					i := nb + 1 -- Jump out of the loop.
				end
				i := i + 1
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_class (a_type: ET_CLASS)
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				check_actual_parameters_validity (a_parameters)
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE)
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			check_qualified_like_identifier_validity (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			check_qualified_like_identifier_validity (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				check_actual_parameters_validity (a_parameters)
			end
		end

end

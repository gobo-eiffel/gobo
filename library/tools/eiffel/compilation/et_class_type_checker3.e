indexing

	description:

		"Eiffel class type validity third pass checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_TYPE_CHECKER3

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			process_class,
			process_class_type,
			process_generic_class_type,
			process_tuple_type
		end

create

	make

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

feature -- Validity checking

	check_type_validity (a_type: ET_TYPE) is
			-- Check whether all classes that appear in `a_type'
			-- have their features already successfully flattened.
			-- Set `has_fatal_error' to True otherwsise.
		require
			a_type_not_void: a_type /= Void
		do
			has_fatal_error := False
			a_type.process (Current)
		end

feature {NONE} -- Type validity

	check_class_type_validity (a_type: ET_CLASS_TYPE) is
			-- Check whether all classes that appear in `a_type'
			-- have their features already successfully flattened.
			-- Set `has_fatal_error' to True otherwsise.
		require
			a_type_not_void: a_type /= Void
		local
			l_class: ET_CLASS
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			l_class := a_type.direct_base_class (universe)
			if not l_class.features_flattened or else l_class.has_flattening_error then
				set_fatal_error
			else
				l_actuals := a_type.actual_parameters
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						l_actuals.type (i).process (Current)
						if has_fatal_error then
							i := nb + 1 -- Jump out of the loop.
						end
						i := i + 1
					end
				end
			end
		end

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE) is
			-- Check whether all classes that appear in `a_type'
			-- have their features already successfully flattened.
			-- Set `has_fatal_error' to True otherwsise.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_parameters := a_type.actual_parameters
			if l_parameters /= Void then
				nb := l_parameters.count
				from i := 1 until i > nb loop
					l_parameters.type (i).process (Current)
					if has_fatal_error then
						i := nb + 1 -- Jump out of the loop.
					end
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

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

end

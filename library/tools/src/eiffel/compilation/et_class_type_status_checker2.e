note

	description:

	"[
		Eiffel class type validity second pass status checkers.
		Check whether all classes that appear in a type have
		their ancestors already successfully built.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"

class ET_CLASS_TYPE_STATUS_CHECKER2

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			process_class,
			process_class_type,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

create

	make

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

feature -- Validity checking

	check_type_validity (a_type: ET_TYPE)
			-- Check whether all classes that appear in `a_type'
			-- have their ancestors already successfully built.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_type_not_void: a_type /= Void
		do
			has_fatal_error := False
			a_type.process (Current)
		end

feature {NONE} -- Type validity

	check_class_type_validity (a_type: ET_CLASS_TYPE)
			-- Check whether all classes that appear in `a_type'
			-- have their ancestors already successfully built.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_type_not_void: a_type /= Void
		local
			l_class: ET_NAMED_CLASS
			i, nb: INTEGER
		do
			l_class := a_type.named_base_class
			if not l_class.ancestors_built or else l_class.has_ancestors_error then
				set_fatal_error
			elseif attached a_type.actual_parameters as l_actuals then
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

	check_qualified_like_identifier_validity (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Check whether all classes that appear in `a_type'
			-- have their ancestors already successfully built.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_type_not_void: a_type /= Void
		do
			a_type.target_type.process (Current)
		end

	check_tuple_type_validity (a_type: ET_TUPLE_TYPE)
			-- Check whether all classes that appear in `a_type'
			-- have their ancestors already successfully built.
			-- Set `has_fatal_error' to True otherwise.
		require
			a_type_not_void: a_type /= Void
		local
			l_class: ET_NAMED_CLASS
			i, nb: INTEGER
		do
			l_class := a_type.named_base_class
			if not l_class.ancestors_built or else l_class.has_ancestors_error then
				set_fatal_error
			elseif attached a_type.actual_parameters as l_parameters then
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
		do
			check_tuple_type_validity (a_type)
		end

feature {NONE} -- Error handling

	set_fatal_error
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

end

indexing

	description:

		"Eiffel qualified anchored type identifier resolvers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_IDENTIFIER_TYPE_RESOLVER

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

feature -- Type resolving

	resolve_type (a_type: ET_TYPE; a_class: ET_CLASS) is
			-- Resolve identifiers in qualified anchored types (such as in
			-- 'like a.identifier' and 'like {A}.identifier') in type `a_type'
			-- when it appears in `a_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			-- no_cycle: no cycle in anchored types involved.
		local
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			a_type.process (Current)
			current_class := old_class
		end

feature {NONE} -- Type resolving

	resolve_qualified_like_identifier (a_type: ET_QUALIFIED_LIKE_IDENTIFIER) is
			-- Resolve 'identifier' in 'like a.identifier' and 'like {A}.identifier'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_class: ET_CLASS
		do
			has_fatal_error := False
			l_target_type := a_type.target_type
				-- The target type may also be made up of qualified anchored types.
			resolve_type (l_target_type, current_class)
			if not has_fatal_error then
				l_class := l_target_type.base_class (current_class)
				l_class.process (current_system.feature_flattener)
				if not l_class.features_flattened or else l_class.has_flattening_error then
					set_fatal_error
				else
					l_query := l_class.named_query (a_type.name)
					if l_query /= Void then
						a_type.resolve_identifier_type (l_query.first_seed)
-- TODO: check that `l_query' is exported to `current_class'.
					else
						set_fatal_error
						error_handler.report_vtat1c_error (current_class, a_type, l_class)
					end
				end
			end
		end

	resolve_actual_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST) is
			-- Resolve the actual parameter types.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_parameters_not_void: a_parameters /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			nb := a_parameters.count
			from i := 1 until i > nb loop
				resolve_type (a_parameters.type (i), current_class)
				if has_fatal_error then
					had_error := True
				end
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

feature {ET_AST_NODE} -- Type processing

	process_class (a_type: ET_CLASS) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				resolve_actual_parameters (a_parameters)
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE) is
			-- Process `a_type'.
		do
			resolve_qualified_like_identifier (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		do
			resolve_qualified_like_identifier (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				resolve_actual_parameters (a_type.actual_parameters)
			end
		end

end

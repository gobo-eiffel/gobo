indexing

	description:

		"Eiffel qualified anchored type resolvers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_TYPE_RESOLVER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			process_class,
			process_class_type,
			process_generic_class_type,
			process_qualified_braced_type,
			process_qualified_like_feature,
			process_qualified_like_type,
			process_tuple_type
		end

creation

	make

feature -- Type resolving

	resolve_type (a_type: ET_TYPE) is
			-- Resolve qualified anchored types of the form
			-- 'like a.b' or 'like {A}.b'.
		require
			a_type_not_void: a_type /= Void
		do
			internal_call := True
			a_type.process (Current)
			internal_call := False
		end

feature {NONE} -- Type resolving

	resolve_qualified_type (a_type: ET_QUALIFIED_TYPE) is
			-- Resolve 'identifier' in 'like a.identifier'
			-- and 'like {A}.identifier'.
		require
			a_type_not_void: a_type /= Void
		local
			a_target_type: ET_TYPE
			a_base_class: ET_CLASS
			a_feature: ET_FEATURE
		do
			a_target_type := a_type.target_type
				-- The target type may also be made up of 
				-- qualified anchored types.
			resolve_type (a_target_type)
			a_base_class := a_target_type.base_class (current_class, universe)
			a_base_class.process (universe.feature_flattener)
			a_feature := a_base_class.named_feature (a_type.name)
			if a_feature /= Void then
				a_type.resolve_identifier_type (a_feature.first_seed)
			else
				set_fatal_error (current_class)
				if a_base_class /= universe.unknown_class then
					error_handler.report_vtat1d_error (current_class, a_type, a_base_class)
				else
					-- This error has already been reported elsewhere.
					-- It is either due to a 'BIT name' or anchored type
					-- not resolved because of another error, or an
					-- inconsistency introduced manually in the AST after
					-- some validity rules had already been checked.
				end
			end
		end

	resolve_actual_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST) is
			-- Resolve the actual parameter types.
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, nb: INTEGER
		do
			nb := a_parameters.count
			from i := 1 until i > nb loop
				resolve_type (a_parameters.type (i))
				i := i + 1
			end
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
			if internal_call then
				internal_call := False
				a_parameters := a_type.actual_parameters
				if a_parameters /= Void then
					resolve_actual_parameters (a_parameters)
				end
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_qualified_braced_type (a_type: ET_QUALIFIED_BRACED_TYPE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				resolve_qualified_type (a_type)
			end
		end

	process_qualified_like_feature (a_type: ET_QUALIFIED_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				resolve_qualified_type (a_type)
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				resolve_qualified_type (a_type)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if internal_call then
				internal_call := False
				a_parameters := a_type.actual_parameters
				if a_parameters /= Void then
					resolve_actual_parameters (a_type.actual_parameters)
				end
			end
		end

feature {NONE} -- Implementation

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

end

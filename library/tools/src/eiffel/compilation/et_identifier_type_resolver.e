note

	description:

		"Eiffel identifier type resolvers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER_TYPE_RESOLVER

inherit

	ET_CLASS_SUBPROCESSOR

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_bit_feature,
			process_class,
			process_class_type,
			process_like_feature,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

create

	make

feature -- Access

	current_feature: detachable ET_FEATURE
			-- Feature where the type appears;
			-- Void if the type does not appear in a feature

feature -- Type resolving

	resolve_type (a_type: ET_TYPE; a_feature: detachable ET_FEATURE; a_class: ET_CLASS)
			-- Resolve identifiers (such as 'like identifier' and
			-- 'BIT identifier') in type `a_type' when it appears
			-- in `a_feature' in `a_class'. Do not try to resolve
			-- qualified anchored types. This is done after the
			-- features of the corresponding classes have been
			-- flattened.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_feature_registered: a_feature /= Void implies a_feature.is_registered
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_feature: detachable ET_FEATURE
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			a_type.process (Current)
			current_class := old_class
			current_feature := old_feature
		end

feature {NONE} -- Type resolving

	resolve_bit_feature (a_type: ET_BIT_FEATURE)
			-- Resolve 'BIT identifier' type.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		do
			has_fatal_error := False
			if attached current_class.named_query (a_type.name) as l_query then
				if attached {ET_CONSTANT_ATTRIBUTE} l_query as l_constant_attribute and then attached {ET_INTEGER_CONSTANT} l_constant_attribute.constant as l_constant then
					a_type.resolve_identifier_type (l_query.first_seed, l_constant)
					check_bit_type (a_type)
				else
						-- VTBT error (ETL2 page 210): The identifier
						-- in Bit_type must be the final name of a
						-- constant attribute of type INTEGER.
					set_fatal_error
					error_handler.report_vtbt0a_error (current_class, a_type)
				end
			elseif attached current_class.named_procedure (a_type.name) as l_procedure then
					-- VTBT error (ETL2 page 210): The identifier
					-- in Bit_type must be the final name of a
					-- constant attribute of type INTEGER.
				set_fatal_error
				error_handler.report_vtbt0a_error (current_class, a_type)
			else
					-- VTBT error (ETL2 page 210): The identifier
					-- in Bit_type must be the final name of a feature.
				set_fatal_error
				error_handler.report_vtbt0b_error (current_class, a_type)
			end
		end

	resolve_like_feature (a_type: ET_LIKE_FEATURE)
			-- Resolve 'like identifier' type.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			l_name: ET_FEATURE_NAME
			l_index: INTEGER
			resolved: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_type.name
			if attached current_class.named_query (l_name) as l_query then
					-- This is a 'like feature'.
				a_type.resolve_like_feature (l_query)
				resolved := True
			elseif attached current_feature as l_current_feature then
					-- This has to be a 'like argument', otherwise this is an error.
					-- Note that 'like argument' is not a valid construct in ECMA Eiffel.
					-- This is supported here for backward compatibility.
				if attached {ET_IDENTIFIER} l_name as l_argument_name then
					if attached l_current_feature.arguments as args then
						l_index := args.index_of (l_argument_name)
						if l_index /= 0 then
							l_argument_name.set_seed (l_index)
							l_argument_name.set_argument (True)
							a_type.resolve_like_argument (l_current_feature)
							resolved := True
						end
					end
				end
			end
			if not resolved then
				set_fatal_error
				if attached current_feature as l_current_feature then
					error_handler.report_vtat1b_error (current_class, l_current_feature, a_type)
				else
					error_handler.report_vtat1a_error (current_class, a_type)
				end
			end
		end

	resolve_qualified_like_identifier (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Resolve 'identifier' in 'like identifier.b'
			-- and 'like {like identifier}.b'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		do
			resolve_type (a_type.target_type, current_feature, current_class)
		end

	resolve_actual_parameters (a_parameters: ET_ACTUAL_PARAMETERS)
			-- Resolve the actual parameter types.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			nb := a_parameters.count
			from i := 1 until i > nb loop
				resolve_type (a_parameters.type (i), current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

feature {NONE} -- Validity

	check_bit_type (a_type: ET_BIT_TYPE)
			-- Check validity of the integer constant.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			constant_not_void: a_type.constant /= Void
		do
			has_fatal_error := False
			a_type.compute_size
			if a_type.has_size_error then
				set_fatal_error
				error_handler.report_vtbt0c_error (current_class, a_type)
			elseif a_type.size = 0 and attached a_type.constant as l_constant and then l_constant.is_negative then
					-- Not considered as a fatal error by gelint.
				error_handler.report_vtbt0d_error (current_class, a_type)
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_bit_feature (a_type: ET_BIT_FEATURE)
			-- Process `a_type'.
		do
			resolve_bit_feature (a_type)
		end

	process_class (a_type: ET_CLASS)
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.actual_parameters as l_parameters then
				resolve_actual_parameters (l_parameters)
			end
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			resolve_like_feature (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			resolve_qualified_like_identifier (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			resolve_qualified_like_identifier (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.actual_parameters as l_parameters then
				resolve_actual_parameters (l_parameters)
			end
		end

invariant

	current_feature_registered: attached current_feature as l_current_feature implies l_current_feature.is_registered

end

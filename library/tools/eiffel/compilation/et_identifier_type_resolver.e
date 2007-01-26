indexing

	description:

		"Eiffel identifier type resolvers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER_TYPE_RESOLVER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_bit_feature,
			process_class,
			process_class_type,
			process_generic_class_type,
			process_like_feature,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new identifier type resolver.
		do
			precursor (a_universe)
			current_class := a_universe.unknown_class
		end

feature -- Access

	current_class: ET_CLASS
			-- Class where the type appears

	current_feature: ET_FEATURE
			-- Feature where the type appears;
			-- Void if the type does not appear in a feature

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when resolving last type?

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature -- Type resolving

	resolve_type (a_type: ET_TYPE; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Resolve identifiers (such as 'like identifier' and
			-- 'BIT identifier') in type `a_type' when in appears
			-- in `a_feature' in `a_class'.
		require
			a_type_not_void: a_type /= Void
			a_feature_registered: a_feature /= Void implies a_feature.is_registered
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
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

	resolve_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Resolve 'BIT identifier' type.
		require
			a_type_not_void: a_type /= Void
		local
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_constant: ET_INTEGER_CONSTANT
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
		do
			l_query := current_class.named_query (a_type.name)
			if l_query /= Void then
				l_constant_attribute ?= l_query
				if l_constant_attribute /= Void then
					l_constant ?= l_constant_attribute.constant
				end
				if l_constant /= Void then
					a_type.resolve_identifier_type (l_query.first_seed, l_constant)
					check_bit_type (a_type)
				else
						-- VTBT error (ETL2 page 210): The identifier
						-- in Bit_type must be the final name of a
						-- constant attribute of type INTEGER.
					set_fatal_error
					error_handler.report_vtbt0a_error (current_class, a_type)
				end
			else
				l_procedure := current_class.named_procedure (a_type.name)
				if l_procedure /= Void then
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
		end

	resolve_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Resolve 'like identifier' type.
		require
			a_type_not_void: a_type /= Void
		local
			l_name: ET_FEATURE_NAME
			l_query: ET_QUERY
			args: ET_FORMAL_ARGUMENT_LIST
			l_index: INTEGER
			l_argument_name: ET_IDENTIFIER
			resolved: BOOLEAN
		do
			l_name := a_type.name
			l_query := current_class.named_query (l_name)
			if l_query /= Void then
					-- This is a 'like feature'.
				a_type.resolve_like_feature (l_query)
				resolved := True
			else
				if current_feature /= Void then
						-- This has to be a 'like argument', otherwise this is an error.
						-- Note that 'like argument' is not a valid construct in ECMA Eiffel.
						-- This is supported here for backward compatibility.
					l_argument_name ?= l_name
					if l_argument_name /= Void then
						args := current_feature.arguments
						if args /= Void then
							l_index := args.index_of (l_argument_name)
							if l_index /= 0 then
								l_argument_name.set_seed (l_index)
								l_argument_name.set_argument (True)
								a_type.resolve_like_argument (current_feature)
								resolved := True
							end
						end
					end
				end
			end
			if not resolved then
				set_fatal_error
				if current_feature /= Void then
					error_handler.report_vtat1b_error (current_class, current_feature, a_type)
				else
					error_handler.report_vtat1a_error (current_class, a_type)
				end
			end
		end

	resolve_actual_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST) is
			-- Resolve the actual parameter types.
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			nb := a_parameters.count
			from i := 1 until i > nb loop
				resolve_type (a_parameters.type (i), current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
		end

feature {NONE} -- Validity

	check_bit_type (a_type: ET_BIT_TYPE) is
			-- Check validity of the integer constant.
		require
			a_type_not_void: a_type /= Void
			constant_not_void: a_type.constant /= Void
		do
			a_type.compute_size
			if a_type.has_size_error then
				set_fatal_error
				error_handler.report_vtbt0c_error (current_class, a_type)
			elseif a_type.size = 0 and a_type.constant.is_negative then
					-- Not considered as a fatal error by gelint.
				error_handler.report_vtbt0d_error (current_class, a_type)
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			resolve_bit_feature (a_type)
		end

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

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			resolve_like_feature (a_type)
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

invariant

	current_class_not_void: current_class /= Void
	current_feature_registered: current_feature /= Void implies current_feature.is_registered

end

indexing

	description:

		"Eiffel identifier type resolvers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER_TYPE_RESOLVER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			process_bit_feature,
			process_class,
			process_class_type,
			process_generic_class_type,
			process_like_feature,
			process_qualified_braced_type,
			process_qualified_like_current,
			process_qualified_like_feature,
			process_qualified_like_type,
			process_tuple_type
		end

creation

	make

feature -- Access

	current_feature: ET_FEATURE
			-- Feature where the type appears;
			-- Void if the type does not appear in a feature

feature -- Setting

	set_current_feature (a_feature: like current_feature) is
			-- Set `current_feature' to `a_feature'.
		require
			a_feature_registered: a_feature /= Void implies a_feature.is_registered
		do
			current_feature := a_feature
		ensure
			current_feature_set: current_feature = a_feature
		end

feature -- Type resolving

	resolve_type (a_type: ET_TYPE) is
			-- Resolve identifiers (such as 'like identifier' and
			-- 'BIT identifier') in type `a_type'. Do not try to
			-- resolve qualified anchored types other than those of
			-- the form 'like Current.b'. This is done after the
			-- features of the corresponding classes have been
			-- flattened.
		require
			a_type_not_void: a_type /= Void
		do
			internal_call := True
			a_type.process (Current)
			internal_call := False
		end

feature {NONE} -- Type resolving

	resolve_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Resolve 'BIT identifier' type.
		require
			a_type_not_void: a_type /= Void
		local
			a_feature: ET_FEATURE
			a_constant: ET_INTEGER_CONSTANT
			a_constant_attribute: ET_CONSTANT_ATTRIBUTE
		do
			a_feature := current_class.named_feature (a_type.name)
			if a_feature /= Void then
				a_constant_attribute ?= a_feature.flattened_feature
				if a_constant_attribute /= Void then
					a_constant ?= a_constant_attribute.constant
				end
				if a_constant /= Void then
					a_type.resolve_identifier_type (a_feature.first_seed, a_constant)
					check_bit_type (a_type)
				else
						-- VTBT error (ETL2 page 210): The identifier
						-- in Bit_type must be the final name of a
						-- constant attribute of type INTEGER.
					set_fatal_error (current_class)
					error_handler.report_vtbt0a_error (current_class, a_type)
				end
			else
					-- VTBT error (ETL2 page 210): The identifier
					-- in Bit_type must be the final name of a feature.
				set_fatal_error (current_class)
				error_handler.report_vtbt0b_error (current_class, a_type)
			end
		end

	resolve_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Resolve 'like identifier' type.
		require
			a_type_not_void: a_type /= Void
		local
			a_name: ET_FEATURE_NAME
			a_feature: ET_FEATURE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
			an_argument_name: ET_IDENTIFIER
			resolved: BOOLEAN
		do
			a_name := a_type.name
			a_feature := current_class.named_feature (a_name)
			if a_feature /= Void then
					-- This is a 'like feature'.
				a_type.resolve_like_feature (a_feature.first_seed)
				resolved := True
			elseif current_feature /= Void then
					-- This has to be a 'like argument', otherwise
					-- this is an error.
				an_argument_name ?= a_name
				if an_argument_name /= Void then
					args := current_feature.arguments
					if args /= Void then
						an_index := args.index_of (an_argument_name)
						if an_index /= 0 then
							a_type.resolve_like_argument (current_feature.first_seed, an_index)
							resolved := True
						end
					end
				end
			end
			if not resolved then
				if current_feature /= Void then
					error_handler.report_vtat0b_error (current_class, current_feature, a_type)
				else
					error_handler.report_vtat0a_error (current_class, a_type)
				end
			end
		end

	resolve_qualified_like_current (a_type: ET_QUALIFIED_LIKE_CURRENT) is
			-- Resolve 'identifier' in 'like Current.identifier'.
		require
			a_type_not_void: a_type /= Void
		local
			a_feature: ET_FEATURE
		do
				-- We consider 'like Current.b' as a 'like b'.
			a_feature := current_class.named_feature (a_type.name)
			if a_feature /= Void then
				a_type.resolve_identifier_type (a_feature.first_seed)
			else
				error_handler.report_vtat0c_error (current_class, a_type)
			end
		end

	resolve_qualified_type (a_type: ET_QUALIFIED_TYPE) is
			-- Resolve 'identifier' in 'like identifier.b'
			-- and 'like {like identifier}.b'.
		require
			a_type_not_void: a_type /= Void
		do
			resolve_type (a_type.target_type)
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

feature {NONE} -- Validity

	check_bit_type (a_type: ET_BIT_TYPE) is
			-- Check validity of the integer constant.
		require
			a_type_not_void: a_type /= Void
			constant_not_void: a_type.constant /= Void
		do
			a_type.compute_size
			if a_type.has_size_error then
				set_fatal_error (current_class)
				error_handler.report_vtbt_error (current_class, a_type)
			elseif a_type.size = 0 and a_type.constant.is_negative then
					-- Not considered as a fatal error by gelint.
				error_handler.report_vtbt_minus_zero_error (current_class, a_type)
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				resolve_bit_feature (a_type)
			end
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

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				resolve_like_feature (a_type)
			end
		end

	process_qualified_braced_type (a_type: ET_QUALIFIED_BRACED_TYPE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				resolve_qualified_type (a_type)
			end
		end

	process_qualified_like_current (a_type: ET_QUALIFIED_LIKE_CURRENT) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				resolve_qualified_like_current (a_type)
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

invariant

	current_feature_registered: current_feature /= Void implies current_feature.is_registered

end

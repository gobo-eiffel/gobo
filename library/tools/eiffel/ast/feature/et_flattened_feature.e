indexing

	description:

		"Eiffel features being flattened"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FLATTENED_FEATURE

feature -- Status report

	is_immediate: BOOLEAN is
			-- Is current feature immediate?
		do
			Result := not is_adapted
		ensure
			definition: Result = not is_adapted
		end

	is_inherited: BOOLEAN is
			-- Is current feature being inherited?
		do
			-- Result := False
		end

	is_redeclared: BOOLEAN is
			-- Is current feature being redeclared?
		do
			-- Result := False
		end

	is_adapted: BOOLEAN is
			-- Is current feature being either inherited or redeclared?
		do
			-- Result := False
		ensure
			definition: Result = (is_inherited or is_redeclared)
		end

	has_seed (a_seed: INTEGER): BOOLEAN is
			-- Does current feature have `a_seed'?
		do
			if first_seed = a_seed then
				Result := True
			elseif other_seeds /= Void then
				Result := other_seeds.has (a_seed)
			end
		ensure
			definition: Result = (first_seed = a_seed or (other_seeds /= Void and then other_seeds.has (a_seed)))
		end

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		deferred
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		deferred
		end

	first_seed: INTEGER
			-- First seed

	other_seeds: ET_FEATURE_IDS
			-- Other seeds (feature IDs of first declarations
			-- of current feature); May be Void if there
			-- is only one seed (which is then accessible
			-- through `first_seed')

	flattened_feature: ET_FEATURE is
			-- Feature resulting after feature flattening
		deferred
		ensure
			flattened_feature_not_void: Result /= Void
		end

feature -- Conversion

	immediate_feature: ET_FEATURE is
			-- Current feature viewed as an immediate feature
		require
			is_immediate: is_immediate
		do
			check is_immediate: is_immediate end
		ensure
			definition: same_objects (Result, Current)
		end

	inherited_feature: ET_INHERITED_FEATURE is
			-- Current feature viewed as an inherited feature
		require
			is_inherited: is_inherited
		do
			check is_inherited: is_inherited end
		ensure
			definition: same_objects (Result, Current)
		end

	redeclared_feature: ET_REDECLARED_FEATURE is
			-- Current feature viewed as a redeclared feature
		require
			is_redeclared: is_redeclared
		do
			check is_redeclared: is_redeclared end
		ensure
			definition: same_objects (Result, Current)
		end

	adapted_feature: ET_ADAPTED_FEATURE is
			-- Current feature viewed as an adapted feature
		require
			is_adapted: is_adapted
		do
			check is_adapted: is_adapted end
		ensure
			definition: same_objects (Result, Current)
		end

feature {NONE} -- Implementation

	same_objects (obj1, obj2: ANY): BOOLEAN is
			-- Workaround for VWEQ when running Degree 3 in flat mode.
		do
			Result := (obj1 = obj2)
		ensure
			definition: Result = (obj1 = obj2)
		end

end

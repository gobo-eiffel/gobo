note

	description:

		"Eiffel features being flattened"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FLATTENED_FEATURE

inherit

	ANY -- Needed for SE 2.1.

	KL_IMPORTED_ANY_ROUTINES

feature -- Status report

	is_immediate: BOOLEAN
			-- Is current feature immediate?
			-- Note that this feature only make sense when flattening the features.
			-- Otherwise, features that are declared or redeclared in a class
			-- are available in ET_CLASS.queries and ET_CLASS.procedures from
			-- range 1 to `declared_count', and (non-redeclared) inherited features
			-- from range `declared_count' + 1 to `count'.
		do
			Result := not is_adapted
		ensure
			definition: Result = not is_adapted
		end

	is_inherited: BOOLEAN
			-- Is current feature being inherited?
			-- Note that this feature only make sense when flattening the features.
			-- Otherwise, features that are declared or redeclared in a class
			-- are available in ET_CLASS.queries and ET_CLASS.procedures from
			-- range 1 to `declared_count', and (non-redeclared) inherited features
			-- from range `declared_count' + 1 to `count'.
		do
			-- Result := False
		end

	is_redeclared: BOOLEAN
			-- Is current feature being redeclared?
			-- Note that this feature only make sense when flattening the features.
			-- Otherwise, features that are declared or redeclared in a class
			-- are available in ET_CLASS.queries and ET_CLASS.procedures from
			-- range 1 to `declared_count', and (non-redeclared) inherited features
			-- from range `declared_count' + 1 to `count'.
		do
			-- Result := False
		end

	is_adapted: BOOLEAN
			-- Is current feature being either inherited or redeclared?
			-- Note that this feature only make sense when flattening the features.
			-- Otherwise, features that are declared or redeclared in a class
			-- are available in ET_CLASS.queries and ET_CLASS.procedures from
			-- range 1 to `declared_count', and (non-redeclared) inherited features
			-- from range `declared_count' + 1 to `count'.
		do
			-- Result := False
		ensure
			definition: Result = (is_inherited or is_redeclared)
		end

	is_dotnet: BOOLEAN
			-- Is current feature a .NET feature?
		do
			-- Result := False
		end

	has_seed (a_seed: INTEGER): BOOLEAN
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

	has_common_seed (other: ET_FLATTENED_FEATURE): BOOLEAN
			-- Do current feature and `other' have a least one seed in common?
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
		do
			if first_seed /= 0 then
				if other.has_seed (first_seed) then
					Result := True
				elseif other_seeds /= Void then
					if other_seeds = other.other_seeds then
						Result := True
					else
						nb := other_seeds.count
						from i := 1 until i > nb loop
							if other.has_seed (other_seeds.item (i)) then
								Result := True
								i := nb + 1
							else
								i := i + 1
							end
						end
					end
				end
			end
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	type: ET_TYPE
			-- Return type;
			-- Void for procedures
		deferred
		end

	arguments: ET_FORMAL_ARGUMENT_LIST
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

	flattened_feature: ET_FEATURE
			-- Feature resulting after feature flattening
		deferred
		ensure
			flattened_feature_not_void: Result /= Void
		end

feature -- Conversion

	immediate_feature: ET_FEATURE
			-- Current feature viewed as an immediate feature
		require
			is_immediate: is_immediate
		do
			check is_immediate: is_immediate end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	inherited_feature: ET_INHERITED_FEATURE
			-- Current feature viewed as an inherited feature
		require
			is_inherited: is_inherited
		do
			check is_inherited: is_inherited end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	redeclared_feature: ET_REDECLARED_FEATURE
			-- Current feature viewed as a redeclared feature
		require
			is_redeclared: is_redeclared
		do
			check is_redeclared: is_redeclared end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	adapted_feature: ET_ADAPTED_FEATURE
			-- Current feature viewed as an adapted feature
		require
			is_adapted: is_adapted
		do
			check is_adapted: is_adapted end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

end

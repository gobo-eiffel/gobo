indexing

	description:

		"Eiffel feature calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_CALL

inherit

	ET_DYNAMIC_TYPE_SET

creation

	make

feature {NONE} -- Initialization

	make (a_type: like static_type; a_feature: like static_feature; a_system: ET_SYSTEM) is
			-- Create a new dynamic call.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_system_not_void: a_system /= Void
		do
			reset (a_type, a_feature, a_system)
		ensure
			static_type_set: static_type = a_type
			static_feature_set: static_feature = a_feature
		end

feature -- Initialization

	reset (a_type: like static_type; a_feature: like static_feature; a_system: ET_SYSTEM) is
			-- Reset current dynamic call.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_system_not_void: a_system /= Void
		local
			l_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_NESTED_DYNAMIC_TYPE_SET
			args: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			static_type := a_type
			static_feature := a_feature
			l_type := a_feature.type
			if l_type /= Void then
				l_dynamic_type := a_system.dynamic_type (l_type, a_type.base_type)
				create l_dynamic_type_set.make (l_dynamic_type)
				result_type := l_dynamic_type_set
			end
			args := a_feature.arguments
			if args /= Void then
				nb := args.count
				if nb > 0 then
					create argument_types.make_with_capacity (nb)
					from i := nb until i < 1 loop
						l_type := args.formal_argument (i).type
						l_dynamic_type := a_system.dynamic_type (l_type, a_type.base_type)
						create l_dynamic_type_set.make (l_dynamic_type)
						argument_types.put_first (l_dynamic_type_set)
						i := i - 1
					end
				end
			end
		ensure
			static_type_set: static_type = a_type
			static_feature_set: static_feature = a_feature
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time

	first_type: ET_DYNAMIC_TYPE
			-- First type in current set;
			-- Void if no type in the set

	other_types: DS_LINKABLE [ET_DYNAMIC_TYPE]
			-- Other types in current set;
			-- Void if zero or one type in the set

	static_feature: ET_FEATURE
			-- Feature being called

	argument_types: ET_DYNAMIC_TYPE_SET_LIST
			-- Types of arguments, if any

	result_type: ET_DYNAMIC_TYPE_SET
			-- Type of Result, if any

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		local
			l_other_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
			found: BOOLEAN
			l_seed: INTEGER
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_result_type: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
		do
			if first_type = Void then
				first_type := a_type
				found := False
			elseif a_type /= first_type then
				from
					l_other_type := other_types
				until
					l_other_type = Void
				loop
					if l_other_type.item = a_type then
						found := True
						l_other_type := Void
					else
						l_other_type := l_other_type.right
					end
				end
				if not found then
					create l_other_type.make (a_type)
					if other_types /= Void then
						l_other_type.put_right (other_types)
					end
					other_types := l_other_type
				end
			else
				found := True
			end
			if not found then
				l_seed := static_feature.first_seed
				l_feature := a_type.base_class.seeded_feature (l_seed)
				if l_feature = Void then
-- TODO: error
				else
					l_dynamic_feature := a_type.dynamic_feature (l_feature, a_system)
					l_dynamic_feature.set_regular (True)
					l_argument_types := l_dynamic_feature.argument_types
					if argument_types /= Void then
						if l_argument_types = Void then
-- TODO: error
						elseif argument_types.count /= l_argument_types.count then
-- TODO: error
						else
							nb := l_argument_types.count
							from i := 1 until i > nb loop
								argument_types.item (i).put_target (l_argument_types.item (i), a_system)
								i := i + 1
							end
						end
					elseif l_argument_types /= Void and then not l_argument_types.is_empty then
-- TODO: error
					end
					l_result_type := l_dynamic_feature.result_type
					if result_type /= Void then
						if l_result_type = Void then
-- TODO: error
						else
							result_type.put_target (l_result_type, a_system)
						end
					elseif l_result_type /= Void then
-- TODO: error
					end
				end
			end
		end

	put_target (a_target: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are super sets of the current sets.)
		do
-- TODO: error
		end

feature -- Link

	next: like Current
			-- Next linked feature call if list of feature calls

	set_next (a_next: like Current) is
			-- Set `next' to `a_next'.
		do
			next := a_next
		ensure
			next_set: next = a_next
		end

invariant

	static_feature_not_void: static_feature /= Void

end

indexing

	description:

		"Eiffel assignment attempts at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_ASSIGNMENT_ATTEMPT

inherit

	ET_DYNAMIC_ATTACHMENT
		redefine
			propagate_types
		end

creation

	make

feature {NONE} -- Initialization

	make (a_source_type: like source_type; an_assignment_attempt: like assignment_attempt;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new assignment attempt.
		require
			a_source_type_not_void: a_source_type /= Void
			an_assignment_attempt_not_void: an_assignment_attempt /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type := a_source_type
			assignment_attempt := an_assignment_attempt
			current_feature := a_current_feature
			current_type := a_current_type
			is_direct_assignment := True
		ensure
			source_type_set: source_type = a_source_type
			assignment_attempt_set: assignment_attempt = an_assignment_attempt
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	first_type: ET_DYNAMIC_TYPE
			-- First type that could go through assignment attempt
			-- Void if no such type

	other_types: ET_DYNAMIC_TYPE_LIST
			-- Other types that could go through assignment attempt
			-- Void if zero or one such type

	assignment_attempt: ET_ASSIGNMENT_ATTEMPT
			-- Assignment attempt instruction

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := assignment_attempt.source.position
		end

feature -- Status report

	is_direct_assignment: BOOLEAN
			-- Can current assignment attempt be implemented as a direct assignment?

feature -- Measurement

	type_count: INTEGER
			-- Number of types that could go through the assignment attempt

feature -- Element change

	propagate_types (a_target: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Propagate types to `a_target'.
		local
			l_count: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			l_count := source_type.count
			if l_count /= count then
				nb := l_count - count
				count := l_count
				l_other_types := source_type.other_types
				if l_other_types /= Void then
					nb2 := l_other_types.count
					from j := 1 until j > nb2 loop
						put_type (l_other_types.item (j), a_target, a_system)
						i := i + 1
						if i < nb then
							j := j + 1
						else
								-- Jump out of the loop.
							j := nb2 + 1
						end
					end
				end
				if i < nb then
					l_type := source_type.first_type
					if l_type /= Void then
						put_type (l_type, a_target, a_system)
					end
				end
			end
		end

feature {NONE} -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_target: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_type' to `a_target' if it can go
			-- through the assignment attempt.
		require
			a_type_not_void: a_type /= Void
			a_target_not_void: a_target /= Void
			a_system_not_void: a_system /= Void
		do
			if not a_type.conforms_to_type (a_target.static_type, a_system) then
				is_direct_assignment := False
			else
				if first_type = Void then
					first_type := a_type
					type_count := type_count + 1
					a_target.put_type (a_type, a_system)
				elseif a_type = first_type then
					-- Do nothing.
				elseif other_types = Void then
					create other_types.make_with_capacity (15)
					other_types.put_first (a_type)
					type_count := type_count + 1
					a_target.put_type (a_type, a_system)
				elseif other_types.has (a_type) then
					-- Do nothing.
				else
					other_types.force_first (a_type)
					type_count := type_count + 1
					a_target.put_type (a_type, a_system)
				end
			end
		end

feature -- Duplication

	cloned_attachment: like Current is
			-- Cloned version of current attachment
		do
			create Result.make (source_type, assignment_attempt, current_feature, current_type)
		end

invariant

	assignment_attempt_not_void: assignment_attempt /= Void
	type_count_non_negative: type_count >= 0

end

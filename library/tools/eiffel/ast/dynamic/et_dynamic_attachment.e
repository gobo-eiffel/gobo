indexing

	description:

		"Eiffel attachments at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_ATTACHMENT

feature -- Status report

	has_type (a_type: ET_DYNAMIC_TYPE): BOOLEAN is
			-- Does `source_type' contain `a_type'?
		require
			a_type_not_void: a_type /= Void
		do
			Result := source_type.has_type (a_type)
		end

	is_null_attachment: BOOLEAN is
			-- Should current attachment be ignored when reporting errors?
		do
			-- Result := False
		end

feature -- Access

	source_type: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of source of attachment

	current_feature: ET_FEATURE
			-- Feature where the attachment appears

	current_type: ET_BASE_TYPE
			-- Type to which `current_feature' belongs

	position: ET_POSITION is
			-- Position of attachment
		deferred
		ensure
			position_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in `source_type' when
			-- `propagate_types' was last called

feature -- Element change

	propagate_types (a_target: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Propagate types to `a_target'.
		require
			a_target_not_void: a_target /= Void
			a_system_not_void: a_system /= Void
		local
			l_count: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_other_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
			i, nb: INTEGER
		do
			l_count := source_type.count
			if l_count /= count then
				nb := l_count - count
				count := l_count
				from
					l_other_type := source_type.other_types
				until
					l_other_type = Void
				loop
					a_target.put_type (l_other_type.item, a_system)
					i := i + 1
					if i < nb then
						l_other_type := l_other_type.right
					else
							-- Jump out of the loop.
						l_other_type := Void
					end
				end
				if i < nb then
					l_type := source_type.first_type
					if l_type /= Void then
						a_target.put_type (l_type, a_system)
					end
				end
			end
		end

feature -- Duplication

	cloned_attachment: like Current is
			-- Cloned version of current attachment
		deferred
		ensure
			cloned_attachment_not_void: Result /= Void
		end

feature -- Link

	next_attachment: ET_DYNAMIC_ATTACHMENT
			-- Next linked attachment in list of attachments

	set_next_attachment (a_next: ET_DYNAMIC_ATTACHMENT) is
			-- Set `next_attachment' to `a_next'.
		do
			next_attachment := a_next
		ensure
			next_attachment_set: next_attachment = a_next
		end

invariant

	count_non_negative: count >= 0
	source_type_not_void: source_type /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void

end

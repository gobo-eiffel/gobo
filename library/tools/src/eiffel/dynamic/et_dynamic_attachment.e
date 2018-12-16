note

	description:

		"Eiffel attachments at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_ATTACHMENT

feature -- Status report

	has_type (a_type: ET_DYNAMIC_PRIMARY_TYPE): BOOLEAN
			-- Does `source_type' contain `a_type'?
		require
			a_type_not_void: a_type /= Void
		do
			Result := source_type_set.has_type (a_type)
		end

	is_null_attachment: BOOLEAN
			-- Should current attachment be ignored when reporting errors?
		do
			-- Result := False
		end

	visited: BOOLEAN
			-- Has current attachment already been visited
			-- when looking for the source of a type?

feature -- Status setting

	set_visited (b: BOOLEAN)
			-- Set `visited' to `b'.
		do
			visited := b
		ensure
			visited_set: visited = b
		end

feature -- Access

	source_type_set: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of source of attachment

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature where the attachment appears

	current_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type to which `current_feature' belongs

	attachment: ET_AST_NODE
			-- Attachment
		require
			not_null: not is_null_attachment
		deferred
		ensure
			attachment_not_void: Result /= Void
		end

	position: ET_POSITION
			-- Position of attachment
		deferred
		ensure
			position_not_void: Result /= Void
		end

	description: STRING
			-- Kind of attachment
		deferred
		ensure
			description_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in `source_type_set' when
			-- `propagate_types' was last called

feature -- Element change

	propagate_types (a_target: ET_DYNAMIC_TARGET; a_system: ET_DYNAMIC_SYSTEM)
			-- Propagate types to `a_target'.
		require
			a_target_not_void: a_target /= Void
			a_system_not_void: a_system /= Void
		local
			l_count: INTEGER
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			l_count := source_type_set.count
			if l_count /= count then
				nb := l_count - count
				count := l_count
				nb2 := source_type_set.count
				from j := nb2 until j < 1 loop
					a_target.put_type_from_attachment (source_type_set.dynamic_type (j), Current, a_system)
					i := i + 1
					if i < nb then
						j := j - 1
					else
							-- Jump out of the loop.
						j := 0
					end
				end
			end
		end

feature -- Link

	next_attachment: detachable ET_DYNAMIC_ATTACHMENT
			-- Next linked attachment in list of attachments

	set_next_attachment (a_next: like next_attachment)
			-- Set `next_attachment' to `a_next'.
		do
			next_attachment := a_next
		ensure
			next_attachment_set: next_attachment = a_next
		end

invariant

	count_non_negative: count >= 0
	source_type_set_not_void: source_type_set /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void

end

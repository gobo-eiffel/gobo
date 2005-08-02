indexing

	description:

		"Eiffel dynamic type sets of agent operands pulling types from subsets (type sets of argument of features 'call' and 'item')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_AGENT_OPERAND_PULL_TYPE_SET

inherit

	ET_DYNAMIC_PULL_TYPE_SET
		rename
			make as make_pull_type_set
		redefine
			put_type_from_attachment
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like static_type; an_agent_type: like agent_type) is
			-- Create a new empty dynamic type set.
			-- Set `first_type' to `a_type' if it is expanded.
		require
			a_type_not_void: a_type /= Void
			an_agent_type_not_void: an_agent_type /= Void
		do
			static_type := a_type
			if a_type.is_expanded then
				first_type := a_type
			end
			agent_type := an_agent_type
		ensure
			static_type_set: static_type = a_type
			first_expanded_type: a_type.is_expanded implies first_type = a_type
			agent_type_set: agent_type = a_type
		end

feature -- Access

	agent_type: ET_DYNAMIC_ROUTINE_TYPE
			-- Type of agent

feature -- Element change

	put_type_from_attachment (a_type: ET_DYNAMIC_TYPE; an_attachment: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_type' coming from `an_attachment' to current type set.
		local
			found: BOOLEAN
			i, nb: INTEGER
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_attachment: ET_DYNAMIC_AGENT_OPERAND_ATTACHMENT
		do
			if a_type.conforms_to_type (static_type, a_system) then
				if first_type = Void then
					first_type := a_type
				elseif a_type = first_type then
					found := True
				elseif other_types = Void then
					create other_types.make_with_capacity (15)
					other_types.put_last (a_type)
				elseif other_types.has (a_type) then
					found := True
				else
					other_types.force_last (a_type)
				end
				if not found then
					l_tuple_type ?= a_type
					if l_tuple_type /= Void then
						l_item_type_sets := l_tuple_type.item_type_sets
						l_open_operand_type_sets := agent_type.open_operand_type_sets
						nb := l_open_operand_type_sets.count
						if l_item_type_sets.count < nb then
								-- Internal error: missing open operands.
							l_builder := a_system.dynamic_type_set_builder
							l_builder.set_fatal_error
							l_builder.error_handler.report_gibgh_error
						else
							from i := 1 until i > nb loop
								create l_attachment.make (l_item_type_sets.item (i), agent_type, an_attachment.attachment, i, an_attachment.current_feature, an_attachment.current_type)
								l_open_operand_type_sets.item (i).put_source (l_attachment, a_system)
								i := i + 1
							end
						end
					end
				end
			end
		end

invariant

	agent_type_not_void: agent_type /= Void

end

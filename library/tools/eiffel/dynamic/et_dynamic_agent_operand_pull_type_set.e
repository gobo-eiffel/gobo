indexing

	description:

		"Eiffel dynamic type sets of agent operands pulling types from subsets (type sets of argument of features 'call' and 'item')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
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
				put_type (a_type)
			end
			agent_type := an_agent_type
		ensure
			static_type_set: static_type = a_type
			first_expanded_type: a_type.is_expanded implies (count = 1 and then dynamic_type (1) = a_type)
			agent_type_set: agent_type = an_agent_type
		end

feature -- Access

	agent_type: ET_DYNAMIC_ROUTINE_TYPE
			-- Type of agent

feature -- Element change

	put_type_from_attachment (a_type: ET_DYNAMIC_TYPE; an_attachment: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_type' coming from `an_attachment' to current type set.
		local
			old_count: INTEGER
			i, nb: INTEGER
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_attachment: ET_DYNAMIC_AGENT_OPERAND_ATTACHMENT
		do
			old_count := count
			put_type_from_type_set (a_type, an_attachment.source_type_set, a_system)
			if old_count < count then
				l_tuple_type ?= a_type
				if l_tuple_type /= Void then
					l_item_type_sets := l_tuple_type.item_type_sets
					l_open_operand_type_sets := agent_type.open_operand_type_sets
					nb := l_open_operand_type_sets.count
					if l_item_type_sets.count < nb then
							-- Internal error: missing open operands.
						l_builder := a_system.dynamic_type_set_builder
						l_builder.set_fatal_error
						l_builder.error_handler.report_giaaa_error
					else
						from i := 1 until i > nb loop
							create l_attachment.make (l_item_type_sets.item (i), agent_type, an_attachment.attachment, i, an_attachment.current_feature, an_attachment.current_type)
							l_open_operand_type_sets.item (i).put_source (l_attachment, a_system)
							i := i + 1
						end
					end
				end
			elseif a_system.universe.is_ise and then not has_type (a_type) then
					-- ISE Eiffel does not type-check the tuple operand of Agent calls even at
					-- execution time. It only checks whether the tuple has enough items and
					-- these items are of the expected types, regardless of the type of the tuple
					-- itself. For example it is OK to pass a "TUPLE [ANY]" to an Agent which expects
					-- a "TUPLE [STRING]" provided that the dynamic type of the item of this tuple
				 	-- conforms to type STRING.
				l_tuple_type ?= a_type
				if l_tuple_type /= Void then
					l_item_type_sets := l_tuple_type.item_type_sets
					l_open_operand_type_sets := agent_type.open_operand_type_sets
					nb := l_open_operand_type_sets.count
					if l_item_type_sets.count >= nb then
						from i := 1 until i > nb loop
							create l_attachment.make (l_item_type_sets.item (i), agent_type, an_attachment.attachment, i, an_attachment.current_feature, an_attachment.current_type)
							l_open_operand_type_sets.item (i).put_source (l_attachment, a_system)
							i := i + 1
						end
					end
				end
			end
		end

invariant

	agent_type_not_void: agent_type /= Void

end

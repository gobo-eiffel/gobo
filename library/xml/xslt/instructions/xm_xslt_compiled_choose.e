indexing

	description: "Objects that represent an xsl:choose or an xsl:if,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_CHOOSE

inherit
	
	XM_XSLT_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; some_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; some_actions: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]) is
			-- Establish invariant.
		require
			conditions: some_conditions /= Void and then some_conditions.count > 0
			actions: some_actions /= Void and then some_actions.count = some_conditions.count
		do
			executable := an_executable
			conditions := some_conditions
			actions := some_actions
			if some_conditions.count = 1 then

				-- We assume that if there was only one condition
				--  then it was an xsl:if;
				-- this is not necessarily so, but it's adequate for tracing purposes.

				instruction_name := "if"
			else				
				instruction_name := "choose"
			end
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			conditions_set: conditions = some_conditions
			actions_set: actions = some_actions
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			last_tail_call := Void
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			variant
				conditions.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if a_cursor.item.effective_boolean_value (a_context).value then
					actions.item (a_cursor.index).process_leaving_tail (a_context)
					last_tail_call := actions.item (a_cursor.index).last_tail_call
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

feature {NONE} -- Implementation
	
	conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Conditions

	actions: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]
			-- Actions

invariant

	conditions: conditions /= Void and then conditions.count > 0
	actions: actions /= Void and then actions.count = conditions.count
	
end
	

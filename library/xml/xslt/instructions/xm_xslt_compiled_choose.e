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

	make (some_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; some_actions: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]) is
			-- Establish invariant.
		require
			conditions: some_conditions /= Void and then some_conditions.count > 0
			actions: some_actions /= Void and then some_actions.count = some_conditions.count
		do
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
			conditions_set: conditions = some_conditions
			actions_set: actions = some_actions
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
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
	

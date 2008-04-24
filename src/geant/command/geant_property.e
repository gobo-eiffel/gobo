indexing

    description:

        "Properties for Geant tasks and commands"

    library: "Gobo Eiffel Ant"
    copyright: "Copyright (c) 2008, Sven Ehrke and others"
    license: "MIT License"
    date: "$Date$"
    revision: "$Revision$"

deferred class GEANT_PROPERTY [G]

inherit

	ANY

    GEANT_SHARED_PROPERTIES
        export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create new  GEANT_PROPERTY object.
		do
		end

feature -- Access

	string_value: STRING is
			-- String value of property or Void if not available
		do
			if not has_been_retrieved then
				retrieved_string_value := string_value_agent.item ([])
				has_been_retrieved := True
			end
			Result := retrieved_string_value
		end

	value: G is
			-- Value of property
		require
			string_value_defined: is_defined
		deferred
		end

feature -- Status report

	is_defined: BOOLEAN is
			-- Is a string value for this property available?
		do
			Result := string_value /= Void
		ensure
			string_value_valid: Result implies string_value /= Void
		end

feature -- Setting

	set_string_value_agent (a_agent: like string_value_agent) is
			-- Set `string_value_agent' to `a_string_value_agent'.
		do
			string_value_agent := a_agent
		ensure
			string_value_agent_set: string_value_agent = a_agent
		end

feature {NONE} -- Implementation

	has_been_retrieved: BOOLEAN
			-- Has `string_value' been called before?

	retrieved_string_value: STRING
			-- string value retrieved through `string_value_agent' if `string_value' has been called before

	string_value_agent: FUNCTION [ANY, TUPLE, STRING]
			-- String value agent

end

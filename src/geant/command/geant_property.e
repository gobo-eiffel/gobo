note

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

	make
			-- Create new GEANT_PROPERTY object.
		do
		end

feature -- Access

	string_value: STRING
			-- String value of property or Void if not available
		require
			is_defined: is_defined
		do
			if not has_been_retrieved then
				retrieved_string_value := string_value_agent.item ([])
				has_been_retrieved := True
			end
			Result := retrieved_string_value
		end

	value: G
			-- Value of property
		require
			is_defined: is_defined
		deferred
		end

	value_or_else (a_default: G): G
			-- `value' if `is_defined', `a_default' otherwise
		do
			if is_defined then
				Result := value
			else
				Result := a_default
			end
		ensure
			value_if_defined: is_defined implies Result = value
			default_if_not_defined: not is_defined implies Result = a_default
		end

	non_empty_value_or_else (a_default: G): G
			-- `value' if `is_defined' and then `not string_value.is_empty', `a_default' otherwise
		do
			if is_defined and then not string_value.is_empty then
				Result := value
			else
				Result := a_default
			end
		ensure
			value_if_defined_and_string_value_not_empty: is_defined and then not string_value.is_empty implies Result = value
			default_if_not_defined: not is_defined or else string_value.is_empty implies Result = a_default
		end

feature -- Status report

	is_defined: BOOLEAN
			-- Is a string value for this property available?
		do
			Result := string_value_agent /= Void and then string_value_agent.item ([]) /= Void
		end

feature -- Setting

	set_string_value_agent (a_agent: like string_value_agent)
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
			-- string value agent

end

note

	description:

		"Variable resolvers for variables"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2004, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_VARIABLES_VARIABLE_RESOLVER

inherit

	GEANT_VARIABLE_RESOLVER

create

	make

feature {NONE} -- Initialization

	make is
			-- Create new Variable resolver.
		do
		end

feature -- Access

	value (k: STRING): STRING is
			-- Item associated with `k';
			-- Void if no such item
		do
			if has (k) then
				Result := variables.item (k)
			end
		end

	variables: GEANT_VARIABLES
			-- Variables used for resolving

feature -- Status report

	has (k: STRING): BOOLEAN is
			-- Is there an item associated with `k'?
		do
			Result := variables.has (k)
		end

feature -- Setting

	set_variables (a_variables: like variables) is
			-- Set `variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

end

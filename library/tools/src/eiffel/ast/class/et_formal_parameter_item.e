﻿note

	description:

		"Eiffel formal generic parameters in comma-separated list of parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"

deferred class ET_FORMAL_PARAMETER_ITEM

inherit

	ET_ACTUAL_PARAMETER_ITEM

feature -- Access

	formal_parameter: ET_FORMAL_PARAMETER
			-- Formal generic parameter in comma-separated list
		deferred
		ensure
			formal_parameter_not_void: Result /= Void
		end

	actual_parameter: ET_ACTUAL_PARAMETER
			-- Actual parameter in comma-separated list
		do
			Result := type
		end

	type: ET_FORMAL_PARAMETER
			-- Type in comma-separated list
			-- (Note: SE 1.0 does not like to have `type'
			-- be renamed as `formal_parameter'. So we end
			-- up having two features here.)
		do
			Result := formal_parameter
		ensure then
			definition: Result = formal_parameter
		end

	label: detachable ET_IDENTIFIER
			-- Label of `actual_parameter';
			-- Useful when part of a labeled tuple, Void if no label
		do
			-- No label.
		end

end

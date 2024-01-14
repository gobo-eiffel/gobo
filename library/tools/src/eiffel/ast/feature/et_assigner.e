note

	description:

		"Eiffel assigners"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2006, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ASSIGNER

inherit

	ET_AST_NODE

feature -- Initialization

	reset
			-- Reset assigner as it was just after it was last parsed.
		deferred
		end

feature -- Access

	feature_name: ET_FEATURE_NAME
			-- Feature name
		deferred
		ensure
			feature_name_not_void: Result /= Void
		end

end

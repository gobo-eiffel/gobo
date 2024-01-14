note

	description:

		"Routines implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"

deferred class ET_DOTNET_ROUTINE

inherit

	ET_ROUTINE
		undefine
			is_frozen, is_dotnet,
			is_static,
			overloaded_extended_name
		redefine
			is_deferred
		end

	ET_DOTNET_FEATURE
		undefine
			is_routine,
			obsolete_message,
			arguments,
			preconditions,
			postconditions,
			reset_preconditions,
			reset_postconditions,
			is_deferred
		end

feature -- Status report

	is_deferred: BOOLEAN
			-- Has feature been declared as deferred?

feature -- Status setting

	set_deferred (b: BOOLEAN)
			-- Set `is_deferred' to `b'.
		do
			is_deferred := b
		ensure
			deferred_set: is_deferred = b
		end

end

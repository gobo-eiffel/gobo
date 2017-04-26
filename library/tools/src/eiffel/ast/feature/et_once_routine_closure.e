note

	description:

		"Eiffel closures with components common to once routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ONCE_ROUTINE_CLOSURE

inherit

	ET_INTERNAL_ROUTINE_CLOSURE

feature -- Status report

	is_once_per_process: BOOLEAN
			-- Is current once routine a once-per-process?
		do
			Result := True
		end

feature -- Access

	keys: detachable ET_MANIFEST_STRING_LIST
			-- Once keys

feature -- Setting

	set_keys (a_keys: like keys)
			-- Set `keys' to `a_keys'.
		do
			keys := a_keys
		ensure
			keys_set: keys = a_keys
		end

end

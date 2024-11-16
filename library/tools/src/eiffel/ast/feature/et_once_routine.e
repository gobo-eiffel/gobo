note

	description:

		"Eiffel once routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ONCE_ROUTINE

inherit

	ET_INTERNAL_ROUTINE
		undefine
			is_once,
			is_once_per_process,
			is_once_per_thread,
			is_once_per_object
		end

	ET_ONCE_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			first_note,
			is_static,
			implementation_feature
		end

end

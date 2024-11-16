note

	description:

		"Eiffel internal (do or once) routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_INTERNAL_ROUTINE

inherit

	ET_ROUTINE
		undefine
			locals,
			reset_after_interface_checked
		end

	ET_INTERNAL_FEATURE
		undefine
			arguments,
			is_routine,
			obsolete_message
		end

	ET_INTERNAL_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			first_note,
			is_static,
			implementation_feature
		end

end

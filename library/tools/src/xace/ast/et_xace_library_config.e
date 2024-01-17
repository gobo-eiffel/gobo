note

	description:

		"Xace libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"

class ET_XACE_LIBRARY_CONFIG

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_UNIVERSE_CONFIG
		redefine
			make,
			select_target
		end

create

	make

feature {NONE} -- Initialization

	make (a_target: ET_XACE_TARGET)
			-- Create a new Xace library.
		do
			library_prefix := empty_prefix
			precursor (a_target)
		end

feature -- Access

	library_prefix: STRING
			-- Prefix to be applied to the names of the
			-- clusters of the current library when mounted

feature -- Setting

	set_library_prefix (a_prefix: like library_prefix)
			-- Set `library_prefix' to `a_prefix'.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			library_prefix := a_prefix
		ensure
			library_prefix_set: library_prefix = a_prefix
		end

feature -- Basic operations

	select_target (a_target: ET_XACE_TARGET; a_error_handler: ET_XACE_ERROR_HANDLER)
			-- Select `a_target'.
			-- Set `options', `clusters' and `libraries' accordingly.
		do
			precursor (a_target, a_error_handler)
			clusters.set_library_prefix (library_prefix)
		end

feature {NONE} -- Constants

	empty_prefix: STRING = ""
			-- Empty prefix

invariant

	library_prefix_not_void: library_prefix /= Void

end

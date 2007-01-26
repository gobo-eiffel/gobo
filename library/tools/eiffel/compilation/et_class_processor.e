indexing

	description:

		"Eiffel class processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_PROCESSOR

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make
		end

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new processor for classes in `a_universe'.
		do
			universe := a_universe
			current_class := unknown_class
		end

feature -- Access

	current_class: ET_CLASS
			-- Class being processed

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

feature {NONE} -- Implementation

	none_class: ET_CLASS is
			-- Class NONE
		do
			Result := universe.none_class
		ensure
			definition: Result = universe.none_class
		end

	unknown_class: ET_CLASS is
			-- Class *UNKNOWN*
		do
			Result := universe.unknown_class
		ensure
			definition: Result = universe.unknown_class
		end

invariant

	current_class_not_void: current_class /= Void

end

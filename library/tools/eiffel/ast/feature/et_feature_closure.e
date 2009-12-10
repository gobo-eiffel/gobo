indexing

	description:

		"Eiffel closures with components common to routines and extended attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CLOSURE

inherit

	ET_CLOSURE

feature -- Access

	preconditions: ET_PRECONDITIONS
			-- Preconditions

	postconditions: ET_POSTCONDITIONS
			-- Postconditions

	end_keyword: ET_KEYWORD
			-- 'end' keyword

feature -- Setting

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

	set_preconditions (a_preconditions: like preconditions) is
			-- Set `preconditions' to `a_preconditions'.
		do
			preconditions := a_preconditions
		ensure
			preconditions_set: preconditions = a_preconditions
		end

	set_postconditions (a_postconditions: like postconditions) is
			-- Set `postconditions' to `a_postconditions'.
		do
			postconditions := a_postconditions
		ensure
			postconditions_set: postconditions = a_postconditions
		end

	reset_preconditions is
			-- Set `preconditions' to Void.
		do
			preconditions := Void
		end

	reset_postconditions is
			-- Set `postconditions' to Void.
		do
			postconditions := Void
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end

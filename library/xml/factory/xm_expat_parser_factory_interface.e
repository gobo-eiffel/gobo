
indexing

	description:

		"Factory interface for expat parser"

	library:    "Gobo Eiffel XML Library"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class XM_EXPAT_PARSER_FACTORY_INTERFACE
	
	-- Concrete factories allow client code to be compiled when expat 
	-- is not available.

feature -- Factory

	is_expat_available: BOOLEAN is
			-- Is expat parser available?
		deferred
		end
		
	new_expat_parser: XM_PARSER is
			-- Create expat parser.
		require
			available: is_expat_available
		deferred
		ensure
			not_void: Result /= Void
		end

end

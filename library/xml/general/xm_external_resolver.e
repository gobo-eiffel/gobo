indexing
	
	description:
	
		"Interface for external resolver of system entities"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_EXTERNAL_RESOLVER

feature -- Action(s)

	resolve (a_system: STRING) is
			-- Resolve a system identifier to an input stream.
		require
			not_void: a_system /= Void
		deferred
		ensure
			--has_error_set:
		end
		
feature -- Result

	last_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from external entity.
		require
			not_error: not has_error
		deferred
		ensure
			not_void: Result /= Void
		end
	
	has_error: BOOLEAN is
			-- Did the last resolution attempt?
		deferred
		end
		
	last_error: STRING is
		require
			has_error: has_error
		deferred
		ensure
			not_void: Result /= Void
		end

end

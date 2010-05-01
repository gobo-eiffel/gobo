note
	
	description:
	
		"Resolvers that may report a media type"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_RESOLVER_MEDIA_TYPE

feature -- Result
	
	has_media_type: BOOLEAN is
			-- Is the media type available.
		deferred
		end
	
	last_media_type: UT_MEDIA_TYPE is
			-- Media type, if available.
		require
			has_media_type: has_media_type
		deferred
		ensure
			result_not_void: Result /= Void
		end

end
	

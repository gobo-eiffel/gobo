indexing

	description:

		"Objects that provide shared access to a singleton emitter factory."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SHARED_EMITTER_FACTORY

feature -- Access

	emitter_factory: XM_XSLT_EMITTER_FACTORY is
			-- Singletom emitter factory
		once
			create Result.make
		ensure
			emitter_factory_not_void: Result /= Void
		end

end
	

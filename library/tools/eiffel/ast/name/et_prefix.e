indexing

	description:

		"Eiffel prefix feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_PREFIX

inherit

	ET_FEATURE_NAME
		redefine
			is_prefix
		end

feature -- Status report

	is_prefix: BOOLEAN is
			-- Is current feature name of the form 'prefix ...'?
		once
			Result := True
		end

end -- class ET_PREFIX

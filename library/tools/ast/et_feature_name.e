indexing

	description:

		"Eiffel feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_FEATURE_NAME

inherit

	HASHABLE
		redefine
			is_equal
		end

feature -- Access

	position: ET_POSITION
			-- Position in source code

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			else
				Result := same_type (other)
			end
		end

	is_equal (other: like Current): BOOLEAN is
			-- Are current feature name and `other' considered equal?
		do
			Result := same_feature_name (other)
		end

invariant

	position_not_void: position /= Void

end -- class ET_FEATURE_NAME

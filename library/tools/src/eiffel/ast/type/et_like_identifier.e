note

	description:

		"Eiffel 'like identifier' or 'like *.identifier' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"

deferred class ET_LIKE_IDENTIFIER

inherit

	ET_LIKE_TYPE
		redefine
			has_identifier_anchored_type
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Name of the feature associated with current type
		deferred
		ensure
			name_not_void: Result /= Void
		end

	seed: INTEGER
			-- Feature ID of one of the seeds of the
			-- feature associated with current type;
			-- 0 if not resolved yet
		deferred
		ensure
			seed_not_negative: Result >= 0
		end

feature -- Status report

	has_identifier_anchored_type: BOOLEAN
			-- Does current type contain an identifier anchored type
			-- (i.e. an anchored type other than 'like Current')?
		do
			Result := True
		end

end

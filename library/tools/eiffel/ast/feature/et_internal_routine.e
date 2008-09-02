indexing

	description:

		"Eiffel internal (do or once) routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_ROUTINE

inherit

	ET_ROUTINE
		undefine
			locals
		redefine
			reset_after_features_flattened
		end

	ET_INTERNAL_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			implementation_feature
		end

feature -- Initialization

	reset_after_features_flattened is
			-- Reset current feature as it was just after it was last flattened.
		do
			if implementation_checked then
				if locals /= Void then
					locals.reset
				end
				if compound /= Void then
					compound.reset
				end
				if rescue_clause /= Void then
					rescue_clause.reset
				end
			end
			precursor
		end

end

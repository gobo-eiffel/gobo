note

	description:

		"Eiffel rename paris in comma-separated list of rename pairs"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_RENAME_ITEM

inherit

	ET_AST_NODE

feature -- Access

	rename_pair: ET_RENAME
			-- Rename pair in comma-separated list
		deferred
		ensure
			rename_pair_not_void: Result /= Void
		end

end

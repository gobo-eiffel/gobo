note

	description:

		"Eiffel type marks (e.g. 'attached', 'detachable', 'expanded', 'reference', 'separate', 'deferred', '!' or '?')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_MARK

inherit

	ET_TYPE_MARK
		undefine
			first_position,
			last_position
		end

	ET_AST_LEAF

feature -- Status report

	is_deferred: BOOLEAN
			-- Is current type mark 'deferred'?
		do
			-- Result := False
		end

end

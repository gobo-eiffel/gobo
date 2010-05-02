note

	description:

		"Eiffel type marks (e.g. 'attached', 'detachable', 'expanded', 'reference', 'separate', 'deferred', '!' or '?')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_MARK

inherit

	ET_TYPE_MARK

feature -- Status report

	is_deferred: BOOLEAN
			-- Is current type mark 'deferred'?
		do
			-- Result := False
		end

end

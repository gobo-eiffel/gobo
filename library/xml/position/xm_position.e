indexing

	description:

		"Abstract definition of positions in XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_POSITION

inherit

	ANY
		redefine
			out
		end

feature -- Access

	source: XM_SOURCE is
			-- Source from where position is taken
		deferred
		end

feature -- Output

	out: STRING is
			-- Textual representation
		do
			Result := source.out
		end

invariant

	source_not_void: source /= Void

end

indexing

	description:

		"Abstract definition of a position in an XML document"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XM_POSITION

inherit

	ANY
		redefine
			out
		end

feature {ANY}

	source: XM_SOURCE is
		deferred
		end

	out: STRING is
		do
			Result := clone (source.out)
		end

invariant

	source_not_void: source /= Void

end

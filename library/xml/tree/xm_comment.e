indexing

	description:

		"Objects that represent XML comment nodes"

	library:	"Gobo Eiffel Kernel Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_COMMENT

inherit

	XM_NODE
		redefine
			implementation
		end

creation

	make_from_implementation

feature {ANY} -- Access

	data: UC_STRING is
			-- the actual character data of this comment.
		do
			Result := implementation.data
		end

feature {ANY} -- Basic routines

	process (x: XM_NODE_PROCESSOR) is
		do
			x.process_comment (Current)
		end

feature {ANY} -- Element change

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_COMMENT

invariant

	data_not_void: data /= Void

end -- class XM_COMMENT

--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999	Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------

indexing

	description:

		"Implementation of XML parser using Expat"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_EXPAT_PARSER

inherit
	
	XM_PARSER
	
	XM_FORWARD_CALLBACKS
	
	XM_FORWARD_DTD_CALLBACKS
	
	XP_PARSER
		export
			{NONE} all
		end	

creation

	make

end

indexing

	description:

		"class representing a xml processing instruction."

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

class XT_PROCESSING_INSTRUCTION

inherit

	XT_NODE

	XI_PROCESSING_INSTRUCTION

creation

	make

feature {NONE} -- Initialisation

	make (a_target, a_data: UC_STRING) is
		require
			a_target_not_void: a_target /= Void
			a_data_not_void: a_data /= Void
		do
			target := a_target
			data := a_data
		end

feature {ANY} -- Access

	target: UC_STRING

	data: UC_STRING

end -- class XT_PROCESSING_INSTRUCTION

--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
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

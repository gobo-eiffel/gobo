indexing

	description:

		"class representing a xml processing instruction."

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

deferred class XI_PROCESSING_INSTRUCTION

inherit

	XI_NODE

feature {ANY} -- Access

	target: UC_STRING is
			-- target of this processing instruction. XML defines this as being the
			-- first token following the markup that begins the processing instruction.
		deferred
		end

	data: UC_STRING is
			-- content of this processing instruction. This is from the first non
			-- white space character after the target to the character immediately
			-- preceding the ?>.
		deferred
		end

invariant

	target_not_void: target /= Void
	data_not_void: data /= Void

end -- XI_PROCESSING_INSTRUCTION

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

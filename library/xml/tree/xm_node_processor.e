indexing

	description:

		"common anchestor for xml-nodes"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

class XM_NODE_PROCESSOR

feature {ANY} -- Access

	process_element (e: XM_ELEMENT) is
		do
		end

	process_character_data (c: XM_CHARACTER_DATA) is
		require
			c_not_void: c /= Void
		do
		end

	process_processing_instruction (pi: XM_PROCESSING_INSTRUCTION) is
		require
			pi_not_void: pi /= Void
		do
		end

	process_document (doc: XM_DOCUMENT) is
		do
		end

	process_comment (com: XM_COMMENT) is
		require
			com_not_void: com /= Void
		do
		end

	process_attributes (e: XM_ELEMENT) is
		require
			e_not_void: e /= Void
		do
		end

	process_attribute (att: XM_ATTRIBUTE) is
		require
			att_not_void: att /= Void
		do
		end

end -- class XM_NODE_PROCESSOR

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


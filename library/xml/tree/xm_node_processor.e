note

	description:

		"Visitor pattern for XML node objects. Inherit and %
		%redefine to make use of this pattern"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_NODE_PROCESSOR

feature -- Processing

	process_element (e: XM_ELEMENT)
			-- Process element `e'.
		require
			e_not_void: e /= Void
		do
		end

	process_character_data (c: XM_CHARACTER_DATA)
			-- Process character data `c'.
		require
			c_not_void: c /= Void
		do
		end

	process_processing_instruction (a_pi: XM_PROCESSING_INSTRUCTION)
			-- Process processing instruction `a_pi'.
		require
			a_pi_not_void: a_pi /= Void
		do
		end

	process_document (doc: XM_DOCUMENT)
			-- Process document `doc'.
		require
			doc_not_void: doc /= Void
		do
		end

	process_comment (com: XM_COMMENT)
			-- Process comment `com'.
		require
			com_not_void: com /= Void
		do
		end

	process_attributes (e: XM_ELEMENT)
			-- Process attributes of element `e'.
		require
			e_not_void: e /= Void
		do
		end

	process_attribute (att: XM_ATTRIBUTE)
			-- Process attribute `att'.
		require
			att_not_void: att /= Void
		do
		end

end

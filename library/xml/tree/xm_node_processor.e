indexing

	description:

		"Implements visitor pattern for XML node objects. Inherit and %
		%redefine to make use of this pattern"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

end

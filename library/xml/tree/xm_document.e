indexing

	description:

		"XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DOCUMENT

inherit

	XM_COMPOSITE
		redefine
			make_default
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create root node.
		do
			make_composite
		end

	make_default is
			-- Create root node.
		do
			make
		end

feature -- Access

	root_element: XM_ELEMENT
			-- Root element of current document

feature {XM_PARSER, XM_CALLBACKS} -- Setting

	set_root_element (an_element: like root_element) is
			-- Set root element.
		do
			root_element := an_element
				-- Composite operations:
			wipe_out
			force_last (an_element)
		ensure
			root_element_set: root_element = an_element
			last_set: last = root_element
			count_set: count = 1
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_document (Current)
		end

end

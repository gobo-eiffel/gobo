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
			force_last (an_element)
		ensure
			root_element_set: root_element = an_element
			last_set: last = root_element
		end

feature {NONE} -- Name comparison with namespace.

	named_same_name (a_named: XM_NAMED_NODE; a_name: STRING): BOOLEAN is
			-- Has 'a_named' same name as 'a_name'?
			-- (Namespace is ignored on the root node because the 
			-- root element defines the current namespace.)
		do
			Result := same_string (a_named.name, a_name)
		end
		
feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_document (Current)
		end

invariant
	
	--single_element: this composite has a single XM_ELEMENT child
	
end

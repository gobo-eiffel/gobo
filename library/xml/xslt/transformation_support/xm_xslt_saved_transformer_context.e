indexing

	description:

		"Objects that encapsulate a transformer execution context"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_SAVED_TRANSFORMER_CONTEXT

creation

	make

feature {NONE} -- Initialization

	make (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
			a_mode: XM_XSLT_MODE; a_template: XM_XSLT_COMPILED_TEMPLATE;
			a_group_iterator: XM_XSLT_GROUP_ITERATOR;
			a_regexp_iterator: XM_XSLT_REGEXP_ITERATOR) is
			-- Save context.
		do
			iterator := an_iterator
			mode := a_mode
			template := a_template
			group_iterator := a_group_iterator
			regexp_iterator := a_regexp_iterator
		ensure
			iterator_saved: iterator = an_iterator
			mode_saved: mode = a_mode
			template_saved: template = a_template
			group_iterator_saved: group_iterator = a_group_iterator
			regexp_iterator_saved: regexp_iterator = a_regexp_iterator
		end

feature -- Access

	iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Saved current iterator

	mode: XM_XSLT_MODE
			-- Saved current mode

	template: XM_XSLT_COMPILED_TEMPLATE
			-- Saved current template

	group_iterator: XM_XSLT_GROUP_ITERATOR
			-- Saved current group iterator

	regexp_iterator: XM_XSLT_REGEXP_ITERATOR
			-- Saved current regexp iterator

end
	

note

	description:

		"Formatter that displays resolved namespaces for debugging (not valid XML)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_RESOLVED_FORMATTER

obsolete

	"Use XM_XMLNS_GENERATOR and XM_NAMESPACE_PRETTY_PRINT_FILTER directly. [2017-04-09]"

inherit

	XM_FORMATTER
		redefine
			process_document
		end

create

	make

feature -- Tree processor routines

	process_document (a_document: XM_DOCUMENT)
			-- Process document using xmlns generator and
			-- pretty print with namespaces filters.
		local
			pretty_print: XM_NAMESPACE_PRETTY_PRINT_FILTER
			xmlns_generator: XM_XMLNS_GENERATOR
		do
			create pretty_print.make_null
			pretty_print.set_output_stream (last_output)
			create xmlns_generator.make_next (pretty_print)
			a_document.process_to_events (xmlns_generator)
		end

end

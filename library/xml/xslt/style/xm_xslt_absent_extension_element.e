indexing

	description:

	"Surrogate objects for extension elements (or indeed xsl elements)%
% for which no implementation is available."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ABSENT_EXTENSION_ELEMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			may_contain_template_body, validate, compile
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status report

	may_contain_template_body: BOOLEAN is
			-- Is `Current' allowed to contain a template-body?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			do_nothing
		end

	validate is
		local
			a_message: STRING
		do
			a_message := STRING_.appended_string ("Absent extension element: ", node_name)
			report_compile_error (a_message)
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end

end

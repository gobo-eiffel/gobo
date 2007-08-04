indexing

	description:

		"xsl:apply-imports element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_APPLY_IMPORTS

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after or any_compile_errors
			loop
				a_name_code := a_cursor.item
				check_unknown_attribute (a_name_code)
				a_cursor.forth
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_within_template
			check_only_with_parameter_content
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			create {XM_XSLT_COMPILED_APPLY_IMPORTS} last_generated_expression.make (an_executable,
																											 with_param_instructions (an_executable, False),
																											 with_param_instructions (an_executable, True))
		end

end

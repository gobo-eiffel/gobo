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
			may_contain_sequence_constructor, validate, compile
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			attributes_prepared := True
		end

	validate is
		local
			a_message: STRING
		do
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			an_instruction_list: DS_LINKED_LIST [XM_XSLT_INSTRUCTION]
			a_block: XM_XSLT_BLOCK
			a_child_list: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]
		do
			if not is_top_level then

				-- if there are fallback children, compile the code for the fallback elements

				if validation_error_message = Void then
					validation_error_message := "Unknown extension instruction"
				end
				create an_instruction_list.make
				fallback_processing (an_executable, Current, an_instruction_list)
				if an_instruction_list.count > 0 then
					if an_instruction_list.count = 1 then
						last_generated_instruction := an_instruction_list.item (1)
					else

						-- We are getting back one block for each xsl:fallback element,
						--  then we are wrapping these blocks in another block. This
						--  is clumsy, but it's not a commonly-used operation...

						create a_block.make (an_executable)
						create a_child_list.make_from_linear (an_instruction_list)
						a_block.set_children (a_child_list)
						last_generated_instruction := a_block
					end
				end
			end
		end

end

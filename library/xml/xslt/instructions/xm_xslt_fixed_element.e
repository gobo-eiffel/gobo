indexing
	description:

		"Attributes whose name is known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FIXED_ELEMENT

inherit

	XM_XSLT_ELEMENT_CONSTRUCTOR

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name_code: INTEGER; a_namespace_code_list: DS_ARRAYED_LIST [INTEGER]; todo_list: ANY; a_simple_type: XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			namespace_codes_not_void: a_namespace_code_list /= Void
		do
			executable := an_executable
			create children.make (0)
			make_expression_instruction
			fixed_name_code := a_name_code
			validation_action := a_validation_action
			type := a_simple_type
			namespace_code_list := a_namespace_code_list
		ensure
			executable_set: executable = an_executable
			name_code_set: fixed_name_code = a_name_code
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
			namespace_codes_set: namespace_code_list = a_namespace_code_list
		end

feature -- Access
	
	instruction_name: STRING is
			-- Name of instruction, for diagnostics
		do
			Result := shared_name_pool.display_name_from_name_code (fixed_name_code)
		end

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER is
			-- Name code
		do
			Result := fixed_name_code
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string, another_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "element ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "name ")
			a_string := STRING_.appended_string (a_string, shared_name_pool.display_name_from_name_code (fixed_name_code))
			std.error.put_string (a_string)
			std.error.put_new_line			
			if children.count = 0 then
				a_string := STRING_.appended_string (indentation (a_level + 1), "empty content")
				std.error.put_string (a_string)
				std.error.put_new_line
			else
				display_children (a_level + 1)
			end
		end

feature {XM_XSLT_ELEMENT_CREATOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER) is
			-- Output namespace nodes for the new element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			from
				a_cursor := namespace_code_list.new_cursor; a_cursor.start
			variant
				namespace_code_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if a_cursor.item >= 0 then -- drop excluded namespaces
					a_receiver.notify_namespace (a_cursor.item, 0)
				end
				a_cursor.forth
			end
		end
	
feature {NONE} -- Implementation
	
	fixed_name_code: INTEGER
			-- Name code

	namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes

invariant

	namespace_codes_not_void: namespace_code_list /= Void

end
	

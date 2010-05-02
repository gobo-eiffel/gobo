note

	description:

		"compiled xsl:attribute-sets"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ATTRIBUTE_SET

inherit

	XM_XSLT_COMPILED_PROCEDURE

	XM_XSLT_ATTRIBUTE_SET_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name_code: like name_code; some_used_attribute_sets: like used_attribute_sets; an_executable: XM_XSLT_EXECUTABLE; a_body: XM_XPATH_EXPRESSION;
			a_line_number: INTEGER; a_system_id: STRING; a_slot_manager: like slot_manager)
			-- Establish invariant.
		require
			used_attribute_sets_not_void: some_used_attribute_sets /= Void
			executable_not_void: an_executable /= Void
			body_not_void: a_body /= Void
			system_id_not_void: a_system_id /= Void
			slot_manager_not_void: a_slot_manager /= Void
		do
			make_procedure (an_executable, a_body, a_line_number, a_system_id, a_slot_manager)
			used_attribute_sets := some_used_attribute_sets
			name_code := a_name_code
		ensure
			name_code_set: name_code = a_name_code
			used_attribute_sets_set: used_attribute_sets = some_used_attribute_sets
			executable_set: executable = an_executable
			body_set: body = a_body
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
			slot_manager_set: slot_manager = a_slot_manager
		end

feature -- Access

	name_code: INTEGER
			-- Name code

feature -- Evaluation


	expand (a_executable: XM_XSLT_EXECUTABLE; a_context: XM_XPATH_CONTEXT)
			-- Expand `Current' to it's constituents.
		require
			a_executable_not_void: a_executable /= Void
			context_not_void: a_context /= Void
		local
			l_new_context: XM_XPATH_CONTEXT
		do
			expand_attribute_sets (a_executable, used_attribute_sets, a_context)

			-- Note, we can ignore the result of process_leaving_tail since an attribute set can't contain a tail call

			if is_stack_frame_needed then
				l_new_context := a_context.new_context
				l_new_context.open_stack_frame (slot_manager)
				body.generate_events (l_new_context)
			else
				body.generate_events (a_context)
			end
		end

feature {NONE} -- Initialization

	used_attribute_sets: DS_ARRAYED_LIST [INTEGER]
			-- Attribute sets used by `Current'

	is_stack_frame_needed: BOOLEAN
			-- Is a stack frame needed?
		do
			Result := slot_manager.number_of_variables > 0
		end

invariant

	used_attribute_sets_not_void: used_attribute_sets /= Void

end


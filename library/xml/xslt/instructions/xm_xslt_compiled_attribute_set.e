indexing

	description:

		"compiled xsl:attribute-sets"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ATTRIBUTE_SET

inherit

	XM_XSLT_ATTRIBUTE_SET_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (some_used_attribute_sets: like used_attribute_sets; a_body: like body; needs_stack_frame: BOOLEAN) is
			-- Establish invariant.
		require
			used_attribute_sets_not_void: some_used_attribute_sets /= Void
			body_not_void: a_body /= Void
		do
			is_stack_frame_needed := needs_stack_frame
			used_attribute_sets := some_used_attribute_sets
			body := a_body
		ensure
			is_stack_frame_needed_set: is_stack_frame_needed = needs_stack_frame
			used_attribute_sets_set: used_attribute_sets = some_used_attribute_sets
			body_set: body = a_body
		end

feature -- Evaluation

	
	expand (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Expand `Current' to it's constituents.
		require
			transformer_not_void: a_transformer /= Void
		local
			a_bindery: XM_XSLT_BINDERY
			a_parameter_set, another_parameter_set: XM_XSLT_PARAMETER_SET
		do
			if used_attribute_sets /= Void then expand_attribute_sets (used_attribute_sets, a_transformer) end

			-- Note, we can ignore the result of process_leaving_tail since an attribute set can't contain a tail call

			if is_stack_frame_needed then
				a_bindery := a_transformer.bindery
				create a_parameter_set.make_empty
				create another_parameter_set.make_empty
				a_bindery.open_stack_frame (a_parameter_set, another_parameter_set)
				body.process_leaving_tail (a_transformer.new_xpath_context)
				a_bindery.close_stack_frame
			else
				body.process_leaving_tail (a_transformer.new_xpath_context)
			end
		end

feature {NONE} -- Initialization

	is_stack_frame_needed: BOOLEAN
			-- Is a stack frame needed?

	used_attribute_sets: DS_ARRAYED_LIST [XM_XSLT_COMPILED_ATTRIBUTE_SET]
			-- Attribute sets used by `Current'

	body: XM_XSLT_BLOCK
			-- Body (xsl:atrtributes)

invariant
	
	used_attribute_sets_not_void: used_attribute_sets /= Void
	body_not_void: body /= Void

end


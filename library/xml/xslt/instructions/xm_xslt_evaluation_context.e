indexing

	description:

		"Objects that represent an XSLT evaluation context"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EVALUATION_CONTEXT

inherit

		XM_XPATH_CONTEXT
		rename
			make as xpath_make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Establish invariant
		require
			transformer_not_void: a_transformer /= Void
		do
			transformer := a_transformer
			current_iterator := transformer.current_iterator
			local_variable_frame := transformer.bindery.current_stack_frame
			reserved_slot_count := 2
			cached_last := -1
		ensure
			transformer_set: transformer = a_transformer
		end

feature -- Access

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

invariant

	transformer_not_void: transformer /= Void

end
	

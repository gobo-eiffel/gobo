indexing

	description:

		"Objects that define one component of a sort key, where all aspects are known"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FIXED_SORT_KEY_DEFINITION
	
inherit
	
	XM_XSLT_SORT_KEY_DEFINITION
		rename
			make as old_make
		redefine
			reduced_definition
		end
creation

	make

feature {NONE} -- Initialization

	make (a_sort_key: XM_XPATH_EXPRESSION;
			an_order, a_data_type, a_case_order, a_language: STRING;
			a_collator: ST_COLLATOR) is
			-- Establish invariant.
		require
			sort_key_not_void: a_sort_key /= Void
			order_not_void: an_order /= Void
			data_type_not_void: a_data_type /= Void
			case_order_not_void: a_case_order /= Void
			language_not_void: a_language /= Void
			collator_not_void: a_collator /= Void -- TODO - remove this when language+case-roder is supported
		do
			sort_key := a_sort_key
			order := an_order
			data_type := a_data_type
			case_order := a_case_order
			language := a_language
			collator := a_collator
			bind_comparer
		ensure
			sort_key_set: sort_key = a_sort_key
			order_set: order = an_order
			data_type_set: data_type = a_data_type
			case_order_set: case_order = a_case_order
			language_set: language = a_language
			collator_set: collator = a_collator
		end
		
feature -- Access

	collator: ST_COLLATOR
			-- Collator

	comparer: KL_COMPARATOR [STRING]
			-- Object that performs comparisons

	reduced_definition (a_context: XM_XSLT_EVALUATION_CONTEXT):  XM_XSLT_FIXED_SORT_KEY_DEFINITION is
			-- Sort key definition without any dependencies on the context
		do
			Result := Current
		ensure then
			no_change: Result = Current
		end

feature {NONE} -- Implementation

	bind_comparer is
			-- Determine which comparer should be use.
		do
			if collator /= Void then
				comparer := collator
			else
				todo ("bind_comparer", True)
			end
		end

invariant

	order_not_void: order /= Void
	case_order_not_void: case_order /= Void
	language_not_void: language /= Void
	data_type_not_void: data_type /= Void
	collator_not_void: collator /= Void
	comparer_not_void: comparer /= Void

end
	

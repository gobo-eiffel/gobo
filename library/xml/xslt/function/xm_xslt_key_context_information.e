indexing

	description:

		"Objects that supply context information for an XSLT key"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_CONTEXT_INFORMATION

inherit

	ANY -- SE 2.1

	XM_XPATH_NODE_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization is

		make (a_document: XM_XPATH_DOCUMENT; a_context: XM_XSLT_EVALUATION_CONTEXT; a_fingerprint: INTEGER) is
			-- Establish invariant.
		require
			document_not_void: a_document /= Void
			context_not_void: a_context /= Void
			strictly_positive_fingerprint: a_fingerprint > 0
		do
			document := a_document
			context := a_context
			key_fingerprint := a_fingerprint
		ensure
			document_set: document = a_document
			context_set: context = a_context
			fingerprint_set: key_fingerprint = a_fingerprint
		end

feature -- Access

	document: XM_XPATH_DOCUMENT
			-- Context document

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Dynamic context

	key_fingerprint: INTEGER
			-- Fingerprint of key's name

	last_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'
	
feature -- Evaluation

	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			a_key_manager: XM_XSLT_KEY_MANAGER
			a_key_value: XM_XPATH_ATOMIC_VALUE
		do
			a_key_manager := context.transformer.key_manager
			if not an_item.is_atomic_value then
				check
					item_is_node: an_item.is_node
					-- as it is not atomic
				end
				create {XM_XPATH_STRING_VALUE} a_key_value.make (an_item.as_node.string_value)
			else
				a_key_value := an_item.as_atomic_value
			end
			a_key_manager.generate_keyed_sequence  (key_fingerprint, document, a_key_value, context)
			if context.transformer.is_error then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make -- error has already been reported 
			else
				last_node_iterator := a_key_manager.last_key_sequence
			end
		end

	
invariant

	document_not_void: document /= Void
	context_not_void: context /= Void
	strictly_positive_fingerprint: key_fingerprint > 0

end
	

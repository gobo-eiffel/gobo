indexing

	description:

		"XPath Document node"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_DOCUMENT

inherit

	XM_XPATH_CHILD_BEARING_NODE

	XM_XPATH_BASE_URI

	XM_XPATH_NAMELESS_NODE

	XM_XPATH_UNTYPED_ATOMIC_STRING_VALUE -- for typed value - add this class

	XM_XPATH_NO_TYPE

	XM_XPATH_NO_ATTRIBUTES
	
feature -- Access

	base_uri: DS_ARRAYED_LIST [ANY_URI] is
			-- Base URI.
		do
create Result.make (1)
			if base_uri_property /= Void and then base_uri_property.count > 0 then
				Result.put_first (base_uri_property)
			end
		ensure then
			base_uri_property: not Result.is_empty implies Result.item (1) = base_uri_property
		end

	node_kind: STRING is
			-- Identifies the kind of node.
		do
			create Result.make_from_string ("document")
		ensure
			node_kind_is_document: Result.is_equal ("document")
		end

	parent: DS_ARRAYED_LIST [XM_XPATH_NODE] is
			-- Parent of current node
		do
			create Result.make (0)
		ensure then
			empty_parent: Result.is_empty
		end

	string_value: UC_STRING is
			-- String-value.
		do
			-- Return the concatentation of the string value of all it's 
			-- text-node descendants.
			-- TODO
		end

	unparsed_entity_system_id (entity_name: UC_STRING): DS_ARRAYED_LIST [UC_STRING] is
			-- System identifier of an unparsed external entity.
		deferred
		ensure
			unparsed_entity_system_id_not_void: Result /= Void
		end

	unparsed_entity_public_id (entity_name: UC_STRING): DS_ARRAYED_LIST [UC_STRING] is
			-- Public identifier of an unparsed external entity.
		deferred
		ensure
			unparsed_entity_public_id_not_void: Result /= Void
		end

	document_uri: DS_ARRAYED_LIST [UC_STRING] is
			-- Absoulte URI of the source from which the document was constructed..
		deferred
		ensure
			document_uri_not_void: Result /= Void
		end
	
end

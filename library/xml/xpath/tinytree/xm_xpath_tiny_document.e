indexing

	description:

		"Tiny tree Document nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_DOCUMENT
	-- A node in the XML parse tree representing the Document itself
	-- (or equivalently, the root node of the Document).

	-- This structure supports trees whose root is an element node rather than a document node.
	-- The document node still exists, for implementation reasons, but it is not regarded as
	-- part of the tree. The variable root_node identifies the actual root of the tree, which
	-- is the document node by default.
	
inherit

	XM_XPATH_DOCUMENT

	XM_XPATH_TINY_NODE

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_TYPE
	
	HASHABLE
	
creation

	make, make_with_defaults

feature -- Initialization

	make (estimated_node_count: INTEGER; estimated_attribute_count: INTEGER; estimated_namespace_count: INTEGER; estimated_character_count: INTEGER) is
			-- Establish invariant
		require
			positive_node_count: estimated_node_count > 0
			attribute_count: estimated_attribute_count >= 0
			namespace_count: estimated_namespace_count >= 0
			character_count: estimated_character_count >= 0
		do
			node_number := 1
			document := Current

			make_node
			
			create node_kinds.make (estimated_node_count)
			create depth.make (estimated_node_count)
			create next_sibling.make (estimated_node_count)
			create alpha.make (estimated_node_count)
			create beta.make (estimated_node_count)
			create name_code.make (estimated_node_count)

			create attribute_parent.make (estimated_attribute_count)
			create attribute_code.make (estimated_attribute_count)
			create attribute_value.make (estimated_attribute_count)

			create namespace_parent.make (estimated_namespace_count)
			create namespace_code.make (estimated_namespace_count)

			create character_buffer.make (estimated_character_count)
		end

	make_with_defaults is
			-- Create with default parameter settings
		do
			make (4000, 100, 20, 4000)
		end

feature -- Access

	hash_code: INTEGER is
		do
			Result := document_number \\ 7
		end

	character_buffer_length: INTEGER is
			-- Length of `character_buffer'
		do
			Result := character_buffer.count
		ensure
			positive_result: Result >= 0
		end
			

	comment_buffer_length: INTEGER is
			-- Length of `comment_buffer'
		do
			if comment_buffer /= Void then
				Result := comment_buffer.count
			else
				Result := 0
			end
		ensure
			positive_result: Result >= 0
		end
			
	unparsed_entity_system_id (entity_name: STRING): STRING is
			-- System identifier of an unparsed external entity
		local
			entity_table_entry: DS_ARRAYED_LIST [STRING]
		do
			if entity_table = Void then
				Result := Void
			elseif not entity_table.has (entity_name) then
				Result := Void
			else
				entity_table_entry := entity_table.item (entity_name)
					check
						entity_present: entity_table_entry /= Void
						-- Because `has' returned `True'.
					end
				Result := entity_table_entry.item (1)
			end
		end

	unparsed_entity_public_id (entity_name: STRING): STRING is
			-- Public identifier of an unparsed external entity
		local
			entity_table_entry: DS_ARRAYED_LIST [STRING]
		do
			if entity_table = Void then
				Result := Void
			elseif not entity_table.has (entity_name) then
				Result := Void
			else
				entity_table_entry := entity_table.item (entity_name)
					check
						entity_present: entity_table_entry /= Void
						-- Because `has' returned `True'.
					end
				Result := entity_table_entry.item (2)
			end
		end

	document_uri: STRING is
			-- Absoulte URI of the source from which the document was constructed
		do
			if system_id_map = Void then
				Result := Void
			else
				Result := system_id_map.system_id (node_number)
			end
		end

	typed_value: DS_ARRAYED_LIST [XM_XPATH_ANY_ATOMIC_VALUE] is
			-- Typed value
		local
			untyped_value: XM_XPATH_XDT_UNTYPED_ATOMIC
		do
			create untyped_value.make (string_value)
			create Result.make (1)
			Result.put_first (untyped_value)
		end

	last_node_added: INTEGER
			-- Last node created with `add_node'
	
feature {XM_XPATH_NODE} -- Access

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

feature -- Element change

	add_node (new_node_type: INTEGER; depth_value: INTEGER; alpha_value: INTEGER;  beta_value: INTEGER; new_name_code: INTEGER) is
			-- Add a node to the document
		require
			valid_node_type: new_node_type = Document_node or new_node_type = Element_node or
				new_node_type = Text_node or new_node_type = Comment_node or new_node_type = Processing_instruction_node
			positive_depth: depth_value > 0
			valid_alpha: alpha_value >= -1
			valid_beta: beta_value >= -1
			valid_name_code: new_name_code >= -1
		do
			number_of_nodes := number_of_nodes + 1
			node_kinds.force (new_node_type, number_of_nodes)
			depth.force (depth_value, number_of_nodes)
			alpha.force (alpha_value, number_of_nodes)
			beta.force (beta_value, number_of_nodes)
			name_code.force (new_name_code, number_of_nodes) 
			set_next_sibling (0, number_of_nodes) -- safety precaution
			last_node_added := number_of_nodes
		ensure
			one_more_node: number_of_nodes = old number_of_nodes + 1 and last_node_added = number_of_nodes
			correct_node_kind: node_kinds.item (number_of_nodes) = new_node_type
			correct_depth: depth.item (number_of_nodes) = depth_value
			correct_alpha: alpha.item (number_of_nodes) = alpha_value
			correct_beta: beta.item (number_of_nodes) = beta_value
			correct_name_code: name_code.item (number_of_nodes) = new_name_code
			no_next_sibling: next_sibling.item (number_of_nodes) = 0
		end
	
	set_next_sibling (next: INTEGER; which_node: INTEGER) is
			-- Set the next sibling of a node
		require
			valid_current_node: which_node > 0
			valid_next_sibling: next >= -1 -- -1 means no next sibling
		do
			next_sibling.force (next, which_node)
		ensure
			next_sibling_set: next_sibling.item (which_node) = next
		end

	append_characters (characters: STRING) is
			-- Add `characters' to the document's content
		require
			characters_not_void: characters /= Void
		local
			counter: INTEGER
		do
			character_buffer.append_string (characters)
		end

	add_namespace (the_parent: INTEGER; ns_code: INTEGER) is
			-- Add a namespace declaration
		do
			namespace_parent.force_last (the_parent)
			namespace_code.force_last (ns_code)
		end

	add_attribute (the_parent: INTEGER; nm_code: INTEGER; type_cde: INTEGER; value: STRING) is
			-- Add an attribute
		do
			attribute_parent.force_last (the_parent)
			attribute_value.force_last (value)
			attribute_code.force_last (nm_code)

				check
					untyped: type_cde = 0
					-- As the parser does not provide type information
				end

			if alpha.item (the_parent) = -1 then alpha.force (attribute_value.count, the_parent) end
			-- TODO check ID values
		end

	store_comment (data: UC_UTF8_STRING) is
			-- Store comment or processing instruction test
		require
			data_not_void: data /= Void
		do
			if comment_buffer = Void then
				create comment_buffer.make (data.count)
			end
			comment_buffer.append_string (data)
		ensure
			comment_buffer_created: comment_buffer /= Void
		end
	
		
feature -- Status setting

	set_name_pool (new_pool: XM_XPATH_NAME_POOL) is
			-- Set the name pool used by this builder
		require
			pool_not_void: new_pool /= Void
		do
			name_pool := new_pool
			add_namespace (node_number, name_pool.namespace_code ("xml", Xml_uri))
			name_pool.allocate_document_number (Current)
			document_number := name_pool.document_number (Current)
		ensure
			pool_set: name_pool = new_pool
		end
	
feature {NONE} -- Implementation

	id_table: DS_HASH_TABLE [XM_XPATH_TINY_ELEMENT, STRING]
			-- Mapping of IDs to elements.

	name_pool: XM_XPATH_NAME_POOL
			-- Namespace mappings.

	document_number: INTEGER
			-- Uniquely identifies this document.

	element_list: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT], INTEGER]
			-- Lists of elements with the same name.

	uses_namespaces: BOOLEAN
			-- Does this document use namespaces?

	entity_table: DS_HASH_TABLE [DS_ARRAYED_LIST [STRING], STRING]
			-- Maps unparsed entity names to their URI/PUBLIC-ID pairs.

	element_type_map: DS_HASH_TABLE [INTEGER, INTEGER]
			-- Maps Element types to node numbers

	root_node: INTEGER
			-- The actual root of the tree. Normally 1.

	character_buffer: UC_UTF8_STRING
			-- The document contents
			--  should this really be CHARACTER, or Unicode character?
			--  From the parser's point of view, it should be CHARACTER
	
	comment_buffer: UC_UTF8_STRING
			-- Buffer for comments, created when needed

	number_of_nodes: INTEGER
			-- Number of nodes excluding attributes and namespaces

			-- The following arrays contain one entry for each node other than attribute
			-- and namespace nodes, arranged in document order

	node_kinds: DS_ARRAYED_LIST [INTEGER]
			-- Kind of node, e.g. Element, Text, Comment

	depth: DS_ARRAYED_LIST [INTEGER]
			-- Depth of the node in the hierarchy (document root is level 1, so = the number of ancestors + 1).

	next_sibling: DS_ARRAYED_LIST [INTEGER]
			-- Node number of the next sibling;
			-- unless it points backwards, in which case it is the node number of the parent

	alpha: DS_ARRAYED_LIST [INTEGER]
			-- A value that depends on the node kind
			-- For text nodes, it is the offset into the text buffer
			-- For comments and processing instructions, it is the
			--  offset into the comment buffer
			-- For elements, it is the index of the first attribute node, or -1
			--  if this element has no attributes.

	beta: DS_ARRAYED_LIST [INTEGER]
			-- A value that depends on the node kind
			-- For text nodes, it is the length of the text
			-- For comments and processing instructions, it is
			-- the length of the text
			-- For elements, it is the index of the first namespace node,
			-- or -1 if this element has no namespaces

	name_code: DS_ARRAYED_LIST [INTEGER]
			-- Name of the node, as an index into the name pool;
			-- -1 indicates there is no name

	prior: DS_ARRAYED_LIST [INTEGER]
			-- Index of preceding-siblings
			-- Constructed only when required

			-- The following arrays contain one entry for each attribute

	number_of_attributes: INTEGER

	attribute_parent: DS_ARRAYED_LIST [INTEGER]
			-- Index of the parent element node

	attribute_code: DS_ARRAYED_LIST [INTEGER]
			-- Name of the node, as an index into the name pool

	attribute_value: DS_ARRAYED_LIST [STRING]
			-- Value of attribute

			--	Not used yet, as we have no typing information	
	--attribute_type_code: DS_ARRAYED_LIST [INTEGER]
			-- Type annotations
			-- Only created if at least one attribute actually has a type

			-- The following arrays contain one entry for each namespace declaration

	number_of_namespaces: INTEGER

	namespace_parent: DS_ARRAYED_LIST [INTEGER]
			-- Index of the parent element node
		
	namespace_code: DS_ARRAYED_LIST [INTEGER]
			-- Name of the node, as an index into the name pool
			--  the top half is the prefix code, the bottom half the URI code

	system_id_map: XM_XPATH_SYSTEM_ID_MAP
			-- Maps element sequence numbers to system-ids

invariant

	node_kind_not_void: node_kind /= Void
	depth_not_void: depth /= Void
	next_sibling_not_void: next_sibling /= Void
	alpha_not_void: alpha /= Void
	beta_not_void: beta /= Void
	name_code_not_void: name_code /= Void
	attribute_parent_not_void: attribute_parent /= Void
	attribute_code_not_void: attribute_code /= Void
	attribute_value_not_void: attribute_value /= Void
	namespace_parent_not_void: namespace_parent /= Void
	namespace_code_not_void: namespace_code /= Void
	positive_node_count: number_of_nodes >= 0
	positive_attribute_count: number_of_attributes >= 0
	positive_namespace_count: number_of_namespaces >= 0

end

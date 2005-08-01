indexing

	description:

		"Tiny-tree Document collections"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_FOREST

inherit

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
		
	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

	UT_STRING_FORMATTER
		export {NONE} all end

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL

create

	make, make_with_defaults

feature {NONE} -- Initialization
	
	make (an_estimated_node_count, an_estimated_attribute_count: INTEGER;
			an_estimated_namespace_count, an_estimated_character_count: INTEGER) is
			-- Establish invariant.
		require
			positive_node_count: an_estimated_node_count >= 0
			attribute_count: an_estimated_attribute_count >= 0
			namespace_count: an_estimated_namespace_count >= 0
			character_count: an_estimated_character_count >= 0
		do
			create system_id_map.make
			create document_list.make_default
			if an_estimated_node_count = 0 then
				estimated_node_count := Default_node_count
			else
				estimated_node_count := an_estimated_node_count
			end
			if an_estimated_attribute_count = 0 then
				estimated_attribute_count := Default_attribute_count
			else
				estimated_attribute_count := an_estimated_attribute_count
			end
			if an_estimated_namespace_count = 0 then
				estimated_namespace_count := Default_namespace_count
			else
				estimated_namespace_count := an_estimated_namespace_count
			end
			if an_estimated_character_count = 0 then
				estimated_character_count := Default_character_count
			else
				estimated_character_count := an_estimated_character_count
			end				
			create node_kinds.make (1, estimated_node_count)
			create depth.make (1, estimated_node_count)
			create next_sibling_indices.make (1, estimated_node_count)
			create alpha.make (1, estimated_node_count)
			create beta.make (1, estimated_node_count)
			create name_codes.make (1, estimated_node_count)

			create attribute_parents.make (1, estimated_attribute_count)
			create attribute_codes.make (1, estimated_attribute_count)
			create attribute_values.make (1, estimated_attribute_count)

			create namespace_parents.make (1, estimated_namespace_count)
			create namespace_codes.make (1, estimated_namespace_count)

			-- This is a problem - we don't know in advance if it will be ascii or not

			create character_buffer.make (estimated_character_count)

			create root_indices.make (1, 5)
		end

	make_with_defaults is
			-- Create with default structure sizes
		do
			make (Default_node_count, Default_attribute_count, Default_namespace_count, Default_character_count)
		end
		
feature -- Access

	Default_node_count: INTEGER is 4000
			-- Default number of nodes (other than attributes and namespaces)

	Default_attribute_count: INTEGER is 100
			-- Default number of attributes

	Default_namespace_count: INTEGER is 20
			-- Default number of namespaces

	Default_character_count: INTEGER is 4000
			-- Default number of characters

	character_buffer: STRING
			-- The charater contents of the contained documents

	comment_buffer: STRING
			-- Buffer for comments, created when needed
	
	number_of_nodes: INTEGER
			-- Number of nodes excluding attributes and namespaces

	number_of_attributes: INTEGER
			-- Number of attribute nodes

	number_of_namespaces: INTEGER
			-- Number of namespace nodes

	last_node_added: INTEGER
			-- Last node created with `add_node'

	element_annotation (a_node_number: INTEGER): INTEGER is
			-- Type annotation of `a_node_number'
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		do
			if element_type_map = Void then
				Result := type_factory.untyped_type.fingerprint
			elseif element_type_map.has (a_node_number)  then
				Result := element_type_map.item (a_node_number)
			else
				Result := type_factory.untyped_type.fingerprint
			end
		end

	retrieve_node (a_node_number: INTEGER): XM_XPATH_TINY_NODE is
			-- Build and retrieve flyweight node for  `a_node_number'
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		local
			a_node_type: INTEGER
		do
			a_node_type := node_kinds.item (a_node_number)
			inspect
				a_node_type
			when Document_node then
				Result := document_list.item (alpha.item (a_node_number))
			when Element_node then
				create {XM_XPATH_TINY_ELEMENT} Result.make (Current, a_node_number)
			when Text_node then
				create {XM_XPATH_TINY_TEXT} Result.make (Current, a_node_number)
			when Comment_node then
				create {XM_XPATH_TINY_COMMENT} Result.make (Current, a_node_number)
			when Processing_instruction_node then
				create {XM_XPATH_TINY_PROCESSING_INSTRUCTION} Result.make (Current, a_node_number)
			end
		ensure
			Node_not_void: Result /= Void
		end

	depth_of (a_node_number: INTEGER): INTEGER is
			-- Depth of node within tree
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		do
			Result := depth.item (a_node_number)
		end

	alpha_value (a_node_number: INTEGER): INTEGER is
			-- Alpha value for the node
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		do
			Result := alpha.item (a_node_number)
		end

	beta_value (a_node_number: INTEGER): INTEGER is
			-- Beta value for the node
		require
			node_number_is_valid: is_node_number_valid (a_node_number) or else is_namespace_number_valid (a_node_number)
		do
			Result := beta.item (a_node_number)
		end

	prior_node (a_node_number: INTEGER): INTEGER is
			-- Previous-sibling for `a_node_number'
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		do
			Result := prior_nodes_index.item (a_node_number)
		end

	namespace_parent (an_index: INTEGER): INTEGER is
			-- Index of parent element
		require
			index_is_valid: is_namespace_number_valid (an_index)
		do
			Result := namespace_parents.item (an_index)
		end

	attribute_parent (an_index: INTEGER): INTEGER is
			-- Index of parent element
		require
			index_is_valid: is_attribute_number_valid (an_index)
		do
			Result := attribute_parents.item (an_index)
		end

	attribute_name_code  (an_index: INTEGER): INTEGER is
			-- Attribute name code for `an_index'
		require
			index_is_valid: is_attribute_number_valid (an_index)
		do
			Result := attribute_codes.item (an_index)
		end

	retrieve_namespace_node (a_namespace_number: INTEGER): XM_XPATH_TINY_NAMESPACE is
			-- Build a flyweight namespace node for `a_namespace_number'
		require
			namespace_number_is_valid: is_namespace_number_valid (a_namespace_number)
		do
			create Result.make (Current, a_namespace_number)
		ensure
			namespace_node_not_void: Result /= Void
		end

	retrieve_node_kind (a_node_number: INTEGER): INTEGER is
			-- Node kind for the node
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		do
			Result := node_kinds.item (a_node_number)
		end
	
	attribute_value (an_attribute_number: INTEGER): STRING is
			-- Value of `an_attribute_number'
		require
			attribute_number_is_valid: is_attribute_number_valid (an_attribute_number)
		do
			Result := attribute_values.item (an_attribute_number)
		end

	retrieve_next_sibling (a_node_number: INTEGER): INTEGER is
			-- Next sibling of  `a_node_number'
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		do
			Result := next_sibling_indices.item (a_node_number)
		end

	retrieve_name_code (a_node_number: INTEGER): INTEGER is
			-- Name code of `a_node_number'
		require
			node_number_is_valid: is_node_number_valid (a_node_number)
		do
			Result := name_codes.item (a_node_number)
		end

	retrieve_attribute_node (an_attribute_number: INTEGER): XM_XPATH_TINY_ATTRIBUTE is
			-- Build a flyweight attribute node for `an_attribute_number'
		require
			attribute_number_is_valid: is_attribute_number_valid (an_attribute_number)
		do
			create Result.make (Current, an_attribute_number)
		ensure
			attribute_node_not_void: Result /= Void
		end

	attribute_annotation (an_attribute_number: INTEGER): INTEGER is
			-- Type annotation of `an_attribute_number'
		require
			attribute_number_is_valid: is_attribute_number_valid (an_attribute_number)
		do
			if attribute_type_codes = Void then
				Result := Untyped_atomic_type_code
			else
				Result := attribute_type_codes.item (an_attribute_number)
			end
		end

	system_id_for_node (a_node_number: INTEGER): STRING is
			-- SYSTEM ID of element or processing-instruction referenced by `a_node_number';
			-- Not necessarily same as base URI.
		require
			valid_node_number: is_node_number_valid (a_node_number)
		do
			Result := system_id_map.system_id (a_node_number)
		ensure
			system_id_not_void: Result /= Void
		end

	line_number_for_node (a_node_number: INTEGER): INTEGER is
			-- Line number of node referenced by `a_node_number'
		require
			valid_node_number: is_node_number_valid (a_node_number)
		do
			if line_number_map /= Void then
				Result := line_number_map.line_number (a_node_number)
			else
				Result := 0
			end
		end
		
	root_node (a_node_number: INTEGER): INTEGER is
			-- Root node for `a_node_number'
		local
			an_index, a_root: INTEGER
		do
			from
				an_index := root_index
			variant
				an_index
			until
				Result > 0 or else an_index = 0
			loop
				a_root := root_indices.item (an_index)
				if a_root <= a_node_number then
					Result := a_root
				end
				an_index := an_index - 1
			end
		end


feature -- Status report

	estimated_node_count: INTEGER
			-- An estimate of how many nodes there will be in the fully constructed tree

	estimated_attribute_count: INTEGER
			-- An estimate of how many attributes there will be in the fully constructed tree

	estimated_namespace_count: INTEGER
			-- An estimate of how many namespaces there will be in the fully constructed tree

	estimated_character_count: INTEGER
			-- An estimate of how many characters there are in the document contents

	is_node_number_valid (a_node_number: INTEGER): BOOLEAN is
			-- Does `a_node_number' represent a valid node?
		do
			Result := a_node_number > 0 and then a_node_number <= last_node_added
		end

	is_attribute_number_valid (an_attribute_number: INTEGER): BOOLEAN is
			-- Does `an_attribute_number' represent a valid attribute?
		do
			Result := an_attribute_number > 0 and then an_attribute_number <= number_of_attributes
		end

	is_namespace_number_valid (an_namespace_number: INTEGER): BOOLEAN is
			-- Does `an_namespace_number' represent a valid namespace?
		do
			Result := an_namespace_number > 0 and then an_namespace_number <= number_of_namespaces
		end

	is_line_numbering: BOOLEAN is
			-- is line numbering turned on?
		do
			Result := line_number_map /= Void
		end

	diagnostic_dump is
			-- Produce diagnostic print of main tree arrays
		local
			an_index, a_limit: INTEGER
		do
			std.error.put_string ("    node    type   depth    next   alpha    beta    name%N")
			from
				an_index := 1
				a_limit := number_of_nodes
			variant
				a_limit - an_index + 1
			until
				an_index > a_limit
			loop
				std.error.put_string (left_padded_string_out (an_index.out, 8, ' '))
				std.error.put_string (left_padded_string_out (node_type_name (node_kinds.item (an_index)), 8, ' ').substring (1,8))
				std.error.put_string (left_padded_string_out (depth.item (an_index).out, 8, ' '))
				std.error.put_string (left_padded_string_out (next_sibling_indices.item (an_index).out, 8, ' '))
				std.error.put_string (left_padded_string_out (alpha.item (an_index).out, 8, ' '))
				std.error.put_string (left_padded_string_out (beta.item (an_index).out, 8, ' '))
				std.error.put_string (left_padded_string_out (name_codes.item (an_index).out, 8, ' '))
				std.error.put_new_line
				an_index := an_index + 1
			end

			std.error.put_string ("    attr  parent    name    value%N")
			from
				an_index := 1
				a_limit := number_of_attributes
			variant
				a_limit - an_index + 1
			until
				an_index > a_limit
			loop
				std.error.put_string (left_padded_string_out (an_index.out, 8, ' '))
				std.error.put_string (left_padded_string_out (attribute_parents.item (an_index).out, 8, ' '))
				std.error.put_string (left_padded_string_out (shared_name_pool.display_name_from_name_code (attribute_name_code (an_index)), 8, ' ').substring (1,8))
				std.error.put_string ("    ")
				std.error.put_string (attribute_value (an_index))
				std.error.put_new_line
				an_index := an_index + 1
			end
			
			std.error.put_string ("      ns  parent  prefix     uri%N")
			from
				an_index := 1
				a_limit := number_of_namespaces
			variant
				a_limit - an_index + 1
			until
				an_index > a_limit
			loop
				std.error.put_string (left_padded_string_out (an_index.out, 8, ' '))
				std.error.put_string (left_padded_string_out (namespace_parents.item (an_index).out, 8, ' '))
				std.error.put_string (left_padded_string_out (shared_name_pool.prefix_from_namespace_code (namespace_codes.item (an_index)), 8, ' '))
				std.error.put_string ("    ")
				std.error.put_string (shared_name_pool.uri_from_namespace_code (namespace_codes.item (an_index)))
				std.error.put_new_line
				an_index := an_index + 1
			end				
		end

	print_sizes is
			-- Print sizes of arrays used.
		do
			std.error.put_string ("Nodes      Attributes Namespaces Characters%N")
			std.error.put_string ("===========================================%N")
			std.error.put_string (left_padded_string_out (number_of_nodes.out, 10, ' '))
			std.error.put_string (left_padded_string_out (number_of_attributes.out, 10, ' '))
			std.error.put_string (left_padded_string_out (number_of_namespaces.out, 10, ' '))
			std.error.put_string (left_padded_string_out (character_buffer.count.out, 10, ' '))
			std.error.put_new_line
		end

feature -- Status setting

	ensure_prior_index is
			-- On demand, ensure existence of index for quick access to preceding-sibling nodes
		do
			if prior_nodes_index = Void then make_prior_index end
		ensure
			prior_index_built: prior_nodes_index /= Void
		end
	
	make_prior_index is
			-- On demand, make an index for quick access to preceding-sibling nodes
		local
			a_prior_index, a_next_node: INTEGER
		do
			create prior_nodes_index.make (1, last_node_added)
			from
				a_prior_index := 1
			variant
				last_node_added - a_prior_index + 1
			until
				a_prior_index > last_node_added
			loop	
				prior_nodes_index.put (-1, a_prior_index)
				a_prior_index := a_prior_index + 1
			end
			from
				a_prior_index := 1
			variant
				last_node_added - a_prior_index + 1
			until
				a_prior_index > last_node_added
			loop
				a_next_node := next_sibling_indices.item (a_prior_index)
				if a_next_node > a_prior_index then
					prior_nodes_index.put (a_prior_index, a_next_node)
				end
				a_prior_index := a_prior_index + 1
			end
		ensure
			a_prior_index_built: prior_nodes_index /= Void
		end
	
	set_line_numbering is
			-- Turn on line numbering
		require
			no_line_numbering: not is_line_numbering
		do
			create line_number_map.make
			set_line_number_for_node (1, 0)
		ensure
			line_number_map_not_void: line_number_map /= Void
		end

	set_name_code_for_node (a_name_code, a_node_number: INTEGER) is
			-- Set `name_code' for `a_node_number.
			-- Needed (indirectly, through `XM_XPATH_TINY_ELEMENT') by `XM_XSLT_STRIPPER'.
		require
			node_number_in_range: is_node_number_valid (a_node_number)
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
		do
			name_codes.put (a_name_code, a_node_number)
		ensure
			name_code_set: name_code_for_node (a_node_number) = a_name_code
		end

feature -- Element change
	
	set_line_number_for_node (a_node_number: INTEGER; a_line_number: INTEGER) is
			-- Set the line number for `a_node_number'.
		require
			valid_node_number: (a_node_number = 1 and last_node_added = 0) or else is_node_number_valid (a_node_number)
			positive_line_number: a_line_number >= 0
		do
			if line_number_map /= Void then
				line_number_map.set_line_number(a_node_number, a_line_number)
			end
		end

	add_document_node (a_document_node: XM_XPATH_TINY_DOCUMENT) is
			-- Add `a_document_node' to `Current'.
		require
			document_node_exists: a_document_node /= Void
		do
			root_index := root_index + 1
			document_list.force_last (a_document_node)
			if number_of_nodes = 0 then
				shared_name_pool.allocate_document_number (a_document_node)
				document_number := a_document_node.document_number
			else
				a_document_node.set_document_number (document_number) -- all documents in `Current' have the same document number
			end
			add_node (Document_node, 1, root_index, 0, -1)
			root_indices.force (last_node_added, root_index)
		end

	add_node (a_new_node_type: INTEGER; a_depth_value: INTEGER; an_alpha_value: INTEGER;  a_beta_value: INTEGER; a_new_name_code: INTEGER) is
			-- Add a node to the document
		require
			valid_node_type: a_new_node_type = Document_node or a_new_node_type = Element_node or
				a_new_node_type = Text_node or a_new_node_type = Comment_node or a_new_node_type = Processing_instruction_node
			strictly_positive_depth: a_depth_value > 0
			valid_alpha: an_alpha_value >= 0
			valid_beta: a_beta_value >= 0
			valid_name_code: a_new_name_code = -1 or else shared_name_pool.is_valid_name_code (a_new_name_code)
		local
			a_new_size: INTEGER
		do
			number_of_nodes := number_of_nodes + 1
			if number_of_nodes > node_kinds.count then
				a_new_size := node_kinds.count * 2
				INTEGER_ARRAY_.resize (node_kinds, 1, a_new_size)
				INTEGER_ARRAY_.resize (depth, 1, a_new_size)
				INTEGER_ARRAY_.resize (alpha, 1, a_new_size)
				INTEGER_ARRAY_.resize (beta, 1, a_new_size)
				INTEGER_ARRAY_.resize (name_codes, 1, a_new_size)
			end
			node_kinds.put (a_new_node_type, number_of_nodes)
			depth.put (a_depth_value, number_of_nodes)
			if an_alpha_value /= 0 then alpha.put (an_alpha_value, number_of_nodes) end
			if a_beta_value /= 0 then beta.put (a_beta_value, number_of_nodes) end
			name_codes.put (a_new_name_code, number_of_nodes) 
			set_next_sibling (-1, number_of_nodes) -- safety precaution
			last_node_added := number_of_nodes
		ensure
			one_more_node: number_of_nodes = old number_of_nodes + 1 and last_node_added = number_of_nodes
			correct_node_kinds: node_kinds.item (number_of_nodes) = a_new_node_type
			correct_depth: depth.item (number_of_nodes) = a_depth_value
			correct_name_codes: name_codes.item (number_of_nodes) = a_new_name_code
			no_next_sibling: next_sibling_indices.item (number_of_nodes) = -1
		end
	
	set_next_sibling (a_next_node: INTEGER; which_node: INTEGER) is
			-- Set the next sibling of a node
		require
			valid_current_node: which_node > 0
			valid_next_sibling: a_next_node >= -1 -- -1 means no next sibling
		do
			if which_node > next_sibling_indices.count then
				INTEGER_ARRAY_.resize (next_sibling_indices, 1, 2 * next_sibling_indices.count)
			end
			next_sibling_indices.put (a_next_node, which_node)
		ensure
			next_sibling_set: next_sibling_indices.item (which_node) = a_next_node
		end

	add_attribute (a_document: XM_XPATH_TINY_DOCUMENT; a_parent: INTEGER; a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING) is
			-- Add an attribute
		local
			a_new_size, an_index, another_type_code: INTEGER
			a_node: XM_XPATH_TINY_NODE
			an_id: STRING
		do
			number_of_attributes := number_of_attributes + 1
			attribute_parents.force (a_parent, number_of_attributes)
			attribute_values.force (a_value, number_of_attributes)
			attribute_codes.force (a_name_code, number_of_attributes)

			-- Uncomment (and review) when schema-aware functionality added
			--if a_type_code = 0 then
				another_type_code := Untyped_atomic_type_code
			--else
			--	another_type_code := a_type_code
			--end
			if another_type_code /= Untyped_atomic_type_code then
				if attribute_type_codes = Void then
					create attribute_type_codes.make (1, number_of_attributes)
					from
						an_index := 1
					variant
						number_of_attributes + 1 - an_index 
					until
						an_index = number_of_attributes
					loop
						attribute_type_codes.put (Untyped_atomic_type_code, an_index)
					end
				end
			end
			if attribute_type_codes /= Void then
				if attribute_type_codes.count < number_of_attributes then
					a_new_size := last_node_added.max (number_of_attributes * 2)
					INTEGER_ARRAY_.resize (attribute_type_codes, 1, a_new_size)
				end
				attribute_type_codes.put (another_type_code, number_of_attributes)
			end
			
			if alpha.item (a_parent) = 0 then alpha.put (number_of_attributes, a_parent) end

			if a_document /= Void and then a_type_code = Id_type_code then -- TODO: maybe expand this for schema-aware version
				-- The attribute is marked as being an ID. But we don't trust it - it
				-- might come from a non-validating parser. Before adding it to the index, we
				-- check that it really is an ID.
				-- TODO: sub-types of ID??
				an_id := STRING_.cloned_string (a_value)
				STRING_.left_adjust (an_id)
				STRING_.right_adjust (an_id)
				if is_ncname (an_id) then
					a_node := retrieve_node (a_parent)
					check
						is_element: a_node.is_tiny_element
					end
					a_document.register_id (a_node.as_tiny_element, an_id)
				end
			end
		end

	add_namespace (a_parent: INTEGER; a_namespace_code: INTEGER) is
			-- Add a namespace declaration
		do
			number_of_namespaces := number_of_namespaces + 1
			namespace_parents.force (a_parent, number_of_namespaces)
			namespace_codes.force (a_namespace_code, number_of_namespaces)
			if beta_value (a_parent) = 0 then
				beta.put (number_of_namespaces, a_parent)
			end
		end

	append_characters (characters: STRING) is
			-- Add `characters' to the document's content
		require
			characters_not_void: characters /= Void
		do
			character_buffer := STRING_.appended_string (character_buffer, characters)
		end
	
	store_comment (a_comment_string: STRING) is
			-- Store comment or processing instruction test
		require
			data_not_void: a_comment_string /= Void
		do
			if comment_buffer = Void then
				comment_buffer := STRING_.cloned_string (a_comment_string)
			else
				comment_buffer := STRING_.appended_string (comment_buffer, a_comment_string)
			end
		ensure
			comment_buffer_created: comment_buffer /= Void
		end

	increase_beta_value (an_increment, a_node_number: INTEGER) is
			-- Increase `beta_value' of `a_node_number' by `an_increment'.
		require
			node_number_in_range: is_node_number_valid (a_node_number)
		do
			beta.put (beta.item (a_node_number) + an_increment, a_node_number)
		end

	condense is
			-- Conditionally release unused memory.
		local
			some_node_kinds, some_name_codes, some_next_siblings, an_alpha, a_beta, a_depth: ARRAY [INTEGER]
			some_namespace_parents, some_namespace_codes, some_attribute_parents, some_attribute_codes, some_attribute_type_codes: ARRAY [INTEGER]
			some_attribute_values: ARRAY [STRING]
		do

			-- If there is more than one tree in the forest,
			--  then the chances are there will be another one added later.

			if root_index < 2 then
				if number_of_nodes * 3 < node_kinds.count or else node_kinds.count - number_of_nodes > 20000 then
					create some_node_kinds.make (1, number_of_nodes); copy_integer_array (node_kinds, some_node_kinds); node_kinds := some_node_kinds; some_node_kinds := Void
					create some_name_codes.make (1, number_of_nodes); copy_integer_array (name_codes, some_name_codes); name_codes := some_name_codes; some_name_codes := Void
					create some_next_siblings.make (1, number_of_nodes); copy_integer_array (next_sibling_indices, some_next_siblings); next_sibling_indices := some_next_siblings; some_next_siblings := Void
					create an_alpha.make (1, number_of_nodes); copy_integer_array (alpha, an_alpha); alpha := an_alpha; an_alpha := Void
					create a_beta.make (1, number_of_nodes); copy_integer_array (beta, a_beta); beta := a_beta; a_beta := Void
					create a_depth.make (1, number_of_nodes); copy_integer_array (depth, a_depth); depth := a_depth; a_depth := Void
					-- TODO: type codes when schema-aware
				end
				if number_of_attributes * 3 < attribute_parents.count or else attribute_parents.count - number_of_attributes > 1000 then
					create some_attribute_parents.make (1, number_of_attributes); copy_integer_array (attribute_parents, some_attribute_parents); attribute_parents := some_attribute_parents; some_attribute_parents := Void
					create some_attribute_codes.make (1, number_of_attributes); copy_integer_array (attribute_codes, some_attribute_codes); attribute_codes := some_attribute_codes; some_attribute_codes := Void
					create some_attribute_values.make (1, number_of_attributes); copy_string_array (attribute_values, some_attribute_values); attribute_values := some_attribute_values; some_attribute_values := Void
					if attribute_type_codes /= Void then
						create some_attribute_type_codes.make (1, number_of_attributes); copy_integer_array (attribute_type_codes, some_attribute_type_codes); attribute_type_codes := some_attribute_type_codes; some_attribute_type_codes := Void
					end
				end
				if number_of_namespaces * 3 < namespace_parents.count then
					create some_namespace_parents.make (1, number_of_namespaces); copy_integer_array (namespace_parents, some_namespace_parents); namespace_parents := some_namespace_parents; some_namespace_parents := Void
					create some_namespace_codes.make (1, number_of_namespaces); copy_integer_array (namespace_codes, some_namespace_codes); namespace_codes := some_namespace_codes; some_namespace_codes := Void					
				end
				character_buffer := character_buffer.substring (1, character_buffer.count)
			end	
		end

	set_element_annotation (which_node: INTEGER; a_new_type: INTEGER) is
			-- Set the element type
		require
			valid_current_node: which_node > 0
		do
			-- Not needed for a basic XSLT processor
		end

	set_system_id_for_node (a_node_number: INTEGER; a_system_id: STRING) is
			-- Set the SYSTEM ID for `a_node_number'.
			-- Not necessarily same as base URI
		require
			system_id_not_void: a_system_id /= Void
			valid_node_number: (a_node_number = 1 and last_node_added = 0) or else is_node_number_valid (a_node_number)
		do
			system_id_map.set_system_id(a_node_number, a_system_id)
		end
		
feature -- Conversion

	namespace_code_for_node (a_namespace_number: INTEGER): INTEGER is
			-- Namespace code for `a_namespace_number'
		require
			node_number_in_range: is_namespace_number_valid (a_namespace_number)
		do
			Result := namespace_codes.item (a_namespace_number)
		end

	name_code_for_node (a_node_number: INTEGER): INTEGER is
			-- Fetch the name code for `a_node_number'
		require
			node_number_in_range: is_node_number_valid (a_node_number)
		do
			Result := name_codes.item (a_node_number)
		end

	attribute_code_for_node (a_node_number: INTEGER): INTEGER is
			-- Fetch the name code for attribute `a_node_number'
		require
			attribute_number_in_range: is_attribute_number_valid (a_node_number)
		do
			Result := attribute_codes.item (a_node_number)
		end

feature {NONE} -- Implementation

	document_number: INTEGER
			-- Actually a forest number in this instance;
			-- Two nodes with the same document number are treated as
			--  being within the same document, for order comparisons.
			-- This works, as all node sequence numbers within a document
			--  are in a contiguous range within `Current'

	document_list: DS_ARRAYED_LIST [XM_XPATH_TINY_DOCUMENT]
			-- Documents in the forest

	root_indices: ARRAY [INTEGER]
			-- Node numbers of root nodes

	root_index: INTEGER
			-- Index of current document root

	system_id_map: XM_XPATH_SYSTEM_ID_MAP
			-- Maps element or processing-instruction sequence numbers to system-ids
			
	line_number_map: XM_XPATH_LINE_NUMBER_MAP
			-- Maps sequence numbers to line numbers

	element_type_map: DS_HASH_TABLE [INTEGER, INTEGER]
			-- Maps Element types to node numbers

	node_kinds: ARRAY [INTEGER]
			-- Kind of node, e.g. Element, Text, Comment
	
	depth: ARRAY [INTEGER]
			-- Depth of node in hierarchy (document root is level 1, so = the number of ancestors + 1).

	next_sibling_indices: ARRAY[INTEGER]
			-- Node number of the next sibling;
			-- unless it points backwards, in which case it is the node number of the parent

	alpha: ARRAY [INTEGER]
			-- A value that depends on the node kind:
			-- For text nodes, it is the offset into the text buffer prior to the start of text.
			-- For comments and processing instructions, it is the
			--  offset into the comment buffer prior to the start of the text.
			-- For elements, it is the index of the first attribute node, or 0
			--  if this element has no attributes.

	beta: ARRAY [INTEGER]
			-- A value that depends on the node kind:
			-- For text nodes, comments and processing instructions,
			--  it is the length of the text.
			-- For elements, it is the index of the first namespace node,
			--  or 0 if this element has no namespaces.

	name_codes: ARRAY [INTEGER]
			-- Name of the node, as an index into the name pool;
			-- -1 indicates there is no name

			-- The following arrays contain one entry for each attribute

	attribute_parents: ARRAY [INTEGER]
			-- Index of parent node

	attribute_codes: ARRAY [INTEGER]
			-- Name of attribute, as an index into the name pool

	attribute_values: ARRAY [STRING]
			-- Value of attribute

	attribute_type_codes: ARRAY [INTEGER]
			-- Type annotations;
			-- Only created if at least one attribute actually has a type
	
	prior_nodes_index: ARRAY [INTEGER]
			-- Index of preceding-siblings
			-- Constructed only when required

			-- The following arrays contain one entry for each namespace declaration

	namespace_parents: ARRAY [INTEGER]
			-- Index of the parent node
		
	namespace_codes: ARRAY [INTEGER]
			-- Name of the node, as an index into the name pool;
			--  top half is prefix code, bottom half is URI code

	copy_integer_array (a_source, a_target: ARRAY [INTEGER]) is
			-- Copy contents of `a_source' to `a_target'.
		require
			source_exists: a_source /= Void
			target_exists: a_target /= Void
			sufficient_count: a_source.count >= a_target.count
		local
			an_index: INTEGER
		do
			from
				an_index := 1
			until
				an_index > a_target.count
			loop
				a_target.put (a_source.item (an_index), an_index)
				an_index := an_index + 1
			end
		end

	copy_string_array (a_source, a_target: ARRAY [STRING]) is
			-- Copy contents of `a_source' to `a_target'.
		require
			source_exists: a_source /= Void
			target_exists: a_target /= Void
			sufficient_count: a_source.count >= a_target.count
		local
			an_index: INTEGER
		do
			from
				an_index := 1
			until
				an_index > a_target.count
			loop
				a_target.put (a_source.item (an_index), an_index)
				an_index := an_index + 1
			end
		end

invariant

	document_list_exists: document_list /= Void
	character_buffer_exists: character_buffer /= Void
	system_id_map_exists: system_id_map /= Void
	node_kinds_exist: node_kinds /= Void
	depth_exists: depth /= Void
	next_sibling_exists: next_sibling_indices /= Void
	alpha_exists: alpha /= Void
	beta_exists: beta /= Void
	name_codes_exist: name_codes /= Void
	attribute_parents_exist: attribute_parents /= Void
	attribute_codes_exist: attribute_codes /= Void
	attribute_values_exist: attribute_values /= Void
	namespace_parents_exist: namespace_parents /= Void
	namespace_codes_exist: namespace_codes /= Void
	positive_node_count: number_of_nodes >= 0
	positive_attribute_count: number_of_attributes >= 0
	namespace_count: number_of_namespaces >= 0 and then number_of_namespaces < 32768

end
	

indexing

	description:

		"Callbacks filter producing tiny trees"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_BUILDER

inherit

	XM_XPATH_RECEIVER

	XM_XPATH_TYPE

creation

	make

feature -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL) is
			-- Set the name pool in which all name codes can be found
		require
			name_pool_not_void: a_name_pool /= Void
		do
			initialize_type_tables
			name_pool := a_name_pool
		ensure
			name_pool_set: name_pool.is_equal (a_name_pool)
		end
	
feature -- Result

	document: XM_XPATH_TINY_DOCUMENT
			-- Resulting document

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree
		do
			system_id := a_system_id
		end

feature -- Events

	start_document is
			-- Notify the start of the document
		do
			-- TODO add timing information
			if defaults_overridden then
				create document.make (estimated_node_count, estimated_attribute_count, estimated_namespace_count, estimated_character_count)
			else
				create document.make_with_defaults
			end
			current_depth := 1
			document.add_node (Document_node, current_depth, -1, -1, -1)
			create previously_at_depth.make (1, 100)
			previously_at_depth.put(1, 1) -- i.e. depth one is node 1 - the document node
			previously_at_depth.put (0, 2) 
			document.set_next_sibling (-1, 1) -- i.e. node one has next sibling 0 (no next sibling)
			current_depth := current_depth + 1
			document.set_name_pool (name_pool)
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI
		do
			-- TODO document.set_unparsed_entity (a_name, a_system_id, a_public_id)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			owner_node, previous_sibling: INTEGER
		do
			document.add_node (Element_node, current_depth, -1, -1, a_name_code)
			node_number := document.last_node_added

			if a_type_code /= 0 then
				-- TODO
			end

			previous_sibling := previously_at_depth.item (current_depth)

			owner_node := previously_at_depth.item (current_depth - 1)
			if previous_sibling > 0 then
				debug ("XPath tiny builder")
					std.error.put_string ("Setting next sibling for ")
					std.error.put_string (previous_sibling.out)
					std.error.put_string (" to element node ")
					std.error.put_string (node_number.out)
					std.error.put_string (" when at depth ")
					std.error.put_string (current_depth.out)
					std.error.put_new_line
				end
				document.set_next_sibling (node_number, previous_sibling)
			end

			debug ("XPath tiny builder")
				std.error.put_string ("Found an element with local name: ")
				std.error.put_string (name_pool.local_name_from_name_code (a_name_code))
				std.error.put_string (", node number is: ")
				std.error.put_string (node_number.out)
				std.error.put_string (", at depth ")
				std.error.put_string (current_depth.out)
				std.error.put_string (". Previous sibling is: ")
				std.error.put_string (previous_sibling.out)
				std.error.put_string (", owner is: ")
				std.error.put_string (owner_node.out)
				std.error.put_new_line
				std.error.put_string ("Name code is ")
				std.error.put_string (a_name_code.out)
				std.error.put_new_line
			end
			debug ("XPath tiny builder")
				std.error.put_string ("Setting owner for element ")
					std.error.put_string (node_number.out)
					std.error.put_string (" to ")
					std.error.put_string (owner_node.out)
					std.error.put_string (" when at depth ")
					std.error.put_string (current_depth.out)
					std.error.put_new_line
			end
			document.set_next_sibling (owner_node, node_number) -- owner pointer in last sibling
			
			previously_at_depth.put (node_number, current_depth)
			current_depth := current_depth + 1
			if current_depth > previously_at_depth.count then
				previously_at_depth.resize (1, previously_at_depth.count)
			end
			previously_at_depth.put (-1, current_depth) -- no previous sibling

			-- TODO - locator stuff
		end

	namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace;
			-- Namespaces are notified after the `start_element' event, and before
			--  any children for the element. The namespaces that are reported are only required
			--  to include those that are different from the parent element; however, duplicates may be reported.
			-- A namespace must not conflict with any namespaces already used for element or attribute names.
		do
				document.add_namespace (node_number + 1, a_namespace_code)			
		end

	attribute (a_name_code: INTEGER; a_type_code: INTEGER; value: STRING; properties: INTEGER) is
			-- Notify an attribute;
			-- Attributes are notified after the `start_element' event, and before any
			--  children. Namespaces and attributes may be intermingled
		do
				document.add_attribute (node_number, a_name_code, a_type_code, value)
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces;
			-- Note that the initial receiver of output from XSLT instructions will not receive this event,
			--  it has to detect it itself. Note that this event is reported for every element even if it has
			--  no attributes, no namespaces, and no content.
		do
			node_number := node_number + 1
		end
	
	end_element is
			-- Notify the end of an element;
			-- The receiver must maintain a stack if it needs to know which
			--  element is ending.
		do
			previously_at_depth.put (-1, current_depth)
			current_depth := current_depth - 1			
		end

	characters (chars: STRING; properties: INTEGER) is
			-- Notify character data
		local
			buffer_start, previous_sibling: INTEGER
		do
			buffer_start := document.character_buffer_length
			document.append_characters (chars)
			document.add_node (Text_node, current_depth, buffer_start, chars.count, -1)
			node_number := document.last_node_added

			previous_sibling := previously_at_depth.item (current_depth)
			if previous_sibling > 0 then
				debug ("XPath tiny builder")
					std.error.put_string ("Setting next sibling for ")
					std.error.put_string (previous_sibling.out)
					std.error.put_string (" to text node ")
					std.error.put_string (node_number.out)
					std.error.put_string (" when at depth ")
					std.error.put_string (current_depth.out)
					std.error.put_new_line
				end				
				document.set_next_sibling (node_number, previous_sibling)
			end
			debug ("XPath tiny builder")
				std.error.put_string ("Setting owner for text node ")
				std.error.put_string (node_number.out)
				std.error.put_string (" to ")
				std.error.put_string (node_number.out)
				std.error.put_string (" when at depth ")
				std.error.put_string (previously_at_depth.item (current_depth - 1).out)
				std.error.put_new_line
			end			
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
		end

	
	processing_instruction (target: STRING; data: STRING; properties: INTEGER) is
			-- Notify a processing instruction
		local
			name_code, previous_sibling: INTEGER
		do
			if not name_pool.is_name_code_allocated ("", "", target) then
				name_pool.allocate_name ("", "", target)
				name_code := name_pool.last_name_code
			else
				name_code := name_pool.name_code ("", "", target) 
			end
			document.store_comment (data)
			document.add_node (Processing_instruction_node, current_depth, document.comment_buffer_length, data.count, name_code)
			node_number := document.last_node_added
			
			previous_sibling := previously_at_depth.item (current_depth)
			if previous_sibling > 0 then
				debug ("XPath tiny builder")
					std.error.put_string ("Setting next sibling for ")
					std.error.put_string (previous_sibling.out)
					std.error.put_string (" to PI node ")
					std.error.put_string (node_number.out)
					std.error.put_string (" when at depth ")
					std.error.put_string (current_depth.out)
					std.error.put_new_line
				end
				document.set_next_sibling (node_number, previous_sibling)
			end
			debug ("XPath tiny builder")
				std.error.put_string ("Setting owner for PI node ")
				std.error.put_string (node_number.out)
				std.error.put_string (" to ")
				std.error.put_string (node_number.out)
				std.error.put_string (" when at depth ")
				std.error.put_string (previously_at_depth.item (current_depth - 1).out)
				std.error.put_new_line
			end		
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)		
		end

	comment (content: STRING; properties: INTEGER) is
			-- Notify a comment;
			-- Comments are only notified if they are outside the DTD.
		local
			previous_sibling: INTEGER
		do
			document.store_comment (content)
			document.add_node (Comment_node, current_depth, document.comment_buffer_length, content.count, -1)
			node_number := document.last_node_added
			
			previous_sibling := previously_at_depth.item (current_depth)
			if previous_sibling > 0 then
				debug ("XPath tiny builder")
					std.error.put_string ("Setting next sibling for ")
					std.error.put_string (previous_sibling.out)
					std.error.put_string (" to comment node ")
					std.error.put_string (node_number.out)
					std.error.put_string (" when at depth ")
					std.error.put_string (current_depth.out)
					std.error.put_new_line
				end				
				document.set_next_sibling (node_number, previous_sibling)
			end
			debug ("XPath tiny builder")
				std.error.put_string ("Setting owner for comment node ")
				std.error.put_string (node_number.out)
				std.error.put_string (" to ")
				std.error.put_string (node_number.out)
				std.error.put_string (" when at depth ")
				std.error.put_string (previously_at_depth.item (current_depth - 1).out)
				std.error.put_new_line
			end					
			document.set_next_sibling (previously_at_depth.item (current_depth - 1), node_number) -- owner pointer in last sibling
			previously_at_depth.put (node_number, current_depth)
		end

	end_document is
			-- Parsing finished.
		do
			-- previously_at_depth.put (-1, current_depth) -- i.e. depth has not been reached yet
			previously_at_depth := Void
			-- TODO add timing information
		end
	
feature -- Implementation control

	estimated_node_count: INTEGER
			-- An estimate of how many nodes there will be in the fully constructed tree

	estimated_attribute_count: INTEGER
			-- An estimate of how many attributes there will be in the fully constructed tree

	estimated_namespace_count: INTEGER
			-- An estimate of how many namespaces there will be in the fully constructed tree

	estimated_character_count: INTEGER
			-- An estimate of how many characters there are in the document contents

	reset_defaults is
			-- Use the default tree implementation parameters
		require
			always_allowed: True
		do
			defaults_overridden := False
		ensure
			default_parameters_in_use: defaults_overridden = False
		end

	set_defaults (new_estimated_node_count: INTEGER; new_estimated_attribute_count: INTEGER; new_estimated_namespace_count: INTEGER; new_estimated_character_count: INTEGER) is
			-- Supply values for the tree implementation parameters
		require
			positive_node_count: estimated_node_count > 0
			attribute_count: estimated_attribute_count >= 0
			namespace_count: estimated_namespace_count >= 0
			character_count: estimated_character_count >= 0
		do
			estimated_node_count := new_estimated_node_count
			estimated_attribute_count := new_estimated_attribute_count
			estimated_namespace_count := new_estimated_namespace_count
			estimated_character_count := new_estimated_character_count
			defaults_overridden := True
		ensure
			correct_node_count: estimated_node_count = new_estimated_node_count
			correct_attribute_count: estimated_attribute_count = new_estimated_attribute_count
			correct_namespace_count: estimated_namespace_count = new_estimated_namespace_count
			correct_character_count: estimated_character_count = new_estimated_character_count
			default_parameters_overridden: defaults_overridden = True
		end

feature {NONE} -- Implementation

	defaults_overridden: BOOLEAN
			-- `True' only if `set_defaults' has been called more recently than `reset_defaults'
	
	current_depth: INTEGER
			-- Depth within the tree;
			-- The document node is level 0;
			-- The document element is level 1.

	node_number: INTEGER
			-- The local sequence number for a node within this document

	previously_at_depth: ARRAY [INTEGER]
			-- Scaffolding used whilst building the tree;
			-- Values are node numbers

	system_id: STRING
			-- The SYSTEM id of the document being processed
			-- TODO - set this in the document to the base-URI

invariant
	positive_depth: current_depth >= 0
	name_pool_not_void: name_pool /= Void

end

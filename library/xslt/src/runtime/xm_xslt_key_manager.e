note

	description:

		"XSLT key managers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_MANAGER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

	XM_XPATH_SHARED_ATOMIC_VALUE_TESTER
		export {NONE} all end

	XM_XPATH_SHARED_64BIT_TESTER
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_AXIS

		-- Separate this class into a pure interface, plus an implementation class.
		--  (hm. perhaps template design pattern would be better)
		-- Then add a COMPONENTS_FACTORY class which will provide instances of KEY_MANAGERs
		--  (and NAME_POOLs), so that non-portable classes can be written to make use of
		--  compiler-specific weak references (e.g. IDENTIFIED in ISE).
		-- That way, we can avoid locking multiple documents in memory.

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant.
		do
			create key_map.make_map_default
			create collation_map.make_with_equality_testers (5, string_equality_tester, Void)
			create document_map.make_map_default
			-- TODO - register idref() support
		end

feature -- Access

	last_key_sequence: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		-- Result from `generate_keyed_sequence'

	generate_keyed_sequence (a_key_fingerprint: INTEGER; a_document: XM_XPATH_DOCUMENT; a_key_value: XM_XPATH_ATOMIC_VALUE;
						  a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Generate a sequence of nodes for a particular key value
		require
			strictly_positive_key_fingerprint: a_key_fingerprint > 0
			document_not_void: a_document /= Void
			key_value_not_void: a_key_value /= Void
			context_not_void: a_context /= Void
		local
			l_item_type: INTEGER
			l_value: detachable XM_XPATH_ATOMIC_VALUE
			l_index: XM_XSLT_KEY_INDEX
			l_key_set: XM_XSLT_KEY_SET
			--a_key_definition: XM_XSLT_KEY_DEFINITION
			l_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			--a_collator: ST_COLLATOR
			l_error: XM_XPATH_ERROR_VALUE
		do
			check attached a_context.transformer as l_context_transformer then
				last_key_sequence := Void
				l_item_type := a_key_value.item_type.primitive_type
				l_key_set := key_definitions (a_key_fingerprint)
				if l_key_set.is_backwards_compatible then
					a_key_value.convert_to_type (type_factory.string_type)
					l_value := a_key_value.converted_value
					l_item_type := String_type_code
				elseif l_item_type = Integer_type_code or else
					l_item_type = Decimal_type_code or else
					l_item_type = Float_type_code then
					l_item_type := Double_type_code
					check attached type_factory.schema_type (l_item_type) as l_schema_type then
						a_key_value.convert_to_type (l_schema_type)
						l_value := a_key_value.converted_value
					end
				else
					l_value := a_key_value
				end
				if does_index_exist (a_document, a_key_fingerprint, l_item_type) then
					l_index := index (a_document, a_key_fingerprint, l_item_type)
					if l_index.is_under_construction then
						create l_error.make_from_string ("Key definition is circular", Xpath_errors_uri, "XTDE0640", Dynamic_error)
						l_context_transformer.report_fatal_error (l_error)
					end
				else
					create l_index.make_under_construction
					put_index (a_document, a_key_fingerprint, l_item_type, l_index)
					build_index (a_key_fingerprint, l_item_type, a_document, a_context)
					if not l_context_transformer.is_error then
						check postcondition_of_build_index: attached last_built_index as l_last_built_index then
							l_index := l_last_built_index
							put_index (a_document, a_key_fingerprint, l_item_type, l_index)
						end
					end
				end
				if not l_context_transformer.is_error then
					check l_value /= Void then
						--  TODO - collation keys
						--a_key_definition := key_definitions (a_key_fingerprint).item (1)
						-- a_collator := a_key_definition.collator
						if l_item_type = Untyped_atomic_type_code then
							--  TODO - collation keys
							l_value.convert_to_type (type_factory.string_type)
							check postcondition_of_convert_to_type: attached l_value.converted_value as l_converted_value then
								l_value := l_converted_value
							end
						end
						if l_index.has (l_value) then
							check attached l_index.map as l_index_map then
								l_list := l_index_map.item (l_value)
								create {XM_XPATH_ARRAY_NODE_LIST_ITERATOR} last_key_sequence.make (l_list)
							end
						else
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_key_sequence.make
						end
					end
				end
			end
		ensure
			a_context_transformer_not_void: attached a_context.transformer as l_context_transformer
			possible_error: l_context_transformer.is_error implies last_key_sequence = Void
			iterator_not_void: not l_context_transformer.is_error implies last_key_sequence /= Void -- of course, the iteration may well yield zero nodes
		end

	collation_uri (a_key_fingerprint: INTEGER): STRING
			-- Collation URI for the key defined by a_key_fingerprint'
		require
			key_defined: has_key (a_key_fingerprint)
		do
			Result := collation_map.item (a_key_fingerprint)
		ensure
			collation_uri_not_void: Result /= Void
		end

	key_definitions (a_key_fingerprint: INTEGER): XM_XSLT_KEY_SET
			-- List of key definitions matching `a_key_fingerprint:'
		require
			key_defined: has_key (a_key_fingerprint)
		do
			Result := key_map.item (a_key_fingerprint)
		ensure
			key_definitions_set_not_void: Result /= Void
		end

feature -- Status report

	has_key (a_key_fingerprint: INTEGER): BOOLEAN
			-- Is there a key definition for `a_key_fingerprint'?
		do
			Result := key_map.has (a_key_fingerprint)
		end

	is_same_collation (a_key_definition: XM_XSLT_KEY_DEFINITION; a_key_fingerprint: INTEGER): BOOLEAN
			-- Does `a_key_definition' use the same collation as all keys defined to map to `a_key_fingerprint'?
		require
			key_definition_not_void: a_key_definition /= Void
		do
			if not key_map.has (a_key_fingerprint) then
				Result := True
			else
				Result := collation_map.has (a_key_fingerprint) and then STRING_.same_string (collation_uri (a_key_fingerprint), a_key_definition.collation_uri)
			end
		end

feature -- Element change

	add_key_definition (a_key_definition: XM_XSLT_KEY_DEFINITION; a_key_fingerprint: INTEGER)
			-- Add a key definition.
		require
			key_definition_not_void: a_key_definition /= Void
			same_collation: is_same_collation (a_key_definition, a_key_fingerprint)
		local
			l_key_list: XM_XSLT_KEY_SET
		do
			key_map.search (a_key_fingerprint)
			if key_map.found then
				l_key_list := key_map.found_item
				check
					collation_map_entry: collation_map.has (a_key_fingerprint)
					-- as this routine ensures it
				end
			else
				create l_key_list.make (a_key_fingerprint)
				key_map.force_new (l_key_list, a_key_fingerprint)
				collation_map.force (a_key_definition.collation_uri, a_key_fingerprint)
			end
			l_key_list.add_definition (a_key_definition)
		ensure
			has_key: has_key (a_key_fingerprint)
			key_definition_added: True -- TODO
		end

	allocate_slots
			-- Allocate stack-frame slots in bodies of all key definitions.
		local
			l_table_cursor: DS_HASH_TABLE_CURSOR [XM_XSLT_KEY_SET, INTEGER]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_KEY_DEFINITION]
		do
			from
				l_table_cursor := key_map.new_cursor
				l_table_cursor.start
			until
				l_table_cursor.after
			loop
				from l_cursor := l_table_cursor.item.key_definitions.new_cursor
				l_cursor.start until l_cursor.after loop
					l_cursor.item.allocate_slots
					l_cursor.forth
				end
				l_table_cursor.forth
			end
		end


feature {NONE} -- Implementation

	key_map: DS_HASH_TABLE [XM_XSLT_KEY_SET, INTEGER]
			-- Map of fingerprints to key sets

	collation_map: DS_HASH_TABLE [STRING, INTEGER]
			-- Map of fingerprints to collation_names

	document_map: DS_HASH_TABLE [DS_HASH_TABLE [XM_XSLT_KEY_INDEX, XM_XPATH_64BIT_NUMERIC_CODE], XM_XPATH_DOCUMENT]
			-- Map of documents in memory to a map of key-fingerprint/item-types to indices of key/value pairs

	last_built_index: detachable XM_XSLT_KEY_INDEX
			-- Result from `build_index'

	build_index (a_key_fingerprint, a_item_type: INTEGER; a_document: XM_XPATH_DOCUMENT; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Build index for `a_document' for a named key.
		require
			document_not_void: a_document /= Void
			context_not_void: a_context /= Void
			transformer_not_in_error: attached a_context.transformer as l_context_transformer and then not l_context_transformer.is_error
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_KEY_DEFINITION]
			l_message: STRING
			l_map: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_NODE], XM_XPATH_ATOMIC_VALUE]
			l_error: XM_XPATH_ERROR_VALUE
		do
			check precondition_transformer_not_void: attached a_context.transformer as l_context_transformer_2 then
				debug ("XSLT key manager")
					std.error.put_string ("Ready to build an index%N")
				end
				last_built_index := Void
				if has_key (a_key_fingerprint) then
					create l_map.make_with_equality_testers (10, Void, atomic_value_tester)
					from
						l_cursor := key_definitions (a_key_fingerprint).key_definitions.new_cursor
						l_cursor.start
					until
						l_cursor.after
					loop
						construct_index (a_document, l_map, l_cursor.item, a_item_type, a_context, l_cursor.index = 1)
						l_cursor.forth
					end
					if not l_context_transformer_2.is_error then create last_built_index.make (l_map) end
				else
					l_message := STRING_.concat ("Key ", shared_name_pool.display_name_from_name_code (a_key_fingerprint))
					l_message := STRING_.appended_string (l_message, " has not been defined")
					create l_error.make_from_string (l_message, Xpath_errors_uri, "XTDE1260", Dynamic_error)
					l_context_transformer_2.report_fatal_error (l_error)
				end
			end
		ensure
			transformer_not_void: attached a_context.transformer as l_context_transformer
			error_or_index_built: not l_context_transformer.is_error implies last_built_index /= Void
		end

	construct_index (a_document: XM_XPATH_DOCUMENT; a_map: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_NODE], XM_XPATH_ATOMIC_VALUE];
		a_key: XM_XSLT_KEY_DEFINITION; a_sought_item_type: INTEGER; a_context: XM_XSLT_EVALUATION_CONTEXT; is_first: BOOLEAN)
			-- Fill in `a_map' for `a_key'.
		require
			document_not_void: a_document /= Void
			context_not_void: a_context /= Void
			transformer_not_in_error: attached a_context.transformer as l_context_transformer and then not l_context_transformer.is_error
			map_not_void: a_map /= Void
			key_not_void: a_key /= Void
		local
			use: XM_XPATH_EXPRESSION
			match: XM_XSLT_PATTERN
			a_node_type: INTEGER
			all_nodes_iterator, an_attribute_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node, another_node: XM_XPATH_NODE
			a_collator: ST_COLLATOR
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
			a_slot_manager: XM_XPATH_SLOT_MANAGER
		do
			check precondition_transformer_not_void: attached a_context.transformer as l_context_transformer then
				use := a_key.body
				match := a_key.match
				a_collator := a_key.collator
				a_new_context := a_context.new_context
				a_slot_manager := a_key.slot_manager
				if a_slot_manager.number_of_variables > 0 then
					a_new_context.open_stack_frame (a_slot_manager)
				end
				a_node_type := match.node_kind
				if a_node_type = Attribute_node or else a_node_type = Any_node or else a_node_type = Document_node then
					-- If the match pattern allows attributes to appear, we must visit them.
					-- We also take this path in the ridiculous event that the pattern can match document nodes.
					from
						all_nodes_iterator := a_document.new_axis_iterator (Descendant_or_self_axis); all_nodes_iterator.start
					until
						l_context_transformer.is_error or all_nodes_iterator.after
					loop
						a_node := all_nodes_iterator.item
						if a_node.node_type = Element_node then
							from
								an_attribute_iterator := a_node.new_axis_iterator (Attribute_axis); an_attribute_iterator.start
							until
								l_context_transformer.is_error or an_attribute_iterator.after
							loop
								another_node := an_attribute_iterator.item
								match.match (another_node, a_new_context.new_pattern_context)
								if not l_context_transformer.is_error and match.last_match_result then
									process_key_node (another_node, use, a_sought_item_type, a_collator, a_map, a_new_context, is_first)
								end
								an_attribute_iterator.forth
							end
							if a_node_type = Any_node then
								-- Index the element as well as it's attributes
								match.match (a_node, a_new_context.new_pattern_context)
								if not l_context_transformer.is_error and match.last_match_result then
									process_key_node (a_node, use, a_sought_item_type, a_collator, a_map, a_new_context, is_first)
								end
							end
						else
							match.match (a_node, a_new_context.new_pattern_context)
							if not l_context_transformer.is_error and match.last_match_result then
								process_key_node (a_node, use, a_sought_item_type, a_collator, a_map, a_new_context, is_first)
							end
						end
						all_nodes_iterator.forth
					end
				else
					from
						all_nodes_iterator := a_document.new_axis_iterator_with_node_test (Descendant_axis, match.node_test); all_nodes_iterator.start
					until
						l_context_transformer.is_error or all_nodes_iterator.after
					loop
						a_node := all_nodes_iterator.item
						-- If `match' is a node test, we avoid testing it a second time
						if attached {XM_XSLT_NODE_TEST} match as a_node_test then
							process_key_node (a_node, use, a_sought_item_type, a_collator, a_map, a_new_context, is_first)
						else
							match.match (a_node, a_new_context.new_pattern_context)
							if not l_context_transformer.is_error and match.last_match_result then
								process_key_node (a_node, use, a_sought_item_type, a_collator, a_map, a_new_context, is_first)
							end
						end
						all_nodes_iterator.forth
					end
				end
			end
		end

	process_key_node (a_node: XM_XPATH_NODE; a_use: XM_XPATH_EXPRESSION; a_sought_item_type: INTEGER;
		a_collator: ST_COLLATOR; a_map: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_NODE], XM_XPATH_ATOMIC_VALUE];
		a_context: XM_XSLT_EVALUATION_CONTEXT; a_is_first: BOOLEAN)
			-- Process one matching node, adding entries to the index if appropriate.
		require
			node_not_void: a_node /= Void
			a_use_not_void: a_use /= Void
			map_not_void: a_map /= Void
			collator: a_collator /= Void
			context_not_void: a_context /= Void
		local
			l_singleton_iterator: XM_XPATH_SINGLETON_NODE_ITERATOR
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_value: detachable XM_XPATH_ATOMIC_VALUE
			l_actual_item_type: INTEGER
			l_finished: BOOLEAN
		do

			-- Make the node we are testing the context node and the current node,
			--  with context position and context size set to 1

			create l_singleton_iterator.make (a_node)
			l_singleton_iterator.start
			a_context.set_current_iterator (l_singleton_iterator)

			-- Evaluate the "use" expression against this context node

			a_use.create_iterator (a_context)
			check
				postcondition_of_create_iterator: attached a_use.last_iterator as l_last_iterator
				attached a_context.transformer as l_context_transformer
			then
				from
					l_iterator := l_last_iterator
					if attached l_iterator.error_value as l_error_value then
						check is_error: l_iterator.is_error end
						l_context_transformer.report_fatal_error (l_error_value)
					else
						l_iterator.start
					end
				until
					l_finished or l_iterator.is_error or else l_iterator.after
				loop
					check
						atomic_values: attached {XM_XPATH_ATOMIC_VALUE} l_iterator.item as l_atomic_value
						-- Use attribute is statically type-checked - sequence constructor is not yet supported
					then
						l_actual_item_type := l_atomic_value.item_type.primitive_type
						if are_types_comparable (l_actual_item_type, a_sought_item_type) then
							if a_sought_item_type = Untyped_atomic_type_code then

								-- If the supplied key value is untyped atomic, we build an index using the
								--  actual type returned by the use expression.
								-- TODO: collation keys

								create {XM_XPATH_STRING_VALUE} l_value.make (l_atomic_value.string_value)
							elseif a_sought_item_type = String_type_code then

								-- If the supplied key value is a string, there is no match unless the use expression
								--  returns a string or an untyped atomic value.
								-- TODO: collation keys

								create {XM_XPATH_STRING_VALUE} l_value.make (l_atomic_value.string_value)
							else
								if attached {XM_XPATH_NUMERIC_VALUE} l_atomic_value as l_numeric_value and then l_numeric_value.is_nan then
									-- ignore NaN
									l_finished := True
								else
									check attached type_factory.schema_type (a_sought_item_type) as l_schema_type then
										if l_atomic_value.is_convertible (l_schema_type) then
											l_atomic_value.convert_to_type (l_schema_type)
											check postcondition_of_convert_to_type: attached l_atomic_value.converted_value as l_converted_value then
												l_value := l_converted_value
											end
										else
											l_finished := True
										end
									end
								end
							end
							if not l_finished then
								check not_finished: l_value /= Void then
									add_node_to_index (a_node, a_map, l_value, a_is_first)
								end
							end
						end
					end
					l_iterator.forth
				end
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					l_context_transformer.report_fatal_error (l_error_value)
				end
			end
		end

	add_node_to_index (a_node: XM_XPATH_NODE; a_map: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_NODE], XM_XPATH_ATOMIC_VALUE];
							 a_value: XM_XPATH_ATOMIC_VALUE; a_is_first: BOOLEAN)
			-- Add `a_node' to `a_map'.
		require
			node_not_void: a_node /= Void
			map_not_void: a_map /= Void
			value_not_void: a_value /= Void
		local
			a_node_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_NODE]
			a_local_order_comparer: XM_XPATH_LOCAL_ORDER_COMPARER
			a_comparison: INTEGER
			added: BOOLEAN
		do
			a_map.search (a_value)
			if a_map.found then
				a_node_list := a_map.found_item

				-- This is not the first node with this key value.
				-- Add the node to the list of nodes for this key,
				--  unless it's already there

				if a_is_first then

					-- If this is the first index definition that we're processing,
					--  then this node must be after all existing nodes in document
					--  order, or the same node as the last existing node

					if a_node_list.is_empty or else a_node_list.last /= a_node then
						if not a_node_list.extendible (1) then
							a_node_list.resize (2 * a_node_list.count)
						end
						a_node_list.put_last (a_node)
					end
				else

					-- Otherwise, we need to insert the node at the correct
					--  position in document order.

					create a_local_order_comparer
					from
						a_cursor := a_node_list.new_cursor; a_cursor.start
					until
						a_cursor.after
					loop
						a_comparison := a_local_order_comparer.three_way_comparison (a_node, a_cursor.item)
						if a_comparison <= 0 then
							if a_comparison = 0 then

								-- Node already in list; do nothing.

							else

								-- Add the node at this position.

								a_cursor.force_left (a_node)
							end
							added := True
							a_cursor.go_after
						else
							a_cursor.forth
						end
					variant
						a_node_list.count + 1 - a_cursor.index
					end

					-- Otherwise add the new node at the end.

					if not added then
						if not a_node_list.extendible (1) then
							a_node_list.resize (2 * a_node_list.count)
						end
						a_node_list.put_last (a_node)
					end
				end
			else
				create a_node_list.make_default
				a_map.force_new (a_node_list, a_value)
				if not a_node_list.extendible (1) then
					a_node_list.resize (2 * a_node_list.count)
				end
				a_node_list.put_last (a_node)
			end
		end

	put_index (a_document: XM_XPATH_DOCUMENT; a_key_fingerprint, an_item_type: INTEGER; an_index: XM_XSLT_KEY_INDEX)
			-- Save the index associated with `a_key_fingerprint', `an_item_type', and `a_document'.
		require
			document_not_void: a_document /= Void
			index_not_void: an_index /= Void
		local
			an_index_map: DS_HASH_TABLE [XM_XSLT_KEY_INDEX, XM_XPATH_64BIT_NUMERIC_CODE]
			a_long: XM_XPATH_64BIT_NUMERIC_CODE
		do
			document_map.search (a_document)
			if document_map.found then
				an_index_map := document_map.found_item
			else
				create an_index_map.make_with_equality_testers (10, Void, long_equality_tester)
				document_map.force_new (an_index_map, a_document)
			end
			create a_long.make (a_key_fingerprint, an_item_type)
			an_index_map.search (a_long)
			if an_index_map.found then
				check
					an_index_map.found_item.is_under_construction
					-- Logic of `sequence_by_key'
				end
				an_index_map.replace_found_item (an_index)
			else
				an_index_map.force_new (an_index, a_long)
			end
		ensure
			index_exists: does_index_exist (a_document, a_key_fingerprint, an_item_type)
		end

	does_index_exist (a_document: XM_XPATH_DOCUMENT; a_key_fingerprint, an_item_type: INTEGER): BOOLEAN
			-- Is there an index for `a_key_fingerprint', `an_item_type', and `a_document'?
		require
			document_not_void: a_document /= Void
		local
			an_index_map: DS_HASH_TABLE [XM_XSLT_KEY_INDEX, XM_XPATH_64BIT_NUMERIC_CODE]
			a_long: XM_XPATH_64BIT_NUMERIC_CODE
		do
			if document_map.has (a_document) then
				an_index_map := document_map.item (a_document)
				create a_long.make (a_key_fingerprint, an_item_type)
				Result := an_index_map.has (a_long)
			end
		end

	index (a_document: XM_XPATH_DOCUMENT; a_key_fingerprint, an_item_type: INTEGER): XM_XSLT_KEY_INDEX
			-- Index associated with `a_key_fingerprint', `an_item_type', and `a_document'
		require
			document_not_void: a_document /= Void
			index_exists: does_index_exist (a_document, a_key_fingerprint, an_item_type)
		local
			an_index_map: DS_HASH_TABLE [XM_XSLT_KEY_INDEX, XM_XPATH_64BIT_NUMERIC_CODE]
			a_long: XM_XPATH_64BIT_NUMERIC_CODE
		do
			check
				index_map_exists: document_map.has (a_document)
				-- From pre-condition
			end
			an_index_map := document_map.item (a_document)
			create a_long.make (a_key_fingerprint, an_item_type)
			Result := an_index_map.item (a_long)
		ensure
			index_not_void: Result /= Void
		end

invariant

	document_map_not_void: document_map /= Void
	key_map: key_map /= Void
	collation_map: collation_map /= Void
		-- coordinated_maps: forall.a_key_fingerprint key_map.has (a_key_fingerprint) implies collation_map.has (a_key_fingerprint)

end


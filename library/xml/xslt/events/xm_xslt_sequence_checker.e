indexing

	description:

		"Receivers that perform type checking."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_SEQUENCE_CHECKER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, notify_namespace, notify_attribute, end_element,
			notify_characters, notify_processing_instruction, notify_comment
		end

	XM_XSLT_SEQUENCE_RECEIVER

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_SHARED_ANY_NODE_TEST

	XM_XPATH_CARDINALITY

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES

		-- This is a receiver that can be inserted into a pipeline to do type checking of the
		--  nodes and/or atomic values produced by a content constructor, as they are written.
		-- It is used, for example, when xsl:sequence has an "as" attribute to indicate the required
		--  type, or to enforce the "as" attribute on xsl:template.
 
		-- This filter also atomizes any nodes in the sequence if the required item type
		--  is atomic.

creation

	make

feature {NONE} -- Initialization

	make (a_required_type: XM_XPATH_SEQUENCE_TYPE; an_underlying_receiver: XM_XSLT_SEQUENCE_RECEIVER) is
			-- Establish invariant.
		require
			required_type_not_void: a_required_type /= Void
			underlying_receiver_not_void: an_underlying_receiver /= Void
		local
			an_atomic_type: XM_XPATH_ATOMIC_TYPE
		do
			base_receiver := an_underlying_receiver
			underlying_receiver := an_underlying_receiver
			item_type := a_required_type.primary_type
			cardinality := a_required_type.cardinality
			an_atomic_type ?= item_type
			if an_atomic_type /= Void then atomize := True end
			if item_type = any_item or else item_type = any_node_test then allow_any_node := True end
			system_id := an_underlying_receiver.system_id
		ensure
			base_receiver_set: base_receiver = an_underlying_receiver
			item_type_set: item_type = a_required_type.primary_type
			cardinality_set: cardinality = a_required_type.cardinality
		end

feature -- Events

		start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			finished: BOOLEAN
		do
			level := level + 1
			if level = 1 then
				if atomize then
					create buffer.make (0)
					finished := True
				else

				end
			end
			if not finished then Precursor (a_name_code, a_type_code, properties) end
		end

	end_element is
			-- Notify the end of an element.
		local
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
		do
			level := level - 1
			if buffer /= Void then
				if level = 0 then
					create an_untyped_atomic_value.make (buffer)
					append_item (an_untyped_atomic_value)
					buffer := Void
				end
			else
				Precursor
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		local
			finished: BOOLEAN
			a_node_test: XM_XPATH_NODE_TEST
		do
			if level = 0 then
				if atomize then
					finished := True -- discard the namespace node when atomizing
				else
					item_count := item_count + 1
					if item_count = 2 and then not is_cardinality_allows_many (cardinality) then
						on_error ("The output sequence contains more than one item, only one is allowed")
						finished := True
					else
						a_node_test ?= item_type
						if not (allow_any_node or else (a_node_test /= Void and then a_node_test.matches_node (Namespace_node, -1, -1))) then
							on_error ("The output sequence is not allowed to contain namespace nodes")
							finished := True
						end
					end
				end
			elseif buffer /= Void then
				finished := True -- discard the namespace node
			end
			if not finished then Precursor (a_namespace_code, properties) end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			finished: BOOLEAN
			a_string_value: XM_XPATH_STRING_VALUE
			a_node_test: XM_XPATH_NODE_TEST
		do
			if level = 0 then
				if atomize then
					create a_string_value.make (a_value)
					check
						convertible: a_string_value.is_convertible (item_type)
						-- TODO: justify this
					end
					append_item (a_string_value.convert_to_type (item_type))
					finished := True
				else
					item_count := item_count + 1
					if item_count = 2 and then not is_cardinality_allows_many (cardinality) then
						on_error ("The output sequence contains more than one item, only one is allowed")
						finished := True
					elseif allow_any_node then
						do_nothing
					else
						a_node_test ?= item_type
						if a_node_test /= Void and then a_node_test.matches_node (Attribute_node, fingerprint_from_name_code (a_name_code), a_type_code) then
							do_nothing
						else
							on_error ("This attribute node does not conform to the required type")
							finished := True
						end
					end
				end
			end
			if not finished then Precursor (a_name_code, a_type_code, a_value, properties) end
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			finished: BOOLEAN
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_node_test: XM_XPATH_NODE_TEST
		do
			if level = 0 then
				if atomize then
					create an_untyped_atomic_value.make (chars)
					append_item (an_untyped_atomic_value)
					finished := True
				else
					item_count := item_count + 1
					if item_count = 2 and then not is_cardinality_allows_many (cardinality) then
						on_error ("The output sequence contains more than one item, only one is allowed")
						finished := True
					elseif allow_any_node then
						do_nothing
					else
						a_node_test ?= item_type
						if a_node_test /= Void and then a_node_test.allows_text_nodes then
							do_nothing
						else
							on_error ("The output sequence is not allowed to contain text nodes")
							finished := True
						end
					end
				end
			elseif buffer /= Void then
				buffer := STRING_.appended_string (buffer, chars)
				finished := True
			end
			if not finished then Precursor (chars, properties) end
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			finished: BOOLEAN
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_node_test: XM_XPATH_NODE_TEST
		do
			if level = 0 then
				if atomize then
					create an_untyped_atomic_value.make (a_data_string)
					append_item (an_untyped_atomic_value)
					finished := True
				else
					item_count := item_count + 1
					if item_count = 2 and then not is_cardinality_allows_many (cardinality) then
						on_error ("The output sequence contains more than one item, only one is allowed")
						finished := True
					elseif allow_any_node then
						do_nothing
					else
						a_node_test ?= item_type
						if a_node_test /= Void and then a_node_test.matches_node (Processing_instruction_node, -1, -1) then
							do_nothing
						else
							on_error ("The result sequence does not allow processing instructions")
							finished := True
						end
					end
				end
			elseif buffer /= Void then
				finished := True -- discard PI
			end
			if not finished then Precursor (a_name, a_data_string, properties) end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		local
			finished: BOOLEAN
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_node_test: XM_XPATH_NODE_TEST
		do
			if level = 0 then
				if atomize then
					create an_untyped_atomic_value.make (a_content_string)
					append_item (an_untyped_atomic_value)
					finished := True
				else
					item_count := item_count + 1
					if item_count = 2 and then not is_cardinality_allows_many (cardinality) then
						on_error ("The output sequence contains more than one item, only one is allowed")
						finished := True
					elseif allow_any_node then
						do_nothing
					else
						a_node_test ?= item_type
						if a_node_test /= Void and then a_node_test.matches_node (Comment_node, -1, -1) then
							do_nothing
						else
							on_error ("The result sequence does not allow comments")
							finished := True
						end
					end
				end
			elseif buffer /= Void then
				finished := True -- discard comment
			end
			if not finished then Precursor (a_content_string, properties) end
		end

	append_item (an_item: XM_XPATH_ITEM) is
			-- Output an item (atomic value or node) to the sequence.
		local
			a_node: XM_XPATH_NODE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_typed_item: XM_XPATH_ITEM
			finished: BOOLEAN
		do
			if level = 0 then
				a_node ?= an_item
				if atomize and then a_node /= Void then
					from
						an_iterator := an_item.typed_value; an_iterator.start
					until
						an_iterator.after
					loop
						append_item (an_iterator.item)
						an_iterator.forth
					end
					finished := True
				elseif item_count = 1 and then not is_cardinality_allows_many (cardinality) then
					on_error ("The output sequence contains more than one item, only one is allowed")
					finished := True
				elseif item_type.matches_item (an_item) then
					a_typed_item := an_item
				else
					an_untyped_atomic_value ?= an_item
					if	an_untyped_atomic_value /= Void and then an_untyped_atomic_value.is_convertible (item_type) then
						a_typed_item := an_untyped_atomic_value.convert_to_type (item_type)
					else
						on_error ("The output sequence is not allowed to contain items of type " + an_item.type_name )
						finished := True
					end
				end
			else
				a_typed_item := an_item
			end
			if not finished then
				underlying_receiver.append_item (a_typed_item)
				item_count := item_count + 1
			end
		end

	final_check is
			-- Final check for empty sequence.
		do
			if item_count = 0 and then not is_cardinality_allows_zero (cardinality) then
				on_error ("The output sequence is not allowed to be empty")
			end
		end

feature {NONE} -- Implementation

	item_type: XM_XPATH_ITEM_TYPE
			-- Required item type

	cardinality: INTEGER
			-- Required cardinality

	atomize: BOOLEAN
			-- Do we need to perform atomization?

	allow_any_node: BOOLEAN
			-- Is any node-type allowed?

	level: INTEGER
			-- Element nesting level

	item_count: INTEGER
			-- Number of items output

	buffer: STRING
			-- Character buffer

	underlying_receiver: XM_XSLT_SEQUENCE_RECEIVER
			-- Base receiver

invariant

	item_type_not_void: item_type /= Void
	base_receiver_is_sequence_receiver: base_receiver = underlying_receiver

end
	

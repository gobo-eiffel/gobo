indexing

	description:

		"XML nodes that can contain other xml nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_COMPOSITE

inherit

	XM_NODE
		undefine
			is_equal, copy
		end

	XM_LINKED_LIST [XM_NODE]
		rename
			make as list_make,
			is_first as list_is_first,
			is_last as list_is_last
		end
			
	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal, copy
		end

feature -- Access

	element_by_name (a_name: STRING): XM_ELEMENT is
			-- Direct child element with name `a_name';
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			element_not_void: has_element_by_name (a_name) = (Result /= Void)
			--namespace: Result /= Void implies same_namespace (Result)
		end

	element_by_qualified_name (a_uri: STRING; a_name: STRING): XM_ELEMENT is
			-- Direct child element with given qualified name;
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		deferred
		ensure
			element_not_void: has_element_by_qualified_name (a_uri, a_name) = (Result /= Void)
		end
		
	has_element_by_name (a_name: STRING): BOOLEAN is
			-- Has current node at least one direct child
			-- element with the name `a_name'?
		require
			a_name_not_void: a_name /= Void
		deferred
		end
		
	has_element_by_qualified_name (a_uri: STRING; a_name: STRING): BOOLEAN is
			-- Has current node at least one direct child
			-- element with given qualified name ?
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		deferred
		end
		
	elements: DS_LIST [XM_ELEMENT] is
			-- List of all direct child elements in current element
			-- (Create a new list at each call.)
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			create {DS_BILINKED_LIST [XM_ELEMENT]} Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_element then
					Result.force_last (typer.element)
				end
				a_cursor.forth
			end
		ensure
			not_void: Result /= Void
		end

feature -- Text

	text: STRING is
			-- Concatenation of all texts directly found in
			-- current element; Void if no text found
			-- (Return a new string at each call.)
		local
			typer: XM_NODE_TYPER
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_character_data then
					if Result = Void then
						Result := STRING_.cloned_string (typer.character_data.content)
					else
						Result := STRING_.appended_string (Result, typer.character_data.content)
					end
				end
				a_cursor.forth
			end
		end

	join_text_nodes is
			-- Join sequences of text nodes.
		deferred
		end

feature {XM_NODE} -- Removal

	equality_delete (v: XM_NODE) is
			-- Delete node if it is in current node, using
			-- object identity.
		deferred
		end
		
feature -- Processing

	process_children (a_processor: XM_NODE_PROCESSOR) is
			-- Process direct children.
		require
			a_processor_not_void: a_processor /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (a_processor)
				a_cursor.forth
			end
		end

	process_children_recursive (a_processor: XM_NODE_PROCESSOR) is
			-- Process direct and indirect children.
		require
			processor_not_void: a_processor /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (a_processor)
				a_cursor.item.process (typer)
				if typer.is_element then
					typer.element.process_children_recursive (a_processor)
				end
				a_cursor.forth
			end
		end
		
end

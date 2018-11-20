note

	description:

		"Test XML tree"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2018, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_TREE

inherit

	TS_TEST_CASE
		redefine
			make_default
		end

create

	make_default

feature {NONE} -- Initialization

	make_default
			-- <Precursor>
		do
			precursor
			create {XM_DOCUMENT} node.make
			create typer
		end

feature -- Test

	test_simple
			-- Simple tree.
		local
			l_parser: XM_EIFFEL_PARSER
			l_tree_pipe: XM_TREE_CALLBACKS_PIPE
			a_root: XM_ELEMENT
		do
			create l_parser.make
			create l_tree_pipe.make
			l_parser.set_callbacks (l_tree_pipe.start)
			l_parser.parse_from_string ("<doc><a/><b/></doc>")
			assert ("parsing error", not l_tree_pipe.error.has_error)

			if not l_tree_pipe.error.has_error then
				assert_has_element (l_tree_pipe.document, "doc")
				a_root := l_tree_pipe.document.root_element
				assert_strings_equal ("root name", a_root.name, "doc")
				assert_has_element (a_root, "a")
				assert_has_element (a_root, "b")
			end
		end

	test_walk
			-- Walk through tree.
		local
			l_parser: XM_EIFFEL_PARSER
			l_tree_pipe: XM_TREE_CALLBACKS_PIPE
		do
			create l_parser.make
			create l_tree_pipe.make
			l_parser.set_callbacks (l_tree_pipe.start)
			l_parser.parse_from_string ("<!-- pre -->"
				+"<doc>"
				+"  <a b='foo'></a><b/><!--inline--><c>zoo</c>"
				+"</doc>"
				+"<!-- post -->")

			node := l_tree_pipe.document
			assert_document
			assert_first
			assert_last
			go_down
			assert_first
			assert_comment (" pre ")
			go_next
			assert_element ("doc")
			go_down
			assert_text_space
			go_next
			assert_element ("a")
			go_down
			assert_attribute ("b", "foo")
			assert_single
			go_up
			go_next
			assert_element ("b")
			assert_childless
			go_next
			assert_comment ("inline")
			go_next
			assert_element ("c")
			go_down
			assert_text ("zoo")
			assert_single
			go_up
			assert_last
			go_up
			go_next
			assert_comment (" post ")
			assert_last
		end

	test_walk_namespaces
			-- Walk through tree with namespaces.
		local
			l_parser: XM_EIFFEL_PARSER
			l_tree_pipe: XM_TREE_CALLBACKS_PIPE
		do
			create l_parser.make
			create l_tree_pipe.make
			l_parser.set_callbacks (l_tree_pipe.start)
			l_parser.parse_from_string ("<doc xmlns='uri1'>"
				+"<a/><b xmlns='uri2'/>"
				+"<ns1:c xmlns:ns1='uri3' xmlns:ns2='uri4' a1='foo1' ns2:a2='foo2'/>"
				+"</doc>")

			node := l_tree_pipe.document
			assert_single
			assert_document
			go_down
			assert_ns_element ("uri1", "doc")
			assert_element_has_qualified ("uri1", "a")
			assert_element_has_qualified ("uri2", "b")
			assert_element_has_qualified ("uri3", "c")
			go_down
			assert_ns_element ("uri1", "a")
			go_next
			assert_ns_element ("uri2", "b")
			go_next
			assert_ns_element ("uri3", "c")
			assert_last
			go_down
			assert_first
			assert_ns_attribute ("", "a1", "foo1")
			go_next
			assert_ns_attribute ("uri4", "a2", "foo2")
			assert_last
		end

	test_build_simple
			-- Build very simple tree.
		local
			a_namespace: XM_NAMESPACE
			a_doc: XM_DOCUMENT
			an_element: XM_ELEMENT
		do
			create a_namespace.make ("", "uri1")
			create a_doc.make
			create an_element.make (a_doc, "doc", a_namespace)
			a_doc.set_root_element (an_element)

			node := a_doc

			assert_document
			go_down
			assert_first
			assert_ns_element ("uri1", "doc")
			assert_last
		end

	test_build_with_add
			-- Build simple tree and use addition routine(s).
		local
			a_namespace: XM_NAMESPACE
			a_doc: XM_DOCUMENT
			an_element: XM_ELEMENT
			a_sub: XM_ELEMENT
		do
			create a_namespace.make ("", "uri1")
			create a_doc.make
			create an_element.make (a_doc, "doc", a_namespace)
			a_doc.set_root_element (an_element)
			an_element.add_unqualified_attribute ("attr1", "v1")
			create a_namespace.make ("p2", "uri2")
			an_element.add_attribute ("attr2", a_namespace, "v2")

			create a_sub.make_last (an_element, "child", a_namespace)
			an_element.add_unqualified_attribute ("attr3", "v3")

			node := a_doc

			assert_document
			go_down
			assert_first
			assert_ns_element ("uri1", "doc")
			go_down
			assert_first
			-- out of order attribute at the start
			assert_attribute ("attr3", "v3")
			go_next
			assert_attribute ("attr1", "v1")
			go_next
			assert_ns_attribute ("uri2", "attr2", "v2")
			go_next
			assert_ns_element ("uri2", "child")
			assert_last
			go_up
		end

feature {NONE} -- Walk navigation

	node: XM_NODE
			-- Node.

	typer: XM_NODE_TYPER
			-- XML node typer

	go_up
			-- Go to parent.
		local
			l_parent: detachable XM_COMPOSITE
		do
			l_parent := node.parent
			assert ("has parent", l_parent /= Void)
			check asserted_above: l_parent /= Void then end
			node := l_parent
		end

	go_down
			-- Go to first child.
		local
			l_composite: detachable XM_COMPOSITE
		do
			node.process (typer)
			assert ("down: is composite", typer.is_composite)
			l_composite := typer.composite
			assert ("down: is composite 2", l_composite /= Void)
			check asserted_above: l_composite /= Void then end
			assert ("down: has child", l_composite.count > 0)
			node := l_composite.first
		end

	go_next
			-- Move to next sibling, or don't
			-- move if last sibling.
		local
			l_parent: detachable XM_COMPOSITE
			it: DS_LINEAR_CURSOR [XM_NODE]
		do
			from
				l_parent := node.parent
				assert ("next: not root", l_parent /= Void)
				check asserted_above: l_parent /= Void then end
				it := l_parent.new_cursor
				it.start
			invariant
				-- exists it.item = node
			until
				it.item = node
			loop
				it.forth
			end

			check not_after: not it.after end
			it.forth
			if not it.after then
				node := it.item
				it.go_after
			-- else at end so don't move
			end

			check out: it.after end
		end

feature {NONE} -- Walk assertions

	assert_document
			-- Node is document.
		do
			node.process (typer)
			assert ("document node expected", typer.is_document)
		end

	assert_comment (a: STRING)
			-- Assert current node is a comment.
		require
			a_not_void: a /= Void
		local
			l_comment: detachable XM_COMMENT
		do
			node.process (typer)
			assert ("comment expected", typer.is_comment)
			l_comment := typer.comment
			assert ("comment expected 2", l_comment /= Void)
			check asserted_above: l_comment /= Void then end
			assert_strings_equal ("comment value", a, l_comment.data)
		end


	assert_element (a_name: STRING)
			-- Node is an element.
		require
			a_name_not_void: a_name /= Void
		local
			l_element: detachable XM_ELEMENT
		do
			node.process (typer)
			assert ("element expected", typer.is_element)
			l_element := typer.element
			assert ("element expected 2", l_element /= Void)
			check asserted_above: l_element /= Void then end
			assert_strings_equal ("element name", a_name, l_element.name)
		end

	assert_element_has_qualified (a_uri: STRING; a_name: STRING)
			-- Child node of an element.
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		local
			l_element: detachable XM_ELEMENT
		do
			node.process (typer)
			assert ("element expected", typer.is_element)
			l_element := typer.element
			assert ("element expected 2", l_element /= Void)
			check asserted_above: l_element /= Void then end
			assert_has_element_qualified (l_element, a_uri, a_name)
		end

	assert_ns_element (a_ns: STRING; a_name: STRING)
			-- Node is an element (with namespace).
		require
			a_ns_not_void: a_ns /= Void
			a_name_not_void: a_name /= Void
		local
			l_element: detachable XM_ELEMENT
		do
			assert_element (a_name)
			node.process (typer)
			l_element := typer.element
			assert ("element expected 2", l_element /= Void)
			check asserted_above: l_element /= Void then end
			assert ("has_qualified_name", l_element.has_qualified_name (a_ns, a_name))
			assert_strings_equal ("element namespace", a_ns, l_element.namespace.uri)
		end

	assert_childless
			-- Node is empty composite.
		local
			l_element: detachable XM_ELEMENT
		do
			node.process (typer)
			assert ("element expected", typer.is_element)
			l_element := typer.element
			assert ("element expected 2", l_element /= Void)
			check asserted_above: l_element /= Void then end
			assert ("element not empty", l_element.count = 0)
		end

	assert_attribute (a_name: STRING; a_value: STRING)
			-- Node is an attribute.
		require
			a_named_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		local
			l_attribute: detachable XM_ATTRIBUTE
		do
			node.process (typer)
			assert ("attribute expected", typer.is_attribute)
			l_attribute := typer.xml_attribute
			assert ("attribute expected 2", l_attribute /= Void)
			check asserted_above: l_attribute /= Void then end
			assert_strings_equal ("attribute name", a_name, l_attribute.name)
			assert_strings_equal ("attribute value", a_value, l_attribute.value)

			assert_attribute_element (l_attribute)
		end

	assert_attribute_element (an_attribute: XM_ATTRIBUTE)
			-- Checks on attributes parent element.
		require
			an_atttribute_not_void: an_attribute /= Void
		local
			l_element: detachable XM_ELEMENT
		do
			an_attribute.parent.process (typer)
			assert ("parent element", typer.is_element)
			l_element := typer.element
			assert ("element expected", l_element /= Void)
			check asserted_above: l_element /= Void then end
			if an_attribute.namespace.uri.count = 0 then
				assert ("unprefixed by name", l_element.has_attribute_by_name (an_attribute.name))
				assert ("attribute result", l_element.attribute_by_name (an_attribute.name) = an_attribute)
			else
				assert ("prefixed not by name", not l_element.has_attribute_by_name (an_attribute.name))
			end
		end

	assert_ns_attribute (a_ns: STRING; a_name: STRING; a_value: STRING)
			-- Node is an attribute (with namespace).
		require
			a_ns_not_void: a_ns /= Void
			a_named_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		local
			l_attribute: detachable XM_ATTRIBUTE
		do
			assert_attribute (a_name, a_value)
			node.process (typer)
			l_attribute := typer.xml_attribute
			assert ("attribute expected", l_attribute /= Void)
			check asserted_above: l_attribute /= Void then end
			assert ("has_qualified_name", l_attribute.has_qualified_name (a_ns, a_name))
			assert_strings_equal ("attribute namespace", a_ns, l_attribute.namespace.uri)
		end

	assert_last
			-- Node is last in parent.
		do
			assert ("last", node.is_last)
		end

	assert_first
			-- Node is first in parent.
		do
			assert ("first", node.is_first)
		end

	assert_text (a: STRING)
			-- Assert text node
		require
			a_not_void: a /= Void
		local
			l_character_data: detachable XM_CHARACTER_DATA
		do
			node.process (typer)
			assert ("text node expected", typer.is_character_data)
			l_character_data := typer.character_data
			assert ("text node expected 2", l_character_data /= Void)
			check asserted_above: l_character_data /= Void then end
			assert_strings_equal ("text", a, l_character_data.content)
		end

	assert_text_space
			-- Assert text node with only spaces.
		local
			i: INTEGER
			a_string: STRING
			space_code: INTEGER
			l_character_data: detachable XM_CHARACTER_DATA
		do
			node.process (typer)
			assert ("text expected", typer.is_character_data)
			l_character_data := typer.character_data
			assert ("text node expected 2", l_character_data /= Void)
			check asserted_above: l_character_data /= Void then end
			from
				a_string := l_character_data.content
				space_code := (' ').code
				i := 1
			until
				i > a_string.count
			loop
				assert ("non space in character data",
						a_string.item_code (i) <= space_code)
				i := i + 1
			end
		end

	assert_single
			-- Node is singleton.
		do
			assert ("singleton", node.is_first and node.is_last)
		end

feature {NONE} -- Implementation

	assert_has_element (a: XM_COMPOSITE; a_name: STRING)
			-- Test element_by_name.
		require
			a_not_void: a /= Void
			a_name_not_void: a_name /= Void
		local
			l_element: detachable XM_ELEMENT
		do
			assert ("has element", a.has_element_by_name (a_name))
			l_element := a.element_by_name (a_name)
			assert ("has element 2", l_element /= Void)
			check asserted_above: l_element /= Void then end
			assert_strings_equal ("element name", l_element.name, a_name)
		end

	assert_has_element_qualified (a: XM_COMPOSITE; a_uri: STRING; a_name: STRING)
			-- Test element_by_name.
		require
			a_not_void: a /= Void
			a_name_not_void: a_name /= Void
			local
			l_element: detachable XM_ELEMENT
		do
			assert ("has element", a.has_element_by_qualified_name (a_uri, a_name))
			l_element := a.element_by_qualified_name (a_uri, a_name)
			assert ("has element 2", l_element /= Void)
			check asserted_above: l_element /= Void then end
			assert_strings_equal ("element namespace", l_element.namespace.uri, a_uri)
			assert_strings_equal ("element name", l_element.name, a_name)
		end

invariant

	node_not_void: node /= Void
	typer_not_void: typer /= Void

end

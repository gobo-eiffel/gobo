indexing

	description:

		"XML attribute nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_ATTRIBUTE

inherit

	XM_NAMED_NODE

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_prefix: like ns_prefix; a_value: like value; a_parent: XM_ELEMENT) is
			-- Create a new attribute.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
			a_parent_not_void: a_parent /= Void
		do
			name := a_name
			ns_prefix := a_prefix
			value := a_value
			parent := a_parent
		ensure
			name_set: name = a_name
			ns_prefix_set: ns_prefix = a_prefix
			value_set: value = a_value
			parent_set: parent = a_parent
		end

feature -- Status report

	is_namespace_declaration: BOOLEAN is
			-- Is current attribute a namespace declaration?
		do
			if has_prefix then
				Result := same_string (Xmlns, ns_prefix)
			else
				Result := same_string (Xmlns, name)
			end
		end

feature -- Access

	value: STRING
			-- Value

	namespace_declaration: XM_NAMESPACE is
			-- Namespace declaration
			-- (Create a new object at each call)
		require
			is_namespace_declaration: is_namespace_declaration
		local
			a_prefix: STRING
			a_uri: STRING
		do
			if has_prefix then
				a_prefix := name
			else
					-- New empty string with the same dynamic type as `name'.
				a_prefix := STRING_.new_empty_string (name, 0)
			end
			if value.count > 0 then
				a_uri := value
			end
			!! Result.make (a_prefix, a_uri)
		ensure
			namespace_not_void: Result /= Void
		end

feature -- Setting

	set_value (a_value: like value) is
			-- Set `a_value' to `value'.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_attribute (Current)
		end

invariant

	value_not_void: value /= Void

end

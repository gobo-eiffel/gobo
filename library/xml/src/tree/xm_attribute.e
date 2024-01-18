note

	description:

		"XML attribute nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"

class XM_ATTRIBUTE

inherit

	XM_NAMED_NODE

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_last

feature {NONE} -- Initialization

	make (a_name: like name; a_ns: like namespace; a_value: like value; a_parent: XM_ELEMENT)
			-- Create a new attribute.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_ns_not_void: a_ns /= Void
			a_value_not_void: a_value /= Void
			a_parent_not_void: a_parent /= Void
		do
			name := a_name
			namespace := a_ns
			value := a_value
			parent := a_parent
		ensure
			parent_set: parent = a_parent
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
			value_set: value = a_value
		end

	make_last (a_name: like name; a_ns: like namespace; a_value: like value; a_parent: XM_ELEMENT)
			-- Create a new attribute,
			-- and add it to parent..
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_ns_not_void: a_ns /= Void
			a_value_not_void: a_value /= Void
			a_parent_not_void: a_parent /= Void
		do
			name := a_name
			namespace := a_ns
			value := a_value
			parent := a_parent
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: a_parent.last = Current
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
			value_set: value = a_value
		end

feature -- Status report

	is_namespace_declaration: BOOLEAN
			-- Is current attribute a namespace declaration?
		do
			if attached ns_prefix as l_ns_prefix and then has_prefix then
				Result := same_string (Xmlns, l_ns_prefix)
			else
				Result := same_string (Xmlns, name)
			end
		end

feature -- Access

	namespace_declaration: XM_NAMESPACE
			-- Namespace corresponding to the declaration
			-- (Create a new object at each call)
		require
			is_namespace_declaration: is_namespace_declaration
		local
			a_prefix: STRING
		do
			if has_prefix then
				a_prefix := name
			else
					-- New empty string with the same dynamic type as `name'.
				a_prefix := STRING_.new_empty_string (name, 0)
			end
			create Result.make (a_prefix, value)
		ensure
			namespace_not_void: Result /= Void
		end

feature -- Access

	value: STRING
			-- Value

feature -- Setting

	set_value (a_value: like value)
			-- Set `a_value' to `value'.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR)
			-- Process current node with `a_processor'.
		do
			a_processor.process_attribute (Current)
		end

invariant

	value_not_void: value /= Void

end

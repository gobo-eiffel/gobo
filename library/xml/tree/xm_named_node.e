indexing

	description:

		"XML nodes that have a name"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NAMED_NODE

inherit

	XM_NODE

feature -- Status report

	has_namespace: BOOLEAN is
			-- Has the name of current node been defined with namespace?
		do
			Result := (namespace /= Void)
		ensure
			definition: Result = (namespace /= Void)
		end

	has_prefix: BOOLEAN is
			-- Has a prefix been used to define the namespace?
			-- (It could also be that the namespace used was the default namespace)
		do
			Result := (ns_prefix /= Void and then ns_prefix.count > 0)
		ensure
			definition: Result = (ns_prefix /= Void and then ns_prefix.count > 0)
		end

feature -- Access

	name: STRING
			-- Name

	ns_prefix: STRING
			-- Namespace prefix used to declare the namespace of the 
			-- name of current node

	namespace: STRING
			-- Namespace of the name of current node

feature -- Element change

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_namespace (a_namespace: like namespace) is
			-- Set `namespace' to `a_namespace'.
		do
			namespace := a_namespace
		ensure
			namespace_set: namespace = a_namespace
		end

	set_prefix (a_prefix: like ns_prefix) is
			-- Set `ns_prefix' to `a_prefix'.
		do
			ns_prefix := a_prefix
		ensure
			ns_prefix_set: ns_prefix = a_prefix
		end

	apply_namespace_declarations (decls: XM_NAMESPACE_TABLE) is
			-- Apply the namespace declaration `decls'.
			-- This means the following:
			-- 1) Name has no prfix -> done
			-- 2) Name has prefix:
			-- 2.1) Prefix has entry in decls -> set namespace
			-- Note: this feature does not take care of default namespace
			-- declarations (since default namespaces do not apply for all
			-- named nodes - they apply for elements, but not for attributes)
		require
			decls_not_void: decls /= Void
		do
			if has_prefix then
				decls.search (ns_prefix)
				if decls.found then
					set_namespace (decls.found_item)
				end
			end
		end

invariant

	name_not_void: name /= Void
	name_not_empty: name.count > 0

end

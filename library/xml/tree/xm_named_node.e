indexing

	description:

		"Common anchestor for nodes that have a name"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NAMED_NODE

inherit

	XM_NODE

feature {ANY} -- Access

	name: UC_STRING
			-- Name of this node.

	ns_prefix: UC_STRING
			-- Namespace prefix used to declare the namespace of the 
			-- name of this node.

	namespace: UC_STRING
			-- Namespace of the name of this node.

feature {ANY} -- Access

	has_namespace: BOOLEAN is
			-- Has the name of this node been defined with namespace?
		do
			Result := namespace /= Void
		end

	has_prefix: BOOLEAN is
			-- Has a prefix been used to define the namespace (It 
			-- could also be that the used namespace was the default namespace)
		do
			Result := ns_prefix /= Void and then
				ns_prefix.count > 0
		end

feature {ANY} -- Element change

	set_name (n: UC_STRING) is
			-- Set `n' to be the name of this node.
		require
			n_not_void: n /= Void
		do
			name := n
		end

	set_namespace (n: UC_STRING) is
			-- Set `n' to be the namespace of the name of this node.
		do
			namespace := n
		end

	set_prefix (n: UC_STRING) is
			-- Set `n' to be the prefix for the namespace of the name of this node
		do
			ns_prefix := n
		end

	apply_namespace_declarations (decls: XM_NAMESPACE_TABLE) is
			-- Apply the namespace declaration `decls'.
			-- This means the following:
			-- 1) Name has no prfix -> done
			-- 2) Name has prefix:
			-- 2.1) Prefix has entry in decls -> set namespace
			-- Note: this feature does not take care of default namespace
			-- declarations (since default namespaces do not apply for
			-- all named nodes - they apply for elements, but not for attributes)
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

end

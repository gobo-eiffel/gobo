indexing

	description:

		"Common anchestor for nodes that have a name"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XM_NAMED_NODE

inherit

	XM_NODE
		redefine
			implementation
		end

feature {ANY} -- Access

	name: UC_STRING is
			-- Name of this node.
		do
			Result := implementation.name
		ensure
			result_not_void: Result /= Void
		end

	ns_prefix: UC_STRING is
			-- Namespace prefix used to declare the namespace of the 
			-- name of this node.
		do
			Result := implementation.ns_prefix
		end

	namespace: UC_STRING is
			-- Namespace of the name of this node.
		do
			Result := implementation.namespace
		end

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
			implementation.set_name (n)
		end

	set_namespace (n: UC_STRING) is
			-- Set `n' to be the namespace of the name of this node.
		do
			implementation.set_namespace (n)
		end

	set_prefix (n: UC_STRING) is
			-- Set `n' to be the prefix for the namespace of the name of this node
		do
			implementation.set_prefix (n)
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

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_NAMED_NODE

invariant

	name_not_void: name /= Void

end -- class XM_NAMED_NODE

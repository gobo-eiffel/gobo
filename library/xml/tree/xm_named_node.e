indexing
	description: "common anchestor for xml-nodes that do have a name (elements and attributes)a";
	status:			"See notice at end of class.";
	author:			"Andreas Leitner";

deferred class
	XM_NAMED_NODE
inherit
	XM_NODE
		redefine
			implementation
		end

feature {ANY} -- Access

	name: UC_STRING is
			-- name of node
		do
			Result := implementation.name
		ensure
			result_not_void: Result /= Void
		end

	ns_prefix: UC_STRING is
		do
			Result := implementation.ns_prefix
		end

	namespace: UC_STRING is
		do
			Result := implementation.namespace
		end

	has_namespace: BOOLEAN is
			-- does this node have a namespace defined
		do
			Result := namespace /= Void
		end

	has_prefix: BOOLEAN is
		do
			Result := ns_prefix /= Void and then not ns_prefix.empty
		end

feature {ANY} -- Element Change

	set_name (n: UC_STRING) is
		require
			n_not_void: n /= Void
		do
			implementation.set_name (n)
		end

	set_namespace (n: UC_STRING) is
		do
			implementation.set_namespace (n)
		end

	set_prefix (n: UC_STRING) is
		do
			implementation.set_prefix (n)
		end

	apply_namespace_declarations (decls: XM_NAMESPACE_TABLE) is
			-- Apply namespace declaration.
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
			if
				has_prefix
			then
				decls.search (ns_prefix)
				if
					decls.found
				then
					set_namespace (decls.found_item)
				end
			end
		end


feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_NAMED_NODE

invariant
	name_not_void: name /= Void

end -- XM_NAMED_NODE

--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------

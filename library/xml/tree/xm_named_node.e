note

	description:

		"XML nodes that have a name"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NAMED_NODE

inherit

	XM_ELEMENT_NODE

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	has_namespace: BOOLEAN
			-- Has the name of current node been defined with namespace?
		do
			Result := (namespace /= Void)
		ensure
			definition: Result = (namespace /= Void)
		end

	has_prefix: BOOLEAN
			-- Has a prefix been used to define the namespace?
			-- (It could also be that the namespace used was the default namespace)
		do
			Result := (ns_prefix /= Void and then ns_prefix.count > 0)
		ensure
			definition: Result = (ns_prefix /= Void and then ns_prefix.count > 0)
		end

	same_namespace (other: XM_NAMED_NODE): BOOLEAN
			-- Has current node same namespace as other?
		require
			other_not_void: other /= Void
		do
			Result := ((not has_namespace) and (not other.has_namespace))
				or ((has_namespace and other.has_namespace) and then namespace.is_equal (other.namespace))
		ensure
			equal_namespaces: Result implies (((not has_namespace) and (not other.has_namespace))
				or else namespace.is_equal (other.namespace))
		end

	same_name (other: XM_NAMED_NODE): BOOLEAN
			-- Has current node same name and namespace as other?
		require
			other_not_void: other /= Void
		do
			Result := same_namespace (other) and
				STRING_.same_string (name, other.name)
		ensure
			definition: Result = (same_namespace (other) and same_name (other))
		end

	has_qualified_name (a_uri: STRING; a_name: STRING): BOOLEAN
			-- Does this node match the qualified name?
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		do
			Result := (STRING_.same_string (a_uri, namespace.uri)
					and STRING_.same_string (a_name, name))
		ensure
			definition: Result = (STRING_.same_string (a_uri, namespace.uri)
					and STRING_.same_string (a_name, name))
		end

feature -- Access

	name: STRING
			-- Name

	namespace: XM_NAMESPACE
			-- Namespace of the name of current node

feature -- Access

	ns_prefix: STRING
			-- Namespace prefix used to declare the namespace of the
			-- name of current node
		require
			has_ns: has_namespace
		do
			Result := namespace.ns_prefix
		ensure
			definition: Result = namespace.ns_prefix
		end

	ns_uri: STRING
			-- URI of namespace.
		require
			has_ns: has_namespace
		do
			Result := namespace.uri
		ensure
			definition: Result = namespace.uri
		end

feature -- Element change

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_namespace (a_namespace: like namespace)
			-- Set `namespace' to `a_namespace'.
		require
			a_namespace_not_void: a_namespace /= Void
		do
			namespace := a_namespace
		ensure
			namespace_set: namespace = a_namespace
		end

invariant

	name_not_void: name /= Void
	name_not_empty: name.count > 0
	has_namespace: has_namespace

end

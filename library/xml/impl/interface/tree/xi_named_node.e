indexing

	description:

		"Common anchestor for nodes that have a name"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_NAMED_NODE

inherit

	XI_NODE

feature {ANY} -- Access

	name: UC_STRING is
			-- Name of this Node.
		deferred
		end

	ns_prefix: UC_STRING is
			-- Namespace prefix used to declare the namespace of the 
			-- name of this node.
		deferred
		end

	namespace: UC_STRING is
			-- Namespace of the name of this node.
		deferred
		end

feature {ANY} -- Element change

	set_name (n: UC_STRING) is
			-- Set `n' to be the name of this node.
		require
			n_not_void: n /= Void
		deferred
		end

	set_namespace (n: UC_STRING) is
			-- Set `n' to be the namespace of the name of this node.
		deferred
		end

	set_prefix (n: UC_STRING) is
			-- Set `n' to be the prefix for the namespace of the name of this node
		deferred
		end

invariant

	name_not_void: name /= Void

end -- class XI_NAMED_NODE

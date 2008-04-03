indexing

	description:

		"Eiffel clients which appear in a comma-separated list of clients"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLIENT_ITEM

inherit

	ET_AST_NODE

feature -- Access

	client: ET_CLIENT is
			-- Client in comma-separated list
		deferred
		ensure
			client_not_void: Result /= Void
		end

	name: ET_CLASS_NAME is
			-- Name of client
		do
			Result := client.name
		ensure
			definition: Result = client.name
		end

	base_class: ET_CLASS is
			-- Base class of client
		do
			Result := client.base_class
		ensure
			definition: Result = client.base_class
		end

end

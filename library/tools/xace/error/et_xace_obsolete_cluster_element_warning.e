note

	description:

		"Warning: Obsolete <cluster> element"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING

inherit

	ET_XACE_WARNING

create

	make

feature {NONE} -- Initialization

	make (a_position: XM_POSITION)
			-- Create a warning reporting that a cluster element that
			-- groups clusters, mounts and options is no longer used.
		require
			a_position_not_void: a_position /= Void
		do
			create parameters.make (1, 1)
			parameters.put (a_position.out, 1)
		end

feature -- Access

	default_template: STRING = "<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead"
			-- Default template used to built the error message

	code: STRING = "XA0014"
			-- Error code

end

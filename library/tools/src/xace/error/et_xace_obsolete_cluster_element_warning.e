note

	description:

		"Warning: Obsolete <cluster> element"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2019, Eric Bezault and others"
	license: "MIT License"

class ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

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
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (a_position.out, 1)
		end

feature -- Access

	default_template: STRING = "<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead"
			-- Default template used to built the error message

	code: STRING = "XA0014"
			-- Error code

end

note

	description:

		"Lace Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_SYSTEM

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_SYSTEM
		redefine
			make,
			clusters
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING)
			-- Create a new Eiffel system.
		do
			precursor (a_name)
			set_default_class_mapping
		end

feature -- Access

	clusters: ET_LACE_CLUSTERS
			-- Clusters

end

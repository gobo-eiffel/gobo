indexing

	description:

		"Xace Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_UNIVERSE

inherit

	ET_UNIVERSE
		redefine
			clusters
		end

	ET_XACE_SYSTEM
		rename
			make as make_system
		undefine
			set_clusters
		redefine
			clusters, set_root_class_name
		end

creation

	make, make_with_factory

feature -- Access

	clusters: ET_XACE_CLUSTERS
			-- Clusters

feature -- Setting

	set_root_class_name (a_name: like root_class_name) is
			-- Set `root_class_name' to `a_name'.
		local
			an_identifier: ET_IDENTIFIER
		do
			root_class_name := a_name
			if a_name /= Void and then a_name.count > 0 then
				!! an_identifier.make (a_name)
				set_root_class (an_identifier)
			else
				root_class := Void
			end
		end

end

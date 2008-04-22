indexing

	description:

		"Eiffel adapted class libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ADAPTED_LIBRARY

inherit

	ET_ADAPTED_UNIVERSE
		rename
			universe as library
		redefine
			library
		end

create

	make

feature -- Access

	library: ET_LIBRARY
			-- Eiffel library being adapted

end

indexing

	description:

		"Provides global access to a TEMPLATE_EXPANDER"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
   UT_SHARED_TEMPLATE_EXPANDER

feature {ANY} -- Access

   template_expander: UT_TEMPLATE_EXPANDER is
      once
         !! Result.make
      end
end

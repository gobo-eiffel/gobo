indexing

	description:

		"provides global access to a TEMPLATE_EXPANDER"

	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"

class
   UT_SHARED_TEMPLATE_EXPANDER

feature {ANY} -- Access

   template_expander: UT_TEMPLATE_EXPANDER is
      once
         !! Result.make
      end
end

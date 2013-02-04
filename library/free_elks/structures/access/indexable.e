note

	description:
		"Tables whose keys are integers in a contiguous interval"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: indexable, access;
	access: index, membership;
	contents: generic;
	date: "$Date: 2011-05-18 01:25:55 +0200 (Wed, 18 May 2011) $"
	revision: "$Revision: 510 $"

deferred class INDEXABLE [G, H -> INTEGER] inherit

	TABLE [G, INTEGER]
		rename
			valid_key as valid_index,
			force as put
		end

	READABLE_INDEXABLE [G]

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end




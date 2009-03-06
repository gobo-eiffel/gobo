indexing

	description:

		"Labeled types appearing in symbol Tuple types"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_LABELED_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_labels: like labels; a_type: like type) is
			-- Create a new labeled type.
		require
			a_labels_not_void: a_labels /= Void
			a_labels_not_empty: not a_labels.is_empty
			no_void_label: not a_labels.has (Void)
			a_type_not_void: a_type /= Void
		do
			labels := a_labels
			type := a_type
		ensure
			labels_set: labels = a_labels
			type_set: type = a_type
		end

feature -- Access

	labels: DS_ARRAYED_LIST [STRING]
			-- labels

	type: PR_TYPE
			-- Type

invariant

	labels_not_void: labels /= Void
	labels_not_empty: not labels.is_empty
	no_void_label: not labels.has (Void)
	type_not_void: type /= Void

end

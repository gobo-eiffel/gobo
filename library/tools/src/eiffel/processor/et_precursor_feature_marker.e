note

	description:

		"Markers of features which are the precursors of at least one feature."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010-2014, Eric Bezault and others"
	license: "MIT License"

class ET_PRECURSOR_FEATURE_MARKER

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new precursor features.
		do
			create precursors.make (500000)
		end

feature -- Processing

	mark_precursors (a_system: ET_SYSTEM)
			-- Mark the features which are the precursor of at least one feature
			-- of one of the classes marked in `a_system'.
			--
			-- Use `is_marked' to see whether a feature has been marked.
			--
			-- Set `use_implementation_feature' to mark the implementation features
			-- of these features instead of the feature themselves.
			--
			-- The definition of precursor feature can be found in the header
			-- comment of features 'first_precursor' and 'other_precursors'
			-- in class ET_FEATURE.
			-- keep them in a cache to be used by next calls to `descendants'.
			--
			-- It is assumed that the features of all classes marked in the
			-- system have already been successfully flattened. Otherwise some
			-- features may be missing when building the list of descendant classes.
		require
			a_system_not_void: a_system /= Void
		do
			unmark_all
			a_system.classes_do_if_recursive (agent {ET_CLASS}.features_do_all (agent add_precursors), agent {ET_CLASS}.is_marked)
		end

	unmark_all
			-- Unmark all features previously marked with `mark_precursors'.
		do
			precursors.wipe_out
		end

feature -- Status report

	is_marked (a_feature: ET_FEATURE): BOOLEAN
			-- Is `a_feature' the precursor of at least one other feature?
		require
			a_feature_not_void: a_feature /= Void
		do
			if use_implementation_feature then
				Result := precursors.has (a_feature.implementation_feature)
			else
				Result := precursors.has (a_feature)
			end
		end

	use_implementation_feature: BOOLEAN
			-- Should the implementation feature of the precursor features
			-- be marked instead of the precursor features themselves?

feature -- Status setting

	set_use_implementation_feature (b: BOOLEAN)
			-- Set `use_implementation_feature' to `b'.
		do
			use_implementation_feature := b
		ensure
			use_implementation_feature_set: use_implementation_feature = b
		end

feature {NONE} -- Implementation

	precursors: DS_HASH_SET [ET_FEATURE]
			-- Features which have been marked as precursors of other features

	add_precursors (a_feature: ET_FEATURE)
			-- Added precursors (or their implementation features if
			-- `use_implementation_feature' is set) of `a_feature' to
			-- `precursors'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.first_precursor as l_first_precursor then
				add_to_precursors (l_first_precursor)
				if attached a_feature.other_precursors as l_other_precursors then
					l_other_precursors.do_all (agent add_to_precursors)
				end
			end
		end

	add_to_precursors (a_feature: ET_FEATURE)
			-- Add `a_feature' (or its implementation feature if
			-- `use_implementation_feature' is set) to `precursors'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if use_implementation_feature then
				precursors.force_last (a_feature.implementation_feature)
			else
				precursors.force_last (a_feature)
			end
		end

invariant

	precursors_not_void: precursors /= Void
	no_void_precursor: not precursors.has_void

end

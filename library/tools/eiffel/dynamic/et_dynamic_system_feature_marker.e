indexing

	description:

		"Eiffel system feature markers using the dynamic type set mechanism"

	remark: "[
		There are different ways to mark the features that a given feature
		recursively depends on (i.e. features that might be executed if
		the given feature is itself executed). Some may give more accurate
		result (i.e. will mark less features as used) but may use more
		memory or take longer to complete. There are currently three feature
		marker algorithms available:

		* ET_SYSTEM_FEATURE_MARKER: traverses the dependent features in the
		  context of the class they have been written in.

		* ET_SYSTEM_TARGETED_FEATURE_MARKER: traverses the dependent features
		  in the context of the base class of the target types of the calls.
		  This algorithm is more accurate than the previous one, but uses
		  more memory and is slower because it will need to traverse the body
		  of the features several times for each possible target type.

		* ET_DYNAMIC_SYSTEM_FEATURE_MARKER: uses the dynamic type set mechanism
		  implemented in the Gobo Eiffel compiler to determine which features
		  are to be part of the resulting executable should the given feature
		  be used as root creation procedure. This algorithm in the most accurate
		  of the three, but is slower.

		Benchmarks when using the root creation procedure of gelint's source code:

		When using gec with no GC:
			With ET_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 16 MB (+ 165 MB before calling this feature)
				time: 0.7 seconds
				marked features: 13,174
			With ET_SYSTEM_TARGETED_FEATURE_MARKER.mark_system:
				memory: 31 MB (+ 165 MB before calling this feature)
				time: 1.5 seconds
				marked features: 12,970
			With ET_DYNAMIC_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 19 MB (+ 165 MB before calling this feature)
				time: 3.7 seconds
				marked features: 11,892
		When using ISE 6.2 with GC:
			With ET_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 13 MB (+ 180 MB before calling this feature)
				time: 2.2 seconds
				marked features: 13,174
			With ET_SYSTEM_TARGETED_FEATURE_MARKER.mark_system:
				memory: 13 MB (+ 180 MB before calling this feature)
				time: 5.8 seconds
				marked features: 12,970
			With ET_DYNAMIC_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 17 MB (+ 180 MB before calling this feature)
				time: 6.0 seconds
				marked features: 11,892
		Number of features compiled with ISE 6.2: 12,111
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_SYSTEM_FEATURE_MARKER

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new system feature marker.
		do
		end

feature -- Processing

	mark_system (a_feature: ET_FEATURE; a_target_type: ET_BASE_TYPE) is
			-- Identify the features that `a_feature' from `a_target_type'
			-- recursively depends on (i.e. they might be executed if
			-- `a_feature' is itself executed) and mark them as being
			-- part of the system. Mark `a_feature' as well.
			-- Use the dynamic type set mechanism to determine which
			-- features need to be marked as being part of the system.
			--
			-- Note that marking a feature means that the query 'is_used'
			-- of its 'implementation_feature' (i.e. feature in the class
			-- it has been written) will be set to True.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_target_class_preparsed: a_target_type.base_class.is_preparsed
		local
			l_class: ET_CLASS
			l_system: ET_SYSTEM
			l_dynamic_system: ET_DYNAMIC_SYSTEM
			l_builder: ET_DYNAMIC_PUSH_TYPE_SET_BUILDER
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_class := a_target_type.base_class
			l_system := l_class.current_system
			unmark_all (l_system)
			if a_feature.is_deferred then
				a_feature.implementation_feature.set_used (True)
			else
				create l_dynamic_system.make (l_system)
				create l_builder.make (l_dynamic_system)
				l_dynamic_system.set_dynamic_type_set_builder (l_builder)
				l_dynamic_system.compile_feature (a_feature.name, l_class)
				l_dynamic_types := l_dynamic_system.dynamic_types
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_dynamic_type := l_dynamic_types.item (i)
					l_dynamic_type.queries.do_all (agent mark_feature)
					l_dynamic_type.procedures.do_all (agent mark_feature)
					i := i + 1
				end
			end
		ensure
			a_feature_used: a_feature.implementation_feature.is_used
		end

	unmark_all (a_system: ET_SYSTEM) is
			-- Unmark all features of `a_system' as if none of them was in the system.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive (agent {ET_CLASS}.features_do_declared (agent {ET_FEATURE}.set_used (False)))
		end

feature {NONE} -- Implementation

	mark_feature (a_feature: ET_DYNAMIC_FEATURE) is
			-- Mark `a_feature' as being used.
		require
			a_feature_not_void: a_feature /= Void
		local
			i, nb: INTEGER
			l_precursor: ET_DYNAMIC_PRECURSOR
			l_precursors: ET_DYNAMIC_PRECURSOR_LIST
		do
			a_feature.static_feature.implementation_feature.set_used (True)
			l_precursor := a_feature.first_precursor
			if l_precursor /= Void then
				mark_feature (l_precursor)
				l_precursors := a_feature.other_precursors
				if l_precursors /= Void then
					nb := l_precursors.count
					from i := 1 until i > nb loop
						mark_feature (l_precursors.item (i))
						i := i + 1
					end
				end
			end
		end

end

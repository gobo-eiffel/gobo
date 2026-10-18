note

	description:

		"Builders for lists of implementations of a given browsable name"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_IMPLEMENTATION_BUILDER

inherit

	ET_BROWSABLE_NAME_NULL_PROCESSOR
		rename
			make as make_null_processor
		redefine
			process_class_name,
			process_precursor_name,
			process_qualified_call_name,
			process_unqualified_call_name
		end

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_message_manager: like message_manager)
			-- Create a new implementation builder.
		require
			a_response_not_void: a_response /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			message_manager := a_message_manager
		ensure
			response_set: response = a_response
			message_manager_set: message_manager = a_message_manager
		end

feature -- Access

	response: LS_IMPLEMENTATION_RESPONSE
			-- List of implementation locations to be built

	message_manager: GELSP
			-- Message manager

feature {ET_BROWSABLE_NAME} -- Processing

	process_class_name (a_name: ET_BROWSABLE_CLASS_NAME)
			-- Process `a_name`.
		local
			l_class: ET_CLASS
		do
			l_class := a_name.actual_class
			if attached message_manager.location (l_class.name, l_class) as l_location then
				response.add_location (l_location)
			end
		end

	process_precursor_name (a_name: ET_BROWSABLE_PRECURSOR_NAME)
			-- Process `a_name`.
		do
			if attached a_name.call_feature as l_feature then
				build_feature_implementations (l_feature, a_name.target_base_class)
			end
		end

	process_qualified_call_name (a_name: ET_BROWSABLE_QUALIFIED_CALL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.call_feature as l_feature then
				build_feature_implementations (l_feature, a_name.target_base_class)
			end
		end

	process_unqualified_call_name (a_name: ET_BROWSABLE_UNQUALIFIED_CALL_NAME)
			-- Process `a_name`.
		do
			if attached a_name.call_feature as l_feature then
				build_feature_implementations (l_feature, a_name.current_class)
			end
		end

feature {NONE} -- Implementation

	build_feature_implementations (a_feature: ET_FEATURE; a_class: ET_CLASS)
			-- Build list of implementations of `a_feature' from `a_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			l_precursors: DS_HASH_SET [ET_FEATURE]
			l_implementations: DS_HASH_SET [ET_FEATURE]
			l_feature: ET_FEATURE
			l_feature_impl: ET_FEATURE
			i, nb: INTEGER
			l_descendants: DS_ARRAYED_LIST [ET_CLASS]
			l_descendant: ET_CLASS
			l_seed: INTEGER
		do
			create l_precursors.make (20)
			create l_implementations.make (20)
			l_precursors.put_last (a_feature)
			from l_precursors.start until l_precursors.after loop
				l_feature := l_precursors.item_for_iteration
				l_feature_impl := l_feature.implementation_feature
				if not l_implementations.has (l_feature_impl) and then a_feature.has_seed (l_feature.first_seed) then
					l_implementations.force_last (l_feature_impl)
				end
				if attached l_feature.first_precursor as l_first_precursor then
					if not l_precursors.has (l_first_precursor) then
						l_precursors.force_last (l_first_precursor)
					end
					if attached l_feature.other_precursors as l_other_precursors then
						nb := l_other_precursors.count
						from i := 1 until i > nb loop
							l_feature := l_other_precursors.item (i)
							if not l_precursors.has (l_feature) then
								l_precursors.force_last (l_feature)
							end
							i := i + 1
						end
					end
				end
				l_precursors.forth
			end
				-- Revert order of precursors.
			from l_implementations.finish until l_implementations.before loop
				l_feature := l_implementations.item_for_iteration
				if attached message_manager.location (l_feature.name, l_feature.implementation_class) as l_location then
					response.add_location (l_location)
				end
				l_implementations.back
			end
				-- Look for redeclarations in descendants.
			l_seed := a_feature.first_seed
			l_descendants := a_class.conforming_descendant_classes
			nb := l_descendants.count
			from i := 1 until i > nb loop
				l_descendant := l_descendants.item (i)
				if attached l_descendant.seeded_feature (l_seed) as l_seeded_feature then
					l_feature_impl := l_seeded_feature.implementation_feature
					if not l_implementations.has (l_feature_impl) then
						l_implementations.force_last (l_feature_impl)
						if attached message_manager.location (l_feature_impl.name, l_feature_impl.implementation_class) as l_location then
							response.add_location (l_location)
						end
					end
				end
				i := i + 1
			end
		end

invariant

	response_not_void: response /= Void
	message_manager_not_void: message_manager /= Void

end

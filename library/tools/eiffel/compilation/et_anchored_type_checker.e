indexing

	description:

		"Eiffel anchored type checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ANCHORED_TYPE_CHECKER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_class,
			process_class_type,
			process_generic_class_type,
			process_like_feature,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new anchored type checker.
		do
			precursor (a_universe)
			current_class := a_universe.unknown_class
			create anchored_type_sorter.make_default
		end

feature -- Access

	current_class: ET_CLASS
			-- Class being processed

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.set_features_flattened
			a_class.set_flattening_error
		ensure
			features_flattened: a_class.features_flattened
			has_flattening_error: a_class.has_flattening_error
		end

feature -- Type checking

	check_signatures (a_class: ET_CLASS) is
			-- Check whether there is no cycle in the anchored types
			-- held in the types of all signatures of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			a_features: ET_FEATURE_LIST
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			j, nb2: INTEGER
			old_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
			a_features := current_class.features
			nb := a_features.count
			from i := 1 until i > nb loop
				a_feature := a_features.item (i)
				a_type := a_feature.type
				if a_type /= Void then
					internal_call := True
					a_type.process (Current)
					internal_call := False
				end
				args := a_feature.arguments
				if args /= Void then
					nb2 := args.count
					from j := 1 until j > nb2 loop
						internal_call := True
						args.formal_argument (j).type.process (Current)
						internal_call := False
						j := j + 1
					end
				end
				i := i + 1
			end
			anchored_type_sorter.sort
			if anchored_type_sorter.has_cycle then
				set_fatal_error (current_class)
				error_handler.report_vtat2a_error (current_class, anchored_type_sorter.cycle)
			end
			anchored_type_sorter.wipe_out
			current_class := old_class
		end

feature {NONE} -- Type checking

	add_like_feature_to_sorter (a_type: ET_LIKE_FEATURE) is
			-- Add to `anchored_type_sorter' anchored types whose
			-- anchors' types are (or contain) also anchored types.
		local
			a_seed: INTEGER
			a_query_type: ET_TYPE
			a_feature: ET_FEATURE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			a_seed := a_type.seed
			if a_seed /= 0 then
					-- Anchored type already resolved.
				if current_anchored_type /= Void then
					anchored_type_sorter.force_relation (a_type, current_anchored_type)
				elseif a_type.is_like_argument then
					a_feature := current_class.seeded_feature (a_seed)
					if a_feature /= Void then
						args := a_feature.arguments
						an_index := a_type.index
						if args /= Void and then an_index <= args.count then
							current_anchored_type := a_type
							internal_call := True
							args.item (an_index).type.process (Current)
							internal_call := False
							current_anchored_type := Void
						end
					end
				else
					a_feature := current_class.seeded_feature (a_seed)
					if a_feature /= Void then
						a_query_type := a_feature.type
						if a_query_type /= Void then
							current_anchored_type := a_type
							internal_call := True
							a_query_type.process (Current)
							internal_call := False
							current_anchored_type := Void
						end
					end
				end
			end
		end

	add_actual_parameters_to_sorter (a_parameters: ET_ACTUAL_PARAMETER_LIST) is
			-- Add to `anchored_type_sorter' anchored types whose
			-- anchors' types are (or contain) also anchored types.
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, nb: INTEGER
		do
			nb := a_parameters.count
			from i := 1 until i > nb loop
				internal_call := True
				a_parameters.type (i).process (Current)
				internal_call := False
				i := i + 1
			end
		end

	anchored_type_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_LIKE_IDENTIFIER]
			-- Anchored type sorter

	current_anchored_type: ET_LIKE_IDENTIFIER
			-- Anchored type (if any) whose anchor is the
			-- type being processed

feature {ET_AST_NODE} -- Type processing

	process_class (a_type: ET_CLASS) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if internal_call then
				internal_call := False
				a_parameters := a_type.actual_parameters
				if a_parameters /= Void then
					add_actual_parameters_to_sorter (a_parameters)
				end
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			if internal_call then
				internal_call := False
				add_like_feature_to_sorter (a_type)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if internal_call then
				internal_call := False
				a_parameters := a_type.actual_parameters
				if a_parameters /= Void then
					add_actual_parameters_to_sorter (a_parameters)
				end
			end
		end

feature {NONE} -- Implementation

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

invariant

	current_class_not_void: current_class /= Void
	anchored_type_sorter_not_void: anchored_type_sorter /= Void

end

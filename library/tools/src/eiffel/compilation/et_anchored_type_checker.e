note

	description:

		"Eiffel anchored type checkers when they appear in signatures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ANCHORED_TYPE_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_class,
			process_class_type,
			process_like_feature,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new anchored type checker.
		do
			precursor {ET_CLASS_SUBPROCESSOR}
			create anchored_type_sorter.make_default
		end

feature -- Type checking

	check_signatures (a_class: ET_CLASS)
			-- Check whether there is no cycle in the anchored types
			-- held in the types of all signatures of `a_class'.
			-- Do not try to follow qualified anchored types.
			-- This is done after the features of the corresponding
			-- classes have been flattened.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			l_type: detachable ET_TYPE
			l_previous_type: detachable ET_TYPE
			i, nb: INTEGER
			j, nb2: INTEGER
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			l_queries := current_class.queries
			nb := l_queries.count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_query.type.process (Current)
				if attached l_query.arguments as args then
					nb2 := args.count
					from j := 1 until j > nb2 loop
						l_type := args.formal_argument (j).type
						if l_type /= l_previous_type then
							l_type.process (Current)
							l_previous_type := l_type
						end
						j := j + 1
					end
					l_previous_type := Void
				end
				i := i + 1
			end
			l_procedures := current_class.procedures
			nb := l_procedures.count
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				if attached l_procedure.arguments as args then
					l_previous_type := Void
					nb2 := args.count
					from j := 1 until j > nb2 loop
						l_type := args.formal_argument (j).type
						if l_type /= l_previous_type then
							l_type.process (Current)
						end
						j := j + 1
					end
					l_previous_type := l_type
				end
				i := i + 1
			end
			anchored_type_sorter.sort
			if attached anchored_type_sorter.cycle as l_cycle and then not l_cycle.is_empty then
				check has_cycle: anchored_type_sorter.has_cycle end
				set_fatal_error
				error_handler.report_vtat2a_error (current_class, l_cycle)
			end
			anchored_type_sorter.wipe_out
			current_class := old_class
		end

feature {NONE} -- Type checking

	add_like_feature_to_sorter (a_type: ET_LIKE_FEATURE)
			-- Add to `anchored_type_sorter' anchored types whose
			-- anchors' types are (or contain) also anchored types.
		local
			a_seed: INTEGER
			l_query_type: ET_TYPE
			args: detachable ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			a_seed := a_type.seed
			if a_seed /= 0 then
					-- Anchored type already resolved.
				if attached current_anchored_type as l_current_anchored_type then
					anchored_type_sorter.force_relation (a_type, l_current_anchored_type)
				elseif a_type.is_like_argument then
					if attached current_class.seeded_feature (a_seed) as l_feature then
						args := l_feature.arguments
						an_index := a_type.index
						if args /= Void and then an_index <= args.count then
							current_anchored_type := a_type
							args.item (an_index).type.process (Current)
							current_anchored_type := Void
						end
					end
				elseif attached current_class.seeded_query (a_seed) as l_query then
					l_query_type := l_query.type
					current_anchored_type := a_type
					l_query_type.process (Current)
					current_anchored_type := Void
				end
			end
		end

	add_qualified_like_identifier_to_sorter (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Add to `anchored_type_sorter' anchored types whose
			-- anchors' types are (or contain) also anchored types.
		do
				-- We need to process 'like a' in types of
				-- the form 'like a.b' and 'like {like a}.b'.
			a_type.target_type.process (Current)
		end

	add_actual_parameters_to_sorter (a_parameters: ET_ACTUAL_PARAMETERS)
			-- Add to `anchored_type_sorter' anchored types whose
			-- anchors' types are (or contain) also anchored types.
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, nb: INTEGER
		do
			nb := a_parameters.count
			from i := 1 until i > nb loop
				a_parameters.type (i).process (Current)
				i := i + 1
			end
		end

	anchored_type_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_LIKE_FEATURE]
			-- Anchored type sorter

	current_anchored_type: detachable ET_LIKE_FEATURE
			-- Anchored type (if any) whose anchor is the
			-- type being processed

feature {ET_AST_NODE} -- Type processing

	process_class (a_type: ET_CLASS)
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.actual_parameters as l_parameters then
				add_actual_parameters_to_sorter (l_parameters)
			end
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			add_like_feature_to_sorter (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			add_qualified_like_identifier_to_sorter (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			add_qualified_like_identifier_to_sorter (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.actual_parameters as l_parameters then
				add_actual_parameters_to_sorter (l_parameters)
			end
		end

invariant

	anchored_type_sorter_not_void: anchored_type_sorter /= Void

end

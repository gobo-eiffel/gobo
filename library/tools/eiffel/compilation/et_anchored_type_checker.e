indexing

	description:

		"Eiffel anchored type checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2008, Eric Bezault and others"
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
			process_generic_class_type,
			process_like_feature,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new anchored type checker.
		do
			precursor {ET_CLASS_SUBPROCESSOR}
			create anchored_type_sorter.make_default
		end

feature -- Type checking

	check_signatures (a_class: ET_CLASS) is
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
			a_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
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
				a_type := l_query.type
				a_type.process (Current)
				args := l_query.arguments
				if args /= Void then
					nb2 := args.count
					from j := 1 until j > nb2 loop
						args.formal_argument (j).type.process (Current)
						j := j + 1
					end
				end
				i := i + 1
			end
			l_procedures := current_class.procedures
			nb := l_procedures.count
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				args := l_procedure.arguments
				if args /= Void then
					nb2 := args.count
					from j := 1 until j > nb2 loop
						args.formal_argument (j).type.process (Current)
						j := j + 1
					end
				end
				i := i + 1
			end
			anchored_type_sorter.sort
			if anchored_type_sorter.has_cycle then
				set_fatal_error
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
			a_feature: ET_FEATURE
			l_query: ET_QUERY
			l_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			a_seed := a_type.seed
			if a_seed /= 0 then
					-- Anchored type already resolved.
				if current_anchored_type /= Void then
					anchored_type_sorter.force_relation (a_type, current_anchored_type)
				elseif a_type.is_like_argument then
					if a_type.is_procedure then
						a_feature := current_class.seeded_procedure (a_seed)
					else
						a_feature := current_class.seeded_query (a_seed)
					end
					if a_feature /= Void then
						args := a_feature.arguments
						an_index := a_type.index
						if args /= Void and then an_index <= args.count then
							current_anchored_type := a_type
							args.item (an_index).type.process (Current)
							current_anchored_type := Void
						end
					end
				else
					l_query := current_class.seeded_query (a_seed)
					if l_query /= Void then
						l_query_type := l_query.type
						current_anchored_type := a_type
						l_query_type.process (Current)
						current_anchored_type := Void
					end
				end
			end
		end

	add_qualified_like_identifier_to_sorter (a_type: ET_QUALIFIED_LIKE_IDENTIFIER) is
			-- Add to `anchored_type_sorter' anchored types whose
			-- anchors' types are (or contain) also anchored types.
		do
				-- We need to process 'like a' in types of
				-- the form 'like a.b' and 'like {like a}.b'.
			a_type.target_type.process (Current)
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
				a_parameters.type (i).process (Current)
				i := i + 1
			end
		end

	anchored_type_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_LIKE_FEATURE]
			-- Anchored type sorter

	current_anchored_type: ET_LIKE_FEATURE
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
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				add_actual_parameters_to_sorter (a_parameters)
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
			add_like_feature_to_sorter (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE) is
			-- Process `a_type'.
		do
			add_qualified_like_identifier_to_sorter (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		do
			add_qualified_like_identifier_to_sorter (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				add_actual_parameters_to_sorter (a_parameters)
			end
		end

invariant

	anchored_type_sorter_not_void: anchored_type_sorter /= Void

end

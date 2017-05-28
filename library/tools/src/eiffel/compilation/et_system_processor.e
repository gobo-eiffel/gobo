note

	description:

		"Eiffel system processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM_PROCESSOR

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make,
	make_null

feature {NONE} -- Initialization

	make
			-- Create a null system processor.
		do
			make_null
			create {ET_EIFFEL_PREPARSER} eiffel_preparser.make (current)
			create {ET_MASTER_CLASS_CHECKER} master_class_checker.make (Current)
			create {ET_EIFFEL_PARSER} eiffel_parser.make (Current)
			create {ET_PROVIDER_CHECKER} provider_checker.make (Current)
			create {ET_ANCESTOR_BUILDER} ancestor_builder.make (Current)
			create {ET_FEATURE_FLATTENER} feature_flattener.make (Current)
			create {ET_INTERFACE_CHECKER} interface_checker.make (Current)
			create {ET_IMPLEMENTATION_CHECKER} implementation_checker.make (Current)
			error_handler := tokens.standard_error_handler
		end

	make_null
			-- Create a null system processor.
		local
			l_null_processor: ET_AST_NULL_PROCESSOR
		do
			ast_factory := tokens.default_ast_factory
			l_null_processor := tokens.null_ast_processor
			eiffel_preparser := l_null_processor
			master_class_checker := l_null_processor
			eiffel_parser := l_null_processor
			provider_checker := l_null_processor
			ancestor_builder := l_null_processor
			feature_flattener := l_null_processor
			interface_checker := l_null_processor
			implementation_checker := l_null_processor
			error_handler := tokens.null_error_handler
			create {ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER} dotnet_assembly_consumer.make (Current)
		end

feature -- Initialization

	activate (a_system: ET_SYSTEM)
			-- Activate current processor to process `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			l_null_processor: ET_AST_NULL_PROCESSOR
		do
			l_null_processor := tokens.null_ast_processor
			if eiffel_preparser = l_null_processor then
				create {ET_EIFFEL_PREPARSER} eiffel_preparser.make (current)
			end
			if master_class_checker = l_null_processor then
				create {ET_MASTER_CLASS_CHECKER} master_class_checker.make (Current)
			end
			if eiffel_parser = l_null_processor then
				create {ET_EIFFEL_PARSER} eiffel_parser.make (Current)
			end
			if provider_checker = l_null_processor then
				create {ET_PROVIDER_CHECKER} provider_checker.make (Current)
			end
			if ancestor_builder = l_null_processor then
				create {ET_ANCESTOR_BUILDER} ancestor_builder.make (Current)
			end
			if feature_flattener = l_null_processor then
				create {ET_FEATURE_FLATTENER} feature_flattener.make (Current)
			end
			if interface_checker = l_null_processor then
				create {ET_INTERFACE_CHECKER} interface_checker.make (Current)
			end
			if implementation_checker = l_null_processor then
				create {ET_IMPLEMENTATION_CHECKER} implementation_checker.make (Current)
			end
			if attached {ET_IMPLEMENTATION_CHECKER} implementation_checker as l_implementation_checker then
				l_implementation_checker.set_flat_mode (a_system.flat_mode)
				l_implementation_checker.set_flat_dbc_mode (a_system.flat_dbc_mode)
				l_implementation_checker.set_suppliers_enabled (a_system.suppliers_enabled)
			end
		end

feature -- Status report

	benchmark_shown: BOOLEAN
			-- Should benchmark be shown for each Degree?

	metrics_shown: BOOLEAN
			-- Should metrics be shown?

feature -- Status setting

	set_benchmark_shown (b: BOOLEAN)
			-- Set `benchmark_shown' to `b'.
		do
			benchmark_shown := b
		ensure
			benchmark_shown_set: benchmark_shown = b
		end

	set_benchmark_shown_recursive (b: BOOLEAN)
			-- Set `benchmark_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_benchmark_shown (b)
		ensure
			benchmark_shown_set: benchmark_shown = b
		end

	set_metrics_shown (b: BOOLEAN)
			-- Set `metrics_shown' to `b'.
		do
			metrics_shown := b
		ensure
			metrics_shown_set: metrics_shown = b
		end

	set_metrics_shown_recursive (b: BOOLEAN)
			-- Set `metrics_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_metrics_shown (b)
		ensure
			metrics_shown_set: metrics_shown = b
		end

feature -- Parser status report

	cluster_dependence_enabled: BOOLEAN
			-- Should cluster dependence constraints be checked?

	use_cluster_dependence_pathnames: BOOLEAN
			-- Should cluster dependence constraints specified in 'providers.txt'
			-- and 'dependants.txt' files be considered as group pathnames
			-- (possibly with wildcards)? Otherwise they are considered as
			-- group names.

feature -- Parser status setting

	set_cluster_dependence_enabled (b: BOOLEAN)
			-- Set `cluster_dependence_enabled' to `b'.
		do
			cluster_dependence_enabled := b
		ensure
			cluster_dependence_enabled_set: cluster_dependence_enabled = b
		end

	set_cluster_dependence_enabled_recursive (b: BOOLEAN)
			-- Set `cluster_dependence_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_cluster_dependence_enabled (b)
		ensure
			cluster_dependence_enabled_set: cluster_dependence_enabled = b
		end

	set_use_cluster_dependence_pathnames (b: BOOLEAN)
			-- Set `use_cluster_dependence_pathnames' to `b'.
		do
			use_cluster_dependence_pathnames := b
		ensure
			use_cluster_dependence_pathnames_set: use_cluster_dependence_pathnames = b
		end

	set_use_cluster_dependence_pathnames_recursive (b: BOOLEAN)
			-- Set `use_cluster_dependence_pathnames' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_use_cluster_dependence_pathnames (b)
		ensure
			use_cluster_dependence_pathnames_set: use_cluster_dependence_pathnames = b
		end

feature -- Access

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

	eiffel_preparser: ET_AST_PROCESSOR
			-- Eiffel preparser

	eiffel_parser: ET_AST_PROCESSOR
			-- Eiffel parser

	dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER
			-- .NET assembly consumer

	master_class_checker: ET_AST_PROCESSOR
			-- Master class checker

	provider_checker: ET_AST_PROCESSOR
			-- Provider checker

	ancestor_builder: ET_AST_PROCESSOR
			-- Ancestor builder

	feature_flattener: ET_AST_PROCESSOR
			-- Feature flattener

	interface_checker: ET_AST_PROCESSOR
			-- Interface checker

	implementation_checker: ET_AST_PROCESSOR
			-- Implementation checker

	error_handler: ET_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_ast_factory (a_factory: like ast_factory)
			-- Set `ast_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			ast_factory := a_factory
		ensure
			ast_factory_set: ast_factory = a_factory
		end

	set_ast_factory_recursive (a_factory: like ast_factory)
			-- Set `ast_factory' to `a_factory' in current system processor
			-- and all other system processors in case of a multiprocessor.
		require
			a_factory_not_void: a_factory /= Void
		do
			set_ast_factory (a_factory)
		ensure
			ast_factory_set: ast_factory = a_factory
		end

	set_eiffel_preparser (a_eiffel_preparser: like eiffel_preparser)
			-- Set `eiffel_preparser' to `a_eiffel_preparser'.
		require
			a_eiffel_preparser_not_void: a_eiffel_preparser /= Void
		do
			eiffel_preparser := a_eiffel_preparser
		ensure
			eiffel_preparser_set: eiffel_preparser = a_eiffel_preparser
		end

	set_eiffel_parser (a_eiffel_parser: like eiffel_parser)
			-- Set `eiffel_parser' to `a_eiffel_parser'.
		require
			a_eiffel_parser_not_void: a_eiffel_parser /= Void
		do
			eiffel_parser := a_eiffel_parser
		ensure
			eiffel_parser_set: eiffel_parser = a_eiffel_parser
		end

	set_dotnet_assembly_consumer (a_consumer: like dotnet_assembly_consumer)
			-- Set `dotnet_assembly_consumer' to `a_consumer'.
		require
			a_consumer_not_void: a_consumer /= Void
		do
			dotnet_assembly_consumer := a_consumer
		ensure
			dotnet_assembly_consumer_set: dotnet_assembly_consumer = a_consumer
		end

	set_master_class_checker (a_master_class_checker: like master_class_checker)
			-- Set `master_class_checker' to `a_master_class_checker'.
		require
			a_master_class_checker_not_void: a_master_class_checker /= Void
		do
			master_class_checker := a_master_class_checker
		ensure
			master_class_checker_set: master_class_checker = a_master_class_checker
		end

	set_provider_checker (a_provider_checker: like provider_checker)
			-- Set `provider_checker' to `a_provider_checker'.
		require
			a_provider_checker_not_void: a_provider_checker /= Void
		do
			provider_checker := a_provider_checker
		ensure
			provider_checker_set: provider_checker = a_provider_checker
		end

	set_ancestor_builder (an_ancestor_builder: like ancestor_builder)
			-- Set `ancestor_builder' to `an_ancestor_builder'.
		require
			an_ancestor_builder_not_void: an_ancestor_builder /= Void
		do
			ancestor_builder := an_ancestor_builder
		ensure
			ancestor_builder_set: ancestor_builder = an_ancestor_builder
		end

	set_feature_flattener (a_feature_flattener: like feature_flattener)
			-- Set `feature_flattener' to `a_feature_flattener'.
		require
			a_feature_flattener_not_void: a_feature_flattener /= Void
		do
			feature_flattener := a_feature_flattener
		ensure
			feature_flattener_set: feature_flattener = a_feature_flattener
		end

	set_interface_checker (an_interface_checker: like interface_checker)
			-- Set `interface_checker' to `an_interface_checker'.
		require
			an_interface_checker_not_void: an_interface_checker /= Void
		do
			interface_checker := an_interface_checker
		ensure
			interface_checker_set: interface_checker = an_interface_checker
		end

	set_implementation_checker (a_checker: like implementation_checker)
			-- Set `implementation_checker' to `a_checker'.
		require
			a_checker_not_void: a_checker /= Void
		do
			implementation_checker := a_checker
		ensure
			implementation_checker_set: implementation_checker = a_checker
		end

	set_error_handler (a_handler: like error_handler)
			-- Set `error_handler' to `a_handler'.
		require
			a_handler_not_void: a_handler /= Void
		do
			error_handler := a_handler
		ensure
			error_handler_set: error_handler = a_handler
		end

	set_error_handler_recursive (a_handler: like error_handler)
			-- Set `error_handler' to `a_handler' in current system processor
			-- and all other system processors in case of a multiprocessor.
		require
			a_handler_not_void: a_handler /= Void
		do
			set_error_handler (a_handler)
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Processing

	compile (a_system: ET_SYSTEM)
			-- Compile all classes reachable from the root class of `a_system'.
			-- `a_system.flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `a_system.flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		local
			l_root_class: ET_CLASS
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
		do
			if not attached a_system.root_type as l_root_type then
				-- Do nothing.
			else
				compile_degree_6 (a_system)
				if l_root_type.same_named_type (a_system.none_type, tokens.unknown_class, tokens.unknown_class) then
					create l_classes.make (a_system.class_count_recursive)
					a_system.classes_do_recursive (agent l_classes.force_last)
					compile_classes (l_classes)
				elseif l_root_type.same_named_type (a_system.any_type, tokens.unknown_class, tokens.unknown_class) then
					create l_classes.make (a_system.class_count_recursive)
					a_system.classes_do_recursive (agent l_classes.force_last)
					compile_classes (l_classes)
				else
					l_root_class := l_root_type.base_class
					l_root_class.process (eiffel_parser)
					if not l_root_class.is_preparsed then
							-- Error: unknown root class.
						error_handler.report_gvsrc4a_error (l_root_class)
					else
						create l_classes.make (a_system.class_count_recursive)
						a_system.classes_do_recursive (agent l_classes.force_last)
						compile_marked_classes (l_classes)
					end
				end
			end
		end

	compile_all (a_system: ET_SYSTEM)
			-- Compile all classes in `a_system'.
			-- `a_system.flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `a_system.flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		local
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
		do
			compile_degree_6 (a_system)
			create l_classes.make (a_system.class_count_recursive)
			a_system.classes_do_recursive (agent l_classes.force_last)
			compile_classes (l_classes)
		end

	compile_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Compile all classes in `a_classes'.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		do
			compile_degree_5 (a_classes, False)
			compile_degree_4 (a_classes)
			compile_degree_3 (a_classes)
		end

	compile_marked_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Compile marked all classes in `a_classes'.
			--
			-- Note that parsing these classes may mark other classes. Process these
			-- other classes as well until no more marked classes are not processed.
			-- Remove unmarked classes from `a_classes' when no more marked classes
			-- need to be parsed.

			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		do
			compile_degree_5 (a_classes, True)
			compile_degree_4 (a_classes)
			compile_degree_3 (a_classes)
		end

	compile_degree_6 (a_system: ET_SYSTEM)
			-- Equivalent of ISE's Degree 6 on `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			a_system.preparse_recursive (Current)
			if dt1 /= Void then
				print_time (dt1, "Degree 6")
			end
			if metrics_shown then
				error_handler.info_file.put_string ("Preparsed ")
				error_handler.info_file.put_integer (a_system.class_count_recursive)
				error_handler.info_file.put_line (" classes")
			end
		end

	compile_degree_5 (a_classes: DS_ARRAYED_LIST [ET_CLASS]; a_marked_only: BOOLEAN)
			-- Equivalent of ISE's Degree 5 on `a_classes'.
			--
			-- `a_marked_only' indicates that only classes which are marked will be processed.
			-- Note that parsing these classes may mark other classes. Process these
			-- other classes as well until no more marked classes are not processed.
			-- Remove unmarked classes from `a_classes' when no more marked classes
			-- need to be parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			if a_marked_only then
				parse_marked_classes (a_classes)
				remove_unmarked_classes (a_classes)
			else
				parse_classes (a_classes)
			end
			if not stop_requested then
				set_syntax_internal_error (a_classes)
			end
			check_provider_validity (a_classes)
			if not stop_requested then
				if metrics_shown then
					error_handler.info_file.put_string ("Parsed ")
					error_handler.info_file.put_integer (a_classes.count)
					error_handler.info_file.put_line (" classes")
					error_handler.info_file.put_integer (feature_count (a_classes))
					error_handler.info_file.put_line (" features")
				end
				if dt1 /= Void then
					print_time (dt1, "Degree 5")
				end
			end
		end

	compile_degree_4 (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Equivalent of ISE Eiffel's Degree 4 on `a_classes'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			build_ancestors (a_classes)
			if not stop_requested then
				set_ancestors_internal_error (a_classes)
			end
			flatten_features (a_classes)
			if not stop_requested then
				set_flattening_internal_error (a_classes)
			end
			check_interface_validity (a_classes)
			if not stop_requested then
				set_interface_internal_error (a_classes)
			end
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "Degree 4")
				end
				if metrics_shown then
					error_handler.info_file.put_string ("Flattened ")
					error_handler.info_file.put_integer (a_classes.count)
					error_handler.info_file.put_line (" classes")
					error_handler.info_file.put_integer (feature_count (a_classes))
					error_handler.info_file.put_line (" features")
				end
			end
		end

	compile_degree_3 (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Equivalent of ISE's Degree 3 on `a_classes'.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			check_implementation_validity (a_classes)
			if not stop_requested then
				set_implementation_internal_error (a_classes)
			end
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "Degree 3")
				end
			end
		end

	parse_system (a_system: ET_SYSTEM)
			-- Parse all classes reachable from the root class of `a_system'
			-- which have not been parsed yet.
			-- The Eiffel system needs to have been preparsed beforehand.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		local
			l_root_class: ET_CLASS
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
		do
			if not attached a_system.root_type as l_root_type then
				-- Do nothing.
			elseif l_root_type.same_named_type (a_system.none_type, tokens.unknown_class, tokens.unknown_class) then
				create l_classes.make (a_system.class_count_recursive)
				a_system.classes_do_recursive (agent l_classes.force_last)
				parse_classes (l_classes)
			elseif l_root_type.same_named_type (a_system.any_type, tokens.unknown_class, tokens.unknown_class) then
				create l_classes.make (a_system.class_count_recursive)
				a_system.classes_do_recursive (agent l_classes.force_last)
				parse_classes (l_classes)
			else
				l_root_class := l_root_type.base_class
				l_root_class.process (eiffel_parser)
				if not l_root_class.is_preparsed then
						-- Error: unknown root class.
					error_handler.report_gvsrc4a_error (l_root_class)
				else
					create l_classes.make (a_system.class_count_recursive)
					a_system.classes_do_recursive (agent l_classes.force_last)
					parse_marked_classes (l_classes)
				end
			end
		end

	parse_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Parse all classes in `a_classes' which have not been parsed yet.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if not l_class.is_parsed then
					l_class.process (eiffel_parser)
				end
				i := i + 1
			end
		end

	parse_marked_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Parse all marked classes in `a_classes' which have not been parsed yet.
			-- Note that parsing these classes may mark other classes. Parse these
			-- other classes as well until no more marked classes are not parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_done: BOOLEAN
			l_count, l_old_count: INTEGER
		do
			from
				nb := a_classes.count
			until
				l_done
			loop
				l_count := 0
				from i := 1 until i > nb loop
					if stop_requested then
							-- Jump out of the loops.
						l_done := True
						i := nb
					else
						l_class :=  a_classes.item (i)
						if l_class.is_marked then
							if l_class.is_parsed then
								l_count := l_count + 1
							else
								l_class.process (eiffel_parser)
								if l_class.is_parsed then
									l_count := l_count + 1
								end
							end
						end
					end
					i := i + 1
				end
				if not l_done then
					l_done := (l_count = l_old_count)
					l_old_count := l_count
				end
			end
		end

	check_provider_validity (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Check cluster dependence constraints on the classes
			-- of `a_classes' which have been parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			if cluster_dependence_enabled then
				from
					i := 1
					nb := a_classes.count
				until
					i > nb or stop_requested
				loop
					l_class := a_classes.item (i)
					if l_class.is_parsed then
						l_class.process (provider_checker)
					end
					i := i + 1
				end
			end
		end

	build_ancestors (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Build ancestors of all classes in `a_classes' if not already done.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if l_class.is_parsed then
					if not l_class.ancestors_built then
						l_class.process (ancestor_builder)
					end
				end
				i := i + 1
			end
		end

	flatten_features (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Flatten features of all classes in `a_classes' if not already done.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if l_class.ancestors_built then
					if not l_class.features_flattened then
						l_class.process (feature_flattener)
					end
				end
				i := i + 1
			end
		end

	check_interface_validity (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Check the interface of all classes in `a_classes' if not already done.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if l_class.features_flattened then
					if not l_class.interface_checked then
						l_class.process (interface_checker)
					end
				end
				i := i + 1
			end
		end

	check_implementation_validity (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Check the implementation of the features of `a_classes' if not already done.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_processor: ET_AST_PROCESSOR
			l_system: ET_SYSTEM
			l_done: BOOLEAN
			l_count, l_old_count: INTEGER
		do
			nb := a_classes.count
			if nb > 0 then
				l_processor := implementation_checker
				if attached {ET_IMPLEMENTATION_CHECKER} l_processor as l_checker then
					l_system := a_classes.first.current_system
					l_checker.set_flat_mode (l_system.flat_mode)
					l_checker.set_flat_dbc_mode (l_system.flat_dbc_mode)
					l_checker.set_suppliers_enabled (l_system.suppliers_enabled)
				end
				from
				until
					l_done
				loop
					l_count := 0
					from i := 1 until i > nb loop
						if stop_requested then
								-- Jump out of the loops.
							l_done := True
							i := nb
						else
							l_class :=  a_classes.item (i)
							if l_class.interface_checked then
								if l_class.implementation_checked then
									l_count := l_count + 1
								else
									l_class.process (l_processor)
									if l_class.implementation_checked then
										l_count := l_count + 1
									end
								end
							end
						end
						i := i + 1
					end
					if not l_done then
						l_done := (l_count = l_old_count)
						l_old_count := l_count
					end
				end
			end
		end

	check_master_class_validity (a_system: ET_SYSTEM)
			-- Check for invalid class name clashes and invalid class overriding in `a_system'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.master_classes_do_recursive_until (agent {ET_MASTER_CLASS}.process (master_class_checker), stop_request)
		end

feature -- Timing

	print_time (a_start: DT_DATE_TIME; a_degree: STRING)
			-- Print time spent in `a_degree' since `a_start'.
		require
			a_start_not_void: a_start /= Void
			a_degree_not_void: a_degree /= Void
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt2: DT_DATE_TIME
			dtd: DT_DATE_TIME_DURATION
		do
			if not stop_requested then
				create l_clock
				dt2 := l_clock.system_clock.date_time_now
				dtd := dt2 - a_start
				dtd.set_canonical (a_start)
				error_handler.info_file.put_string (a_degree)
				error_handler.info_file.put_string (": ")
				error_handler.info_file.put_line (dtd.out)
				debug ("stop")
					io.read_line
				end
			end
		end

feature -- Stop

	stop_requested: BOOLEAN
			-- Has the interruption of the current operation
			-- been requested? The operation will therefore be
			-- interrupted at the earliest possible time.
		do
			if attached stop_request as l_stop_request then
				Result := l_stop_request.item ([])
			end
		end

	stop_request: detachable FUNCTION [BOOLEAN]
			-- Agent used to figure out whether there has been
			-- a request to interrupt the current operation;
			-- No interruption if Void

	set_stop_request (a_stop_request: like stop_request)
			-- Set `stop_request' to `a_stop_request'.
		do
			stop_request := a_stop_request
		ensure
			stop_request_set: stop_request = a_stop_request
		end

	set_stop_request_recursive (a_stop_request: like stop_request)
			-- Set `stop_request' to `a_stop_request' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_stop_request (a_stop_request)
		ensure
			stop_request_set: stop_request = a_stop_request
		end

feature {NONE} -- Implementation

	remove_unmarked_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Remove classes from `a_classes' which are not marked.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, j, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if l_class.is_marked then
					j := j + 1
					a_classes.put (l_class, j)
				end
				i := i + 1
			end
			a_classes.keep_first (j)
		ensure
			no_void_class: not a_classes.has_void
			classes_removed: a_classes.count <= old a_classes.count
			all_marked: a_classes.for_all (agent {ET_CLASS}.is_marked)
		end

	feature_count (a_classes: DS_ARRAYED_LIST [ET_CLASS]): INTEGER
			-- Number of features (immediate or inherited) in `a_classes'
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				Result := l_class.queries.count + l_class.procedures.count
				i := i + 1
			end
		ensure
			feature_count_not_negative: Result >= 0
		end

	set_syntax_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set syntax error to all classes of `a_classes' which have not been parsed.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.is_parsed then
					l_class.set_syntax_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_classes_parsed: a_classes.for_all (agent {ET_CLASS}.is_parsed)
		end

	set_ancestors_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set ancestors error to all classes of `a_classes' for which
			-- the ancestors have not been built.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.ancestors_built then
					l_class.set_ancestors_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_ancestors_built: a_classes.for_all (agent {ET_CLASS}.ancestors_built)
		end

	set_flattening_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set flattening error to all classes of `a_classes' for which
			-- the features have not been flattened.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.features_flattened then
					l_class.set_flattening_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_features_flattened: a_classes.for_all (agent {ET_CLASS}.features_flattened)
		end

	set_interface_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set interface error to all classes of `a_classes' for which
			-- the interface has not been checked.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.interface_checked then
					l_class.set_interface_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_interface_checked: a_classes.for_all (agent {ET_CLASS}.interface_checked)
		end

	set_implementation_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set implementation error to all classes of `a_classes' for which
			-- the implementation has not been checked.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.implementation_checked then
					l_class.set_implementation_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_implementation_checked: a_classes.for_all (agent {ET_CLASS}.implementation_checked)
		end

invariant

	ast_factory_not_void: ast_factory /= Void
	eiffel_preparser_not_void: eiffel_preparser /= Void
	eiffel_parser_not_void: eiffel_parser /= Void
	dotnet_assembly_consumer_not_void: dotnet_assembly_consumer /= Void
	master_class_checker_not_void: master_class_checker /= Void
	provider_checker_not_void: provider_checker /= Void
	ancestor_builder_not_void: ancestor_builder /= Void
	feature_flattener_not_void: feature_flattener /= Void
	interface_checker_not_void: interface_checker /= Void
	implementation_checker_not_void: implementation_checker /= Void
	error_handler_not_void: error_handler /= Void

end

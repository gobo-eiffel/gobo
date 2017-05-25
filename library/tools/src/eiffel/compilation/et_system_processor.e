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

feature -- Processing

	compile (a_system: ET_SYSTEM)
			-- Compile `a_system'.
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
		do
			if not attached a_system.root_type as l_root_type then
				compile_all (a_system)
			elseif l_root_type = a_system.none_type then
				compile_all (a_system)
			elseif l_root_type = a_system.any_type then
				compile_all (a_system)
			else
				compile_system (a_system)
			end
		end

	compile_system (a_system: ET_SYSTEM)
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
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			a_system.preparse_recursive (Current)
			if not stop_requested and then dt1 /= Void and l_clock /= Void then
				print_time (dt1, "Degree 6")
				dt1 := l_clock.system_clock.date_time_now
			end
			a_system.parse_system (Current)
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Preparsed ")
				error_handler.info_file.put_integer (a_system.class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (a_system.parsed_class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (a_system.registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
			if not stop_requested and then dt1 /= Void and l_clock /= Void then
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4 (a_system)
			if not stop_requested and then dt1 /= Void and l_clock /= Void then
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3 (a_system)
			if not stop_requested and then dt1 /= Void then
				print_time (dt1, "Degree 3")
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
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			if is_degree_6_required (a_system) then
				a_system.preparse_recursive (Current)
				if not stop_requested and then dt1 /= Void and l_clock /= Void then
					print_time (dt1, "Degree 6")
					dt1 := l_clock.system_clock.date_time_now
				end
				compile_degree_5 (a_system)
			else
				a_system.parse_all_recursive (Current)
				check_provider_validity (a_system)
				if not stop_requested and then error_handler.benchmark_shown then
					error_handler.info_file.put_string ("Parsed ")
					error_handler.info_file.put_integer (a_system.parsed_class_count_recursive)
					error_handler.info_file.put_line (" classes")
					error_handler.info_file.put_integer (a_system.registered_feature_count)
					error_handler.info_file.put_line (" features")
				end
			end
			if not stop_requested and then dt1 /= Void and l_clock /= Void then
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4 (a_system)
			if not stop_requested and then dt1 /= Void and l_clock /= Void then
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3 (a_system)
			if not stop_requested and then dt1 /= Void then
				print_time (dt1, "Degree 3")
			end
		end

	compile_degree_5 (a_system: ET_SYSTEM)
			-- Equivalent of ISE's Degree 5 on `a_system'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		do
			compile_degree_5_2 (a_system)
			check_provider_validity (a_system)
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (a_system.parsed_class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (a_system.registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
		end

	compile_degree_5_2 (a_system: ET_SYSTEM)
			-- Parse classes of `a_system'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive_until (agent {ET_CLASS}.process (eiffel_parser), stop_request)
		end

	compile_degree_4 (a_system: ET_SYSTEM)
			-- Equivalent of ISE Eiffel's Degree 4 on `a_system'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		do
				-- Build ancestors.
			a_system.classes_do_if_recursive_until (agent {ET_CLASS}.process (ancestor_builder), agent {ET_CLASS}.is_parsed, stop_request)
				-- Flatten features.
			a_system.classes_do_if_recursive_until (agent {ET_CLASS}.process (feature_flattener), agent {ET_CLASS}.ancestors_built, stop_request)
				-- Check interface.
			a_system.classes_do_if_recursive_until (agent {ET_CLASS}.process (interface_checker), agent {ET_CLASS}.features_flattened, stop_request)
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Flattened ")
				error_handler.info_file.put_integer (a_system.parsed_class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (a_system.registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
		end

	compile_degree_3 (a_system: ET_SYSTEM)
			-- Equivalent of ISE Eiffel's Degree 3 on `a_system'.
			-- `a_system.flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `a_system.flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		local
			l_processor: ET_AST_PROCESSOR
		do
				-- Check implementation.
			l_processor := implementation_checker
			if attached {ET_IMPLEMENTATION_CHECKER} l_processor as l_checker then
				l_checker.set_flat_mode (a_system.flat_mode)
				l_checker.set_flat_dbc_mode (a_system.flat_dbc_mode)
				l_checker.set_suppliers_enabled (a_system.suppliers_enabled)
				from
					l_checker.set_has_class_not_processed (False)
					a_system.classes_do_if_recursive_until (agent {ET_CLASS}.process (l_checker), agent {ET_CLASS}.interface_checked, stop_request)
				until
					not l_checker.has_class_not_processed or stop_requested
				loop
					l_checker.set_has_class_not_processed (False)
					a_system.classes_do_if_recursive_until (agent {ET_CLASS}.process (l_checker), agent {ET_CLASS}.interface_checked, stop_request)
				end
			else
				a_system.classes_do_if_recursive_until (agent {ET_CLASS}.process (l_processor), agent {ET_CLASS}.interface_checked, stop_request)
			end
		end

	check_provider_validity (a_system: ET_SYSTEM)
			-- Check cluster dependence constraints on `a_system'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		do
			if a_system.cluster_dependence_enabled then
				a_system.classes_do_if_recursive_until (agent {ET_CLASS}.process (provider_checker), agent {ET_CLASS}.is_parsed, stop_request)
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

feature {NONE} -- Implementation

	is_degree_6_required (a_system: ET_SYSTEM): BOOLEAN
			-- Should Degree 6 be done on `a_system' even when parsing all classes?
		require
			a_system_not_void: a_system /= Void
		do
			Result := a_system.preparse_enabled
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

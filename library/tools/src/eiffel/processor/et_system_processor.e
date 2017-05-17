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

indexing

	description:

		"Eiffel class universes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_UNIVERSE

creation

	make, make_with_factory

feature {NONE} -- Initialization

	make (a_clusters: like clusters; an_error_handler: like error_handler) is
			-- Create a new class universe.
		require
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_AST_FACTORY
		do
			!! a_factory.make
			make_with_factory (a_clusters, a_factory, an_error_handler)
		ensure
			clusters_set: clusters = a_clusters
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_clusters: like clusters; a_factory: like ast_factory;
		an_error_handler: like error_handler) is
			-- Create a new class universe.
		require
			an_error_handler_not_void: an_error_handler /= Void
			a_factory_not_void: a_factory /= Void
		do
			clusters := a_clusters
			!! classes.make (3000)
			!! features.make (100000)
			error_handler := an_error_handler
			ast_factory := a_factory
			make_basic_classes
			!! eiffel_parser.make_with_factory (Current, a_factory, an_error_handler)
			eiffel_parser.set_create_keyword (True)
			!DS_HASH_TOPOLOGICAL_SORTER [ET_CLASS]! class_sorter.make_default
			!DS_HASH_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]! formal_generic_parameter_sorter.make_default
			!! feature_flattener.make (any_class)
		ensure
			clusters_set: clusters = a_clusters
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

	make_basic_classes is
			-- Create basic classes.
		local
			id: ET_IDENTIFIER
			p: ET_FILE_POSITION
			any_parent: ET_PARENT
		do
			!! p.make ("", 0, 0)
			!! id.make ("ANY", p)
			any_class := eiffel_class (id)
			!! id.make ("GENERAL", p)
			general_class := eiffel_class (id)
			!! id.make ("NONE", p)
			none_class := eiffel_class (id)
			!! any_type.make (any_class.name, any_class)
			!! any_parent.make (any_type, Void, Void, Void, Void, Void)
			!! any_parents.make (any_parent)
		ensure
			any_class_not_void: any_class /= Void
			general_class_not_void: general_class /= Void
			none_class_not_void: none_class /= Void
			any_type_not_void: any_type /= Void
			any_parents_not_void: any_parents /= Void
		end

feature -- Status report

	has_class (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Is there a class named `a_name'
			-- in current universe?
		require
			a_name_not_void: a_name /= Void
		do
			classes.search (a_name)
			if classes.found then
				Result := classes.found_item.is_parsed
			end
		ensure
			is_parsed: Result implies eiffel_class (a_name).is_parsed
		end

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	root_class: ET_CLASS
			-- Root class

	classes: DS_HASH_TABLE [ET_CLASS, ET_IDENTIFIER]
			-- Classes in universe

	features: DS_ARRAYED_LIST [ET_FEATURE]
			-- Features in universe, indexed by feature IDs

	eiffel_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- Class named `a_name' in universe
		require
			a_name_not_void: a_name /= Void
		do
			if classes.has (a_name) then
				Result := classes.item (a_name)
			else
				Result := ast_factory.new_class (a_name, classes.count + 1, Current)
				classes.force_last (Result, a_name)
			end
		ensure
			class_not_void: Result /= Void
		end

	descendants (a_class: ET_CLASS): DS_ARRAYED_LIST [ET_CLASS] is
			-- Proper descendant classes of `a_class'
		require
			a_class_not_void: a_class /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_IDENTIFIER]
			other_class: ET_CLASS
		do
			if a_class = any_class or a_class = general_class then
				!! Result.make (classes.count)
			else
				!! Result.make (10)
			end
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				other_class := a_cursor.item
				if other_class.ancestors_searched and not other_class.has_ancestors_error then
					if other_class.has_ancestor (a_class) then
						Result.force_last (other_class)
					end
				end
				a_cursor.forth
			end
		ensure
			descendants_not_void: Result /= Void
			no_void_descendant: not Result.has (Void)
		end

	error_handler: ET_ERROR_HANDLER
			-- Error handler

feature -- Basic classes

	any_class: ET_CLASS
			-- Class ANY

	general_class: ET_CLASS
			-- Class GENERAL

	none_class: ET_CLASS
			-- Class NONE

	any_type: ET_CLASS_TYPE
			-- Class type ANY

	any_parents: ET_PARENTS
			-- Default parents

feature -- Factory

	new_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_clients: ET_CLIENTS; a_class: ET_CLASS): ET_ATTRIBUTE is
			-- New attribute feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_attribute (a_name, a_type, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			attribute_not_void: Result /= Void
		end

	new_constant_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE; a_constant: ANY;
		a_clients: ET_CLIENTS; a_class: ET_CLASS): ET_CONSTANT_ATTRIBUTE is
			-- New constant attribute feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_constant_attribute (a_name, a_type, a_constant, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			constant_attribute_not_void: Result /= Void
		end

	new_deferred_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
		a_class: ET_CLASS): ET_DEFERRED_FUNCTION is
			-- New deferred function feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_deferred_function (a_name, args, a_type, an_obsolete,
				a_preconditions, a_postconditions, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			deferred_function_not_void: Result /= Void
		end

	new_deferred_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
		a_class: ET_CLASS): ET_DEFERRED_PROCEDURE is
			-- New deferred procedure feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_deferred_procedure (a_name, args, an_obsolete, a_preconditions,
				a_postconditions, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			deferred_procedure_not_void: Result /= Void
		end

	new_do_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLIENTS; a_class: ET_CLASS): ET_DO_FUNCTION is
			-- New do function feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_do_function (a_name, args, a_type, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			do_function_not_void: Result /= Void
		end

	new_do_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLIENTS; a_class: ET_CLASS): ET_DO_PROCEDURE is
			-- New do procedure feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_do_procedure (a_name, args, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			do_procedure_not_void: Result /= Void
		end

	new_external_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
		a_class: ET_CLASS): ET_EXTERNAL_FUNCTION is
			-- New external function feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_language_not_void: a_language /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_external_function (a_name, args, a_type, an_obsolete,
				a_preconditions, a_language, an_alias, a_postconditions,
				a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			external_function_not_void: Result /= Void
		end

	new_external_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
		a_class: ET_CLASS): ET_EXTERNAL_PROCEDURE is
			-- New external procedure feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_language_not_void: a_language /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_external_procedure (a_name, args, an_obsolete, a_preconditions,
				a_language, an_alias, a_postconditions, a_clients,
				a_class, an_id)
			features.force_last (Result)
		ensure
			external_procedure_not_void: Result /= Void
		end

	new_once_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLIENTS; a_class: ET_CLASS): ET_ONCE_FUNCTION is
			-- New once function feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_once_function (a_name, args, a_type, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			once_function_not_void: Result /= Void
		end

	new_once_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLIENTS; a_class: ET_CLASS): ET_ONCE_PROCEDURE is
			-- New once procedure feature for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_once_procedure (a_name, args, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			once_procedure_not_void: Result /= Void
		end

	new_unique_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_clients: ET_CLIENTS; a_class: ET_CLASS): ET_UNIQUE_ATTRIBUTE is
			-- New unique attribute declaration for `a_class'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		local
			an_id: INTEGER
		do
			an_id := features.count + 1
			Result := ast_factory.new_unique_attribute (a_name, a_type, a_clients, a_class, an_id)
			features.force_last (Result)
		ensure
			unique_attribute_not_void: Result /= Void
		end

feature -- Setting

	set_root_class (a_name: ET_IDENTIFIER) is
			-- Set `root_class'.
		require
			a_name_not_void: a_name /= Void
		do
			root_class := eiffel_class (a_name)
		ensure
			root_class_not_void: root_class /= Void
			root_class_set: root_class.name.same_identifier (a_name)
		end

	set_clusters (a_clusters: like clusters) is
			-- Set `a_clusters' to `clusters'.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

feature -- Parsing

	parse_all is
			-- Parse whole universe.
		do
			if clusters /= Void then
				clusters.parse_all (Current)
			end
		end

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			eiffel_parser.parse (a_file, a_filename, a_cluster)
		end

feature -- Compilation

	compute_ancestors is
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_IDENTIFIER]
			a_class: ET_CLASS
			nb: INTEGER
		do
--			if root_class /= Void then
--				root_class.add_to_system
--			end
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
--				if a_class.in_system then
					nb := nb + 1
					if a_class.is_parsed and then not a_class.has_syntax_error then
						a_class.flatten
--						a_class.search_ancestors
					end
--				end
				a_cursor.forth
			end
			print ("Flattened ")
			print (nb)
			print (" classes%N")
		end

feature {NONE} -- Implementation

	eiffel_parser: ET_EIFFEL_PARSER
			-- Eiffel parser

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

feature {ET_CLASS} -- Implementation

	class_sorter: DS_TOPOLOGICAL_SORTER [ET_CLASS]
			-- Class sorter

	feature_flattener: ET_FEATURE_FLATTENER
			-- Feature flattener

feature {ET_FORMAL_GENERIC_PARAMETERS, ET_FORMAL_GENERIC_TYPE} -- Implementation

	formal_generic_parameter_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]
			-- Formal generic parameter sorter

invariant

	classes_not_void: classes /= Void
	no_void_class: not classes.has_item (Void)
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)
	error_handler_not_void: error_handler /= Void
	eiffel_parser_not_void: eiffel_parser /= Void
	ast_factory_not_void: ast_factory /= Void
	class_sorter_not_void: class_sorter /= Void
	feature_flattener_not_void: feature_flattener /= Void
	formal_generic_parameter_sorter_not_void: formal_generic_parameter_sorter /= Void
	any_class_not_void: any_class /= Void
	general_class_not_void: general_class /= Void
	none_class_not_void: none_class /= Void
	any_type_not_void: any_type /= Void
	any_parents_not_void: any_parents /= Void

end -- class ET_UNIVERSE

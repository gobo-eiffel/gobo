indexing

	description:

		"Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNIVERSE

inherit

	KL_IMPORTED_STRING_ROUTINES
	ET_SHARED_CLASS_NAME_TESTER
	ET_SHARED_TOKEN_CONSTANTS

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
			create a_factory.make
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
			create classes.make_map (3000)
			classes.set_key_equality_tester (class_name_tester)
			create features.make (100000)
			error_handler := an_error_handler
			ast_factory := a_factory
			set_use_attribute_keyword (True)
			set_use_convert_keyword (True)
			set_use_create_keyword (True)
			set_use_recast_keyword (True)
			set_use_reference_keyword (True)
			make_basic_classes
			create null_processor.make (Current)
			qualified_signature_resolver := null_processor
		ensure
			clusters_set: clusters = a_clusters
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

	make_basic_classes is
			-- Create basic classes.
		local
			any_parent: ET_PARENT
		do
			any_class := eiffel_class (tokens.any_class_name)
			any_class.set_in_system (True)
			general_class := eiffel_class (tokens.general_class_name)
			none_class := eiffel_class (tokens.none_class_name)
			tuple_class := eiffel_class (tokens.tuple_class_name)
			tuple_class.set_in_system (True)
			bit_class := eiffel_class (tokens.bit_class_name)
			bit_class.set_in_system (True)
			create unknown_class.make_unknown (tokens.unknown_class_name)
			create any_type.make (Void, any_class.name, any_class)
			create any_parent.make (any_type, Void, Void, Void, Void, Void)
			create any_parents.make_with_capacity (1)
			any_parents.put_first (any_parent)
		ensure
			any_class_not_void: any_class /= Void
			general_class_not_void: general_class /= Void
			none_class_not_void: none_class /= Void
			any_type_not_void: any_type /= Void
			any_parents_not_void: any_parents /= Void
		end

feature -- Status report

	has_class (a_name: ET_CLASS_NAME): BOOLEAN is
			-- Is there a class named `a_name'
			-- in current universe?
		require
			a_name_not_void: a_name /= Void
		do
			classes.search (a_name)
			if classes.found then
				Result := classes.found_item.is_preparsed
			end
		ensure
			is_preparsed: Result implies eiffel_class (a_name).is_preparsed
		end

	is_preparsed: BOOLEAN
			-- Has the whole universe already been preparsed?

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	root_class: ET_CLASS
			-- Root class

	classes: DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME]
			-- Classes in universe

	eiffel_class (a_name: ET_CLASS_NAME): ET_CLASS is
			-- Class named `a_name' in universe
		require
			a_name_not_void: a_name /= Void
		do
			classes.search (a_name)
			if classes.found then
				Result := classes.found_item
			else
				Result := ast_factory.new_class (a_name, classes.count + 1)
				classes.force_last (Result, a_name)
			end
		ensure
			class_not_void: Result /= Void
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

	tuple_class: ET_CLASS
			-- Class TUPLE

	bit_class: ET_CLASS
			-- Class BIT

	unknown_class: ET_CLASS
			-- Class *UNKNOWN*
			-- This class is equal to no other classes, not even itself;
			-- it does conform to no type, not even itself, and no type
			-- conforms to it

	any_type: ET_CLASS_TYPE
			-- Class type ANY

	any_parents: ET_PARENT_LIST
			-- Default parents

feature -- Features

	register_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			features.force_last (a_feature)
			a_feature.set_id (features.count)
		ensure
			registered: a_feature.is_registered
		end

	features: DS_ARRAYED_LIST [ET_FEATURE]
			-- Features in universe, indexed by feature IDs

feature -- Measurement

	parsed_classes_count: INTEGER is
			-- Number of parsed classes in universe
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
		do
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.is_parsed then
					Result := Result + 1
				end
				a_cursor.forth
			end
		ensure
			parsed_classes_count_positive: Result >= 0
		end

feature -- Setting

	set_root_class (a_name: ET_CLASS_NAME) is
			-- Set `root_class'.
		require
			a_name_not_void: a_name /= Void
		do
			root_class := eiffel_class (a_name)
			root_class.set_in_system (True)
		ensure
			root_class_not_void: root_class /= Void
			root_class_set: root_class.name.same_class_name (a_name)
		end

	set_clusters (a_clusters: like clusters) is
			-- Set `a_clusters' to `clusters'.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

feature -- Parser status report

	use_attribute_keyword: BOOLEAN
			-- Should 'attribute' be considered as
			-- a keyword (otherwise identifier)?

	use_convert_keyword: BOOLEAN
			-- Should 'convert' be considered as
			-- a keyword (otherwise identifier)?

	use_create_keyword: BOOLEAN
			-- Should 'create' be considered as
			-- a keyword (otherwise identifier)?

	use_recast_keyword: BOOLEAN
			-- Should 'recast' be considered as
			-- a keyword (otherwise identifier)?

	use_reference_keyword: BOOLEAN
			-- Should 'reference' be considered as
			-- a keyword (otherwise identifier)?

feature -- Parser setting

	set_use_attribute_keyword (b: BOOLEAN) is
			-- Set `use_attribute_keyword' to `b'.
		do
			use_attribute_keyword := b
		ensure
			use_attribute_keyword_set: use_attribute_keyword = b
		end

	set_use_convert_keyword (b: BOOLEAN) is
			-- Set `use_convert_keyword' to `b'.
		do
			use_convert_keyword := b
		ensure
			use_convert_keyword_set: use_convert_keyword = b
		end

	set_use_create_keyword (b: BOOLEAN) is
			-- Set `use_create_keyword' to `b'.
		do
			use_create_keyword := b
		ensure
			use_create_keyword_set: use_create_keyword = b
		end

	set_use_recast_keyword (b: BOOLEAN) is
			-- Set `use_recast_keyword' to `b'.
		do
			use_recast_keyword := b
		ensure
			use_recast_keyword_set: use_recast_keyword = b
		end

	set_use_reference_keyword (b: BOOLEAN) is
			-- Set `use_reference_keyword' to `b'.
		do
			use_reference_keyword := b
		ensure
			use_reference_keyword_set: use_reference_keyword = b
		end

feature -- Parsing

	preparse is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Use `preparse_multiple' policy by default (this
			-- can be redefined in descendants).
		do
			preparse_multiple
		end

	preparse_shallow is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		do
			if not is_preparsed then
				if clusters /= Void then
					clusters.preparse_shallow (Current)
				end
				is_preparsed := True
			end
		end

	preparse_single is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly
			-- one class.
		do
			if not is_preparsed then
				if clusters /= Void then
					clusters.preparse_single (Current)
				end
				is_preparsed := True
			end
		end

	preparse_multiple is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		do
			if not is_preparsed then
				if clusters /= Void then
					clusters.preparse_multiple (Current)
				end
				is_preparsed := True
			end
		end

	preparse_single_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Scan Eiffel file `a_file' to find the name of the class it
			-- contains. The file is supposed to contain exactly one class.
			-- Add the class to `classes', but do not parse it.
			-- `a_filename' is the filename of `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			eiffel_preparser.preparse_single (a_file, a_filename, a_cluster)
		end

	preparse_multiple_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Scan Eiffel file `a_file' to find the names of the classes
			-- it contains. The file can contain more than one class. Add
			-- the classes to `classes', but do not parse them.
			-- `a_filename' is the filename of `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			eiffel_preparser.preparse_multiple (a_file, a_filename, a_cluster)
		end

	parse_all is
			-- Parse whole universe.
			-- There is not need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway.
		do
			if clusters /= Void then
				clusters.parse_all (Current)
			end
			is_preparsed := True
		end

	parse_system is
			-- Parse whole system.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			not_done: BOOLEAN
			a_parser: like eiffel_parser
		do
			if root_class /= Void then
				a_parser := eiffel_parser
				root_class.process (a_parser)
				if not root_class.is_preparsed then
						-- TODO:
					print ("Class ")
					print (root_class.name.name)
					print (" not found.%N")
				else
					not_done := True
					a_cursor := classes.new_cursor
					from until not not_done loop
						not_done := False
						from a_cursor.start until a_cursor.after loop
							a_class := a_cursor.item
							if a_class.in_system and then not a_class.is_parsed then
								a_class.process (a_parser)
								not_done := True
							end
							a_cursor.forth
						end
					end
				end
			end
		end

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_file' within cluster `a_cluster'.
			-- `a_filename' is the filename of `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			eiffel_parser.parse (a_file, a_filename, a_cluster)
		end

feature -- Compilation

	compile is
			-- Compile universe.
		do
			if root_class = Void or root_class = none_class then
				compile_all
			else
				compile_system
			end
		end

	compile_all is
			-- Compile all classes in the universe.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			nb: INTEGER
			a_signature_viewer: ET_SIGNATURE_VIEWER
		do
			activate_processors
			preparse_single
--			parse_all
--debug ("ericb")
--	print ("Parsed ")
--	print (parsed_classes_count)
--	print (" classes%N")
--	print (features.count)
--	print (" features%N")
--	io.read_line
--end
			a_cursor := classes.new_cursor
				-- Parse classes.
			from a_cursor.start until a_cursor.after loop
			a_class := a_cursor.item
				if a_class.is_preparsed then
					a_class.process (eiffel_parser)
				end
				a_cursor.forth
			end
debug ("ericb")
	print ("Parsed ")
	print (classes.count)
	print (" classes%N")
	print (features.count)
	print (" features%N")
	io.read_line
end
				-- Build ancestors.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.is_parsed then
					a_class.process (ancestor_builder)
				end
				a_cursor.forth
			end
				-- Flatten features.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.ancestors_built then
					nb := nb + 1
					a_class.process (feature_flattener)
				end
				a_cursor.forth
			end
				-- Resolve qualified anchored types in signatures.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.features_flattened then
					a_class.process (qualified_signature_resolver)
				end
				a_cursor.forth
			end
				-- Check interface.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.qualified_signatures_resolved then
					a_class.process (interface_checker)
				end
				a_cursor.forth
			end
debug ("ericb")
	print ("Flattened ")
	print (nb)
	print (" classes%N")
	print ("Done.%N")
	print (features.count)
	print (" features%N")
	create a_signature_viewer.make (Current)
	a_signature_viewer.execute
end
		end

	compile_system is
			-- Compile all classes in the system.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			nb: INTEGER
			a_signature_viewer: ET_SIGNATURE_VIEWER
		do
			activate_processors
			preparse_single
			--preparse_shallow
			parse_system
debug ("ericb")
	print ("Preparsed ")
	print (classes.count)
	print (" classes%N")
	print ("Parsed ")
	print (parsed_classes_count)
	print (" classes%N")
	print (features.count)
	print (" features%N")
	io.read_line
end
			a_cursor := classes.new_cursor
				-- Build ancestors.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.is_parsed then
					a_class.process (ancestor_builder)
				end
				a_cursor.forth
			end
				-- Flatten features.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.ancestors_built then
					nb := nb + 1
					a_class.process (feature_flattener)
				end
				a_cursor.forth
			end
				-- Resolve qualified anchored types in signatures.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.features_flattened then
					nb := nb + 1
					a_class.process (qualified_signature_resolver)
				end
				a_cursor.forth
			end
				-- Check interface.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.qualified_signatures_resolved then
					a_class.process (interface_checker)
				end
				a_cursor.forth
			end
debug ("ericb")
	print ("Flattened ")
	print (nb)
	print (" classes%N")
	print ("Done.%N")
	print (features.count)
	print (" features%N")
	create a_signature_viewer.make (Current)
	a_signature_viewer.execute
end
		end

feature -- Processors

	eiffel_preparser: ET_EIFFEL_PREPARSER is
			-- Eiffel preparser
		do
			Result := internal_eiffel_preparser
			if Result = Void then
				create Result.make_with_factory (Current, ast_factory, error_handler)
				internal_eiffel_preparser := Result
			end
			Result.set_use_attribute_keyword (use_attribute_keyword)
			Result.set_use_convert_keyword (use_convert_keyword)
			Result.set_use_create_keyword (use_create_keyword)
			Result.set_use_recast_keyword (use_recast_keyword)
			Result.set_use_reference_keyword (use_reference_keyword)
		ensure
			eiffel_preparser_not_void: Result /= Void
		end

	eiffel_parser: ET_EIFFEL_PARSER is
			-- Eiffel parser
		do
			Result := internal_eiffel_parser
			if Result = Void then
				create Result.make_with_factory (Current, ast_factory, error_handler)
				internal_eiffel_parser := Result
			end
			Result.set_universe (Current)
			Result.set_ast_factory (ast_factory)
			Result.set_error_handler (error_handler)
			Result.set_use_attribute_keyword (use_attribute_keyword)
			Result.set_use_convert_keyword (use_convert_keyword)
			Result.set_use_create_keyword (use_create_keyword)
			Result.set_use_recast_keyword (use_recast_keyword)
			Result.set_use_reference_keyword (use_reference_keyword)
		ensure
			eiffel_parser_not_void: Result /= Void
		end

	ancestor_builder: ET_ANCESTOR_BUILDER is
			-- Ancestor builder
		once
			create Result.make (Current)
		ensure
			ancestor_builder_not_void: Result /= Void
		end

	feature_flattener: ET_FEATURE_FLATTENER is
			-- Feature flattener
		once
			create Result.make (Current)
		ensure
			feature_flattener_not_void: Result /= Void
		end

	qualified_signature_resolver: ET_AST_PROCESSOR
			-- Qualified signature resolver

	interface_checker: ET_INTERFACE_CHECKER is
			-- Interface checker
		once
			create Result.make (Current)
		ensure
			interface_checker_not_void: Result /= Void
		end

	null_processor: ET_AST_NULL_PROCESSOR
			-- Null processor

	activate_processors is
			-- Activate processors.
		do
			create {ET_QUALIFIED_SIGNATURE_RESOLVER} qualified_signature_resolver.make (Current)
		end

	set_qualified_signature_resolver (a_resolver: like qualified_signature_resolver) is
			-- Set `qualified_signature_resolver' to `a_resolver'.
		require
			a_resolver_not_void: a_resolver /= Void
		do
			qualified_signature_resolver := a_resolver
		ensure
			qualified_signature_resolver_not_void: qualified_signature_resolver = a_resolver
		end

feature {NONE} -- Implementation

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

	internal_eiffel_preparser: ET_EIFFEL_PREPARSER
			-- Eiffel preparser

	internal_eiffel_parser: ET_EIFFEL_PARSER
			-- Eiffel parser

invariant

	classes_not_void: classes /= Void
	no_void_class: not classes.has_item (Void)
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)
	error_handler_not_void: error_handler /= Void
	ast_factory_not_void: ast_factory /= Void
	any_class_not_void: any_class /= Void
	general_class_not_void: general_class /= Void
	none_class_not_void: none_class /= Void
	tuple_class_not_void: tuple_class /= Void
	bit_class_not_void: bit_class /= Void
	unknown_class_not_void: unknown_class /= Void
	any_type_not_void: any_type /= Void
	any_parents_not_void: any_parents /= Void
	qualified_signature_resolver_not_void: qualified_signature_resolver /= Void
	null_processor_not_void: null_processor /= Void

end

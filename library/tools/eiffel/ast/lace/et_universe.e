indexing

	description:

		"Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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
			!! classes.make_map (3000)
			classes.set_key_equality_tester (class_name_tester)
			!! features.make (100000)
			error_handler := an_error_handler
			ast_factory := a_factory
			make_basic_classes
		ensure
			clusters_set: clusters = a_clusters
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

	make_basic_classes is
			-- Create basic classes.
		local
			a_name: ET_IDENTIFIER
			any_parent: ET_PARENT
		do
			!! a_name.make ("ANY")
			any_class := eiffel_class (a_name)
			!! a_name.make ("GENERAL")
			general_class := eiffel_class (a_name)
			!! a_name.make ("NONE")
			none_class := eiffel_class (a_name)
			!! any_type.make (Void, any_class.name, any_class)
			!! any_parent.make (any_type, Void, Void, Void, Void, Void)
			!! any_parents.make_with_capacity (1)
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
			-- Has current universe already been preparsed?

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	root_class: ET_CLASS
			-- Root class

	classes: DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME]
			-- Classes in universe

	features: DS_ARRAYED_LIST [ET_FEATURE]
			-- Features in universe, indexed by feature IDs

	eiffel_class (a_name: ET_CLASS_NAME): ET_CLASS is
			-- Class named `a_name' in universe
		require
			a_name_not_void: a_name /= Void
		do
			classes.search (a_name)
			if classes.found then
				Result := classes.found_item
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
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
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

	eiffel_parser: ET_EIFFEL_PARSER is
			-- Eiffel parser
		once
			!! Result.make_with_factory (Current, ast_factory, error_handler)
		ensure
			eiffel_parser_not_void: Result /= Void
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

	any_parents: ET_PARENT_LIST
			-- Default parents

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
		end

	parse_system is
			-- Parse whole system.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			not_done: BOOLEAN
		do
			if root_class /= Void then
				if not root_class.is_preparsed then
					preparse
				end
				if not root_class.is_preparsed then
						-- TODO:
					print ("Class ")
					print (root_class.name.name)
					print (" not found.%N")
				else
					root_class.add_to_system
					root_class.parse
					a_cursor := classes.new_cursor
					not_done := True
					from until not not_done loop
						not_done := False
						from a_cursor.start until a_cursor.after loop
							a_class := a_cursor.item
							if a_class.in_system and then not a_class.is_parsed then
								if a_class.is_preparsed then
									a_class.parse
									not_done := True
								end
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

	compute_ancestors is
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
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

	eiffel_preparser: ET_EIFFEL_PREPARSER is
			-- Eiffel preparser
		once
			!! Result.make_with_factory (Current, ast_factory, error_handler)
			Result.set_use_create_keyword (True)
		ensure
			eiffel_preparser_not_void: Result /= Void
		end

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

feature {ET_CLASS} -- Implementation

	class_sorter: DS_TOPOLOGICAL_SORTER [ET_CLASS] is
			-- Class sorter
		once
			!DS_HASH_TOPOLOGICAL_SORTER [ET_CLASS]! Result.make_default
		ensure
			class_sorter_not_void: class_sorter /= Void
		end

	feature_flattener: ET_FEATURE_FLATTENER is
			-- Feature flattener
		once
			!! Result.make (any_class)
		ensure
			feature_flattener_not_void: Result /= Void
		end

feature {ET_FORMAL_PARAMETER_LIST, ET_FORMAL_PARAMETER_TYPE} -- Implementation

	formal_parameter_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_PARAMETER] is
			-- Formal generic parameter sorter
		once
			!DS_HASH_TOPOLOGICAL_SORTER [ET_FORMAL_PARAMETER]! Result.make_default
		ensure
			formal_parameter_sorter_not_void: Result /= Void
		end

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
	any_type_not_void: any_type /= Void
	any_parents_not_void: any_parents /= Void

end

indexing

	description:

		"Eiffel class universe"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_UNIVERSE

inherit

	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_clusters: like clusters; a_factory: ET_AST_FACTORY;
		an_error_handler: ET_ERROR_HANDLER) is
			-- Create a new class universe.
		require
			an_error_handler_not_void: an_error_handler /= Void
			a_factory_not_void: a_factory /= Void
		do
			clusters := a_clusters
			!! classes.make (3000)
			error_handler := an_error_handler
			ast_factory := a_factory
			!! eiffel_parser.make_with_factory (Current, a_factory, an_error_handler)
			make_basic_classes
		ensure
			clusters_set: clusters = a_clusters
			ast_factory_set: ast_factory = a_factory
		end

	make_basic_classes is
			-- Create basic classes.
		local
			id: ET_IDENTIFIER
			p: ET_FILE_POSITION
		do
			!! p.make ("", 0, 0)
			!! id.make ("ANY", p)
			any_class := eiffel_class (id)
			!! id.make ("GENERAL", p)
			general_class := eiffel_class (id)
			!! id.make ("NONE", p)
			none_class := eiffel_class (id)
			!! any_type.make (any_class.name, Void, any_class)
			!! any_parent.make (any_type, Void, Void, Void, Void, Void)
		ensure
			any_class_not_void: any_class /= Void
			general_class_not_void: general_class /= Void
			none_class_not_void: none_class /= Void
			any_type_not_void: any_type /= Void
			any_parent_not_void: any_parent /= Void
		end

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	classes: DS_HASH_TABLE [ET_CLASS, ET_IDENTIFIER]
			-- Classes in universe

	eiffel_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- Class named `a_name' in universe
		require
			a_name_not_void: a_name /= Void
		do
			if classes.has (a_name) then
				Result := classes.item (a_name)
			else
				Result := ast_factory.new_class (a_name, classes.count, Current)
				classes.force (Result, a_name)
			end
		ensure
			class_not_void: Result /= Void
		end

	error_handler: ET_ERROR_HANDLER
			-- Error handler

	next_feature_id: INTEGER is
		do
			feature_counter := feature_counter + 1
			Result := feature_counter
		end

	feature_counter: INTEGER

feature -- Basic classes

	any_class: ET_CLASS
			-- Class ANY

	general_class: ET_CLASS
			-- Class GENERAL

	none_class: ET_CLASS
			-- Class NONE

	any_type: ET_CLASS_TYPE
			-- Class type ANY

	any_parent: ET_PARENT
			-- Default parent

feature -- Parsing

	parse_all is
			-- Parse whole universe.
		do
			if clusters /= Void then
				clusters.parse_all (Current)
			end
		end

	parse_file (a_file: like INPUT_STREAM_TYPE; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			eiffel_parser.parse (a_file, a_filename, a_cluster)
		end

feature -- Compilation

	compute_ancestors is
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_IDENTIFIER]
		do
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.flatten
				a_cursor.forth
			end
		end

feature {NONE} -- Implementation

	eiffel_parser: ET_EIFFEL_PARSER
			-- Eiffel parser

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

invariant

	classes_not_void: classes /= Void
	no_void_class: not classes.has_item (Void)
	error_handler_not_void: error_handler /= Void
	eiffel_parser_not_void: eiffel_parser /= Void
	ast_factory_not_void: ast_factory /= Void
	any_class_not_void: any_class /= Void
	general_class_not_void: general_class /= Void
	none_class_not_void: none_class /= Void
	any_type_not_void: any_type /= Void
	any_parent_not_void: any_parent /= Void

end -- class ET_UNIVERSE

indexing

	description:

		"Test config parser skeletons"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class TS_CONFIG_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton,
			parse as yyparse
		redefine
			report_error
		end

	TS_CONFIG_SCANNER_SKELETON
		rename
			make as make_config_scanner
		end

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new config parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			make_config_scanner ("unknown file", an_error_handler)
			make_parser_skeleton
		ensure
			error_handler_set: error_handler = an_error_handler
		end

feature -- Parsing

	parse (a_file: like INPUT_STREAM_TYPE) is
			-- Parse Ace file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			reset
			set_input_buffer (new_file_buffer (a_file))
			filename := INPUT_STREAM_.name (a_file)
			last_config := Void
			class_regexp := Void
			feature_regexp := Void
			class_prefix := Void
			compile := Void
			execute := Void
			yyparse
		end

feature -- Access

	last_config: TS_CONFIG
			-- Last config parsed

	class_regexp: LX_REGULAR_EXPRESSION
			-- Class regular expression

	feature_regexp: LX_REGULAR_EXPRESSION
			-- Feature regular expression

	class_prefix: STRING
			-- Prefix of generated testcase class names

	compile: STRING
			-- Compilation command-line

	execute: STRING
			-- Execution command-line

	testgen: STRING
			-- Directory where test classes are generated;
			-- Void means current directory

feature -- Status report

	compiler_ise: BOOLEAN
	compiler_hact: BOOLEAN
	compiler_se: BOOLEAN
	compiler_ve: BOOLEAN
			-- Compiler which will be used to compile the test classes

feature -- Status setting

	set_compiler_ise (b: BOOLEAN) is
			-- Set `compiler_ise' to `b'.
		do
			compiler_ise := b
		ensure
			compiler_ise_set: compiler_ise = b
		end

	set_compiler_se (b: BOOLEAN) is
			-- Set `compiler_se' to `b'.
		do
			compiler_se := b
		ensure
			compiler_se_set: compiler_se = b
		end

	set_compiler_hact (b: BOOLEAN) is
			-- Set `compiler_hact' to `b'.
		do
			compiler_hact := b
		ensure
			compiler_hact_set: compiler_hact = b
		end

	set_compiler_ve (b: BOOLEAN) is
			-- Set `compiler_ve' to `b'.
		do
			compiler_ve := b
		ensure
			compiler_ve_set: compiler_ve = b
		end

feature -- AST factory

	new_config (a_root_class: STRING; a_testgen: STRING;
		a_compile: STRING; an_execute: STRING;
		a_clusters: DS_LIST [TS_CLUSTER]): TS_CONFIG is
			-- New config
		require
			a_root_class_not_void: a_root_class /= Void
			a_compile_not_void: a_compile /= Void
			an_execute_not_void: an_execute /= Void
			a_clusters_not_void: a_clusters /= Void
			no_void_cluster: not a_clusters.has (Void)
		do
			!! Result.make (a_root_class, a_testgen, a_compile, an_execute, a_clusters)
		ensure
			config_not_void: Result /= Void
		end

	new_cluster (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER): TS_CLUSTER is
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_pathname_not_void: a_pathname /= Void
			class_regexp_not_void: class_regexp /= Void
			feature_regexp_not_void: feature_regexp /= Void
			class_prefix_not_void: class_prefix /= Void
		do
			!! Result.make (a_name, a_pathname, class_regexp, feature_regexp, class_prefix)
		ensure
			cluster_not_void: Result /= Void
		end

	new_regexp (a_regexp: ET_IDENTIFIER): LX_REGULAR_EXPRESSION is
			-- New regular expression;
			-- Void if there is a syntax error in `a_regexp'
		require
			a_regexp_not_void: a_regexp /= Void
		do
			!LX_DFA_REGULAR_EXPRESSION! Result.compile (a_regexp.name, True)
			if not Result.compiled then
				Result := Void
				error_handler.report_regexp_syntax_error (a_regexp)
			end
		ensure
			compiled: Result /= Void implies Result.compiled
		end

feature -- Defaults

	set_defaults (root_class: STRING) is
			-- Set default values if not already set.
		require
			root_class_not_void: root_class /= Void
		do
			if class_regexp = Void then
				class_regexp := Default_class_regexp
			end
			if feature_regexp = Void then
				feature_regexp := Default_feature_regexp
			end
			if class_prefix = Void then
				class_prefix := Default_class_prefix
			end
			if compile = Void then
				compile := default_compile (root_class)
			end
			if execute = Void then
				execute := default_execute (root_class)
			end
		ensure
			class_regexp_not_void: class_regexp /= Void
			feature_regexp_not_void: feature_regexp /= Void
			class_prefix_not_void: class_prefix /= Void
			compile_not_void: compile /= Void
			execute_not_void: execute /= Void
		end

	Default_class_regexp: LX_REGULAR_EXPRESSION is
			-- Default class regexp
		once
			!LX_DFA_REGULAR_EXPRESSION! Result.compile ("TEST_.*", True)
		ensure
			regexp_not_void: Result /= Void
			regexp_compiled: Result.compiled
		end

	Default_feature_regexp: LX_REGULAR_EXPRESSION is
			-- Default feature regexp
		once
			!LX_DFA_REGULAR_EXPRESSION! Result.compile ("test_.*", True)
		ensure
			regexp_not_void: Result /= Void
			regexp_compiled: Result.compiled
		end

	Default_class_prefix: STRING is "X"
			-- Default prefix of generated testcase class names

	default_compile (root_class: STRING): STRING is
			-- Default compilation command-line
		require
			root_class_not_void: root_class /= Void
		do
			if compiler_ise then
				Result := "geant compile_ise"
			elseif compiler_hact then
				Result := "geant compile_hact"
			elseif compiler_se then
				Result := "geant compile_se"
			elseif compiler_ve then
				Result := "geant compile_ve"
			else
				Result := "geant compile"
			end
		ensure
			default_compile_not_void: Result /= Void
		end

	default_execute (root_class: STRING): STRING is
			-- Default execute command-line
		require
			root_class_not_void: root_class /= Void
		do
			Result := STRING_.make (root_class.count)
			Result.append_string (STRING_.to_lower (root_class))
		ensure
			default_execute_not_void: Result /= Void
		end

	default_cluster: TS_CLUSTER is
			-- Default cluster
		require
			class_regexp_not_void: class_regexp /= Void
			feature_regexp_not_void: feature_regexp /= Void
			class_prefix_not_void: class_prefix /= Void
		local
			a_name, a_pathname: ET_IDENTIFIER
			a_position: ET_FILE_POSITION
		do
			!! a_position.make ("unknown file", 0, 0)
			!! a_name.make ("root", a_position)
			!! a_pathname.make (".", a_position)
			!! Result.make (a_name, a_pathname, class_regexp, feature_regexp, class_prefix)
		ensure
			cluster_not_void: Result /= Void
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		do
			error_handler.report_config_syntax_error (current_position)
		end

invariant

	compiled_class_regexp: class_regexp /= Void implies class_regexp.compiled
	compiled_feature_regexp: feature_regexp /= Void implies feature_regexp.compiled

end -- class TS_CONFIG_PARSER_SKELETON

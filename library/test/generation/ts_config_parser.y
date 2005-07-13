%{
indexing

	description:

		"Test config parsers"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_CONFIG_PARSER

inherit

	TS_CONFIG_PARSER_SKELETON

	TS_CONFIG_SCANNER
		rename
			make as make_config_scanner
		end

create

	make

%}

%token T_CLASS T_CLUSTER T_COMPILE T_DEFAULT T_END
%token T_EXECUTE T_FEATURE T_PREFIX T_TEST T_TESTGEN
%token T_STRERR

%token <ET_IDENTIFIER> T_IDENTIFIER T_STRING

%type <TS_CLUSTER>				Cluster
%type <DS_ARRAYED_LIST [TS_CLUSTER]>	Cluster_list Clusters_opt
%type <ET_IDENTIFIER>			Identifier

%start Config

%%
--------------------------------------------------------------------------------

Config: T_TEST Identifier Defaults_opt
			{ set_defaults ($2.name) }
		Clusters_opt T_END
			{ last_config := new_config ($2.name, testgen, compile, execute, $5) }
	;

Defaults_opt: -- Empty
	| T_DEFAULT
	| T_DEFAULT Default_list
	;

Default_list: Default
	| Default_list Default
	;

Default: T_CLASS '(' Identifier ')'
		{
			class_regexp := new_regexp ($3)
			if class_regexp = Void then
				class_regexp := Default_class_regexp
			end
		}
	| T_FEATURE '(' Identifier ')'
		{
			feature_regexp := new_regexp ($3)
			if feature_regexp = Void then
				feature_regexp := Default_feature_regexp
			end
		}
	| T_PREFIX '(' Identifier ')'
		{ class_prefix := $3.name }
	| T_COMPILE '(' Identifier ')'
		{ compile := $3.name }
	| T_EXECUTE '(' Identifier ')'
		{ execute := $3.name }
	| T_TESTGEN '(' Identifier ')'
		{ testgen := $3.name }
	;

Clusters_opt: -- Empty
		{
			create {DS_ARRAYED_LIST [TS_CLUSTER]} $$.make (1)
			$$.put_last (default_cluster)
		}
	| T_CLUSTER
		{
			create {DS_ARRAYED_LIST [TS_CLUSTER]} $$.make (1)
			$$.put_last (default_cluster)
		}
	| T_CLUSTER Cluster_list
		{ $$ := $2 }
	;

Cluster_list: Cluster
		{
			create {DS_ARRAYED_LIST [TS_CLUSTER]} $$.make (5)
			$$.put_last ($1)
		}
	| Cluster_list Cluster
		{ $$ := $1; $$.force_last ($2) }
	;

Cluster: Identifier ':' Identifier
		{ $$ := new_cluster ($1, $3) }
	;

Identifier: T_IDENTIFIER
		{ $$ := $1 }
	| T_STRING
		{ $$ := $1 }
	;

--------------------------------------------------------------------------------
%%

end

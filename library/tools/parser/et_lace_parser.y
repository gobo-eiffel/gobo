%{
indexing

	description:

		"Lace parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LACE_PARSER

inherit

	ET_LACE_PARSER_SKELETON

	ET_LACE_SCANNER
		rename
			make as make_lace_scanner
		end

creation

	make, make_with_factory

%}

%token                 L_SYSTEM L_ROOT L_END L_CLUSTER
%token                 L_DEFAULT L_EXTERNAL L_OPTION
%token                 L_ABSTRACT L_ALL L_EXCLUDE
%token <ET_IDENTIFIER> L_IDENTIFIER L_STRING
%token                 L_STRERR

%type <ET_CLUSTER>			Cluster Nested_cluster Recursive_cluster
%type <ET_CLUSTERS>			Cluster_list Clusters_opt Sub_clusters_opt
%type <ET_EXCLUDE>			Exclude_opt Exclude_list
%type <ET_IDENTIFIER>		Identifier

%start Ace

%%
--------------------------------------------------------------------------------

Ace: L_SYSTEM Identifier L_ROOT Identifier Root_cluster_opt Creation_procedure_opt
	Defaults_opt Clusters_opt Externals_opt L_END
		{
			last_universe := new_universe ($8)
			last_universe.set_root_class ($4)
		}
	;

Root_cluster_opt: -- Empty
	| '(' Identifier ')'
	;

Creation_procedure_opt: -- Empty
	| ':' Identifier
	;

Defaults_opt: -- Empty
	| L_DEFAULT
	| L_DEFAULT Default_list
	;

Default_list: Default Default_terminator
	| Default Default_separator Default_list
	;

Default: Identifier '(' Identifier ')'
	;

Default_terminator: -- Empty
	| ';'
	;

Default_separator: -- Empty
	| ';'
	;

Clusters_opt: -- Empty
		-- { $$ := Void }
	| L_CLUSTER
		-- { $$ := Void }
	| L_CLUSTER Cluster_list
		{ $$ := $2 }
	;

Cluster_list: Cluster Cluster_terminator
		{ $$ := new_clusters ($1) }
	| Cluster Cluster_separator Cluster_list
		{ $$ := $3; $$.put_first ($1) }
	;

Cluster: L_ABSTRACT Nested_cluster
		{ $$ := $2; $$.set_abstract (True) }
	| L_ALL Recursive_cluster
		{ $$ := $2; $$.set_recursive (True) }
	| Nested_cluster
		{ $$ := $1 }
	;

Nested_cluster: Identifier ':' Identifier Options_opt Sub_clusters_opt
		{
			$$ := new_cluster ($1, $3)
			$$.set_subclusters ($5)
		}
	| Identifier Options_opt Sub_clusters_opt
		{
			$$ := new_cluster ($1, Void)
			$$.set_subclusters ($3)
		}
	;

Recursive_cluster: Identifier ':' Identifier Exclude_opt Options_opt
		{
			$$ := new_cluster ($1, $3)
			$$.set_exclude ($4)
		}
	;

Cluster_terminator: -- Empty
	| ';'
	;

Cluster_separator: -- Empty
	| ';'
	;

Sub_clusters_opt: -- Empty
		-- { $$ := Void }
	| L_CLUSTER L_END
		-- { $$ := Void }
	| L_CLUSTER Cluster_list L_END
		{ $$ := $2 }
	;

Exclude_opt: -- Empty
	| L_EXCLUDE L_END
	| L_EXCLUDE Exclude_list L_END
		{ $$ := $2 }
	| L_EXCLUDE Exclude_list ';' L_END
		{ $$ := $2 }
	;

Exclude_list: Identifier
		{ !! $$.make $$.put_last ($1) }
	| Exclude_list ';' Identifier
		{ $$ := $1; $$.put_last ($3) }
	;

Options_opt: -- Empty
	| L_OPTION L_END
	| L_OPTION Option_list L_END
	;

Option_list: Option Option_terminator
	| Option Option_separator Option_list
	;

Option: Identifier '(' Identifier ')' ':' Class_list
	;

Class_list: Identifier
	| Class_list ',' Identifier
	;

Option_terminator: -- Empty
	| ';'
	;

Option_separator: -- Empty
	| ';'
	;

Externals_opt: -- Empty
	| L_EXTERNAL
	| L_EXTERNAL External_list
	;

External_list: External External_terminator
	| External External_separator External_list
	;

External: Identifier ':' External_items
	;

External_items: Identifier
	| External_items ',' Identifier
	;

External_terminator: -- Empty
	| ';'
	;

External_separator: -- Empty
	| ';'
	;

Identifier: L_IDENTIFIER
		{ $$ := $1 }
	| L_STRING
		{ $$ := $1 }
	;

--------------------------------------------------------------------------------
%%

end -- class ET_LACE_PARSER

%{
indexing

	description:

		"Lace parsers"
  
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
%token                 L_DEFAULT L_EXTERNAL L_GENERATE L_OPTION
%token                 L_ABSTRACT L_ALL L_EXCLUDE
%token <ET_IDENTIFIER> L_IDENTIFIER L_STRING
%token                 L_STRERR

%type <ET_LACE_CLUSTER>		Cluster Nested_cluster Recursive_cluster Subcluster
%type <ET_LACE_CLUSTERS>	Cluster_list Clusters_opt Subclusters_opt Subcluster_list
%type <ET_LACE_EXCLUDE>		Excludes Exclude_list Cluster_options_opt
%type <ET_IDENTIFIER>		Identifier

%start Ace

%%
--------------------------------------------------------------------------------

Ace: L_SYSTEM Identifier L_ROOT Identifier Root_cluster_opt Creation_procedure_opt
	Defaults_opt Clusters_opt Externals_opt Generates_opt L_END
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

Defaults: L_DEFAULT
	| L_DEFAULT Default_list
	;

Defaults_opt: -- Empty
	| Defaults
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
	| L_CLUSTER Cluster_list Cluster_terminator
		{ $$ := $2 }
	;

Cluster_list: Cluster
		{ $$ := new_clusters ($1) }
	| Identifier '(' Identifier ')' ':' Identifier Cluster_options_opt
		{
			add_subcluster ($1, $3, $6, $7)
			-- TODO:
			abort
		}
	| Cluster_list Cluster_separator Cluster
		{ $$ := $1; $$.put_last ($3) }
	| Cluster_list Cluster_separator Identifier '(' Identifier ')' ':' Identifier Cluster_options_opt
		{
			$$ := $1
			add_subcluster ($3, $5, $8, $9)
		}
	;

Cluster: L_ABSTRACT Nested_cluster
		{ $$ := $2; $$.set_abstract (True) }
	| L_ALL Recursive_cluster
		{ $$ := $2; $$.set_recursive (True) }
	| Nested_cluster
		{ $$ := $1 }
	;

Nested_cluster: Identifier ':' Identifier Cluster_options_opt Subclusters_opt
		{
			$$ := new_cluster ($1, $3)
			$$.set_exclude ($4)
			$$.set_subclusters ($5)
		}
	| Identifier Cluster_options_opt Subclusters_opt
		{
			$$ := new_cluster ($1, Void)
			$$.set_exclude ($2)
			$$.set_subclusters ($3)
		}
	;

Recursive_cluster: Identifier ':' Identifier Cluster_options_opt
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

Subclusters_opt: -- Empty
		-- { $$ := Void }
	| L_CLUSTER L_END
		-- { $$ := Void }
	| L_CLUSTER Subcluster_list Cluster_terminator L_END
		{ $$ := $2 }
	;

Subcluster_list: Subcluster
		{ $$ := new_clusters ($1) }
	| Subcluster_list Cluster_separator Subcluster
		{ $$ := $1; $$.put_last ($3) }
	;

Subcluster: L_ABSTRACT Nested_cluster
		{ $$ := $2; $$.set_abstract (True) }
	| Nested_cluster
		{ $$ := $1 }
	;

Cluster_options_opt: -- Empty
		-- { $$ := Void }
	| Excludes Defaults_opt Options_opt L_END
		{ $$ := $1 }
	| Defaults Options_opt L_END
		-- { $$ := Void }
	| Options L_END
		-- { $$ := Void }
	;

Excludes: L_EXCLUDE
	| L_EXCLUDE Exclude_list
		{ $$ := $2 }
	| L_EXCLUDE Exclude_list ';'
		{ $$ := $2 }
	;

Exclude_list: Identifier
		{ !! $$.make $$.put_last ($1) }
	| Exclude_list ';' Identifier
		{ $$ := $1; $$.put_last ($3) }
	;

Options: L_OPTION
	| L_OPTION Option_list
	;

Options_opt: -- Empty
	| Options
	;

Option_list: Option Option_terminator
	| Option Option_separator Option_list
	;

Option: Identifier '(' Identifier ')' ':' Class_list
--TODO: | Identifier ':' Class_list
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
	| Identifier '(' Identifier ')'
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

Generates_opt: -- Empty
	| L_GENERATE
	| L_GENERATE External_list
	;

Identifier: L_IDENTIFIER
		{ $$ := $1 }
	| L_STRING
		{ $$ := $1 }
	;

--------------------------------------------------------------------------------
%%

end

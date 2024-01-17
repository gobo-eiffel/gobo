%{
note

	description:

		"Lace parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class ET_LACE_PARSER

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_LACE_PARSER_SKELETON

	ET_LACE_SCANNER
		rename
			make as make_lace_scanner
		end

create

	make, make_standard, make_with_factory

%}

%token <ET_IDENTIFIER> L_IDENTIFIER L_STRING L_ALL
%token L_SYSTEM L_ROOT L_END L_CLUSTER
%token L_DEFAULT L_EXTERNAL L_GENERATE L_OPTION
%token L_ABSTRACT L_EXCLUDE L_VISIBLE L_LIBRARY
%token L_ASSEMBLY L_PREFIX
%token L_STRERR

%type <ET_LACE_CLUSTER> Cluster Nested_cluster Recursive_cluster Subcluster Qualified_subcluster
%type <ET_LACE_CLUSTERS> Cluster_list Subcluster_list
%type <detachable ET_LACE_CLUSTERS> Clusters_opt Subclusters_opt 
%type <ET_LACE_EXCLUDE> Exclude_list
%type <detachable ET_LACE_EXCLUDE> Excludes Cluster_options_opt
%type <ET_IDENTIFIER> Identifier External_items
%type <detachable ET_IDENTIFIER> Root_cluster_opt Creation_procedure_opt Prefix_opt
%type <ET_LACE_DOTNET_ASSEMBLY> Assembly
%type <ET_LACE_SYSTEM> System Ace
%type <ET_ADAPTED_DOTNET_ASSEMBLIES> Assembly_list
%type <detachable ET_ADAPTED_DOTNET_ASSEMBLIES> Assemblies_opt

%start Ace

%%
--------------------------------------------------------------------------------

Ace: System L_ROOT Identifier Root_cluster_opt Creation_procedure_opt
	Defaults_opt Clusters_opt Assemblies_opt Externals_opt Generates_opt L_END
		{
			$$ := $1
			set_system ($$)
			if attached $7 as l_clusters then
				$$.set_clusters (l_clusters)
			end
			if attached $8 as l_assemblies then
				$$.set_dotnet_assemblies (l_assemblies)
			end
			$$.set_root_type ($3)
			$$.set_root_creation ($5)
		}
	;

System: L_SYSTEM Identifier
		{
			$$ := new_system ($2.name)
			last_system := $$
		}
	;

Root_cluster_opt: -- Empty
		--{ $$ := Void }
	| '(' Identifier ')'
		{ $$ := $2 }
	;

Creation_procedure_opt: -- Empty
		--{ $$ := Void }
	| ':' Identifier
		{ $$ := $2 }
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
		{ $$ := new_default_value ($1, $3) }
	| Identifier '(' L_ALL ')'
		{ $$ := new_default_value ($1, $3) }
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
	| Qualified_subcluster
		{
-- TODO: syntax error: the cluster list cannot contain just
-- one subcluster that is qualified because it needs an unqualified
-- parent cluster.
			$$ := new_clusters ($1)
		}
	| Cluster_list Cluster_separator Cluster
		{ $$ := $1; $$.put_last ($3) }
	| Cluster_list Cluster_separator Qualified_subcluster
		{
				-- Note: the subcluster has already been inserted
				-- in the list of subclusters of its parent. So
				-- no need to add it to the top-level list of clusters.
			$$ := $1
		}
	;

Cluster: L_ABSTRACT Nested_cluster
		{ $$ := $2; $$.set_abstract (True) }
	| L_ALL Recursive_cluster
		{ $$ := $2; $$.set_recursive (True) }
	| L_LIBRARY Recursive_cluster
		{
			$$ := $2;
			$$.set_recursive (True)
			$$.set_read_only (True)
		}
	| Nested_cluster
		{ $$ := $1 }
	;

Qualified_subcluster: Identifier '(' Identifier ')' ':' Identifier Cluster_options_opt
		{
			$$ := new_qualified_subcluster ($1, $3, $6, $7)
		}
	| L_ALL Identifier '(' Identifier ')' ':' Identifier Cluster_options_opt
		{
			$$ := new_qualified_subcluster ($2, $4, $7, $8)
			$$.set_recursive (True)
		}
	| L_LIBRARY Identifier '(' Identifier ')' ':' Identifier Cluster_options_opt
		{
			$$ := new_qualified_subcluster ($2, $4, $7, $8)
			$$.set_recursive (True)
			$$.set_read_only (True)
		}
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
	| Excludes Defaults_opt Options_opt Visibles_opt L_END
		{ $$ := $1 }
	| Defaults Options_opt Visibles_opt L_END
		-- { $$ := Void }
	| Options Visibles_opt L_END
		-- { $$ := Void }
	| Visibles L_END
		-- { $$ := Void }
	;

Excludes: L_EXCLUDE
	| L_EXCLUDE Exclude_list
		{ $$ := $2 }
	| L_EXCLUDE Exclude_list ';'
		{ $$ := $2 }
	;

Exclude_list: Identifier
		{ create $$.make $$.put_last ($1) }
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
	| Identifier '(' L_ALL ')' ':' Class_list
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

Visibles: L_VISIBLE
	| L_VISIBLE Visible_list
	;

Visibles_opt: -- Empty
	| Visibles
	;

Visible_list: Identifier L_END
	| Visible ';'
	| Visible Visible_separator Visible_list
	;

Visible: Identifier
	| Identifier L_END
	;

Visible_separator: -- Empty
	| ';'
	;

Assemblies_opt: -- Empty
		-- { $$ := Void }
	| L_ASSEMBLY
		-- { $$ := Void }
	| L_ASSEMBLY Assembly_list Assembly_terminator
		{ $$ := $2 }
	;

Assembly_list: Assembly
		{ $$ := new_assemblies ($1) }
	| Assembly_list Assembly_separator Assembly
		{
			$$ := $1
			$1.put_last ($3)
		}
	;

Assembly: Identifier ':' Identifier Prefix_opt
		{
			$$ := new_assembly ($1, $3)
			$$.set_classname_prefix_id ($4)
		}
	| Identifier ':' Identifier ',' Identifier ',' Identifier ',' Identifier Prefix_opt
		{
			$$ := new_gac_assembly ($1, $3, $5, $7, $9)
			$$.set_classname_prefix_id ($10)
		}
	;

Prefix_opt: -- Empty
		-- { $$ := Void }
	| L_PREFIX Identifier L_END
		{ $$ := $2 }
	;

Assembly_terminator: -- Empty
	| ';'
	;

Assembly_separator: -- Empty
	| ';'
	;

Externals_opt: -- Empty
	| L_EXTERNAL
	| L_EXTERNAL External_list
	;

External_list: External External_terminator
	| External External_separator External_list
	;

External: External_items
	| Identifier '(' Identifier ')'
	| Identifier '(' L_ALL ')'
	;

External_items: Identifier ':' Identifier
		{
			add_external_value ($1, $3)
			$$ := $1
		}
	| External_items ',' Identifier
		{
			add_external_value ($1, $3)
			$$ := $1
		}
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

indexing

	description:

		"Eiffel token and symbol constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_TOKEN_CONSTANTS

feature -- Symbols

	symbol: ET_SYMBOL is
			-- Dummy symbol
		once
			!! Result.make
		ensure
			symbol_not_void: Result /= Void
		end

feature -- Keywords

	keyword: ET_TOKEN is
			-- Dummy keyword
		once
			Result := strip_keyword
		ensure
			keyword_not_void: Result /= Void
		end

	creation_keyword: ET_TOKEN is
			-- 'creation' keyword
		once
			!! Result.make (creation_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	export_keyword: ET_TOKEN is
			-- 'export' keyword
		once
			!! Result.make (export_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	rename_keyword: ET_TOKEN is
			-- 'rename' keyword
		once
			!! Result.make (rename_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	strip_keyword: ET_TOKEN is
			-- 'strip' keyword
		once
			!! Result.make (strip_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

feature -- Keyword names

	capitalized_current_keyword_name: STRING is "Current"
	capitalized_false_keyword_name: STRING is "False"
	capitalized_precursor_keyword_name: STRING is "Precursor"
	capitalized_result_keyword_name: STRING is "Result"
	capitalized_true_keyword_name: STRING is "True"
			-- Eiffel keyword names with first letter in upper-case

	alias_keyword_name: STRING is "alias"
	all_keyword_name: STRING is "all"
	and_keyword_name: STRING is "and"
	as_keyword_name: STRING is "as"
	check_keyword_name: STRING is "check"
	class_keyword_name: STRING is "class"
	create_keyword_name: STRING is "create"
	creation_keyword_name: STRING is "creation"
	current_keyword_name: STRING is "current"
	debug_keyword_name: STRING is "debug"
	deferred_keyword_name: STRING is "deferred"
	do_keyword_name: STRING is "do"
	else_keyword_name: STRING is "else"
	elseif_keyword_name: STRING is "elseif"
	end_keyword_name: STRING is "end"
	ensure_keyword_name: STRING is "ensure"
	expanded_keyword_name: STRING is "expanded"
	export_keyword_name: STRING is "export"
	external_keyword_name: STRING is "external"
	false_keyword_name: STRING is "false"
	feature_keyword_name: STRING is "feature"
	from_keyword_name: STRING is "from"
	frozen_keyword_name: STRING is "frozen"
	if_keyword_name: STRING is "if"
	implies_keyword_name: STRING is "implies"
	indexing_keyword_name: STRING is "indexing"
	infix_keyword_name: STRING is "infix"
	inherit_keyword_name: STRING is "inherit"
	inspect_keyword_name: STRING is "inspect"
	invariant_keyword_name: STRING is "invariant"
	is_keyword_name: STRING is "is"
	like_keyword_name: STRING is "like"
	local_keyword_name: STRING is "local"
	loop_keyword_name: STRING is "loop"
	not_keyword_name: STRING is "not"
	obsolete_keyword_name: STRING is "obsolete"
	old_keyword_name: STRING is "old"
	once_keyword_name: STRING is "once"
	or_keyword_name: STRING is "or"
	precursor_keyword_name: STRING is "precursor"
	prefix_keyword_name: STRING is "prefix"
	redefine_keyword_name: STRING is "redefine"
	reference_keyword_name: STRING is "reference"
	rename_keyword_name: STRING is "rename"
	require_keyword_name: STRING is "require"
	rescue_keyword_name: STRING is "rescue"
	result_keyword_name: STRING is "result"
	retry_keyword_name: STRING is "retry"
	select_keyword_name: STRING is "select"
	separate_keyword_name: STRING is "separate"
	strip_keyword_name: STRING is "strip"
	then_keyword_name: STRING is "then"
	true_keyword_name: STRING is "true"
	undefine_keyword_name: STRING is "undefine"
	unique_keyword_name: STRING is "unique"
	until_keyword_name: STRING is "until"
	variant_keyword_name: STRING is "variant"
	when_keyword_name: STRING is "when"
	xor_keyword_name: STRING is "xor"
			-- Eiffel keyword names

feature -- Nodes

	clients: ET_CLIENTS is
		once
		end

end -- class ET_TOKEN_CONSTANTS

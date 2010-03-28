indexing

	description:

		"Eiffel class parents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT

inherit

	ET_PARENT_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_renames: like renames; an_exports: like exports;
		an_undefines: like undefines; a_redefines: like redefines; a_selects: like selects) is
			-- Create a new parent clause.
		require
			a_type_not_void: a_type /= Void
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			type := a_type
				-- Find out whether formal parameters have
				-- been given actual derivations.
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void and then a_parameters.has_derived_parameters then
				actual_parameters := a_parameters
			end
			actual_parameters := a_parameters
			renames := a_renames
			exports := an_exports
			undefines := an_undefines
			redefines := a_redefines
			selects := a_selects
			if has_feature_adaptation then
				end_keyword := tokens.end_keyword
			end
		ensure
			type_set: type = a_type
			renames_set: renames = a_renames
			exports_set: exports = an_exports
			undefines_set: undefines = an_undefines
			redefines_set: redefines = a_redefines
			selects_set: selects = a_selects
		end

feature -- Initialization

	reset is
			-- Reset parent as it was when it was last parsed.
		do
			type.reset
			if actual_parameters /= Void then
				actual_parameters.reset
			end
			if renames /= Void then
				renames.reset
			end
			if exports /= Void then
				exports.reset
			end
			if undefines /= Void then
				undefines.reset
			end
			if redefines /= Void then
				redefines.reset
			end
			if selects /= Void then
				selects.reset
			end
		end

feature -- Access

	type: ET_BASE_TYPE
			-- Parent type

	actual_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters;
			-- Void if `type' is not generic or if its
			-- actual parameters are not different from
			-- their corresponding formal parameters

	renames: ET_RENAME_LIST
			-- Rename clause

	exports: ET_EXPORT_LIST
			-- Export clause

	undefines: ET_KEYWORD_FEATURE_NAME_LIST
			-- Undefine clause

	redefines: ET_KEYWORD_FEATURE_NAME_LIST
			-- Redefine clause

	selects: ET_KEYWORD_FEATURE_NAME_LIST
			-- Select clause

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	parent: ET_PARENT is
			-- Class parent in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := type.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if end_keyword /= Void then
				Result := end_keyword
			else
				Result := type.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if end_keyword /= Void then
				Result := end_keyword.break
			else
				Result := type.break
			end
		end

feature -- Status report

	has_feature_adaptation: BOOLEAN is
			-- Does current parent have a feature adaptation clause?
		do
			Result := renames /= Void or exports /= Void or
				undefines /= Void or redefines /= Void or selects /= Void
		ensure
			definition: Result = (renames /= Void or exports /= Void or
				undefines /= Void or redefines /= Void or selects /= Void)
		end

feature -- Setting

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: has_feature_adaptation implies an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_parent (Current)
		end

invariant

	type_not_void: type /= Void
	end_keyword_not_void: has_feature_adaptation implies end_keyword /= Void

end

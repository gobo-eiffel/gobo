note

	description:

		"Eiffel class parents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"

class ET_PARENT

inherit

	ET_PARENT_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_renames: like renames; an_exports: like exports;
		an_undefines: like undefines; a_redefines: like redefines; a_selects: like selects)
			-- Create a new parent clause.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
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

	reset
			-- Reset parent as it was when it was last parsed.
		do
			type.reset
			if attached renames as l_renames then
				l_renames.reset
			end
			if attached exports as l_exports then
				l_exports.reset
			end
			if attached undefines as l_undefines then
				l_undefines.reset
			end
			if attached redefines as l_redefines then
				l_redefines.reset
			end
			if attached selects as l_selects then
				l_selects.reset
			end
		end

feature -- Access

	type: ET_BASE_TYPE
			-- Parent type

	renames: detachable ET_RENAME_LIST
			-- Rename clause

	exports: detachable ET_EXPORT_LIST
			-- Export clause

	undefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- Undefine clause

	redefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- Redefine clause

	selects: detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- Select clause

	end_keyword: detachable ET_KEYWORD
			-- 'end' keyword

	parent: ET_PARENT
			-- Class parent in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := type.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached end_keyword as l_end_keyword then
				Result := l_end_keyword
			else
				Result := type.last_leaf
			end
		end

feature -- Status report

	has_feature_adaptation: BOOLEAN
			-- Does current parent have a feature adaptation clause?
		do
			Result := renames /= Void or exports /= Void or
				undefines /= Void or redefines /= Void or selects /= Void
		ensure
			definition: Result = (renames /= Void or exports /= Void or
				undefines /= Void or redefines /= Void or selects /= Void)
		end

feature -- Setting

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: has_feature_adaptation implies an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_parent (Current)
		end

invariant

	type_not_void: type /= Void
	end_keyword_not_void: has_feature_adaptation implies end_keyword /= Void

end

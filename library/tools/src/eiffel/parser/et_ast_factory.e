note

	description:

		"Eiffel Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_FACTORY

inherit

	ET_SHARED_TOKEN_CONSTANTS

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new AST factory.
		do
		end

feature -- Eiffel keywords

	new_across_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'across' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)across").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.across_keyword
		end

	new_agent_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_AGENT_KEYWORD
			-- New 'agent' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)agent").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_alias_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'alias' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)alias").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.alias_keyword
		end

	new_all_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'all' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)all").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_all
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_and_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'and' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)and").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_and
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_as_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'as' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)as").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.as_keyword
		end

	new_assign_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'assign' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)assign").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.assign_keyword
		end

	new_attached_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'attached' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)attached").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_attached
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_attribute_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'attribute' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)attribute").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.attribute_keyword
		end

	new_check_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'check' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)check").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.check_keyword
		end

	new_class_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'class' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)class").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_class
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_convert_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'convert' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)convert").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.convert_keyword
		end

	new_create_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'create' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)create").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.create_keyword
		end

	new_creation_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'creation' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)creation").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.creation_keyword
		end

	new_current_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_CURRENT
			-- New 'current' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)current").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_debug_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'debug' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)debug").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.debug_keyword
		end

	new_deferred_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'deferred' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)deferred").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.deferred_keyword
		end

	new_detachable_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'detachable' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)detachable").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_detachable
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_do_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'do' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)do").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.do_keyword
		end

	new_else_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'else' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)else").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.else_keyword
		end

	new_elseif_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'elseif' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)elseif").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.elseif_keyword
		end

	new_end_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'end' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)end").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.end_keyword
		end

	new_ensure_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'ensure' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)ensure").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_ensure
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_expanded_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'expanded' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)expanded").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_expanded
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_export_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'export' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)export").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.export_keyword
		end

	new_external_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'external' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)external").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.external_keyword
		end

	new_false_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_FALSE_CONSTANT
			-- New 'false' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)false").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_feature_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'feature' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)feature").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.feature_keyword
		end

	new_from_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'from' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)from").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.from_keyword
		end

	new_frozen_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'frozen' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)frozen").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_frozen
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_if_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'if' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)if").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.if_keyword
		end

	new_implies_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'implies' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)implies").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_implies
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_indexing_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'indexing' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)indexing").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.indexing_keyword
		end

	new_inherit_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'inherit' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)inherit").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.inherit_keyword
		end

	new_inspect_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'inspect' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)inspect").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.inspect_keyword
		end

	new_invariant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'invariant' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)invariant").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.invariant_keyword
		end

	new_is_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'is' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)is").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.is_keyword
		end

	new_like_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'like' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)like").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_like
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_local_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'local' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)local").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.local_keyword
		end

	new_loop_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'loop' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)loop").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.loop_keyword
		end

	new_not_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'not' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)not").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_not
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_note_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'note' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)note").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.note_keyword
		end

	new_obsolete_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'obsolete' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)obsolete").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.obsolete_keyword
		end

	new_old_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'old' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)old").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_old
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_once_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'once' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)once").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_once
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_or_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'or' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)or").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_or
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_precursor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_PRECURSOR_KEYWORD
			-- New 'precursor' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)precursor").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_redefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'redefine' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)redefine").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.redefine_keyword
		end

	new_reference_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'reference' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)reference").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_reference
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_rename_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'rename' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)rename").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.rename_keyword
		end

	new_require_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'require' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)require").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_require
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_rescue_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'rescue' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)rescue").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.rescue_keyword
		end

	new_result_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_RESULT
			-- New 'result' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)result").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_retry_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_RETRY_INSTRUCTION
			-- New 'retry' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)retry").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_select_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'select' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)select").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.select_keyword
		end

	new_separate_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'separate' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)separate").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_separate
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_some_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'some' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)some").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.some_keyword
		end

	new_strip_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'strip' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)strip").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_strip
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_then_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'then' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)then").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.then_keyword
		end

	new_true_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_TRUE_CONSTANT
			-- New 'true' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)true").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_undefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'undefine' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)undefine").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.undefine_keyword
		end

	new_unique_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'unique' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)unique").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_unique
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_until_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'until' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)until").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.until_keyword
		end

	new_variant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'variant' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)variant").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.variant_keyword
		end

	new_void_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_VOID
			-- New 'void' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)void").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_when_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'when' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)when").recognizes (a_scanner.last_unicode_literal)
		do
			Result := tokens.when_keyword
		end

	new_xor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'xor' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {RX_PCRE_ROUTINES}.regexp ("(?i)xor").recognizes (a_scanner.last_unicode_literal)
		do
			create Result.make_xor
			Result.set_position (a_scanner.line, a_scanner.column)
		end

feature -- Eiffel symbols

	new_and_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∧' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_and_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_and_then_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∧…' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_and_then_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_arrow_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '->' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.arrow_symbol
		end

	new_assign_attempt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '?=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.assign_attempt_symbol
		end

	new_assign_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ':=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.assign_symbol
		end

	new_at_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '@' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_at
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_bang_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '!' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_bang
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_bar_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '¦' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.bar_symbol
		end

	new_close_repeat_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '⟲' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.close_repeat_symbol
		end

	new_colon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ':' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.colon_symbol
		end

	new_comma_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ',' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.comma_symbol
		end

	new_div_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '//' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_div
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_divide_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '/' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_divide
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_dollar_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '$' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_dollar
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_dot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '.' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.dot_symbol
		end

	new_dotdot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '..' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.dotdot_symbol
		end

	new_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_equal
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_for_all_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '∀' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.for_all_symbol
		end

	new_ge_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '>=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_ge
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_gt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '>' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_gt
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_implies_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '⇒' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_implies_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_le_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '<=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_le
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_left_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '<<' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_left_array
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_left_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '{' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.left_brace_symbol
		end

	new_left_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_BRACKET_SYMBOL
			-- New '[' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_left_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '(' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.left_parenthesis_symbol
		end

	new_lt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '<' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_lt
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_minus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '-' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_minus
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_mod_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '\\' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_mod
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_not_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '¬' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_not_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_not_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '/=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_not_equal
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_not_tilde_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '/~' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_not_tilde
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_open_repeat_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '⟳' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.open_repeat_symbol
		end

	new_or_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∨' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_or_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_or_else_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∨…' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_or_else_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_plus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '+' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_plus
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_power_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '^' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_power
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_question_mark_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_QUESTION_MARK_SYMBOL
			-- New '?' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_right_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '>>' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_array_symbol
		end

	new_right_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '}' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_brace_symbol
		end

	new_right_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ']' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_bracket_symbol
		end

	new_right_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ')' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_parenthesis_symbol
		end

	new_semicolon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SEMICOLON_SYMBOL
			-- New ';' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.semicolon_symbol
		end

	new_there_exists_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '∃' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.there_exists_symbol
		end

	new_tilde_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '~' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_tilde
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_times_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '*' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_times
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_xor_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '⊻' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_xor_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
		end

feature -- AST leaves

	new_binary_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_BINARY_INTEGER_CONSTANT
			-- New integer constant in binary format
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_BINARY_INTEGER_CONSTANT}.valid_literal (a_scanner.last_unicode_literal)
		do
			Result := a_scanner.last_binary_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_break (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_BREAK
			-- New break
		require
			a_scanner_not_void: a_scanner /= Void
			has_break: a_scanner.has_break
		do
			-- Result := Void
		end

	new_c1_character_constant (a_value: CHARACTER_32; a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_C1_CHARACTER_CONSTANT
			-- New character constant of the form 'A'
		require
			a_scanner_not_void: a_scanner /= Void
			valid_value: {ET_C1_CHARACTER_CONSTANT}.valid_value (a_value)
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_c2_character_constant (a_value: CHARACTER_8; a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_C2_CHARACTER_CONSTANT
			-- New character constant of the form '%A'
		require
			a_scanner_not_void: a_scanner /= Void
			a_value_valid: {ET_C2_CHARACTER_CONSTANT}.valid_value (a_value.to_character_32)
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_c3_character_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_C3_CHARACTER_CONSTANT
			-- New character constant of the form '%/code/'
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_C3_CHARACTER_CONSTANT}.valid_literal ({STRING_32} "'%%/" + a_scanner.last_unicode_literal + {STRING_32} "/'")
		do
			Result := a_scanner.last_c3_character_constant
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_comment (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_COMMENT
			-- New comment
		require
			a_scanner_not_void: a_scanner /= Void
			has_comment: a_scanner.has_comment
		do
			-- Result := Void
		end

	new_free_operator (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_FREE_OPERATOR
			-- New free operator
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_prefix (a_scanner.last_utf8_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_hexadecimal_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_HEXADECIMAL_INTEGER_CONSTANT
			-- New integer constant in hexadecimal format
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_HEXADECIMAL_INTEGER_CONSTANT}.valid_literal (a_scanner.last_unicode_literal)
		do
			Result := a_scanner.last_hexadecimal_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_identifier (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_IDENTIFIER
			-- New identifier
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_IDENTIFIER}.valid_name (a_scanner.last_unicode_literal)
		do
			Result := a_scanner.last_identifier
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_octal_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_OCTAL_INTEGER_CONSTANT
			-- New integer constant in octal format
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_OCTAL_INTEGER_CONSTANT}.valid_literal (a_scanner.last_unicode_literal)
		do
			Result := a_scanner.last_octal_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_regular_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_REGULAR_INTEGER_CONSTANT
			-- New integer constant with no underscore
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_REGULAR_INTEGER_CONSTANT}.valid_literal (a_scanner.last_unicode_literal)
		do
			Result := a_scanner.last_regular_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_regular_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_REGULAR_MANIFEST_STRING
			-- New manifest string with no special character
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_REGULAR_MANIFEST_STRING}.valid_literal ({STRING_32} "%"" + a_scanner.last_unicode_literal + {STRING_32} "%"")
		do
			create Result.make (a_scanner.last_utf8_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_regular_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_REGULAR_REAL_CONSTANT
			-- New real constant with no underscore
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_REGULAR_REAL_CONSTANT}.valid_literal (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_special_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SPECIAL_MANIFEST_STRING
			-- New manifest string with special characters
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_SPECIAL_MANIFEST_STRING}.valid_literal ({STRING_32} "%"" + a_scanner.last_unicode_literal + {STRING_32} "%"")
		do
			Result := a_scanner.last_special_manifest_string
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_underscored_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_UNDERSCORED_INTEGER_CONSTANT
			-- New integer constant with underscores
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_UNDERSCORED_INTEGER_CONSTANT}.valid_literal (a_scanner.last_unicode_literal)
		do
			Result := a_scanner.last_underscored_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_underscored_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_UNDERSCORED_REAL_CONSTANT
			-- New real constant with underscores
		require
			a_scanner_not_void: a_scanner /= Void
			valid_literal: {ET_UNDERSCORED_REAL_CONSTANT}.valid_literal (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_verbatim_string (a_marker, an_open, a_close: STRING_8; a_left_aligned: BOOLEAN; a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_VERBATIM_STRING
			-- New verbatim string
		require
			a_marker_not_void: a_marker /= Void
			a_marker_is_string_8: a_marker.same_type ({STRING_8} "")
			valid_utf8_marker: {UC_UTF8_ROUTINES}.valid_utf8 (a_marker)
			an_open_not_void: an_open /= Void
			an_open_is_string_8: an_open.same_type ({STRING_8} "")
			valid_utf8_open: {UC_UTF8_ROUTINES}.valid_utf8 (an_open)
			a_close_not_void: a_close /= Void
			a_close_is_string_8: a_close.same_type ({STRING_8} "")
			valid_utf8_close: {UC_UTF8_ROUTINES}.valid_utf8 (a_close)
			a_scanner_not_void: a_scanner /= Void
		do
			Result := a_scanner.last_verbatim_string (a_marker, an_open, a_close, a_left_aligned)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

feature -- AST nodes

	new_across_all_expression (a_across: detachable ET_KEYWORD; a_iterable_expression: detachable ET_EXPRESSION;
		a_as: detachable ET_KEYWORD; a_item_name: detachable ET_IDENTIFIER; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_all_conditional: detachable ET_CONDITIONAL;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_EXPRESSION
			-- New across all expression
		do
			if a_iterable_expression /= Void and a_item_name /= Void and a_all_conditional /= Void then
				create Result.make_all (a_iterable_expression, a_item_name, an_until_conditional, a_all_conditional)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				if a_as /= Void then
					Result.set_as_keyword (a_as)
				end
			end
		end

	new_across_instruction (a_across: detachable ET_KEYWORD; a_iterable_expression: detachable ET_EXPRESSION;
		a_as: detachable ET_KEYWORD; a_item_name: detachable ET_IDENTIFIER;
		a_from_compound: detachable ET_COMPOUND; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_loop_compound: detachable ET_COMPOUND;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_INSTRUCTION
			-- New across instruction
		do
			if a_iterable_expression /= Void and a_item_name /= Void then
				create Result.make (a_iterable_expression, a_item_name, a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				if a_as /= Void then
					Result.set_as_keyword (a_as)
				end
			end
		end

	new_across_some_expression (a_across: detachable ET_KEYWORD; a_iterable_expression: detachable ET_EXPRESSION;
		a_as: detachable ET_KEYWORD; a_item_name: detachable ET_IDENTIFIER; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_some_conditional: detachable ET_CONDITIONAL;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_EXPRESSION
			-- New across some expression
		do
			if a_iterable_expression /= Void and a_item_name /= Void and a_some_conditional /= Void then
				create Result.make_some (a_iterable_expression, a_item_name, an_until_conditional, a_some_conditional)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				if a_as /= Void then
					Result.set_as_keyword (a_as)
				end
			end
		end

	new_actual_arguments (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_ACTUAL_ARGUMENT_LIST
			-- New actual argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_actual_parameter_comma (a_parameter: detachable ET_ACTUAL_PARAMETER; a_comma: detachable ET_SYMBOL): detachable ET_ACTUAL_PARAMETER_ITEM
			-- New actual_parameter-comma
		do
			Result := a_parameter
		end

	new_actual_parameters (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_ACTUAL_PARAMETER_LIST
			-- New actual generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
				if a_left /= Void and then not a_left.position.is_null then
					Result.set_left_bracket (a_left)
				end
			end
		end

	new_agent_argument_operand_comma (an_argument: detachable ET_AGENT_ARGUMENT_OPERAND; a_comma: detachable ET_SYMBOL): detachable ET_AGENT_ARGUMENT_OPERAND_ITEM
			-- New agent_argument_operand-comma
		do
			Result := an_argument
		end

	new_agent_argument_operands (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_AGENT_ARGUMENT_OPERAND_LIST
			-- New agent argument operand list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_agent_typed_open_argument (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE; r: detachable ET_SYMBOL;
		a_question_mark: detachable ET_QUESTION_MARK_SYMBOL): detachable ET_AGENT_TYPED_OPEN_ARGUMENT
			-- New agent open argument of the form '{TYPE} ?'
		do
			if a_type /= Void then
				create Result.make (a_type)
			end
		end

	new_agent_open_target (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE; r: detachable ET_SYMBOL): detachable ET_AGENT_OPEN_TARGET
			-- New agent open target of the form '{TYPE}'
		do
			if a_type /= Void then
				create Result.make (a_type)
			end
		end

	new_alias_and_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "and" feature name
		do
			if a_string /= Void then
				create Result.make_and (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_and_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∧" feature name
		do
			if a_string /= Void then
				create Result.make_and_symbol (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_and_then_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "and then" feature name
		do
			if a_string /= Void then
				create Result.make_and_then (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_and_then_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∧…" feature name
		do
			if a_string /= Void then
				create Result.make_and_then_symbol (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_bracket_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "[]" feature name
		do
			if a_string /= Void then
				create Result.make_bracket (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_div_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_div (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_divide_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_divide (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_dotdot_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias ".." feature name
		do
			if a_string /= Void then
				create Result.make_dotdot (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_free_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_FREE_NAME
			-- New alias free feature name
		require
			a_string_computed: a_string /= Void implies a_string.value.count > 0
		do
			if a_string /= Void then
				create Result.make_infix (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_ge_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias ">=" feature name
		do
			if a_string /= Void then
				create Result.make_ge (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_gt_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias ">" feature name
		do
			if a_string /= Void then
				create Result.make_gt (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_implies_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "implies" feature name
		do
			if a_string /= Void then
				create Result.make_implies (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_implies_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "⇒" feature name
		do
			if a_string /= Void then
				create Result.make_implies_symbol (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_le_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "<=" feature name
		do
			if a_string /= Void then
				create Result.make_le (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_lt_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "<" feature name
		do
			if a_string /= Void then
				create Result.make_lt (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_minus_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "-" feature name
		do
			if a_string /= Void then
				create Result.make_minus (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_mod_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "\\" feature name
		do
			if a_string /= Void then
				create Result.make_mod (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_name_list (nb: INTEGER): detachable ET_ALIAS_NAME_LIST
			-- New list of alias names with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_alias_not_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "not" feature name
		do
			if a_string /= Void then
				create Result.make_not (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_not_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "¬" feature name
		do
			if a_string /= Void then
				create Result.make_not_symbol (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "or" feature name
		do
			if a_string /= Void then
				create Result.make_or (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∨" feature name
		do
			if a_string /= Void then
				create Result.make_or_symbol (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_else_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "or else" feature name
		do
			if a_string /= Void then
				create Result.make_or_else (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_else_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∨…" feature name
		do
			if a_string /= Void then
				create Result.make_or_else_symbol (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_parenthesis_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "()" feature name
		do
			if a_string /= Void then
				create Result.make_parenthesis (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_plus_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "+" feature name
		do
			if a_string /= Void then
				create Result.make_plus (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_power_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "^" feature name
		do
			if a_string /= Void then
				create Result.make_power (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_times_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "*" feature name
		do
			if a_string /= Void then
				create Result.make_times (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_xor_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "xor" feature name
		do
			if a_string /= Void then
				create Result.make_xor (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_xor_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "⊻" feature name
		do
			if a_string /= Void then
				create Result.make_xor_symbol (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_aliased_feature_name (a_name: detachable ET_IDENTIFIER; an_alias_name_list: detachable ET_ALIAS_NAME_LIST): detachable ET_ALIASED_FEATURE_NAME
			-- New aliased feature name
		do
			if a_name /= Void and an_alias_name_list /= Void then
				create Result.make (a_name, an_alias_name_list)
			end
		end

	new_all_export (a_clients: detachable ET_CLIENTS; an_all: detachable ET_KEYWORD): detachable ET_ALL_EXPORT
			-- New 'all' export clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
			end
		end

	new_argument_name_comma (a_name: detachable ET_IDENTIFIER; a_comma: detachable ET_SYMBOL): detachable ET_ARGUMENT_NAME
			-- New argument_name-comma
		do
			Result := a_name
		end

	new_assertion_semicolon (an_assertion: detachable ET_ASSERTION; a_semicolon: detachable ET_SYMBOL): detachable ET_ASSERTION_ITEM
			-- New assertion followed by a semicolon
		do
			Result := an_assertion
		end

	new_assigner (an_assign: detachable ET_KEYWORD; a_feature_name: detachable ET_FEATURE_NAME): detachable ET_ASSIGNER
			-- New assigner
		do
			Result := a_feature_name
		end

	new_assigner_instruction (a_target: detachable ET_QUALIFIED_FEATURE_CALL_EXPRESSION; an_assign: detachable ET_SYMBOL;
		a_source: detachable ET_EXPRESSION): detachable ET_ASSIGNER_INSTRUCTION
			-- New assigner instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
			end
		end

	new_assignment (a_target: detachable ET_WRITABLE; an_assign: detachable ET_SYMBOL; a_source: detachable ET_EXPRESSION): detachable ET_ASSIGNMENT
			-- New assignment instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
			end
		end

	new_assignment_attempt (a_target: detachable ET_WRITABLE; an_assign_attempt: detachable ET_SYMBOL;
		a_source: detachable ET_EXPRESSION): detachable ET_ASSIGNMENT_ATTEMPT
			-- New assignment-attempt instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
			end
		end

	new_attachment_mark_separate_keyword (a_attachment_mark: detachable ET_TYPE_MARK;
		a_separateness_keyword: detachable ET_KEYWORD): detachable ET_ATTACHMENT_MARK_SEPARATE_KEYWORD
			-- New attachment mark ('attached', 'detachable', '!' or '?',
			-- possibly implicit) followed by the keyword 'separate'
		do
			if a_attachment_mark /= Void and a_separateness_keyword /= Void then
				create Result.make (a_attachment_mark, a_separateness_keyword)
			end
		end

	new_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_ATTRIBUTE
			-- New attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_clients (a_clients)
			end
		end

	new_attribute_compound (a_attribute: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'attribute' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.attribute_keyword)
			end
		end

	new_bang_instruction (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE; r: detachable ET_SYMBOL;
		a_target: detachable ET_WRITABLE; a_call: detachable ET_QUALIFIED_CALL): detachable ET_BANG_INSTRUCTION
			-- New bang creation instruction
		do
			if a_target /= Void then
				create Result.make (a_type, a_target, a_call)
				if l /= Void and then not l.position.is_null then
					Result.set_left_bang (l)
				end
			end
		end

	new_bracket_arguments (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_ACTUAL_ARGUMENT_LIST
			-- New bracket argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_bracketed_with_capacity (nb)
			end
		end

	new_bracket_expression (a_target: detachable ET_EXPRESSION; a_name: detachable ET_BRACKET_SYMBOL;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_BRACKET_EXPRESSION
			-- New bracket expression
		do
			if a_target /= Void and a_name /= Void then
				create Result.make (a_target, a_name, args)
			end
		end

	new_call_agent (an_agent: detachable ET_AGENT_KEYWORD; a_target: detachable ET_AGENT_TARGET; a_name: detachable ET_QUALIFIED_FEATURE_NAME;
		args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_CALL_AGENT
			-- New call agent
		do
			if a_name /= Void then
				if a_target = Void then
					create Result.make_unqualified (a_name, args)
				else
					create Result.make (a_target, a_name, args)
				end
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
			end
		end

	new_check_instruction (a_check: detachable ET_KEYWORD; a_then_compound: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CHECK_INSTRUCTION
			-- New check instruction with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			Result.set_then_compound (a_then_compound)
			if a_check /= Void and then not a_check.position.is_null then
				Result.set_check_keyword (a_check)
			end
		end

	new_choice_comma (a_choice: detachable ET_CHOICE; a_comma: detachable ET_SYMBOL): detachable ET_CHOICE_ITEM
			-- New choice-comma
		do
			Result := a_choice
		end

	new_choice_list (a_when: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CHOICE_LIST
			-- New choice list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_when /= Void and nb = 0 then
				Result.set_when_keyword (a_when)
			end
		end

	new_choice_range (a_lower: detachable ET_CHOICE_CONSTANT; a_dotdot: detachable ET_SYMBOL;
		an_upper: detachable ET_CHOICE_CONSTANT): detachable ET_CHOICE_RANGE
			-- New choice range
		do
			if a_lower /= Void and an_upper /= Void then
				create Result.make (a_lower, an_upper)
			end
		end

	new_class_assertion (a_class_keyword: detachable ET_KEYWORD): detachable ET_CLASS_ASSERTION
			-- New 'class' assertion
		do
			create Result.make
			if a_class_keyword /= Void then
				Result.set_class_keyword (a_class_keyword)
			end
		end

	new_class_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_CLASS_NAME;
		a_base_class: detachable ET_NAMED_CLASS): detachable ET_CLASS_TYPE
			-- New Eiffel class type
		do
			if a_name /= Void and a_base_class /= Void then
				create Result.make (a_type_mark, a_name, a_base_class)
			end
		end

	new_client (a_name: detachable ET_CLASS_NAME; a_base_class: detachable ET_NAMED_CLASS): detachable ET_CLIENT
			-- New client
		do
			if a_name /= Void and a_base_class /= Void then
				create Result.make (a_name, a_base_class)
			end
		end

	new_client_comma (a_name: detachable ET_CLASS_NAME; a_base_class: detachable ET_NAMED_CLASS;
		a_comma: detachable ET_SYMBOL): detachable ET_CLIENT_ITEM
			-- New client followed by a comma
		do
			if a_name /= Void and a_base_class /= Void then
				create {ET_CLIENT} Result.make (a_name, a_base_class)
			end
		end

	new_clients (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_CLIENTS
			-- New client clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_brace (a_left)
			end
		end

	new_colon_type (a_colon: detachable ET_SYMBOL; a_type: detachable ET_TYPE): detachable ET_DECLARED_TYPE
			-- New colon-type
		do
			Result := a_type
		end

	new_compound (nb: INTEGER): detachable ET_COMPOUND
			-- New instruction compound with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_empty_compound: detachable ET_COMPOUND
			-- New empty instruction compound
		do
			Result := Void
		end

	new_conditional (a_keyword: detachable ET_KEYWORD; an_expression: detachable ET_EXPRESSION): detachable ET_CONDITIONAL
			-- New conditional
		do
			if an_expression /= Void then
				if a_keyword /= Void and then ((a_keyword.is_if or a_keyword.is_inspect) and not a_keyword.position.is_null) then
					create {ET_KEYWORD_EXPRESSION} Result.make (a_keyword, an_expression)
				else
					Result := an_expression
				end
			end
		end

	new_constant_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_AST_LEAF; a_constant: detachable ET_CONSTANT; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_CONSTANT_ATTRIBUTE
			-- New constant attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_constant /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_constant, a_class)
				Result.set_assigner (an_assigner)
				Result.set_clients (a_clients)
			end
		end

	new_constrained_formal_parameter (a_type_mark: detachable ET_KEYWORD; a_name: detachable ET_IDENTIFIER;
		an_arrow: detachable ET_SYMBOL; a_constraint: detachable ET_CONSTRAINT;
		a_creation: detachable ET_CONSTRAINT_CREATOR; a_class: detachable ET_CLASS): detachable ET_CONSTRAINED_FORMAL_PARAMETER
			-- New constrained formal generic parameter
		do
			if a_name /= Void and a_constraint /= Void and a_class /= Void then
				create Result.make (a_name, a_constraint, a_creation, a_class)
				if a_type_mark /= Void then
					Result.set_type_mark (a_type_mark)
				end
			end
		end

	new_constraint_actual_parameter_comma (a_parameter: detachable ET_CONSTRAINT_ACTUAL_PARAMETER;
		a_comma: detachable ET_SYMBOL): detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
			-- New constraint_actual_parameter-comma
		do
			Result := a_parameter
		end

	new_constraint_actual_parameters (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
			-- New constraint actual generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
				if a_left /= Void and then not a_left.position.is_null then
					Result.set_left_bracket (a_left)
				end
			end
		end

	new_constraint_creator (a_create: detachable ET_KEYWORD; an_end: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CONSTRAINT_CREATOR
			-- New constraint creation clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_constraint_generic_named_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_IDENTIFIER;
		a_generics: like new_constraint_actual_parameters): detachable ET_CONSTRAINT_GENERIC_NAMED_TYPE
			-- New Eiffel constraint generic named type
		do
			if a_name /= Void and a_generics /= Void then
				create Result.make (a_type_mark, a_name, a_generics)
			end
		end

	new_constraint_labeled_actual_parameter (a_label: detachable ET_IDENTIFIER; a_colon: detachable ET_SYMBOL;
		a_type: detachable ET_CONSTRAINT_TYPE): detachable ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER
			-- New constraint labeled actual parameter
		do
			if a_label /= Void and a_type /= Void then
				create Result.make (a_label, a_colon, a_type)
			end
		end

	new_constraint_labeled_actual_parameter_semicolon (a_parameter: detachable ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL): detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
			-- New constraint_labeled_actual_parameter-semicolon
		do
			Result := a_parameter
		end

	new_constraint_labeled_comma_actual_parameter (a_label: detachable ET_IDENTIFIER; a_comma: detachable ET_SYMBOL;
		a_type: detachable ET_CONSTRAINT_TYPE): detachable ET_CONSTRAINT_LABELED_COMMA_ACTUAL_PARAMETER
			-- New constraint labeled actual parameter followed by a comma
		do
			if a_label /= Void and a_type /= Void then
				create Result.make (a_label, a_comma, a_type)
			end
		end

	new_constraint_named_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_IDENTIFIER): detachable ET_CONSTRAINT_NAMED_TYPE
			-- New Eiffel constraint named type
		do
			if a_name /= Void then
				create Result.make (a_type_mark, a_name)
			end
		end

	new_constraint_renames (a_rename: detachable ET_KEYWORD; a_end: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CONSTRAINT_RENAME_LIST
			-- New constraint rename clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_convert_feature_comma (a_convert_feature: detachable ET_CONVERT_FEATURE; a_comma: detachable ET_SYMBOL): detachable ET_CONVERT_FEATURE_ITEM
			-- New convert_feature-comma
		do
			Result := a_convert_feature
		end

	new_convert_features (a_convert: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CONVERT_FEATURE_LIST
			-- New convert clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_convert_from_expression (a_source: ET_EXPRESSION; a_convert_feature: ET_CONVERT_FEATURE; a_source_type, a_target_type: ET_TYPE_CONTEXT): ET_CONVERT_FROM_EXPRESSION
			-- New conversion from expresion to convert `a_source' of type `a_source_type' to `a_target_type'
			-- using `a_convert_feature'
		require
			a_source_not_void: a_source /= Void
			a_convert_feature_not_void: a_convert_feature /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_valid_context: a_source_type.is_valid_context
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_valid_context: a_target_type.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			create Result.make (a_target_type.named_type, a_convert_feature, a_source)
		ensure
			new_convert_from_expression_not_void: Result /= Void
		end

	new_convert_function (a_name: detachable ET_FEATURE_NAME; a_colon: detachable ET_SYMBOL;
		a_types: detachable ET_TYPE_LIST): detachable ET_CONVERT_FUNCTION
			-- New convert function
		do
			if a_name /= Void and a_types /= Void then
				create Result.make (a_name, a_types)
			end
		end

	new_convert_procedure (a_name: detachable ET_FEATURE_NAME; a_left_parenthesis: detachable ET_SYMBOL;
		a_types: detachable ET_TYPE_LIST; a_right_parenthesis: detachable ET_SYMBOL): detachable ET_CONVERT_PROCEDURE
			-- New convert procedure
		do
			if a_name /= Void and a_types /= Void then
				create Result.make (a_name, a_types)
			end
		end

	new_convert_to_expression (a_source: ET_EXPRESSION; a_convert_feature: ET_CONVERT_FEATURE; a_source_type, a_target_type: ET_TYPE_CONTEXT): ET_CONVERT_TO_EXPRESSION
			-- New conversion to expresion to convert `a_source' of type `a_source_type' to `a_target_type'
			-- using `a_convert_feature'
		require
			a_source_not_void: a_source /= Void
			a_convert_feature_not_void: a_convert_feature /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_valid_context: a_source_type.is_valid_context
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_valid_context: a_target_type.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			create Result.make (a_source, a_convert_feature)
		ensure
			new_convert_to_expression_not_void: Result /= Void
		end

	new_convert_types (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_TYPE_LIST
			-- New convert type list with given capacity
		require
			nb_positive: nb >= 0
		local
			a_braced_types: ET_BRACED_TYPE_LIST
		do
			if nb > 0 then
				create a_braced_types.make_with_capacity (nb)
				Result := a_braced_types
				if a_left /= Void and then not a_left.position.is_null then
					a_braced_types.set_left_brace (a_left)
				end
			end
		end

	new_create_expression (a_create: detachable ET_KEYWORD; a_region: detachable ET_CREATION_REGION; a_type: detachable ET_TARGET_TYPE;
		a_call: detachable ET_QUALIFIED_CALL): detachable ET_CREATE_EXPRESSION
			-- New create expression
		do
			if a_type /= Void then
				create Result.make (a_type, a_call)
				if a_create /= Void and then not a_create.position.is_null then
					Result.set_create_keyword (a_create)
					if a_region /= Void then
						Result.set_creation_region (a_region)
					end
				end
			end
		end

	new_create_instruction (a_create: detachable ET_KEYWORD; a_region: detachable ET_CREATION_REGION; a_type: detachable ET_TARGET_TYPE;
		a_target: detachable ET_WRITABLE; a_call: detachable ET_QUALIFIED_CALL): detachable ET_CREATE_INSTRUCTION
			-- New create instruction
		do
			if a_target /= Void then
				create Result.make (a_type, a_target, a_call)
				if a_create /= Void and then not a_create.position.is_null then
					Result.set_create_keyword (a_create)
					if a_region /= Void then
						Result.set_creation_region (a_region)
					end
				end
			end
		end

	new_creation_region (l: detachable ET_SYMBOL; a_name: detachable ET_CLASS_NAME;
		r: detachable ET_SYMBOL): detachable ET_CREATION_REGION
			-- New creation region
		do
			if a_name /= Void then
				create Result.make (a_name)
				if l /= Void then
					Result.set_left_symbol (l)
				end
				if r /= Void then
					Result.set_right_symbol (r)
				end
			end
		end

	new_creator (a_create: detachable ET_KEYWORD; a_clients: detachable ET_CLIENT_LIST; nb: INTEGER): detachable ET_CREATOR
			-- New creation clause with given capacity
		require
			nb_positive: nb >= 0
		do
			if a_clients /= Void then
				create Result.make_with_capacity (a_clients, nb)
			end
		end

	new_creators (nb: INTEGER): detachable ET_CREATOR_LIST
			-- New list of creation clauses with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_current_address (d: detachable ET_SYMBOL; c: detachable ET_CURRENT): detachable ET_CURRENT_ADDRESS
			-- New address of Current
		do
			create Result.make
			if d /= Void and then not d.position.is_null then
				Result.set_dollar (d)
			end
		end

	new_custom_attribute (a_creation: detachable ET_CREATE_EXPRESSION;
		a_settings: detachable ET_MANIFEST_TUPLE; an_end: detachable ET_KEYWORD): detachable ET_CUSTOM_ATTRIBUTE
			-- New if instruction
		do
			if a_creation /= Void then
				create Result.make (a_creation, a_settings)
			end
		end

	new_debug_compound (a_debug: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'debug' keyword
		do
			if a_debug /= Void and then not a_debug.position.is_null then
				if a_compound /= Void then
					Result := a_compound
				else
					create Result.make
				end
				Result.set_keyword (a_debug)
			elseif a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.debug_keyword)
			end
		end

	new_debug_instruction (a_keys: detachable ET_MANIFEST_STRING_LIST; a_compound: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD): detachable ET_DEBUG_INSTRUCTION
			-- New debug instruction
		do
			create Result.make (a_keys, a_compound)
		end

	new_deferred_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER; an_is: detachable ET_KEYWORD;
		a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_deferred: detachable ET_KEYWORD;
		a_postconditions: detachable ET_POSTCONDITIONS; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_DEFERRED_FUNCTION
			-- New deferred function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_deferred_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_deferred: detachable ET_KEYWORD; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_DEFERRED_PROCEDURE
			-- New deferred procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_do_compound (a_do: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'do' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.do_keyword)
			end
		end

	new_do_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_compound: detachable ET_COMPOUND;
		a_postconditions: detachable ET_POSTCONDITIONS; a_rescue: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_DO_FUNCTION
			-- New do function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_do_function_inline_agent (an_agent: detachable ET_AGENT_KEYWORD; a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_compound: detachable ET_COMPOUND;
		a_postconditions: detachable ET_POSTCONDITIONS; a_rescue: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD; an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_DO_FUNCTION_INLINE_AGENT
			-- New inline agent whose associated feature is a do function
		do
			if a_type /= Void then
				create Result.make (a_formal_args, a_type, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
			end
		end

	new_do_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_DO_PROCEDURE
			-- New do procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_do_procedure_inline_agent (an_agent: detachable ET_AGENT_KEYWORD; a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_DO_PROCEDURE_INLINE_AGENT
			-- New inline agent whose associated feature is a do procedure
		do
			create Result.make (a_formal_args, an_actual_args)
			if an_agent /= Void then
				Result.set_agent_keyword (an_agent)
			end
			Result.set_preconditions (a_preconditions)
			Result.set_locals (a_locals)
			Result.set_compound (a_compound)
			Result.set_postconditions (a_postconditions)
			Result.set_rescue_clause (a_rescue)
		end

	new_dot_feature_name (a_dot: detachable ET_SYMBOL; a_name: detachable ET_FEATURE_NAME): detachable ET_QUALIFIED_FEATURE_NAME
			-- New dot-feature_name
		do
			Result := a_name
		end

	new_else_compound (an_else: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by an 'else' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.else_keyword)
			end
		end

	new_elseif_expression (a_conditional: detachable ET_CONDITIONAL;
		a_then_keyword: detachable ET_KEYWORD; a_then_expression: detachable ET_EXPRESSION): detachable ET_ELSEIF_EXPRESSION
			-- New 'elseif' part of 'if' expression
		do
			if a_conditional /= Void and a_then_expression /= Void then
				create Result.make (a_conditional, a_then_expression)
			end
		end

	new_elseif_expression_list (nb: INTEGER): detachable ET_ELSEIF_EXPRESSION_LIST
			-- New 'elseif' expression list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_elseif_part (a_conditional: detachable ET_CONDITIONAL;
		a_then_compound: detachable ET_COMPOUND): detachable ET_ELSEIF_PART
			-- New elseif part
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_then_compound)
			end
		end

	new_elseif_part_list (nb: INTEGER): detachable ET_ELSEIF_PART_LIST
			-- New elseif part list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_equality_expression (l: detachable ET_EXPRESSION; an_op: detachable ET_SYMBOL;
		r: detachable ET_EXPRESSION): detachable ET_EQUALITY_EXPRESSION
			-- New equality expression
		do
			if l /= Void and an_op /= Void and r /= Void then
				create Result.make (l, an_op, r)
			end
		end

	new_exports (an_export: detachable ET_KEYWORD; nb: INTEGER): detachable ET_EXPORT_LIST
			-- New export clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_expression_address (d: detachable ET_SYMBOL; e: detachable ET_PARENTHESIZED_EXPRESSION): detachable ET_EXPRESSION_ADDRESS
			-- New expression address
		do
			if e /= Void then
				create Result.make (e)
				if d /= Void and then not d.position.is_null then
					Result.set_dollar (d)
				end
			end
		end

	new_expression_comma (an_expression: detachable ET_EXPRESSION; a_comma: detachable ET_SYMBOL): detachable ET_EXPRESSION_ITEM
			-- New expression-comma
		do
			Result := an_expression
		end

	new_extended_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;  a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue_clause: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_EXTENDED_ATTRIBUTE
			-- New extended attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue_clause)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_extended_feature_name_comma (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_comma: detachable ET_SYMBOL): detachable ET_EXTENDED_FEATURE_NAME
			-- New extended_feature_name-comma
		do
			Result := a_name
		end

	new_external_alias (a_keyword: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING): detachable ET_EXTERNAL_ALIAS
			-- New external alias
		do
			Result := a_string
		end

	new_external_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_EXTERNAL_FUNCTION
			-- New external function
		do
			if a_name /= Void and a_type /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_language, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_alias_clause (an_alias)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_external_function_inline_agent (an_agent: detachable ET_AGENT_KEYWORD;
		a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST; a_type: detachable ET_DECLARED_TYPE;
		a_preconditions: detachable ET_PRECONDITIONS; a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_EXTERNAL_FUNCTION_INLINE_AGENT
			-- New inline agent whose associated feature is an external function
		do
			if a_type /= Void and a_language /= Void then
				create Result.make (a_formal_args, a_type, a_language, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_alias_clause (an_alias)
				Result.set_postconditions (a_postconditions)
			end
		end

	new_external_language (a_keyword: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING): detachable ET_EXTERNAL_LANGUAGE
			-- New external language
		do
			Result := a_string
		end

	new_external_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_language: detachable ET_EXTERNAL_LANGUAGE; an_alias: detachable ET_EXTERNAL_ALIAS;
		a_postconditions: detachable ET_POSTCONDITIONS; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_EXTERNAL_PROCEDURE
			-- New external procedure
		do
			if a_name /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_language, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_alias_clause (an_alias)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_external_procedure_inline_agent (an_agent: detachable ET_AGENT_KEYWORD; a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_preconditions: detachable ET_PRECONDITIONS; a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD; an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_EXTERNAL_PROCEDURE_INLINE_AGENT
			-- New inline agent whose associated feature is an external procedure
		do
			if a_language /= Void then
				create Result.make (a_formal_args, a_language, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_alias_clause (an_alias)
				Result.set_postconditions (a_postconditions)
			end
		end

	new_feature_address (d: detachable ET_SYMBOL; a_name: detachable ET_FEATURE_NAME): detachable ET_FEATURE_ADDRESS
			-- New feature address
		do
			if a_name /= Void then
				create Result.make (a_name)
				if d /= Void and then not d.position.is_null then
					Result.set_dollar (d)
				end
			end
		end

	new_feature_clause (a_feature: detachable ET_KEYWORD; a_clients: detachable ET_CLIENT_LIST): detachable ET_FEATURE_CLAUSE
			-- New fetaure clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
			end
		end

	new_feature_clauses (nb: INTEGER): detachable ET_FEATURE_CLAUSE_LIST
			-- New feature clauses with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_feature_export (a_clients: detachable ET_CLIENTS; nb: INTEGER): detachable ET_FEATURE_EXPORT
			-- New feature export clause with given capacity
		require
			nb_positive: nb >= 0
		do
			if a_clients /= Void then
				create Result.make_with_capacity (a_clients, nb)
			end
		end

	new_feature_name_comma (a_name: detachable ET_FEATURE_NAME; a_comma: detachable ET_SYMBOL): detachable ET_FEATURE_NAME_ITEM
			-- New feature_name-comma
		do
			Result := a_name
		end

	new_for_all_quantifier_expression (a_quantifier_symbol: detachable ET_SYMBOL;
		a_item_name: detachable ET_IDENTIFIER; a_colon_symbol: detachable ET_SYMBOL;
		a_iterable_expression: detachable ET_EXPRESSION; a_bar_symbol: detachable ET_SYMBOL;
		a_iteration_expression: detachable ET_EXPRESSION): detachable ET_QUANTIFIER_EXPRESSION
			-- New quantifier expression of the form '∀'
		do
			if a_item_name /= Void and a_iterable_expression /= Void and a_iteration_expression /= Void then
				create Result.make_for_all (a_item_name, a_iterable_expression, a_iteration_expression)
			end
		end

	new_formal_argument (a_name: detachable ET_ARGUMENT_NAME; a_type: detachable ET_DECLARED_TYPE): detachable ET_FORMAL_ARGUMENT
			-- New formal argument
		do
			if a_name /= Void and a_type /= Void then
				create Result.make (a_name, a_type)
			end
		end

	new_formal_argument_semicolon (an_argument: detachable ET_FORMAL_ARGUMENT; a_semicolon: detachable ET_SYMBOL): detachable ET_FORMAL_ARGUMENT_ITEM
			-- New formal_argument-semicolon
		do
			Result := an_argument
		end

	new_formal_arguments (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_FORMAL_ARGUMENT_LIST
			-- New formal argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_formal_comma_argument (a_name: detachable ET_ARGUMENT_NAME; a_type: detachable ET_DECLARED_TYPE): detachable ET_FORMAL_ARGUMENT
			-- New formal agument whose name is followed by a comma
		do
			if a_name /= Void and a_type /= Void then
				create {ET_FORMAL_COMMA_ARGUMENT} Result.make (a_name, a_type)
			end
		end

	new_formal_parameter (a_type_mark: detachable ET_KEYWORD; a_name: detachable ET_IDENTIFIER;
		a_class: detachable ET_CLASS): detachable ET_FORMAL_PARAMETER
			-- New formal generic parameter
		do
			if a_name /= Void and a_class /= Void then
				create Result.make (a_name, a_class)
				if a_type_mark /= Void then
					Result.set_type_mark (a_type_mark)
				end
			end
		end

	new_formal_parameter_comma (a_formal: detachable ET_FORMAL_PARAMETER; a_comma: detachable ET_SYMBOL): detachable ET_FORMAL_PARAMETER_ITEM
			-- New formal_parameter-comma
		do
			Result := a_formal
		end

	new_formal_parameter_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_IDENTIFIER;
		an_index: detachable INTEGER; a_class: detachable ET_CLASS): detachable ET_FORMAL_PARAMETER_TYPE
			-- New formal generic parameter type
		do
			if a_name /= Void and then an_index >= 1 and then a_class /= Void then
				create Result.make (a_type_mark, a_name, an_index, a_class)
			end
		end

	new_formal_parameters (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_FORMAL_PARAMETER_LIST
			-- New formal generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_bracket (a_left)
			end
		end

	new_from_compound (a_from: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'from' keyword
		do
			if a_from /= Void and then not a_from.position.is_null then
				if a_compound /= Void then
					Result := a_compound
				else
					create Result.make
				end
				Result.set_keyword (a_from)
			elseif a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.from_keyword)
			end
		end

	new_generic_class_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_IDENTIFIER;
		a_generics: like new_actual_parameters; a_base_class: detachable ET_NAMED_CLASS): detachable ET_CLASS_TYPE
			-- New Eiffel generic class type
		do
			if a_name /= Void and a_generics /= Void and a_base_class /= Void then
				create Result.make_generic (a_type_mark, a_name, a_generics, a_base_class)
			end
		end

	new_if_expression (a_conditional: detachable ET_CONDITIONAL; a_then_keyword: detachable ET_KEYWORD; a_then_expression: detachable ET_EXPRESSION;
		a_elseif_parts: detachable ET_ELSEIF_EXPRESSION_LIST; a_else_keyword: detachable ET_KEYWORD; a_else_expression: detachable ET_EXPRESSION;
		a_end_keyword: detachable ET_KEYWORD): detachable ET_IF_EXPRESSION
			-- New 'if' expression
		do
			if a_conditional /= Void and a_then_expression /= Void and a_else_expression /= Void then
				create Result.make (a_conditional, a_then_expression, a_else_expression)
				Result.set_elseif_parts (a_elseif_parts)
			end
		end

	new_if_instruction (a_conditional: detachable ET_CONDITIONAL; a_then_compound: detachable ET_COMPOUND;
		an_elseif_parts: detachable ET_ELSEIF_PART_LIST; an_else_compound: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD): detachable ET_IF_INSTRUCTION
			-- New 'if' instruction
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_then_compound)
				Result.set_elseif_parts (an_elseif_parts)
				Result.set_else_compound (an_else_compound)
			end
		end

	new_indexing (a_terms: detachable ET_INDEXING_TERM_LIST): detachable ET_INDEXING
			-- New indexing clause
		do
			if a_terms /= Void then
				create Result.make (a_terms)
			end
		end

	new_indexing_semicolon (an_indexing: detachable ET_INDEXING_ITEM; a_semicolon: detachable ET_SYMBOL): detachable ET_INDEXING_ITEM
			-- New indexing-semicolon
		do
			Result := an_indexing
		end

	new_indexing_term_comma (a_term: detachable ET_INDEXING_TERM; a_comma: detachable ET_SYMBOL): detachable ET_INDEXING_TERM_ITEM
			-- New indexing_term-comma
		do
			Result := a_term
		end

	new_indexing_terms (nb: INTEGER): detachable ET_INDEXING_TERM_LIST
			-- New indexing terms with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_indexings (an_indexing: detachable ET_KEYWORD; nb: INTEGER): detachable ET_INDEXING_LIST
			-- New indexing clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if an_indexing /= Void then
				Result.set_indexing_keyword (an_indexing)
			end
		end

	new_infix_and_then_operator (an_and: detachable ET_KEYWORD; a_then: detachable ET_KEYWORD): detachable ET_INFIX_AND_THEN_OPERATOR
			-- New binary "and then" operator
		do
			create Result.make
			if an_and /= Void and then not an_and.position.is_null then
				Result.set_and_keyword (an_and)
			end
		end

	new_infix_expression (l: detachable ET_EXPRESSION; a_name: detachable ET_OPERATOR; r: detachable ET_EXPRESSION): detachable ET_INFIX_EXPRESSION
			-- New infix expression
		do
			if l /= Void and r /= Void and a_name /= Void then
				create Result.make (l, a_name, r)
			end
		end

	new_infix_free_operator (an_operator: detachable ET_FREE_OPERATOR): detachable ET_FREE_OPERATOR
			-- New binary "<free-operator>" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_infix
			end
		end

	new_infix_free_operator_from_symbol (a_symbol: detachable ET_SYMBOL): detachable ET_FREE_OPERATOR
			-- New binary "<free-operator>" operator
		do
			if a_symbol /= Void then
				create Result.make_infix (a_symbol.text)
				Result.set_position (a_symbol.line, a_symbol.column)
				Result.set_break (a_symbol.break)
			end
		end

	new_infix_minus_operator (an_operator: detachable ET_SYMBOL_OPERATOR): detachable ET_SYMBOL_OPERATOR
			-- New binary "-" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_infix_minus
			end
		end

	new_infix_or_else_operator (an_or: detachable ET_KEYWORD; an_else: detachable ET_KEYWORD): detachable ET_INFIX_OR_ELSE_OPERATOR
			-- New binary "or else" operator
		do
			create Result.make
			if an_or /= Void and then not an_or.position.is_null then
				Result.set_or_keyword (an_or)
			end
		end

	new_infix_plus_operator (an_operator: detachable ET_SYMBOL_OPERATOR): detachable ET_SYMBOL_OPERATOR
			-- New binary "+" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_infix_plus
			end
		end

	new_inspect_expression (a_conditional: detachable ET_CONDITIONAL; a_when_parts: detachable ET_WHEN_EXPRESSION_LIST;
		an_else_part: detachable ET_CONDITIONAL; an_end: detachable ET_KEYWORD): detachable ET_INSPECT_EXPRESSION
			-- New inspect expression
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_when_parts)
				Result.set_else_part (an_else_part)
			end
		end

	new_inspect_instruction (a_conditional: detachable ET_CONDITIONAL; a_when_parts: detachable ET_WHEN_PART_LIST;
		an_else_compound: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD): detachable ET_INSPECT_INSTRUCTION
			-- New inspect instruction
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_when_parts)
				Result.set_else_compound (an_else_compound)
			end
		end

	new_invariants (an_invariant: detachable ET_KEYWORD; a_class: detachable ET_CLASS; nb: INTEGER): detachable ET_INVARIANTS
			-- New class invariants with given capacity
		require
			nb_positive: nb >= 0
		do
			if a_class /= Void then
				create Result.make_with_capacity (a_class, nb)
				if an_invariant /= Void and then not an_invariant.position.is_null then
					Result.set_invariant_keyword (an_invariant)
				end
			end
		end

	new_iteration_cursor (a_at_symbol: detachable ET_SYMBOL; a_identifier: detachable ET_IDENTIFIER): detachable ET_ITERATION_CURSOR
			-- New iteration cursor '@i' expression
		do
			if a_identifier /= Void then
				create Result.make (a_identifier)
				if a_at_symbol /= Void and then not a_at_symbol.position.is_null then
					Result.set_at_symbol (a_at_symbol)
				end
			end
		end

	new_keyword_feature_name_list (a_keyword: detachable ET_KEYWORD; nb: INTEGER): detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- New feature name list, with a given capacity, preceded by a keyword
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_label_comma (a_label: detachable ET_IDENTIFIER; a_comma: detachable ET_SYMBOL): detachable ET_LABEL
			-- New label-comma
		do
			Result := a_label
		end

	new_labeled_actual_parameter (a_label: detachable ET_LABEL; a_type: detachable ET_DECLARED_TYPE): detachable ET_LABELED_ACTUAL_PARAMETER
			-- New labeled actual parameter
		do
			if a_label /= Void and a_type /= Void then
				create Result.make (a_label, a_type)
			end
		end

	new_labeled_actual_parameter_semicolon (a_parameter: detachable ET_LABELED_ACTUAL_PARAMETER;
		a_semicolon: detachable ET_SYMBOL): detachable ET_ACTUAL_PARAMETER_ITEM
			-- New labeled_actual_parameter-semicolon
		do
			Result := a_parameter
		end

	new_labeled_comma_actual_parameter (a_label: detachable ET_LABEL; a_type: detachable ET_DECLARED_TYPE): detachable ET_LABELED_ACTUAL_PARAMETER
			-- New labeled actual parameter whose label is followed by a comma
		do
			if a_label /= Void and a_type /= Void then
				create {ET_LABELED_COMMA_ACTUAL_PARAMETER} Result.make (a_label, a_type)
			end
		end

	new_like_current (a_type_mark: detachable ET_TYPE_MARK; a_like: detachable ET_KEYWORD;
		a_current: detachable ET_CURRENT): detachable ET_LIKE_CURRENT
			-- New 'like Current' type
		do
			create Result.make (a_type_mark)
			if a_like /= Void and then not a_like.position.is_null then
				Result.set_like_keyword (a_like)
			end
		end

	new_like_feature (a_type_mark: detachable ET_TYPE_MARK; a_like: detachable ET_KEYWORD;
		a_name: detachable ET_FEATURE_NAME): detachable ET_LIKE_FEATURE
			-- New 'like name' type
		do
			if a_name /= Void then
				create Result.make (a_type_mark, a_name)
				if a_like /= Void and then not a_like.position.is_null then
					Result.set_like_keyword (a_like)
				end
			end
		end

	new_local_comma_variable (a_name: detachable ET_LOCAL_NAME; a_type: detachable ET_DECLARED_TYPE): detachable ET_LOCAL_VARIABLE
			-- New local variable whose name is followed by a comma
		do
			if a_name /= Void and a_type /= Void then
				create {ET_LOCAL_COMMA_VARIABLE} Result.make (a_name, a_type)
			end
		end

	new_local_name_comma (a_name: detachable ET_IDENTIFIER; a_comma: detachable ET_SYMBOL): detachable ET_LOCAL_NAME
			-- New local_name-comma
		do
			Result := a_name
		end

	new_local_variable (a_name: detachable ET_LOCAL_NAME; a_type: detachable ET_DECLARED_TYPE): detachable ET_LOCAL_VARIABLE
			-- New local variable
		do
			if a_name /= Void and a_type /= Void then
				create Result.make (a_name, a_type)
			end
		end

	new_local_variable_semicolon (a_variable: detachable ET_LOCAL_VARIABLE; a_semicolon: detachable ET_SYMBOL): detachable ET_LOCAL_VARIABLE_ITEM
			-- New local_variable-semicolon
		do
			Result := a_variable
		end

	new_local_variables (a_local: detachable ET_KEYWORD; nb: INTEGER): detachable ET_LOCAL_VARIABLE_LIST
			-- New local variable list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_local /= Void and nb = 0 then
				Result.set_local_keyword (a_local)
			end
		end

	new_loop_compound (a_loop: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'loop' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.loop_keyword)
			end
		end

	new_loop_instruction (a_from_compound: detachable ET_COMPOUND; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_loop_compound: detachable ET_COMPOUND;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_LOOP_INSTRUCTION
			-- New loop instruction
		do
			if an_until_conditional /= Void then
				create Result.make (a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				Result.set_has_old_variant_syntax (False)
			end
		end

	new_loop_instruction_old_syntax (a_from_compound: detachable ET_COMPOUND; an_invariant: detachable ET_LOOP_INVARIANTS;
		a_variant: detachable ET_VARIANT; an_until_conditional: detachable ET_CONDITIONAL;
		a_loop_compound: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD): detachable ET_LOOP_INSTRUCTION
			-- New loop instruction with the old syntax where the variant
			-- clause appears after the invariant clause
		do
			if an_until_conditional /= Void then
				create Result.make (a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				Result.set_has_old_variant_syntax (True)
			end
		end

	new_loop_invariants (an_invariant: detachable ET_KEYWORD; nb: INTEGER): detachable ET_LOOP_INVARIANTS
			-- New loop invariants with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if an_invariant /= Void and then not an_invariant.position.is_null then
				Result.set_invariant_keyword (an_invariant)
			end
		end

	new_manifest_array (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_MANIFEST_ARRAY
			-- New manifest array with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_symbol (a_left)
			end
		end

	new_manifest_string_comma (a_string: detachable ET_MANIFEST_STRING; a_comma: detachable ET_SYMBOL): detachable ET_MANIFEST_STRING_ITEM
			-- New manifest_string-comma
		do
			Result := a_string
		end

	new_manifest_string_list (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_MANIFEST_STRING_LIST
			-- New list of manifest strings with capacity `nb'.
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_manifest_tuple (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_MANIFEST_TUPLE
			-- New manifest tuple with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_symbol (a_left)
			end
		end

	new_manifest_type (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE; r: detachable ET_SYMBOL): detachable ET_MANIFEST_TYPE
			-- New manifest type
		do
			if a_type /= Void then
				create Result.make (a_type)
			end
		end

	new_named_object_test (a_attached: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_expression: detachable ET_EXPRESSION; a_as: detachable ET_KEYWORD;
		a_name: detachable ET_IDENTIFIER): detachable ET_NAMED_OBJECT_TEST
			-- New named object-test expression
		do
			if a_name /= Void and a_expression /= Void then
				create Result.make (a_type, a_expression, a_name)
				if a_attached /= Void and then not a_attached.position.is_null then
					Result.set_attached_keyword (a_attached)
				end
			end
		end

	new_none_clients (a_left, a_right: detachable ET_SYMBOL): detachable ET_CLIENTS
			-- Client list of the form {}
		do
			create Result.make
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_brace (a_left)
			end
		end

	new_null_export (a_semicolon: detachable ET_SEMICOLON_SYMBOL): detachable ET_NULL_EXPORT
			-- New null export
		do
			-- Result := Void
		end

	new_null_instruction (a_semicolon: detachable ET_SEMICOLON_SYMBOL): detachable ET_NULL_INSTRUCTION
			-- New null instruction
		do
			-- Result := Void
		end

	new_object_equality_expression (l: detachable ET_EXPRESSION; an_op: detachable ET_SYMBOL;
		r: detachable ET_EXPRESSION): detachable ET_OBJECT_EQUALITY_EXPRESSION
			-- New object equality expression
		do
			if l /= Void and an_op /= Void and r /= Void then
				create Result.make (l, an_op, r)
			end
		end

	new_object_test (a_attached: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_expression: detachable ET_EXPRESSION): detachable ET_OBJECT_TEST
			-- New object-test expression
		do
			if a_expression /= Void then
				create Result.make (a_type, a_expression)
				if a_attached /= Void and then not a_attached.position.is_null then
					Result.set_attached_keyword (a_attached)
				end
			end
		end

	new_obsolete_message (an_obsolete: detachable ET_KEYWORD;
		a_message: detachable ET_MANIFEST_STRING): detachable ET_OBSOLETE
			-- New obsolete clause
		do
			Result := a_message
		end

	new_old_expression (an_old: detachable ET_KEYWORD; e: detachable ET_EXPRESSION): detachable ET_OLD_EXPRESSION
			-- New old expression
		do
			if e /= Void then
				create Result.make (e)
				if an_old /= Void and then not an_old.position.is_null then
					Result.set_old_keyword (an_old)
				end
			end
		end

	new_old_object_test (a_left_brace: detachable ET_SYMBOL; a_name: detachable ET_IDENTIFIER;
		a_colon: detachable ET_SYMBOL; a_type: detachable ET_TYPE; a_right_brace: detachable ET_SYMBOL;
		a_expression: detachable ET_EXPRESSION): detachable ET_OLD_OBJECT_TEST
			-- New object-test expression
		do
			if a_name /= Void and a_type /= Void and a_expression /= Void then
				create Result.make (a_name, a_type, a_expression)
				if a_left_brace /= Void and then not a_left_brace.position.is_null then
					Result.set_left_brace (a_left_brace)
				end
			end
		end

	new_once_compound (a_once: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'once' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.once_keyword)
			end
		end

	new_once_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_keys: detachable ET_MANIFEST_STRING_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_ONCE_FUNCTION
			-- New once function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_keys (a_keys)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_once_function_inline_agent (an_agent: detachable ET_AGENT_KEYWORD;
		a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST; a_type: detachable ET_DECLARED_TYPE;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_keys: detachable ET_MANIFEST_STRING_LIST; a_compound: detachable ET_COMPOUND;
		a_postconditions: detachable ET_POSTCONDITIONS; a_rescue: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_ONCE_FUNCTION_INLINE_AGENT
			-- New inline agent whose associated feature is a once function
		do
			if a_type /= Void then
				create Result.make (a_formal_args, a_type, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_keys (a_keys)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
			end
		end

	new_once_manifest_string (a_once: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING): detachable ET_ONCE_MANIFEST_STRING
			-- New once manifest string
		do
			if a_string /= Void then
				create Result.make (a_string)
				if a_once /= Void and then not a_once.position.is_null then
					Result.set_once_keyword (a_once)
				end
			end
		end

	new_once_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_keys: detachable ET_MANIFEST_STRING_LIST;
		a_compound: detachable ET_COMPOUND;
		a_postconditions: detachable ET_POSTCONDITIONS; a_rescue: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_ONCE_PROCEDURE
			-- New once procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_keys (a_keys)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_once_procedure_inline_agent (an_agent: detachable ET_AGENT_KEYWORD;
		a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_keys: detachable ET_MANIFEST_STRING_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_ONCE_PROCEDURE_INLINE_AGENT
			-- New inline agent whose associated feature is a once procedure
		do
			create Result.make (a_formal_args, an_actual_args)
			if an_agent /= Void then
				Result.set_agent_keyword (an_agent)
			end
			Result.set_preconditions (a_preconditions)
			Result.set_locals (a_locals)
			Result.set_keys (a_keys)
			Result.set_compound (a_compound)
			Result.set_postconditions (a_postconditions)
			Result.set_rescue_clause (a_rescue)
		end

	new_parent (a_type: detachable ET_CLASS_TYPE; a_renames: detachable ET_RENAME_LIST; an_exports: detachable ET_EXPORT_LIST;
		an_undefines, a_redefines, a_selects: detachable ET_KEYWORD_FEATURE_NAME_LIST; an_end: detachable ET_KEYWORD): detachable ET_PARENT
			-- New parent
		do
			if a_type /= Void then
				create Result.make (a_type, a_renames, an_exports, an_undefines, a_redefines, a_selects)
			end
		end

	new_parent_clauses (nb: INTEGER): detachable ET_PARENT_CLAUSE_LIST
			-- New inherit clauses with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_parent_semicolon (a_parent: detachable ET_PARENT; a_semicolon: detachable ET_SYMBOL): detachable ET_PARENT_ITEM
			-- New parent-semicolon
		do
			Result := a_parent
		end

	new_parents (an_inherit: detachable ET_KEYWORD; nb: INTEGER): detachable ET_PARENT_LIST
			-- New class parent list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		ensure
			parents_not_void: nb > 0 implies Result /= Void
		end

	new_parenthesized_expression (l: detachable ET_SYMBOL; e: detachable ET_EXPRESSION;
		r: detachable ET_SYMBOL): detachable ET_PARENTHESIZED_EXPRESSION
			-- New parenthesized expression
		do
			if e /= Void then
				create Result.make (e)
				if l /= Void and then not l.position.is_null then
					Result.set_left_parenthesis (l)
				end
			end
		end

	new_postconditions (an_ensure: detachable ET_KEYWORD;
		a_then: detachable ET_KEYWORD; nb: INTEGER): detachable ET_POSTCONDITIONS
			-- New postconditions with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if an_ensure /= Void and then not an_ensure.position.is_null then
				Result.set_ensure_keyword (an_ensure)
			end
			if a_then /= Void then
				Result.set_then_keyword (a_then)
			end
		end

	new_preconditions (a_require: detachable ET_KEYWORD;
		an_else: detachable ET_KEYWORD; nb: INTEGER): detachable ET_PRECONDITIONS
			-- New preconditions with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_require /= Void and then not a_require.position.is_null then
				Result.set_require_keyword (a_require)
			end
			if an_else /= Void then
				Result.set_else_keyword (an_else)
			end
		end

	new_precursor_class_name (l: detachable ET_SYMBOL; a_name:
		detachable ET_CLASS_NAME; r: detachable ET_SYMBOL): detachable ET_PRECURSOR_CLASS_NAME
			-- New class name surrounded by braces
		do
			Result := a_name
		end

	new_precursor_expression (is_parent_prefixed: BOOLEAN;
		a_precursor: detachable ET_PRECURSOR_KEYWORD; a_parent: detachable ET_PRECURSOR_CLASS_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_PRECURSOR_EXPRESSION
			-- New precursor expression
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_precursor_instruction (is_parent_prefixed: BOOLEAN; a_precursor: detachable ET_PRECURSOR_KEYWORD;
		a_parent: detachable ET_PRECURSOR_CLASS_NAME; args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_PRECURSOR_INSTRUCTION
			-- New precursor instruction
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_prefix_expression (a_name: detachable ET_OPERATOR; e: detachable ET_EXPRESSION): detachable ET_PREFIX_EXPRESSION
			-- New prefix expression
		do
			if a_name /= Void and e /= Void then
				create Result.make (a_name, e)
			end
		end

	new_prefix_free_operator (an_operator: detachable ET_FREE_OPERATOR): detachable ET_FREE_OPERATOR
			-- New unary "<free-operator>" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_prefix
			end
		end

	new_prefix_free_operator_from_symbol (a_symbol: detachable ET_SYMBOL): detachable ET_FREE_OPERATOR
			-- New unary "<free-operator>" operator
		do
			if a_symbol /= Void then
				create Result.make_prefix (a_symbol.text)
				Result.set_position (a_symbol.line, a_symbol.column)
				Result.set_break (a_symbol.break)
			end
		end

	new_prefix_minus_operator (an_operator: detachable ET_SYMBOL_OPERATOR): detachable ET_SYMBOL_OPERATOR
			-- New unary "-" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_prefix_minus
			end
		end

	new_prefix_plus_operator (an_operator: detachable ET_SYMBOL_OPERATOR): detachable ET_SYMBOL_OPERATOR
			-- New unary "+" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_prefix_plus
			end
		end

	new_qualified_call (a_name: detachable ET_QUALIFIED_FEATURE_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_QUALIFIED_CALL
			-- New qualified call
		do
			if a_name /= Void then
				create Result.make (a_name, args)
			end
		end

	new_qualified_call_expression (a_target: detachable ET_EXPRESSION; a_name: detachable ET_QUALIFIED_FEATURE_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_QUALIFIED_CALL_EXPRESSION
			-- New qualified call expression
		do
			if a_name /= Void and a_target /= Void then
				create Result.make (a_target, a_name, args)
			end
		end

	new_qualified_call_instruction (a_target: detachable ET_EXPRESSION; a_name: detachable ET_QUALIFIED_FEATURE_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_QUALIFIED_CALL_INSTRUCTION
			-- New qualified call instruction
		do
			if a_name /= Void and a_target /= Void then
				create Result.make (a_target, a_name, args)
			end
		end

	new_qualified_like_braced_type (a_type_mark: detachable ET_TYPE_MARK;
		a_like: detachable ET_KEYWORD; a_left_brace: detachable ET_SYMBOL;
		a_type: detachable ET_TYPE; a_right_brace: detachable ET_SYMBOL;
		a_name: detachable ET_QUALIFIED_FEATURE_NAME; a_class: detachable ET_CLASS): detachable ET_QUALIFIED_LIKE_BRACED_TYPE
			-- New qualified anchored type of the form 'like {A}.b'
		do
			if a_type /= Void and a_name /= Void and a_class /= Void then
				create Result.make (a_type_mark, a_type, a_name, a_class)
				if a_like /= Void and then not a_like.position.is_null then
					Result.set_like_keyword (a_like)
				end
			end
		end

	new_qualified_like_type (a_type_mark: detachable ET_TYPE_MARK; a_type: detachable ET_LIKE_TYPE;
		a_name: detachable ET_QUALIFIED_FEATURE_NAME; a_class: detachable ET_CLASS): detachable ET_QUALIFIED_LIKE_TYPE
			-- New qualified anchored type of the form 'like a.b.c'
		do
			if a_type /= Void and a_name /= Void and a_class /= Void then
				create Result.make (a_type_mark, a_type, a_name, a_class)
			end
		end

	new_rename (old_name: detachable ET_FEATURE_NAME; an_as: detachable ET_KEYWORD;
		new_name: detachable ET_EXTENDED_FEATURE_NAME): detachable ET_RENAME
			-- New rename pair
		do
			if old_name /= Void and new_name /= Void then
				create Result.make (old_name, new_name)
			end
		end

	new_rename_comma (old_name: detachable ET_FEATURE_NAME; an_as: detachable ET_KEYWORD;
		new_name: detachable ET_EXTENDED_FEATURE_NAME; a_comma: detachable ET_SYMBOL): detachable ET_RENAME_ITEM
			-- New rename pair followed by a comma
		do
			if old_name /= Void and new_name /= Void then
				create {ET_RENAME} Result.make (old_name, new_name)
			end
		end

	new_renames (a_rename: detachable ET_KEYWORD; nb: INTEGER): detachable ET_RENAME_LIST
			-- New rename clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_repeat_instruction (a_open_repeat_symbol: detachable ET_SYMBOL;
		a_item_name: detachable ET_IDENTIFIER; a_colon_symbol: detachable ET_SYMBOL;
		a_iterable_expression: detachable ET_EXPRESSION;
		a_bar_symbol: detachable ET_SYMBOL; a_loop_compound: detachable ET_COMPOUND;
		a_close_repeat_symbol: detachable ET_SYMBOL): detachable ET_REPEAT_INSTRUCTION
			-- New repeat instruction of the form '⟳ ... ⟲'
		do
			if a_item_name /= Void and a_iterable_expression /= Void then
				create Result.make (a_item_name, a_iterable_expression, a_loop_compound)
			end
		end

	new_rescue_compound (a_rescue: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'rescue' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.rescue_keyword)
			end
		end

	new_result_address (d: detachable ET_SYMBOL; r: detachable ET_RESULT): detachable ET_RESULT_ADDRESS
			-- New address of Result
		do
			create Result.make
			if d /= Void and then not d.position.is_null then
				Result.set_dollar (d)
			end
		end

	new_static_call_expression (a_feature: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_name: detachable ET_QUALIFIED_FEATURE_NAME; args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_STATIC_CALL_EXPRESSION
			-- New static call expression
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void and then not a_feature.position.is_null then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_static_call_instruction (a_feature: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_name: detachable ET_QUALIFIED_FEATURE_NAME; args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_STATIC_CALL_INSTRUCTION
			-- New static call instruction
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void and then not a_feature.position.is_null then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_strip_expression (a_strip: detachable ET_KEYWORD; l, r: detachable ET_SYMBOL; nb: INTEGER): detachable ET_STRIP_EXPRESSION
			-- New strip expression with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_strip /= Void and then not a_strip.position.is_null then
				Result.set_strip_keyword (a_strip)
			end
		end

	new_tag (a_name: detachable ET_IDENTIFIER; a_colon: detachable ET_SYMBOL): detachable ET_TAG
			-- New tag
		do
			Result := a_name
		end

	new_tagged_assertion (a_tag: detachable ET_TAG): detachable ET_TAGGED_ASSERTION
			-- New tagged assertion
		do
			if a_tag /= Void then
				create Result.make (a_tag)
			end
		end

	new_tagged_indexing (a_tag: detachable ET_TAG; a_terms: detachable ET_INDEXING_TERM_LIST): detachable ET_TAGGED_INDEXING
			-- New tagged indexing clause
		do
			if a_tag /= Void and a_terms /= Void then
				create Result.make (a_tag, a_terms)
			end
		end

	new_target_type (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE; r: detachable ET_SYMBOL): detachable ET_TARGET_TYPE
			-- New type surrounded by braces
		do
			Result := a_type
		end

	new_then_compound (a_then: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'then' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.then_keyword)
			end
		end

	new_there_exists_quantifier_expression (a_quantifier_symbol: detachable ET_SYMBOL;
		a_item_name: detachable ET_IDENTIFIER; a_colon_symbol: detachable ET_SYMBOL;
		a_iterable_expression: detachable ET_EXPRESSION; a_bar_symbol: detachable ET_SYMBOL;
		a_iteration_expression: detachable ET_EXPRESSION): detachable ET_QUANTIFIER_EXPRESSION
			-- New quantifier expression of the form '∃'
		do
			if a_item_name /= Void and a_iterable_expression /= Void and a_iteration_expression /= Void then
				create Result.make_there_exists (a_item_name, a_iterable_expression, a_iteration_expression)
			end
		end

	new_tuple_type (a_type_mark: detachable ET_TYPE_MARK; a_tuple: detachable ET_IDENTIFIER;
		a_generics: like new_actual_parameters; a_base_class: detachable ET_NAMED_CLASS): detachable ET_TUPLE_TYPE
			-- New 'TUPLE' type
		do
			if a_base_class /= Void then
				create Result.make (a_type_mark, a_generics, a_base_class)
				if a_tuple /= Void and then not a_tuple.position.is_null then
					Result.set_tuple_keyword (a_tuple)
				end
			end
		end

	new_type_comma (a_type: detachable ET_TYPE; a_comma: detachable ET_SYMBOL): detachable ET_TYPE_ITEM
			-- New type-comma
		do
			Result := a_type
		end

	new_type_constraint_comma (a_type_constraint: detachable ET_TYPE_CONSTRAINT; a_comma: detachable ET_SYMBOL): detachable ET_TYPE_CONSTRAINT_ITEM
			-- New type_constraint-comma
		do
			Result := a_type_constraint
		end

	new_type_constraint_list (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_TYPE_CONSTRAINT_LIST
			-- New type constraint list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_brace (a_left)
			end
		end

	new_type_rename_constraint (a_type: detachable ET_TYPE; a_renames: detachable ET_CONSTRAINT_RENAME_LIST): detachable ET_TYPE_RENAME_CONSTRAINT
			-- New type-rename constraint
		do
			if a_type /= Void and a_renames /= Void then
				create Result.make (a_type, a_renames)
			end
		end

	new_unique_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_type: detachable ET_DECLARED_TYPE;
		an_assigner: detachable ET_ASSIGNER; an_is: detachable ET_AST_LEAF; a_unique: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_UNIQUE_ATTRIBUTE
			-- New unique attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_clients (a_clients)
			end
		end

	new_unqualified_call_expression (a_name: detachable ET_FEATURE_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_UNQUALIFIED_CALL_EXPRESSION
			-- New unqualified call expression
		do
			if a_name /= Void then
				create Result.make (a_name, args)
			end
		end

	new_unqualified_call_instruction (a_name: detachable ET_FEATURE_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_UNQUALIFIED_CALL_INSTRUCTION
			-- New unqualified call instruction
		do
			if a_name /= Void then
				create Result.make (a_name, args)
			end
		end

	new_variant (a_variant: detachable ET_KEYWORD; a_tag: detachable ET_TAG;
		an_expression: detachable ET_EXPRESSION): detachable ET_VARIANT
			-- New loop variant
		do
			if an_expression /= Void then
				create Result.make (a_tag, an_expression)
				if a_variant /= Void and then not a_variant.position.is_null then
					Result.set_variant_keyword (a_variant)
				end
			end
		end

	new_when_expression (a_choices: detachable ET_CHOICE_LIST;
		a_then_keyword: detachable ET_KEYWORD; a_then_expression: detachable ET_EXPRESSION): detachable ET_WHEN_EXPRESSION
			-- New 'elseif' part of 'if' expression
		do
			if a_choices /= Void and a_then_expression /= Void then
				create Result.make (a_choices, a_then_expression)
			end
		end

	new_when_expression_list (nb: INTEGER): detachable ET_WHEN_EXPRESSION_LIST
			-- New 'when' expression list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_when_part (a_choices: detachable ET_CHOICE_LIST;
		a_then_compound: detachable ET_COMPOUND): detachable ET_WHEN_PART
			-- New when part
		do
			if a_choices /= Void then
				create Result.make (a_choices, a_then_compound)
			end
		end

	new_when_part_list (nb: INTEGER): detachable ET_WHEN_PART_LIST
			-- New when part list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

feature -- AST factory

	new_class (a_name: ET_CLASS_NAME): ET_CLASS
			-- New Eiffel class
		require
			a_name_not_void: a_name /= Void
		do
			create Result.make (a_name)
		ensure
			class_not_void: Result /= Void
		end

end

indexing

	description:

		"Eiffel keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_KEYWORD

inherit

	ET_TOKEN
		rename
			make as make_token
		end

	ET_CLASS_MARK
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		undefine
			is_attached,
			is_deferred,
			is_detachable,
			is_expanded,
			is_reference,
			is_separate
		end

create

	make_alias,
	make_all,
	make_as,
	make_assign,
	make_attached,
	make_attribute,
	make_check,
	make_class,
	make_convert,
	make_create,
	make_creation,
	make_debug,
	make_deferred,
	make_detachable,
	make_do,
	make_else,
	make_elseif,
	make_end,
	make_ensure,
	make_expanded,
	make_export,
	make_external,
	make_feature,
	make_from,
	make_frozen,
	make_if,
	make_indexing,
	make_infix,
	make_inherit,
	make_inspect,
	make_invariant,
	make_is,
	make_like,
	make_local,
	make_loop,
	make_note,
	make_obsolete,
	make_old,
	make_once,
	make_prefix,
	make_redefine,
	make_reference,
	make_rename,
	make_require,
	make_rescue,
	make_select,
	make_separate,
	make_strip,
	make_then,
	make_undefine,
	make_unique,
	make_until,
	make_variant,
	make_when

convert

	to_identifier: {ET_IDENTIFIER, ET_FEATURE_NAME, ET_EXTENDED_FEATURE_NAME}

feature {NONE} -- Initialization

	make_agent is
			-- Create a new 'agent' keyword.
		do
			code := tokens.agent_keyword_code
			make_token (tokens.agent_keyword_name)
		ensure
			is_agent: is_agent
			line_set: line = no_line
			column_set: column = no_column
		end

	make_alias is
			-- Create a new 'alias' keyword.
		do
			code := tokens.alias_keyword_code
			make_token (tokens.alias_keyword_name)
		ensure
			is_alias: is_alias
			line_set: line = no_line
			column_set: column = no_column
		end

	make_all is
			-- Create a new 'all' keyword.
		do
			code := tokens.all_keyword_code
			make_token (tokens.all_keyword_name)
		ensure
			is_all: is_all
			line_set: line = no_line
			column_set: column = no_column
		end

	make_and is
			-- Create a new 'and' keyword.
		do
			code := tokens.infix_and_code
			make_token (tokens.and_keyword_name)
		ensure
			is_and: is_and
			line_set: line = no_line
			column_set: column = no_column
		end

	make_as is
			-- Create a new 'as' keyword.
		do
			code := tokens.as_keyword_code
			make_token (tokens.as_keyword_name)
		ensure
			is_as: is_as
			line_set: line = no_line
			column_set: column = no_column
		end

	make_assign is
			-- Create a new 'assign' keyword.
		do
			code := tokens.assign_keyword_code
			make_token (tokens.assign_keyword_name)
		ensure
			is_assign: is_assign
			line_set: line = no_line
			column_set: column = no_column
		end

	make_attached is
			-- Create a new 'attached' keyword.
		do
			code := tokens.attached_keyword_code
			make_token (tokens.attached_keyword_name)
		ensure
			is_attached: is_attached
			line_set: line = no_line
			column_set: column = no_column
		end

	make_attribute is
			-- Create a new 'attribute' keyword.
		do
			code := tokens.attribute_keyword_code
			make_token (tokens.attribute_keyword_name)
		ensure
			is_attribute: is_attribute
			line_set: line = no_line
			column_set: column = no_column
		end

	make_check is
			-- Create a new 'check' keyword.
		do
			code := tokens.check_keyword_code
			make_token (tokens.check_keyword_name)
		ensure
			is_check: is_check
			line_set: line = no_line
			column_set: column = no_column
		end

	make_class is
			-- Create a new 'class' keyword.
		do
			code := tokens.class_keyword_code
			make_token (tokens.class_keyword_name)
		ensure
			is_class: is_class
			line_set: line = no_line
			column_set: column = no_column
		end

	make_convert is
			-- Create a new 'convert' keyword.
		do
			code := tokens.convert_keyword_code
			make_token (tokens.convert_keyword_name)
		ensure
			is_convert: is_convert
			line_set: line = no_line
			column_set: column = no_column
		end

	make_create is
			-- Create a new 'create' keyword.
		do
			code := tokens.create_keyword_code
			make_token (tokens.create_keyword_name)
		ensure
			is_create: is_create
			line_set: line = no_line
			column_set: column = no_column
		end

	make_creation is
			-- Create a new 'creation' keyword.
		do
			code := tokens.creation_keyword_code
			make_token (tokens.creation_keyword_name)
		ensure
			is_creation: is_creation
			line_set: line = no_line
			column_set: column = no_column
		end

	make_current is
			-- Create a new 'current' keyword.
		do
			code := tokens.current_keyword_code
			make_token (tokens.capitalized_current_keyword_name)
		ensure
			is_current: is_current
			line_set: line = no_line
			column_set: column = no_column
		end

	make_debug is
			-- Create a new 'debug' keyword.
		do
			code := tokens.debug_keyword_code
			make_token (tokens.debug_keyword_name)
		ensure
			is_debug: is_debug
			line_set: line = no_line
			column_set: column = no_column
		end

	make_deferred is
			-- Create a new 'deferred' keyword.
		do
			code := tokens.deferred_keyword_code
			make_token (tokens.deferred_keyword_name)
		ensure
			is_deferred: is_deferred
			line_set: line = no_line
			column_set: column = no_column
		end

	make_detachable is
			-- Create a new 'detachable' keyword.
		do
			code := tokens.detachable_keyword_code
			make_token (tokens.detachable_keyword_name)
		ensure
			is_detachable: is_detachable
			line_set: line = no_line
			column_set: column = no_column
		end

	make_do is
			-- Create a new 'do' keyword.
		do
			code := tokens.do_keyword_code
			make_token (tokens.do_keyword_name)
		ensure
			is_do: is_do
			line_set: line = no_line
			column_set: column = no_column
		end

	make_else is
			-- Create a new 'else' keyword.
		do
			code := tokens.else_keyword_code
			make_token (tokens.else_keyword_name)
		ensure
			is_else: is_else
			line_set: line = no_line
			column_set: column = no_column
		end

	make_elseif is
			-- Create a new 'elseif' keyword.
		do
			code := tokens.elseif_keyword_code
			make_token (tokens.elseif_keyword_name)
		ensure
			is_elseif: is_elseif
			line_set: line = no_line
			column_set: column = no_column
		end

	make_end is
			-- Create a new 'end' keyword.
		do
			code := tokens.end_keyword_code
			make_token (tokens.end_keyword_name)
		ensure
			is_end: is_end
			line_set: line = no_line
			column_set: column = no_column
		end

	make_ensure is
			-- Create a new 'ensure' keyword.
		do
			code := tokens.ensure_keyword_code
			make_token (tokens.ensure_keyword_name)
		ensure
			is_ensure: is_ensure
			line_set: line = no_line
			column_set: column = no_column
		end

	make_expanded is
			-- Create a new 'expanded' keyword.
		do
			code := tokens.expanded_keyword_code
			make_token (tokens.expanded_keyword_name)
		ensure
			is_expanded: is_expanded
			line_set: line = no_line
			column_set: column = no_column
		end

	make_export is
			-- Create a new 'export' keyword.
		do
			code := tokens.export_keyword_code
			make_token (tokens.export_keyword_name)
		ensure
			is_export: is_export
			line_set: line = no_line
			column_set: column = no_column
		end

	make_external is
			-- Create a new 'external' keyword.
		do
			code := tokens.external_keyword_code
			make_token (tokens.external_keyword_name)
		ensure
			is_external: is_external
			line_set: line = no_line
			column_set: column = no_column
		end

	make_false is
			-- Create a new 'false' keyword.
		do
			code := tokens.false_keyword_code
			make_token (tokens.capitalized_false_keyword_name)
		ensure
			is_false: is_false
			line_set: line = no_line
			column_set: column = no_column
		end

	make_feature is
			-- Create a new 'feature' keyword.
		do
			code := tokens.feature_keyword_code
			make_token (tokens.feature_keyword_name)
		ensure
			is_feature: is_feature
			line_set: line = no_line
			column_set: column = no_column
		end

	make_from is
			-- Create a new 'from' keyword.
		do
			code := tokens.from_keyword_code
			make_token (tokens.from_keyword_name)
		ensure
			is_from: is_from
			line_set: line = no_line
			column_set: column = no_column
		end

	make_frozen is
			-- Create a new 'frozen' keyword.
		do
			code := tokens.frozen_keyword_code
			make_token (tokens.frozen_keyword_name)
		ensure
			is_frozen: is_frozen
			line_set: line = no_line
			column_set: column = no_column
		end

	make_if is
			-- Create a new 'if' keyword.
		do
			code := tokens.if_keyword_code
			make_token (tokens.if_keyword_name)
		ensure
			is_if: is_if
			line_set: line = no_line
			column_set: column = no_column
		end

	make_implies is
			-- Create a new 'implies' keyword.
		do
			code := tokens.infix_implies_code
			make_token (tokens.implies_keyword_name)
		ensure
			is_implies: is_implies
			line_set: line = no_line
			column_set: column = no_column
		end

	make_indexing is
			-- Create a new 'indexing' keyword.
		do
			code := tokens.indexing_keyword_code
			make_token (tokens.indexing_keyword_name)
		ensure
			is_indexing: is_indexing
			line_set: line = no_line
			column_set: column = no_column
		end

	make_infix is
			-- Create a new 'infix' keyword.
		do
			code := tokens.infix_keyword_code
			make_token (tokens.infix_keyword_name)
		ensure
			is_infix: is_infix
			line_set: line = no_line
			column_set: column = no_column
		end

	make_inherit is
			-- Create a new 'inherit' keyword.
		do
			code := tokens.inherit_keyword_code
			make_token (tokens.inherit_keyword_name)
		ensure
			is_inherit: is_inherit
			line_set: line = no_line
			column_set: column = no_column
		end

	make_inspect is
			-- Create a new 'inspect' keyword.
		do
			code := tokens.inspect_keyword_code
			make_token (tokens.inspect_keyword_name)
		ensure
			is_inspect: is_inspect
			line_set: line = no_line
			column_set: column = no_column
		end

	make_invariant is
			-- Create a new 'invariant' keyword.
		do
			code := tokens.invariant_keyword_code
			make_token (tokens.invariant_keyword_name)
		ensure
			is_invariant: is_invariant
			line_set: line = no_line
			column_set: column = no_column
		end

	make_is is
			-- Create a new 'is' keyword.
		do
			code := tokens.is_keyword_code
			make_token (tokens.is_keyword_name)
		ensure
			is_is: is_is
			line_set: line = no_line
			column_set: column = no_column
		end

	make_like is
			-- Create a new 'like' keyword.
		do
			code := tokens.like_keyword_code
			make_token (tokens.like_keyword_name)
		ensure
			is_like: is_like
			line_set: line = no_line
			column_set: column = no_column
		end

	make_local is
			-- Create a new 'local' keyword.
		do
			code := tokens.local_keyword_code
			make_token (tokens.local_keyword_name)
		ensure
			is_local: is_local
			line_set: line = no_line
			column_set: column = no_column
		end

	make_loop is
			-- Create a new 'loop' keyword.
		do
			code := tokens.loop_keyword_code
			make_token (tokens.loop_keyword_name)
		ensure
			is_loop: is_loop
			line_set: line = no_line
			column_set: column = no_column
		end

	make_not is
			-- Create a new 'not' keyword.
		do
			code := tokens.prefix_not_code
			make_token (tokens.not_keyword_name)
		ensure
			is_not: is_not
			line_set: line = no_line
			column_set: column = no_column
		end

	make_note is
			-- Create a new 'note' keyword.
		do
			code := tokens.note_keyword_code
			make_token (tokens.note_keyword_name)
		ensure
			is_note: is_note
			line_set: line = no_line
			column_set: column = no_column
		end

	make_obsolete is
			-- Create a new 'obsolete' keyword.
		do
			code := tokens.obsolete_keyword_code
			make_token (tokens.obsolete_keyword_name)
		ensure
			is_obsolete: is_obsolete
			line_set: line = no_line
			column_set: column = no_column
		end

	make_old is
			-- Create a new 'old' keyword.
		do
			code := tokens.old_keyword_code
			make_token (tokens.old_keyword_name)
		ensure
			is_old: is_old
			line_set: line = no_line
			column_set: column = no_column
		end

	make_once is
			-- Create a new 'once' keyword.
		do
			code := tokens.once_keyword_code
			make_token (tokens.once_keyword_name)
		ensure
			is_once: is_once
			line_set: line = no_line
			column_set: column = no_column
		end

	make_or is
			-- Create a new 'or' keyword.
		do
			code := tokens.infix_or_code
			make_token (tokens.or_keyword_name)
		ensure
			is_or: is_or
			line_set: line = no_line
			column_set: column = no_column
		end

	make_precursor is
			-- Create a new 'precursor' keyword.
		do
			code := tokens.precursor_keyword_code
			make_token (tokens.precursor_keyword_name)
		ensure
			is_precursor: is_precursor
			line_set: line = no_line
			column_set: column = no_column
		end

	make_prefix is
			-- Create a new 'prefix' keyword.
		do
			code := tokens.prefix_keyword_code
			make_token (tokens.prefix_keyword_name)
		ensure
			is_prefix: is_prefix
			line_set: line = no_line
			column_set: column = no_column
		end

	make_redefine is
			-- Create a new 'redefine' keyword.
		do
			code := tokens.redefine_keyword_code
			make_token (tokens.redefine_keyword_name)
		ensure
			is_redefine: is_redefine
			line_set: line = no_line
			column_set: column = no_column
		end

	make_reference is
			-- Create a new 'reference' keyword.
		do
			code := tokens.reference_keyword_code
			make_token (tokens.reference_keyword_name)
		ensure
			is_reference: is_reference
			line_set: line = no_line
			column_set: column = no_column
		end

	make_rename is
			-- Create a new 'rename' keyword.
		do
			code := tokens.rename_keyword_code
			make_token (tokens.rename_keyword_name)
		ensure
			is_rename: is_rename
			line_set: line = no_line
			column_set: column = no_column
		end

	make_require is
			-- Create a new 'require' keyword.
		do
			code := tokens.require_keyword_code
			make_token (tokens.require_keyword_name)
		ensure
			is_require: is_require
			line_set: line = no_line
			column_set: column = no_column
		end

	make_rescue is
			-- Create a new 'rescue' keyword.
		do
			code := tokens.rescue_keyword_code
			make_token (tokens.rescue_keyword_name)
		ensure
			is_rescue: is_rescue
			line_set: line = no_line
			column_set: column = no_column
		end

	make_result is
			-- Create a new 'result' keyword.
		do
			code := tokens.result_keyword_code
			make_token (tokens.capitalized_result_keyword_name)
		ensure
			is_result: is_result
			line_set: line = no_line
			column_set: column = no_column
		end

	make_retry is
			-- Create a new 'retry' keyword.
		do
			code := tokens.retry_keyword_code
			make_token (tokens.retry_keyword_name)
		ensure
			is_retry: is_retry
			line_set: line = no_line
			column_set: column = no_column
		end

	make_select is
			-- Create a new 'select' keyword.
		do
			code := tokens.select_keyword_code
			make_token (tokens.select_keyword_name)
		ensure
			is_select: is_select
			line_set: line = no_line
			column_set: column = no_column
		end

	make_separate is
			-- Create a new 'separate' keyword.
		do
			code := tokens.separate_keyword_code
			make_token (tokens.separate_keyword_name)
		ensure
			is_separate: is_separate
			line_set: line = no_line
			column_set: column = no_column
		end

	make_strip is
			-- Create a new 'strip' keyword.
		do
			code := tokens.strip_keyword_code
			make_token (tokens.strip_keyword_name)
		ensure
			is_strip: is_strip
			line_set: line = no_line
			column_set: column = no_column
		end

	make_then is
			-- Create a new 'then' keyword.
		do
			code := tokens.then_keyword_code
			make_token (tokens.then_keyword_name)
		ensure
			is_then: is_then
			line_set: line = no_line
			column_set: column = no_column
		end

	make_true is
			-- Create a new 'true' keyword.
		do
			code := tokens.true_keyword_code
			make_token (tokens.capitalized_true_keyword_name)
		ensure
			is_true: is_true
			line_set: line = no_line
			column_set: column = no_column
		end

	make_undefine is
			-- Create a new 'undefine' keyword.
		do
			code := tokens.undefine_keyword_code
			make_token (tokens.undefine_keyword_name)
		ensure
			is_undefine: is_undefine
			line_set: line = no_line
			column_set: column = no_column
		end

	make_unique is
			-- Create a new 'unique' keyword.
		do
			code := tokens.unique_keyword_code
			make_token (tokens.unique_keyword_name)
		ensure
			is_unique: is_unique
			line_set: line = no_line
			column_set: column = no_column
		end

	make_until is
			-- Create a new 'until' keyword.
		do
			code := tokens.until_keyword_code
			make_token (tokens.until_keyword_name)
		ensure
			is_until: is_until
			line_set: line = no_line
			column_set: column = no_column
		end

	make_variant is
			-- Create a new 'variant' keyword.
		do
			code := tokens.variant_keyword_code
			make_token (tokens.variant_keyword_name)
		ensure
			is_variant: is_variant
			line_set: line = no_line
			column_set: column = no_column
		end

	make_void is
			-- Create a new 'void' keyword.
		do
			code := tokens.void_keyword_code
			make_token (tokens.capitalized_void_keyword_name)
		ensure
			is_void: is_void
			line_set: line = no_line
			column_set: column = no_column
		end

	make_when is
			-- Create a new 'when' keyword.
		do
			code := tokens.when_keyword_code
			make_token (tokens.when_keyword_name)
		ensure
			is_when: is_when
			line_set: line = no_line
			column_set: column = no_column
		end

	make_xor is
			-- Create a new 'xor' keyword.
		do
			code := tokens.infix_xor_code
			make_token (tokens.xor_keyword_name)
		ensure
			is_xor: is_xor
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Status report

	is_agent: BOOLEAN is
			-- Is current keyword 'agent'?
		do
			Result := (code = tokens.agent_keyword_code)
		end

	is_alias: BOOLEAN is
			-- Is current keyword 'alias'?
		do
			Result := (code = tokens.alias_keyword_code)
		end

	is_all: BOOLEAN is
			-- Is current keyword 'all'?
		do
			Result := (code = tokens.all_keyword_code)
		end

	is_and: BOOLEAN is
			-- Is current keyword 'and'?
		do
			Result := (code = tokens.infix_and_code)
		end

	is_as: BOOLEAN is
			-- Is current keyword 'as'?
		do
			Result := (code = tokens.as_keyword_code)
		end

	is_assign: BOOLEAN is
			-- Is current keyword 'assign'?
		do
			Result := (code = tokens.assign_keyword_code)
		end

	is_attached: BOOLEAN is
			-- Is current keyword 'attached'?
		do
			Result := (code = tokens.attached_keyword_code)
		end

	is_attribute: BOOLEAN is
			-- Is current keyword 'attribute'?
		do
			Result := (code = tokens.attribute_keyword_code)
		end

	is_check: BOOLEAN is
			-- Is current keyword 'check'?
		do
			Result := (code = tokens.check_keyword_code)
		end

	is_class: BOOLEAN is
			-- Is current keyword 'class'?
		do
			Result := (code = tokens.class_keyword_code)
		end

	is_convert: BOOLEAN is
			-- Is current keyword 'convert'?
		do
			Result := (code = tokens.convert_keyword_code)
		end

	is_create: BOOLEAN is
			-- Is current keyword 'create'?
		do
			Result := (code = tokens.create_keyword_code)
		end

	is_creation: BOOLEAN is
			-- Is current keyword 'creation'?
		do
			Result := (code = tokens.creation_keyword_code)
		end

	is_current: BOOLEAN is
			-- Is current keyword 'current'?
		do
			Result := (code = tokens.current_keyword_code)
		end

	is_debug: BOOLEAN is
			-- Is current keyword 'debug'?
		do
			Result := (code = tokens.debug_keyword_code)
		end

	is_deferred: BOOLEAN is
			-- Is current keyword 'deferred'?
		do
			Result := (code = tokens.deferred_keyword_code)
		end

	is_detachable: BOOLEAN is
			-- Is current keyword 'detachable'?
		do
			Result := (code = tokens.detachable_keyword_code)
		end

	is_do: BOOLEAN is
			-- Is current keyword 'do'?
		do
			Result := (code = tokens.do_keyword_code)
		end

	is_else: BOOLEAN is
			-- Is current keyword 'else'?
		do
			Result := (code = tokens.else_keyword_code)
		end

	is_elseif: BOOLEAN is
			-- Is current keyword 'elseif'?
		do
			Result := (code = tokens.elseif_keyword_code)
		end

	is_end: BOOLEAN is
			-- Is current keyword 'end'?
		do
			Result := (code = tokens.end_keyword_code)
		end

	is_ensure: BOOLEAN is
			-- Is current keyword 'ensure'?
		do
			Result := (code = tokens.ensure_keyword_code)
		end

	is_expanded: BOOLEAN is
			-- Is current keyword 'expanded'?
		do
			Result := (code = tokens.expanded_keyword_code)
		end

	is_export: BOOLEAN is
			-- Is current keyword 'export'?
		do
			Result := (code = tokens.export_keyword_code)
		end

	is_external: BOOLEAN is
			-- Is current keyword 'external'?
		do
			Result := (code = tokens.external_keyword_code)
		end

	is_false: BOOLEAN is
			-- Is current keyword 'false'?
		do
			Result := (code = tokens.false_keyword_code)
		end

	is_feature: BOOLEAN is
			-- Is current keyword 'feature'?
		do
			Result := (code = tokens.feature_keyword_code)
		end

	is_from: BOOLEAN is
			-- Is current keyword 'from'?
		do
			Result := (code = tokens.from_keyword_code)
		end

	is_frozen: BOOLEAN is
			-- Is current keyword 'frozen'?
		do
			Result := (code = tokens.frozen_keyword_code)
		end

	is_if: BOOLEAN is
			-- Is current keyword 'if'?
		do
			Result := (code = tokens.if_keyword_code)
		end

	is_implies: BOOLEAN is
			-- Is current keyword 'implies'?
		do
			Result := (code = tokens.infix_implies_code)
		end

	is_indexing: BOOLEAN is
			-- Is current keyword 'indexing'?
		do
			Result := (code = tokens.indexing_keyword_code)
		end

	is_infix: BOOLEAN is
			-- Is current keyword 'infix'?
		do
			Result := (code = tokens.infix_keyword_code)
		end

	is_inherit: BOOLEAN is
			-- Is current keyword 'inherit'?
		do
			Result := (code = tokens.inherit_keyword_code)
		end

	is_inspect: BOOLEAN is
			-- Is current keyword 'inspect'?
		do
			Result := (code = tokens.inspect_keyword_code)
		end

	is_invariant: BOOLEAN is
			-- Is current keyword 'invariant'?
		do
			Result := (code = tokens.invariant_keyword_code)
		end

	is_is: BOOLEAN is
			-- Is current keyword 'is'?
		do
			Result := (code = tokens.is_keyword_code)
		end

	is_like: BOOLEAN is
			-- Is current keyword 'like'?
		do
			Result := (code = tokens.like_keyword_code)
		end

	is_local: BOOLEAN is
			-- Is current keyword 'local'?
		do
			Result := (code = tokens.local_keyword_code)
		end

	is_loop: BOOLEAN is
			-- Is current keyword 'loop'?
		do
			Result := (code = tokens.loop_keyword_code)
		end

	is_not: BOOLEAN is
			-- Is current keyword 'not'?
		do
			Result := (code = tokens.prefix_not_code)
		end

	is_note: BOOLEAN is
			-- Is current keyword 'note'?
		do
			Result := (code = tokens.note_keyword_code)
		end

	is_obsolete: BOOLEAN is
			-- Is current keyword 'obsolete'?
		do
			Result := (code = tokens.obsolete_keyword_code)
		end

	is_old: BOOLEAN is
			-- Is current keyword 'old'?
		do
			Result := (code = tokens.old_keyword_code)
		end

	is_once: BOOLEAN is
			-- Is current keyword 'once'?
		do
			Result := (code = tokens.once_keyword_code)
		end

	is_or: BOOLEAN is
			-- Is current keyword 'or'?
		do
			Result := (code = tokens.infix_or_code)
		end

	is_precursor: BOOLEAN is
			-- Is current keyword 'precursor'?
		do
			Result := (code = tokens.precursor_keyword_code)
		end

	is_prefix: BOOLEAN is
			-- Is current keyword 'prefix'?
		do
			Result := (code = tokens.prefix_keyword_code)
		end

	is_redefine: BOOLEAN is
			-- Is current keyword 'redefine'?
		do
			Result := (code = tokens.redefine_keyword_code)
		end

	is_reference: BOOLEAN is
			-- Is current keyword 'reference'?
		do
			Result := (code = tokens.reference_keyword_code)
		end

	is_rename: BOOLEAN is
			-- Is current keyword 'rename'?
		do
			Result := (code = tokens.rename_keyword_code)
		end

	is_require: BOOLEAN is
			-- Is current keyword 'require'?
		do
			Result := (code = tokens.require_keyword_code)
		end

	is_rescue: BOOLEAN is
			-- Is current keyword 'rescue'?
		do
			Result := (code = tokens.rescue_keyword_code)
		end

	is_result: BOOLEAN is
			-- Is current keyword 'result'?
		do
			Result := (code = tokens.result_keyword_code)
		end

	is_retry: BOOLEAN is
			-- Is current keyword 'retry'?
		do
			Result := (code = tokens.retry_keyword_code)
		end

	is_select: BOOLEAN is
			-- Is current keyword 'select'?
		do
			Result := (code = tokens.select_keyword_code)
		end

	is_separate: BOOLEAN is
			-- Is current keyword 'separate'?
		do
			Result := (code = tokens.separate_keyword_code)
		end

	is_strip: BOOLEAN is
			-- Is current keyword 'strip'?
		do
			Result := (code = tokens.strip_keyword_code)
		end

	is_then: BOOLEAN is
			-- Is current keyword 'then'?
		do
			Result := (code = tokens.then_keyword_code)
		end

	is_true: BOOLEAN is
			-- Is current keyword 'true'?
		do
			Result := (code = tokens.true_keyword_code)
		end

	is_undefine: BOOLEAN is
			-- Is current keyword 'undefine'?
		do
			Result := (code = tokens.undefine_keyword_code)
		end

	is_unique: BOOLEAN is
			-- Is current keyword 'unique'?
		do
			Result := (code = tokens.unique_keyword_code)
		end

	is_until: BOOLEAN is
			-- Is current keyword 'until'?
		do
			Result := (code = tokens.until_keyword_code)
		end

	is_variant: BOOLEAN is
			-- Is current keyword 'variant'?
		do
			Result := (code = tokens.variant_keyword_code)
		end

	is_void: BOOLEAN is
			-- Is current keyword 'void'?
		do
			Result := (code = tokens.void_keyword_code)
		end

	is_when: BOOLEAN is
			-- Is current keyword 'when'?
		do
			Result := (code = tokens.when_keyword_code)
		end

	is_xor: BOOLEAN is
			-- Is current keyword 'xor'?
		do
			Result := (code = tokens.infix_xor_code)
		end

feature -- Conversion

	to_identifier: ET_IDENTIFIER is
			-- Identifier version of current keyword
		do
			create Result.make (text)
		ensure
			to_identifier_not_void: Result /= Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_keyword (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Keyword code

end

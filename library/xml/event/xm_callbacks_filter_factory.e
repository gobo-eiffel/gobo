note

	description:

		"Convenient class to create event filters"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CALLBACKS_FILTER_FACTORY

feature -- Filters

	new_null: XM_CALLBACKS_NULL is
			-- New null callback consumer
		do
			create Result.make
		ensure
			null_callback_not_void: Result /= Void
		end

	new_pretty_print: XM_PRETTY_PRINT_FILTER is
			-- New pretty printer (to standard io)
		do
			create Result.make_null
		ensure
			pretty_print_not_void: Result /= Void
		end

	new_canonical_pretty_print: XM_CANONICAL_PRETTY_PRINT_FILTER is
			-- James Clark' canonical XML output
		do
			create Result.make_null
		ensure
			pretty_print_not_void: Result /= Void
		end

	new_indent_pretty_print: XM_INDENT_PRETTY_PRINT_FILTER is
			-- Indenting pretty print filter
		do
			create Result.make_null
		ensure
			indent_pretty_print_not_void: Result /= Void
		end
		
	new_end_tag_checker: XM_END_TAG_CHECKER is
			-- New end tag checker filter
		obsolete "End tag checking is built into parser"
		do
			create Result.make_null
		ensure
			checker_not_void: Result /= Void
		end

	new_unicode_validation: XM_UNICODE_VALIDATION_FILTER is
			-- New unicode validation filter
		do
			create Result.make_null
		ensure
			unicode_validation_not_void: Result /= Void
		end

	new_namespace_resolver: XM_NAMESPACE_RESOLVER is
			-- New namespace resolver
		do
			create Result.make_null
		ensure
			namespace_resolver_not_void: Result /= Void
		end

	new_xmlns_generator: XM_XMLNS_GENERATOR is
			-- New xmlns: generator (opposite of namespace resolver)
		do
			create Result.make_null
		ensure
			xmlns_generator_not_void: Result /= Void
		end
		
	new_stop_on_error: XM_STOP_ON_ERROR_FILTER is
			-- New stop-on-error filter
		do
			create Result.make_null
		ensure
			stop_on_error_not_void: Result /= Void
		end

	new_content_concatenator: XM_CONTENT_CONCATENATOR is
			-- New content concatenation filter.
		do
			create Result.make_null
		ensure
			content_concatenator_not_void: Result /= Void
		end
		
	new_whitespace_normalizer: XM_WHITESPACE_NORMALIZER is
			-- New whitespace normalizer.
		do
			create Result.make_null
		ensure
			whitespace_normalizer_not_void: Result /= Void
		end

	new_shared_strings: XM_SHARED_STRINGS_FILTER is
			-- New shared strings filter
		do
			create Result.make_null
		ensure
			shared_string_not_void: Result /= Void
		end

	new_tree_builder: XM_CALLBACKS_TO_TREE_FILTER is
			-- New tree construction filter
		obsolete "See tree cluster, e.g. XM_TREE_CALLBACKS_PIPE"
		do
			create Result.make_null
		ensure
			tree_builder_not_void: Result /= Void
		end

feature -- Pipes

	callbacks_pipe (a: ARRAY [XM_CALLBACKS_FILTER]): XM_CALLBACKS is
			-- Make a pipe,
			-- eg << new_tag_checker, new_pretty_print >>
			-- return first item of pipe.
		require
			a_not_void: a /= Void
			a_not_empty: a.count > 0
			-- no_void_callbacks_filter: not a.has (Void)
		local
			i, nb: INTEGER
		do
			i := a.lower
			nb := a.upper
			from until i >= nb loop
				a.item (i).set_next (a.item (i + 1))
				i := i + 1
			end
			Result := a.item (a.lower)
		ensure
			pipe_not_void: Result /= Void
		end

	standard_callbacks_pipe (a: ARRAY [XM_CALLBACKS_FILTER]): XM_CALLBACKS is
			-- Add elements to standard validation pipe, which
			-- begins with:
			--  namespace resolver -> stop on error
		require
			a_not_void: a /= Void
		local
			a_last: XM_CALLBACKS_FILTER
		do
			a_last := new_stop_on_error
			Result := callbacks_pipe (<< new_namespace_resolver, a_last >>)
			if a.count > 0 then
				a_last.set_next (callbacks_pipe (a))
			end
		ensure
			pipe_not_void: Result /= Void
		end

end

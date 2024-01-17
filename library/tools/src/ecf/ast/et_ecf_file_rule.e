note

	description:

		"ECF file rules"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_FILE_RULE

inherit

	ET_ECF_CONDITIONED

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_exclude: like exclude; a_include: like include)
			-- Create a new file rule.
		require
			no_void_exclude: a_exclude /= Void implies not a_exclude.has_void
			no_void_include: a_include /= Void implies not a_include.has_void
		do
			exclude := a_exclude
			include := a_include
			exclude_regexp := compiled_regexp (exclude)
			include_regexp := compiled_regexp (include)
		ensure
			exclude_set: exclude = a_exclude
			include_set: include = a_include
		end

feature -- Status report

	is_included (a_pathname: STRING): BOOLEAN
			-- Is `a_pathname' included according to the exclude/include rules?
			-- That means it is either not excluded or it is included.
		do
			Result := True
			if attached exclude_regexp as l_exclude_regexp and then l_exclude_regexp.there_exists (agent {RX_PCRE_REGULAR_EXPRESSION}.matches (a_pathname)) then
				Result := False
				if attached include_regexp as l_include_regexp then
						-- It's excluded, check if there is an include that matches.
					Result := l_include_regexp.there_exists (agent {RX_PCRE_REGULAR_EXPRESSION}.matches (a_pathname))
				end
			end
		end

feature -- Access

	exclude: detachable DS_HASH_SET [STRING]
			-- Exclude patterns

	include: detachable DS_HASH_SET [STRING]
			-- Include patterns

	description: detachable STRING
			-- Description

feature -- Setting

	set_description (a_description: like description)
			-- Set `description' to `a_description'.
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

feature {NONE} -- Implementation

	exclude_regexp: detachable DS_ARRAYED_LIST [RX_PCRE_REGULAR_EXPRESSION]
			-- Exclude regular expressions

	include_regexp: detachable DS_ARRAYED_LIST [RX_PCRE_REGULAR_EXPRESSION]
			-- Include regular expressions

	compiled_regexp (a_patterns: detachable DS_HASH_SET [STRING]): detachable DS_ARRAYED_LIST [RX_PCRE_REGULAR_EXPRESSION]
			-- Compile `a_patterns' into a regular expression.
		local
			l_cursor: DS_HASH_SET_CURSOR [STRING]
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			if a_patterns /= Void and then not a_patterns.is_empty then
				create Result.make (a_patterns.count)
				l_cursor := a_patterns.new_cursor
				from l_cursor.start until l_cursor.after loop
					create l_regexp.make
					if operating_system.is_windows then
						l_regexp.set_caseless (True)
					end
					l_regexp.compile (l_cursor.item)
					if l_regexp.is_compiled then
						Result.put_last (l_regexp)
					end
					l_cursor.forth
				end
			end
		end

invariant

	no_void_exclude: attached exclude as l_exclude implies not l_exclude.has_void
	no_void_include: attached include as l_include implies not l_include.has_void
	no_void_exclude_regexp: attached exclude_regexp as l_exclude_regexp implies not l_exclude_regexp.has_void
	exclude_regexp_compiled: attached exclude_regexp as l_exclude_regexp implies l_exclude_regexp.for_all (agent {RX_PCRE_REGULAR_EXPRESSION}.is_compiled)
	no_void_include_regexp: attached include_regexp as l_include_regexp implies not l_include_regexp.has_void
	include_regexp_compiled: attached include_regexp as l_include_regexp implies l_include_regexp.for_all (agent {RX_PCRE_REGULAR_EXPRESSION}.is_compiled)

end

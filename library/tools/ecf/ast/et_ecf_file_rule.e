note

	description:

		"ECF file rules"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			if exclude_regexp /= Void and then exclude_regexp.there_exists (agent {RX_PCRE_REGULAR_EXPRESSION}.matches (a_pathname)) then
				Result := False
				if include_regexp /= Void then
						-- It's excluded, check if there is an include that matches.
					Result := include_regexp.there_exists (agent {RX_PCRE_REGULAR_EXPRESSION}.matches (a_pathname))
				end
			end
		end

feature -- Access

	exclude: DS_HASH_SET [STRING]
			-- Exclude patterns

	include: DS_HASH_SET [STRING]
			-- Include patterns

feature {NONE} -- Implementation

	exclude_regexp: DS_ARRAYED_LIST [RX_PCRE_REGULAR_EXPRESSION]
			-- Exclude regular expressions

	include_regexp: DS_ARRAYED_LIST [RX_PCRE_REGULAR_EXPRESSION]
			-- Include regular expressions

	compiled_regexp (a_patterns: DS_HASH_SET [STRING]): DS_ARRAYED_LIST [RX_PCRE_REGULAR_EXPRESSION]
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

	no_void_exclude: exclude /= Void implies not exclude.has_void
	no_void_include: include /= Void implies not include.has_void
	no_void_exclude_regexp: exclude_regexp /= Void implies not exclude_regexp.has_void
	exclude_regexp_compiled: exclude_regexp /= Void implies exclude_regexp.for_all (agent {RX_PCRE_REGULAR_EXPRESSION}.is_compiled)
	no_void_include_regexp: include_regexp /= Void implies not include_regexp.has_void
	include_regexp_compiled: include_regexp /= Void implies include_regexp.for_all (agent {RX_PCRE_REGULAR_EXPRESSION}.is_compiled)

end

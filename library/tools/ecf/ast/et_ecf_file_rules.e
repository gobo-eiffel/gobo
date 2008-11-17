indexing

	description:

		"ECF file rule lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_FILE_RULES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_file_rule: like file_rule) is
			-- Create a new file rule list with initially one rule `a_file_rule'.
		require
			a_file_rule_not_void: a_file_rule /= Void
		do
			create file_rules.make (Initial_file_rules_capacity)
			file_rules.put_last (a_file_rule)
		ensure
			one_file_rule: file_rules.count = 1
			file_rule_set: file_rules.last = a_file_rule
		end

	make_empty is
			-- Create a new empty file rule list.
		do
			create file_rules.make (Initial_file_rules_capacity)
		ensure
			is_empty: file_rules.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is the list of file rules empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	is_included (a_pathname: STRING): BOOLEAN is
			-- Is `a_pathname' included according to the exclude/include rules?
			-- That means it is either not excluded or it is included.
		do
			Result := file_rules.for_all (agent {ET_ECF_FILE_RULE}.is_included (a_pathname))
		end

feature -- Access

	file_rule (i: INTEGER): ET_ECF_FILE_RULE is
			-- `i'-th file rule
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := file_rules.item (i)
		ensure
			file_rule_not_void: Result /= Void
		end

	file_rules: DS_ARRAYED_LIST [like file_rule]
			-- File rules

feature -- Measurement

	count: INTEGER is
			-- Number of file rules
		do
			Result := file_rules.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = file_rules.count
		end

feature -- Element change

	put_last (a_file_rule: like file_rule) is
			-- Add `a_file_rule' to the list of file rules.
		require
			a_file_rule_not_void: a_file_rule /= Void
		do
			file_rules.force_last (a_file_rule)
		ensure
			one_more: file_rules.count = old file_rules.count + 1
			file_rule_added: file_rules.last = a_file_rule
		end

	fill_file_rules (a_file_rules: ET_ECF_FILE_RULES; a_state: ET_ECF_STATE) is
			-- Add to `a_file_rules' the current file rules
			-- whose conditions satisfy `a_state'.
		require
			a_file_rules_not_void: a_file_rules /= Void
			a_state_not_void: a_state /= Void
		do
			file_rules.do_if (agent a_file_rules.put_last, agent {ET_ECF_FILE_RULE}.is_enabled (a_state))
		end

feature {NONE} -- Constants

	Initial_file_rules_capacity: INTEGER is 50
			-- Initial capacity for `file_rules'

invariant

	file_rules_not_void: file_rules /= Void
	no_void_file_rule: not file_rules.has (Void)

end

indexing

	description:

		"Objects that represent XSLT keys"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_DEFINITION

inherit

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_match: XM_XSLT_PATTERN; a_usage_expression: XM_XPATH_EXPRESSION; a_collator: ST_COLLATOR; a_collation_uri: STRING) is
			-- Establish invariant.
		require
			match_not_void: a_match /= Void
			usage_expression_not_void: a_usage_expression /= Void
			collation_uri: a_collation_uri /= Void
			collator: a_collator /= Void
		do
			match := a_match
			use := a_usage_expression
			collator := a_collator
			collation_uri := a_collation_uri
		ensure
			match_set: match = a_match
			use_set: use = a_usage_expression
			collator_set: collator = a_collator
			uri_set: STRING_.same_string (collation_uri, a_collation_uri)
		end

feature -- Access

	match: XM_XSLT_PATTERN
			-- Match pattern

	use: XM_XPATH_EXPRESSION
			-- Usage expression

	collator: ST_COLLATOR
			-- Collator for string comparisons

	collation_uri: STRING
			-- Name of `collator'

invariant

	match: match /= Void
	use: use /= Void
	collation_uri: collation_uri /= Void
	collator: collator /= Void

end

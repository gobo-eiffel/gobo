indexing

	description:

		"Conformance to XPath, XQuery and XSLT standards"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONFORMANCE

feature -- Status report

	basic_xslt_processor: BOOLEAN
			-- Does this processor conform to a Basic XSLT processor?

	schema_aware_xslt_processor: BOOLEAN
			-- Does this processor conform to a Schema-aware XSLT processor?

feature -- Status setting

	set_basic_xslt_processor is
			-- Declare this to be a Basic XSLT processor.
		require
			not_schema_aware: not schema_aware_xslt_processor
		do
			basic_xslt_processor := True
		ensure
			set: basic_xslt_processor
		end

invariant

	-- No support yet for schema-awareness

	not_schema_aware: not schema_aware_xslt_processor

end

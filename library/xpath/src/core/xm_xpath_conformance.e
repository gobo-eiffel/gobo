note

	description:

		"Conformance to XPath, XQuery and XSLT standards"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_CONFORMANCE

feature -- Status report

	basic_xslt_processor: BOOLEAN
			-- Does this processor conform to a Basic XSLT processor?

	basic_xquery_processor: BOOLEAN
			-- Does this processor conform to an XQuery processor without the Schema Import Feature?

	xquery_processor: BOOLEAN
			-- Is this processor an XQuery processor?

	schema_aware_processor: BOOLEAN
			-- Does this processor conform to a Schema-aware XSLT processor?

	customized_host_language: BOOLEAN
			-- Is this processor implementing a custom host language?

	is_full_type_scheme: BOOLEAN
			-- Does this processor implement the full xs:schema type scheme?

feature -- Status setting

	set_basic_xslt_processor
			-- Declare this to be a Basic XSLT processor.
		require
			not_schema_aware: not schema_aware_processor
			not_xquery: not basic_xquery_processor and then not xquery_processor
		do
			basic_xslt_processor := True
		ensure
			set: basic_xslt_processor
		end

	set_customized_host_language
			-- Declare this to be a customized host language.
			-- A customized host language is a host language
			--  that does not implement every data-type at a given level.
			-- First, you must select your level, by calling a command
			--  such as `set_basic_xslt_processor'. Only then may you call
			--  this command.
			-- N.B. A customized host language based on basic_xslt_processor
			--  may not be viable.
		require
			base_level: basic_xslt_processor or else schema_aware_processor or else xquery_processor
		do
			customized_host_language := True
		ensure
			set: customized_host_language = True
		end

invariant

	-- No support yet for schema-awareness
	-- No support yet for XQuery

	not_schema_aware: not schema_aware_processor
	xquery_not_supported: not basic_xquery_processor and then not xquery_processor
	basic_xslt_processor: basic_xslt_processor implies not is_full_type_scheme
	basic_xquery_processor: basic_xquery_processor implies xquery_processor
	customized: customized_host_language implies basic_xslt_processor or else schema_aware_processor or else xquery_processor

end

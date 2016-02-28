note

	description:

		"Objects that implement gexslt:collation to define collations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GEXSLT_COLLATION

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

	-- This class implements a User-defined Data Element in the gexslt extensions
	--  namespace, whose purpose is to define collations.
	-- At present, all it does is define aliases for the Unicode codepoint collator,
	--  so as to illustrate the User-defined Data Element mechanism, and to test
	--  specifying default collations, and using collations other than the default.
	-- When we actually have other collations available, in particular a UCA collator,
	--  then the code will be updated so that it will work for real, providing
	--  named tailored collations.

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
			l_collation_name: like collation_name
			l_collator: like collator
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Name_attribute) then
						l_collation_name := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_collation_name)
						STRING_.right_adjust (l_collation_name)
						collation_name := l_collation_name
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			l_collation_name := collation_name
			if l_collation_name = Void then
				report_absence ("name")
			else

				-- Register the collation early, so it's available when optimizing XPath expressions.

				create l_collator
				collator := l_collator
				check attached principal_stylesheet as l_principal_stylesheet then
					l_principal_stylesheet.declare_collation (l_collator, l_collation_name)
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		do
			check_top_level (Void)
			check_empty
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			check
				attached principal_stylesheet as l_principal_stylesheet
				attached collator as l_collator
				attached collation_name as l_collation_name
			then
				l_principal_stylesheet.declare_collation (l_collator, l_collation_name)
			end
		end

feature {NONE} -- Implementation

	collation_name: detachable STRING
			-- Name of collation

	collator: detachable ST_COLLATOR
			-- Collator to be registered

end

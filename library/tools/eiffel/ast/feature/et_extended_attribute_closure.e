note

	description:

		"Eiffel closures with components common to extended attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTENDED_ATTRIBUTE_CLOSURE

inherit

	ET_FEATURE_CLOSURE

feature -- Access

	attribute_keyword: ET_KEYWORD
			-- 'attribute' keyword

feature -- Setting

	set_attribute_keyword (a_attribute: like attribute_keyword) is
			-- Set `attribute_keyword' to `a_attribute'.
		require
			a_attribute_not_void: a_attribute /= Void
		do
			attribute_keyword := a_attribute
		ensure
			attribute_keyword_set: attribute_keyword = a_attribute
		end

invariant

	attribute_keyword_not_void: attribute_keyword /= Void

end

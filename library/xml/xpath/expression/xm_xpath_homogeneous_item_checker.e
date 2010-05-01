note

	description:

	"Objects that implement type checking for a homogeneuous sequence."
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_HOMOGENEOUS_ITEM_CHECKER

inherit

	XM_XPATH_ITEM_MAPPING_FUNCTION

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

create {XM_XPATH_MAPPED_PATH_EXPRESSION}

	make


feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			-- nothing to do
		end

feature -- Access

	mapped_item (a_item: XM_XPATH_ITEM): XM_XPATH_ITEM is
			-- `a_item' mapped to zero or one items
		do
			check
				a_item_not_void: a_item /= Void
				-- Only used by XM_XPATH_MAPPED_PATH_EXPRESSION which checks for this
			end
			if not a_item.is_atomic_value then
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Path expressions may not mix atomic values and nodes", Xpath_errors_uri, "XPTY0018", Type_error)
			else
				Result := a_item
			end
		end

end


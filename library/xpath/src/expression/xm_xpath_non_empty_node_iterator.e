note

	description:

	"Objects that return a non-empty sequence, or raise an error"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_NON_EMPTY_NODE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator, start
		end

	XM_XPATH_CARDINALITY
		export
			{NONE} all
			{ANY} is_valid_required_cardinality
		end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_iterator: like base_iterator; a_role_locator: like role_locator; a_required_cardinality: INTEGER)
			-- Initialize `Current'.
		require
			a_iterator_not_void: a_iterator /= Void
			a_iterator_before: a_iterator.before
			a_role_locator_not_void: a_role_locator /= Void
			valid_cardinality_request: is_valid_required_cardinality (a_required_cardinality)
		do
			base_iterator := a_iterator
			role_locator := a_role_locator
			required_cardinality := a_required_cardinality
		ensure
			base_iterator_set: base_iterator = a_iterator
			role_locator_set: role_locator = a_role_locator
			required_cardinality_set: required_cardinality = a_required_cardinality
		end

	feature -- Access

	item: XM_XPATH_NODE
			-- Value or node at the current position
		do
			Result := base_iterator.item
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := base_iterator.after
		end

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node sequence?
		do
			Result := True
		end

feature -- Cursor movement

	start
			-- Move to first position
		local
			l_error: XM_XPATH_ERROR_VALUE
		do
			index := 1
			base_iterator.start
			if attached base_iterator.error_value as l_error_value then
				check is_error: base_iterator.is_error end
				set_last_error (l_error_value)
			elseif base_iterator.after then
				create l_error.make_from_string (STRING_.concat("An empty sequence is not allowed as the ", role_locator.message),
															role_locator.namespace_uri, role_locator.error_code, Type_error)
				set_last_error (l_error)
			end
		end

	forth
			-- Move to next position
		do
			index := index + 1
			base_iterator.forth
		end

feature -- Conversion

		as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (base_iterator.another, role_locator, required_cardinality)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Base sequence

	required_cardinality: INTEGER
			-- The required cardinality

	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role locator for error messages

invariant

	base_iterator_not_void: base_iterator /= Void
	role_locator_not_void: role_locator /= Void
	valid_cardinality_request: is_valid_required_cardinality (required_cardinality)

end


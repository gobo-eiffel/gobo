indexing

	description:

		"Class that creates xml parser objects and allows one to find %
		%out whether a given parser has been compiled in or not"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_PARSER_FACTORY

creation

	make

feature

	make is
		do
			!! te_ep_tree_fact.make (ep_event_fact)
			!! te_ef_tree_fact.make (ef_event_fact)
		end

feature

	is_eiffel_event_available: BOOLEAN is
			-- is the Eiffel event parser compiled in?
		do
			Result := ef_event_fact.is_available
		end

	is_expat_event_available: BOOLEAN is
			-- is the Expat event parser compild in?
		do
			Result := ep_event_fact.is_available
		end

	is_any_toe_tree_available: BOOLEAN is
		do
			Result := is_toe_expat_tree_available or
				is_toe_eiffel_tree_available
		end

	is_toe_expat_tree_available: BOOLEAN is
		do
			Result := te_ep_tree_fact.is_available
		end

	is_toe_eiffel_tree_available: BOOLEAN is
		do
			Result := te_ef_tree_fact.is_available
		end

	new_eiffel_event_parser: XM_EVENT_PARSER is
		require
			is_eiffel_event_available: is_eiffel_event_available
		do
			Result := ef_event_fact.new_event_parser
		ensure
			result_not_void: Result /= Void
		end

	new_eiffel_event_parser_imp: XI_EVENT_PARSER is
		require
			is_eiffel_event_available: is_eiffel_event_available
		do
			Result := ef_event_fact.new_event_parser_imp
		ensure
			result_not_void: Result /= Void
		end

	new_expat_event_parser: XM_EVENT_PARSER is
		require
			is_expat_event_available: is_expat_event_available
		do
			Result := ep_event_fact.new_event_parser
		ensure
			result_not_void: Result /= Void
		end

	new_expat_event_parser_imp: XI_EVENT_PARSER is
		require
			is_expat_event_available: is_expat_event_available
		do
			Result := ep_event_fact.new_event_parser_imp
		ensure
			result_not_void: Result /= Void
		end

	new_toe_eiffel_tree_parser: XM_TREE_PARSER is
		require
			is_toe_eiffel_tree_available: is_toe_eiffel_tree_available
		do
			Result := te_ef_tree_fact.new_tree_parser
		ensure
			result_not_void: Result /= Void
		end

	new_toe_eiffel_tree_parser_imp: XI_TREE_PARSER is
		require
			is_toe_eiffel_tree_available: is_toe_eiffel_tree_available
		do
			Result := te_ef_tree_fact.new_tree_parser_imp
		ensure
			result_not_void: Result /= Void
		end

	new_toe_expat_tree_parser: XM_TREE_PARSER is
		require
			is_toe_expat_tree_available: is_toe_expat_tree_available
		do
			Result := te_ep_tree_fact.new_tree_parser
		ensure
			result_not_void: Result /= Void
		end

	new_toe_expat_tree_parser_imp: XI_TREE_PARSER is
		require
			is_toe_expat_tree_available: is_toe_expat_tree_available
		do
			Result := te_ep_tree_fact.new_tree_parser_imp
		ensure
			result_not_void: Result /= Void
		end

feature {NONE}

	ef_event_fact: XF_EVENT_PARSER_FACTORY is
		once
			!! Result
		ensure
			factory_not_void: Result /= Void
		end

	ep_event_fact: XP_EVENT_PARSER_FACTORY is
		once
			!! Result
		ensure
			factory_not_void: Result /= Void
		end

	te_ep_tree_fact: XT_TREE_PARSER_FACTORY

	te_ef_tree_fact: XT_TREE_PARSER_FACTORY

invariant

	toe_expat_tree_fact_not_void: te_ep_tree_fact /= Void
	toe_eiffel_tree_fact_not_void: te_ef_tree_fact /= Void

end

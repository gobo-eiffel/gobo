note

	description:

		"Classes which can point to browsable information"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_CLASS

inherit

	ANY

	ET_SHARED_FEATURE_NAME_TESTER
		export {NONE} all end

create

	make
feature {NONE} -- Initialization

	make
			-- Create new browsable class.
		do
			class_name_range := {ET_RANGE}.null_range
			create features.make_map (400)
			features.set_key_equality_tester (feature_name_tester)
			create browsable_names.make_map (500)
			create declaration_ranges.make_map (500)
			create query_type_ranges.make_map (400)
		end

feature -- Access

	class_name_range: ET_RANGE
			-- Range of class name of current class

	features: DS_HASH_TABLE [ET_BROWSABLE_FEATURE, ET_FEATURE_NAME]
			-- Features in current class, indexed by feature names

	declaration_ranges: DS_HASH_TABLE [ET_RANGE, ET_IDENTIFIER]
			-- Positions in the text of declarations of names of formal arguments,
			-- local variables, iteration items, inline separate arguments and
			-- tuple labels

	query_type_ranges: DS_HASH_TABLE [ET_RANGE, ET_CLOSURE]
			-- Position of query types, indexed by closure (e.g. feature,
			-- invariant or inline agent)

	browsable_names: DS_HASH_TABLE [ET_BROWSABLE_NAME, ET_RANGE]
			-- Browsable names in current class, indexed by their positions in the text

	browsable_name (a_position: ET_POSITION): detachable ET_BROWSABLE_NAME
			-- Browsable name at position `a_position` in current class, if any
		require
			a_position_not_void: a_position /= Void
		local
			l_range: ET_RANGE
		do
			from browsable_names.start until browsable_names.after loop
				l_range := browsable_names.key_for_iteration
				if l_range.contains (a_position) then
					Result := browsable_names.item_for_iteration
					browsable_names.go_after
				elseif l_range.is_after (a_position) then
					browsable_names.go_after
				else
					browsable_names.forth
				end
			end
		end

feature -- Setting

	set_class_name_range (a_range: like class_name_range)
			-- Set `class_name_range` to `a_range`.
		require
			a_range_not_void: a_range /= Void
		do
			class_name_range := a_range
		ensure
			class_name_range_set: class_name_range = a_range
		end

invariant

	class_name_range_not_void: class_name_range /= Void
	features_not_void: features /= Void
	no_void_feature: not features.has_void_item
	no_void_feature_name: not features.has_void
	browsable_names_not_void: browsable_names /= Void
	no_void_browsable_name: not browsable_names.has_void_item
	no_void_browsable_name_position: not browsable_names.has_void
	declaration_ranges_not_void: declaration_ranges /= Void
	no_void_declaration_name: not declaration_ranges.has_void
	no_void_declaration_range: not declaration_ranges.has_void_item
	query_type_ranges_not_void: query_type_ranges /= Void
	no_query_type_closure: not query_type_ranges.has_void
	no_query_type_range: not query_type_ranges.has_void_item

end

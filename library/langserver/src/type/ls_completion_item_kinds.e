note

	description:

		"Set of predefined values for LS_COMPLETION_ITEM_KIND"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_KINDS

feature -- Access

	text: LS_COMPLETION_ITEM_KIND
			-- 'Text' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			text_not_void: Result /= Void
			instance_free: class
		end

	method: LS_COMPLETION_ITEM_KIND
			-- 'Method' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			method_not_void: Result /= Void
			instance_free: class
		end

	function: LS_COMPLETION_ITEM_KIND
			-- 'Function' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 3
			Result := l_integer
		ensure
			function_not_void: Result /= Void
			instance_free: class
		end

	constructor: LS_COMPLETION_ITEM_KIND
			-- 'Constructor' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 4
			Result := l_integer
		ensure
			constructor_not_void: Result /= Void
			instance_free: class
		end

	field: LS_COMPLETION_ITEM_KIND
			-- 'Field' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 5
			Result := l_integer
		ensure
			field_not_void: Result /= Void
			instance_free: class
		end

	variable: LS_COMPLETION_ITEM_KIND
			-- 'Variable' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 6
			Result := l_integer
		ensure
			variable_not_void: Result /= Void
			instance_free: class
		end

	class_: LS_COMPLETION_ITEM_KIND
			-- 'Class' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 7
			Result := l_integer
		ensure
			class_not_void: Result /= Void
			instance_free: class
		end

	interface: LS_COMPLETION_ITEM_KIND
			-- 'Interface' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 8
			Result := l_integer
		ensure
			interface_not_void: Result /= Void
			instance_free: class
		end

	module: LS_COMPLETION_ITEM_KIND
			-- 'Module' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 9
			Result := l_integer
		ensure
			module_not_void: Result /= Void
			instance_free: class
		end

	property: LS_COMPLETION_ITEM_KIND
			-- 'Property' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 10
			Result := l_integer
		ensure
			property_not_void: Result /= Void
			instance_free: class
		end

	unit: LS_COMPLETION_ITEM_KIND
			-- 'Unit' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 11
			Result := l_integer
		ensure
			unit_not_void: Result /= Void
			instance_free: class
		end

	value: LS_COMPLETION_ITEM_KIND
			-- 'Value' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 12
			Result := l_integer
		ensure
			value_not_void: Result /= Void
			instance_free: class
		end

	enum: LS_COMPLETION_ITEM_KIND
			-- 'Enum' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 13
			Result := l_integer
		ensure
			enum_not_void: Result /= Void
			instance_free: class
		end

	keyword: LS_COMPLETION_ITEM_KIND
			-- 'Keyword' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 14
			Result := l_integer
		ensure
			keyword_not_void: Result /= Void
			instance_free: class
		end

	snippet: LS_COMPLETION_ITEM_KIND
			-- 'Snippet' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 15
			Result := l_integer
		ensure
			snippet_not_void: Result /= Void
			instance_free: class
		end

	color: LS_COMPLETION_ITEM_KIND
			-- 'Color' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 16
			Result := l_integer
		ensure
			color_not_void: Result /= Void
			instance_free: class
		end

	file: LS_COMPLETION_ITEM_KIND
			-- 'File' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 17
			Result := l_integer
		ensure
			file_not_void: Result /= Void
			instance_free: class
		end

	reference_: LS_COMPLETION_ITEM_KIND
			-- 'Reference' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 18
			Result := l_integer
		ensure
			reference_not_void: Result /= Void
			instance_free: class
		end

	folder: LS_COMPLETION_ITEM_KIND
			-- 'Folder' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 19
			Result := l_integer
		ensure
			folder_not_void: Result /= Void
			instance_free: class
		end

	enum_member: LS_COMPLETION_ITEM_KIND
			-- 'EnumMember' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 20
			Result := l_integer
		ensure
			enum_member_not_void: Result /= Void
			instance_free: class
		end

	constant: LS_COMPLETION_ITEM_KIND
			-- 'Constant' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 21
			Result := l_integer
		ensure
			constant_not_void: Result /= Void
			instance_free: class
		end

	struct: LS_COMPLETION_ITEM_KIND
			-- 'Struct' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 22
			Result := l_integer
		ensure
			struct_not_void: Result /= Void
			instance_free: class
		end

	event: LS_COMPLETION_ITEM_KIND
			-- 'Event' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 23
			Result := l_integer
		ensure
			event_not_void: Result /= Void
			instance_free: class
		end

	operator: LS_COMPLETION_ITEM_KIND
			-- 'Operator' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 24
			Result := l_integer
		ensure
			operator_not_void: Result /= Void
			instance_free: class
		end

	type_parameter: LS_COMPLETION_ITEM_KIND
			-- 'TypeParameter' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 25
			Result := l_integer
		ensure
			type_parameter_not_void: Result /= Void
			instance_free: class
		end

end

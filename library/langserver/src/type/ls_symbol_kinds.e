note

	description:

		"Set of predefined values for LS_SYMBOL_KIND"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_KINDS

feature -- Access

	file: LS_SYMBOL_KIND
			-- 'File' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			file_not_void: Result /= Void
			instance_free: class
		end

	module: LS_SYMBOL_KIND
			-- 'Module' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			module_not_void: Result /= Void
			instance_free: class
		end

	namespace: LS_SYMBOL_KIND
			-- 'Namespace' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 3
			Result := l_integer
		ensure
			namespace_not_void: Result /= Void
			instance_free: class
		end

	package: LS_SYMBOL_KIND
			-- 'Package' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 4
			Result := l_integer
		ensure
			package_not_void: Result /= Void
			instance_free: class
		end

	class_: LS_SYMBOL_KIND
			-- 'Class' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 5
			Result := l_integer
		ensure
			class_not_void: Result /= Void
			instance_free: class
		end

	method: LS_SYMBOL_KIND
			-- 'Method' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 6
			Result := l_integer
		ensure
			method_not_void: Result /= Void
			instance_free: class
		end

	property: LS_SYMBOL_KIND
			-- 'Property' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 7
			Result := l_integer
		ensure
			property_not_void: Result /= Void
			instance_free: class
		end

	field: LS_SYMBOL_KIND
			-- 'Field' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 8
			Result := l_integer
		ensure
			field_not_void: Result /= Void
			instance_free: class
		end

	constructor: LS_SYMBOL_KIND
			-- 'Constructor' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 9
			Result := l_integer
		ensure
			constructor_not_void: Result /= Void
			instance_free: class
		end

	enum: LS_SYMBOL_KIND
			-- 'Enum' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 10
			Result := l_integer
		ensure
			enum_not_void: Result /= Void
			instance_free: class
		end

	interface: LS_SYMBOL_KIND
			-- 'Interface' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 11
			Result := l_integer
		ensure
			interface_not_void: Result /= Void
			instance_free: class
		end

	function: LS_SYMBOL_KIND
			-- 'Function' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 12
			Result := l_integer
		ensure
			function_not_void: Result /= Void
			instance_free: class
		end

	variable: LS_SYMBOL_KIND
			-- 'Variable' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 13
			Result := l_integer
		ensure
			variable_not_void: Result /= Void
			instance_free: class
		end

	constant: LS_SYMBOL_KIND
			-- 'Constant' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 14
			Result := l_integer
		ensure
			constant_not_void: Result /= Void
			instance_free: class
		end

	string: LS_SYMBOL_KIND
			-- 'String' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 15
			Result := l_integer
		ensure
			string_not_void: Result /= Void
			instance_free: class
		end

	number: LS_SYMBOL_KIND
			-- 'Number' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 16
			Result := l_integer
		ensure
			number_not_void: Result /= Void
			instance_free: class
		end

	boolean: LS_SYMBOL_KIND
			-- 'Boolean' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 17
			Result := l_integer
		ensure
			boolean_not_void: Result /= Void
			instance_free: class
		end

	array: LS_SYMBOL_KIND
			-- 'Array' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 18
			Result := l_integer
		ensure
			array_not_void: Result /= Void
			instance_free: class
		end

	object: LS_SYMBOL_KIND
			-- 'Object' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 19
			Result := l_integer
		ensure
			object_not_void: Result /= Void
			instance_free: class
		end

	key: LS_SYMBOL_KIND
			-- 'Key' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 20
			Result := l_integer
		ensure
			key_not_void: Result /= Void
			instance_free: class
		end

	null: LS_SYMBOL_KIND
			-- 'Null' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 21
			Result := l_integer
		ensure
			null_not_void: Result /= Void
			instance_free: class
		end

	enum_member: LS_SYMBOL_KIND
			-- 'EnumMember' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 22
			Result := l_integer
		ensure
			enum_member_not_void: Result /= Void
			instance_free: class
		end

	struct: LS_SYMBOL_KIND
			-- 'Struct' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 23
			Result := l_integer
		ensure
			struct_not_void: Result /= Void
			instance_free: class
		end

	event: LS_SYMBOL_KIND
			-- 'Event' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 24
			Result := l_integer
		ensure
			event_not_void: Result /= Void
			instance_free: class
		end

	operator: LS_SYMBOL_KIND
			-- 'Operator' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 25
			Result := l_integer
		ensure
			operator_not_void: Result /= Void
			instance_free: class
		end

	type_parameter: LS_SYMBOL_KIND
			-- 'TypeParameter' symbol kind
		local
			l_integer: LS_INTEGER
		once
			l_integer := 26
			Result := l_integer
		ensure
			type_parameter_not_void: Result /= Void
			instance_free: class
		end

end

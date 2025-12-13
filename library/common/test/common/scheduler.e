note

	description: "Scheduler to get some predictable output in SCOOP tests "

	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SCHEDULER

feature -- Access

	value: INTEGER
			-- Scheduler value
		do
			separate value_cell as l_cell do
				Result := l_cell.item
			end
		ensure
			instance_free: class
		end

feature -- Setting

	set_value (a_value: INTEGER)
			-- Set `value` to `a_value`
		do
			separate value_cell as l_cell do
				l_cell.put (a_value)
			end
		ensure
			instance_free: class
		end

feature -- Basic operation

	wait_for_value (a_value: INTEGER)
			-- Wait for `value` to be equal to `a_value`.
			-- Give up after 10 seconds.
		do
			wait_for_value_with_timeout (a_value, 10_000_000_000)
		ensure
			instance_free: class
		end

	wait_for_value_with_timeout (a_value: INTEGER; a_timeout: INTEGER_64)
			-- Wait for `value` to be equal to `a_value`.
			-- Give up after `a_timeout` nanoseconds.
		local
			i: INTEGER_64
			nb: INTEGER_64
		do
			nb := a_timeout // 1_000_000
			from until
				value = a_value or i > nb
			loop
				if i = nb then
					{EXECUTION_ENVIRONMENT}.sleep (a_timeout \\ 1_000_000)
				else
						-- 1 millisecond.
					{EXECUTION_ENVIRONMENT}.sleep (1_000_000)
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	value_cell: separate CELL [INTEGER]
			-- Shared scheduler value
		once ("PROCESS")
			create Result.put (0)
		ensure
			instance_free: class
		end

end

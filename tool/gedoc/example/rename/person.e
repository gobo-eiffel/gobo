class PERSON
inherit ANY redefine default_create end  -- needed by ISE and GOBO compiler; but not by SmartEiffel

feature {ANY}
   name: STRING
   addr: STRING

   get_addr():STRING  is do Result := addr end  -- accessor method, to read
   set_addr(a:STRING) is do addr   := a    end  -- accessor method, to write

   default_create is  -- the constructor
     do
       name := "name"
       addr := "addr"
     end
end

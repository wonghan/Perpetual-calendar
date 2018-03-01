Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity modes is 
Port( k0:in std_logic;
    mode:out std_logic);
end entity;
architecture behav of modes is
	signal t:std_logic; 
begin
		process(k0)
		begin
            if(k0='1')then
				t<=NOT t;
			end if;
		end process;
        mode<=t;
	end behav;
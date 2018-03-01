Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity month is 
Port(clk,reset:in std_logic;
	run:in std_logic;--runnian wei 1
	sel:out std_logic_vector(1 downto 0);
    q:out std_logic_vector(7 downto 0);		
    c:out std_logic);
end entity;
architecture behav of month is
begin
process(clk,run,reset)
variable r:std_logic_vector(7 downto 0); 
begin
		if reset='0' then r:="00000001";
		elsif (rising_edge(clk)) then
			r:=r+1;c<='0';
			if r(3 downto 0)=3 and r(7 downto 4)=1 then
				r(3 downto 0):="0001";r(7 downto 4):="0000";c<='1';
			elsif r(3 downto 0)=10  then
				r(3 downto 0):="0000";r(7 downto 4):=r(7 downto 4)+1;
			end if;
		end if;	
		case r is
			when "00000001"=>sel<="00";
			when "00000010"=>sel<="11";
				if(run='1')then sel<="10";
				end if;
			when "00000011"=>sel<="00";
			when "00000100"=>sel<="01";
			when "00000101"=>sel<="00";
			when "00000110"=>sel<="01";
			when "00000111"=>sel<="00";
			when "00001000"=>sel<="00";
			when "00001001"=>sel<="01";
			when "00001010"=>sel<="00";
			when "00001011"=>sel<="01";
			when "00001100"=>sel<="00";
			when others=>null;
		end case;
		q<=r;	 
end process;
end behav;
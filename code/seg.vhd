LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;
ENTITY seg IS
  PORT(clk:IN std_logic;
       idata:IN std_logic_vector(31 downto 0);
       ds_stcp,ds_shcp,ds_data:OUT std_logic);
END entity;
ARCHITECTURE behav OF seg IS
   signal b,clk2,ds_stcpr,ds_shcpr,ds_datar:std_logic;
   signal cnt: std_logic_vector(11 DOWNTO 0); 
   signal seg_duan :std_logic_vector(7 downto 0);
   signal seg_wei :std_logic_vector(7 downto 0);
   signal seg_num:std_logic_vector(3 downto 0);
   signal sel:std_logic_vector(2 downto 0);
   --signal idata: std_logic_vector(31 DOWNTO 0); 
   
   CONSTANT SEG_NUM0:std_logic_vector(7 downto 0):="11000000";
   CONSTANT SEG_NUM1:std_logic_vector(7 downto 0):="11111001";
   CONSTANT SEG_NUM2:std_logic_vector(7 downto 0):="10100100";
   CONSTANT SEG_NUM3:std_logic_vector(7 downto 0):="10110000";
   CONSTANT SEG_NUM4:std_logic_vector(7 downto 0):="10011001";
   CONSTANT SEG_NUM5:std_logic_vector(7 downto 0):="10010010";
   CONSTANT SEG_NUM6:std_logic_vector(7 downto 0):="10000010";
   CONSTANT SEG_NUM7:std_logic_vector(7 downto 0):="11111000";
   CONSTANT SEG_NUM8:std_logic_vector(7 downto 0):="10000000";
   CONSTANT SEG_NUM9:std_logic_vector(7 downto 0):="10010000";

   CONSTANT SEG_WE0:std_logic_vector(7 downto 0):="11111110";
   CONSTANT SEG_WE1:std_logic_vector(7 downto 0):="11111101";
   CONSTANT SEG_WE2:std_logic_vector(7 downto 0):="11111011";
   CONSTANT SEG_WE3:std_logic_vector(7 downto 0):="11110111";
   CONSTANT SEG_WE4:std_logic_vector(7 downto 0):="11101111";
   CONSTANT SEG_WE5:std_logic_vector(7 downto 0):="11011111";
   CONSTANT SEG_WE6:std_logic_vector(7 downto 0):="10111111";
   CONSTANT SEG_WE7:std_logic_vector(7 downto 0):="01111111";

   
BEGIN
   process(clk)
   begin
   if(clk'event and clk='1') then
    clk2<='0';
    clk2<=not clk2;
   end if;
   end process;
   process(clk2,sel,seg_num)
   begin
   if(clk2'event and clk2='1') then
     cnt<=cnt+1;
  
    if(        (cnt >= x"002" and cnt < x"022") or (cnt >= x"024" and cnt < x"044")
			or (cnt >= x"046" and cnt < x"066") or (cnt >= x"068" and cnt < x"088")
			or (cnt >= x"08a" and cnt < x"0aa") or (cnt >= x"0ac" and cnt < x"0cc")
			or (cnt >= x"0ce" and cnt < x"0ee") or (cnt >= x"0f0" and cnt < x"110")
			or (cnt >= x"112" and cnt < x"132") or (cnt >= x"134" and cnt < x"154")
			or (cnt >= x"156" and cnt < x"176") or (cnt >= x"178" and cnt < x"198")
			or (cnt >= x"19a" and cnt < x"1ba") or (cnt >= x"1bc" and cnt < x"1dc")
			or (cnt >= x"1de" and cnt < x"1fe")
			
			) 
		then
		ds_shcpr<=not ds_shcpr ;
		else ds_shcpr<='0';
		end if;
		if(  (cnt = x"001") or (cnt = x"023")
		    or (cnt = x"045") or (cnt = x"067")
		    or (cnt = x"089") or (cnt = x"0ab")
            or (cnt = x"0cd") or (cnt = x"0ef") 
		    or (cnt = x"111") or (cnt = x"133")
		    or (cnt = x"155") or (cnt = x"177")
		    or (cnt = x"199") or (cnt = x"1bb")
		    or (cnt = x"1dd") or (cnt = x"199")
		    ) then
		    ds_stcpr<='0';
		    end if;
		  if(  (cnt = x"022") or (cnt = x"044")
		    or (cnt = x"066") or (cnt = x"088")
		    or (cnt = x"0aa") or (cnt = x"0cc")
            or (cnt = x"0ee") or (cnt = x"110") 
		    or (cnt = x"132") or (cnt = x"154") 
		    or (cnt = x"176") or (cnt = x"198")
		    or (cnt = x"1ba") or (cnt = x"1dc")
		    or (cnt = x"1fe")
		    ) then
		    ds_stcpr<='1'; 
		    end if;
             		 
  if (cnt=x"200")then
   cnt<=x"000";
   end if;
  end if;
  sel<=cnt(8 downto 6);
  case sel is
   when "000" => seg_wei<=seg_we0;seg_num<=idata(3 downto 0);
   when "001" => seg_wei<=seg_we1;seg_num<=idata(7 downto 4);
   when "010" => seg_wei<=seg_we2;seg_num<=idata(11 downto 8 );
   when "011" => seg_wei<=seg_we3;seg_num<=idata(15 downto 12);
   when "100" => seg_wei<=seg_we4;seg_num<=idata(19 downto 16);
   when "101" => seg_wei<=seg_we5;seg_num<=idata(23 downto 20);
   when "110" => seg_wei<=seg_we6;seg_num<=idata(27 downto 24);
   when "111" => seg_wei<=seg_we7;seg_num<=idata(31 downto 28);
   when others=>NULL;
   end case;
   case seg_num is
   when "0000" =>seg_duan <= SEG_NUM0;
   when "0001" =>seg_duan <= SEG_NUM1;
   when "0010" =>seg_duan <= SEG_NUM2;
   when "0011" =>seg_duan <= SEG_NUM3;
   when "0100" =>seg_duan <= SEG_NUM4;
   when "0101" =>seg_duan <= SEG_NUM5;
   when "0110" =>seg_duan <= SEG_NUM6;
   when "0111" =>seg_duan <= SEG_NUM7;
   when "1000" =>seg_duan <= SEG_NUM8;
   when "1001" =>seg_duan <= SEG_NUM9;
   when others=>NULL;
   end case;
   end process;
   process(cnt)
   begin
		case cnt is
		 when x"002"|x"046"|x"08a"|x"0ce"|x"112"|x"156"|x"19a"|x"1de"  => ds_datar <= seg_duan(7);
		 when x"004"|x"048"|x"08c"|x"0d0"|x"114"|x"158"|x"19c"|x"1e0"  => ds_datar <= seg_duan(6);
		 when x"006"|x"04a"|x"08e"|x"0d2"|x"116"|x"15a"|x"19e"|x"1e2"  => ds_datar <= seg_duan(5);  
		 when x"008"|x"04c"|x"090"|x"0d4"|x"118"|x"15c"|x"1a0"|x"1e4"  => ds_datar <= seg_duan(4);     
		 when x"00a"|x"04e"|x"092"|x"0d6"|x"11a"|x"15e"|x"1a2"|x"1e6"  => ds_datar <= seg_duan(3);     
		 when x"00c"|x"050"|x"094"|x"0d8"|x"11c"|x"160"|x"1a4"|x"1e8"  => ds_datar <= seg_duan(2);      
		 when x"00e"|x"052"|x"096"|x"0da"|x"11e"|x"162"|x"1a6"|x"1ea"  => ds_datar <= seg_duan(1);      
		 when x"010"|x"054"|x"098"|x"0dc"|x"120"|x"164"|x"1a8"|x"1ec"  => ds_datar <= seg_duan(0);      
		 when x"012"|x"056"|x"09a"|x"0de"|x"122"|x"166"|x"1aa"|x"1ee"  => ds_datar <= seg_wei(0);      
		 when x"014"|x"058"|x"09c"|x"0e0"|x"124"|x"168"|x"1ac"|x"1f0"  => ds_datar <= seg_wei(1);
		 when x"016"|x"05a"|x"09e"|x"0e2"|x"126"|x"16a"|x"1ae"|x"1f2"  => ds_datar <= seg_wei(2);             
		 when x"018"|x"05c"|x"0a0"|x"0e4"|x"128"|x"16c"|x"1b0"|x"1f4"  => ds_datar <= seg_wei(3);         
		 when x"01a"|x"05e"|x"0a2"|x"0e6"|x"12a"|x"16e"|x"1b2"|x"1f6"  => ds_datar <= seg_wei(4);         
		 when x"01c"|x"060"|x"0a4"|x"0e8"|x"12c"|x"170"|x"1b4"|x"1f8"  => ds_datar <= seg_wei(5);         
		 when x"01e"|x"062"|x"0a6"|x"0ea"|x"12e"|x"172"|x"1b6"|x"1fa"  => ds_datar <= seg_wei(6);         
		 when x"020"|x"064"|x"0a8"|x"0ec"|x"130"|x"174"|x"1b8"|x"1fc"  => ds_datar <= seg_wei(7);   
		 
		 when x"024"|x"068"|x"0ac"|x"0f0"|x"134"|x"178"|x"1bc"  => ds_datar <= '1';          
		 when x"026"|x"06a"|x"0ae"|x"0f2"|x"136"|x"17a"|x"1be"  => ds_datar <= '1';  
		 when x"028"|x"06c"|x"0b0"|x"0f4"|x"138"|x"17c"|x"1c0"  => ds_datar <= '1';  
		 when x"02a"|x"06e"|x"0b2"|x"0f6"|x"13a"|x"17e"|x"1c2"  => ds_datar <= '1';  
		 when x"02c"|x"070"|x"0b4"|x"0f8"|x"13c"|x"180"|x"1c4"  => ds_datar <= '1';  
		 when x"02e"|x"072"|x"0b6"|x"0fa"|x"13e"|x"182"|x"1c6"  => ds_datar <= '1';            
		 when x"030"|x"074"|x"0b8"|x"0fc"|x"140"|x"184"|x"1c8"  => ds_datar <= '1';            
		 when x"032"|x"076"|x"0ba"|x"0fe"|x"142"|x"186"|x"1ca"  => ds_datar <= '1';            
		 when x"034"|x"078"|x"0bc"|x"100"|x"144"|x"188"|x"1cc"  => ds_datar <= '1';            
		 when x"036"|x"07a"|x"0be"|x"102"|x"146"|x"18a"|x"1ce"  => ds_datar <= '1';            
		 when x"038"|x"07c"|x"0c0"|x"104"|x"148"|x"18c"|x"1d0"  => ds_datar <= '1';            
		 when x"03a"|x"07e"|x"0c2"|x"106"|x"14a"|x"18e"|x"1d2"  => ds_datar <= '1';            
		 when x"03c"|x"080"|x"0c4"|x"108"|x"14c"|x"190"|x"1d4"  => ds_datar <= '1';         
		 when x"03e"|x"082"|x"0c6"|x"10a"|x"14e"|x"192"|x"1d6"  => ds_datar <= '1';   
		 when x"040"|x"084"|x"0c8"|x"10c"|x"150"|x"194"|x"1d8"  => ds_datar <= '1';   
		 when x"042"|x"086"|x"0ca"|x"10e"|x"152"|x"196"|x"1da"  => ds_datar <= '1';   
	     when others=>ds_datar<='0';
		 end case;
   end process;
		      ds_stcp<=ds_stcpr;
		      ds_shcp<=ds_shcpr;
		      ds_data<=ds_datar;
end behav;

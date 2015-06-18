library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package array32 is 

   subtype reg is std_logic_vector(31 downto 0); -- a byte 
        type reg_array is array (31 downto 0) of reg; -- array of bytes 

end array32; 


package body array32 is 

end array32; 
package custom_math_package is 
    function ceil_log2(x : positive) return natural; 
end package;

package body custom_math_package is 
    function ceil_log2 (x : positive) return natural is
        variable y : natural;
    begin
        y:=0;
        while(2**y < x) and y < 15 loop 
            y := y +1;
        end loop;
        return y;
    end function; 
end package body;
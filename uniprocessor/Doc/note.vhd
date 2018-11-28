if(type = sw and addr(2) = '1') then
	data[63:56] <= read_data2[31:23];
elsif (type = sh and adr(2:1) = "11") then
	data[63:56] <= read_data2(15:8);
elsif (type = sb and addr(2:0) = "111") then
	data[63:56] <= read_data2(7:0);
else
	data[63:56] <= read_data2[63:56];

----


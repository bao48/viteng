function matlab_color = RGBtoMHex(hex_color)

hex_split = cellstr(reshape(hex_color, 6, []'));
hex1 = cell2mat(hex_split(1:2, 1));
num1 = strcat(hex1(1, 1), hex1(2, 1));
hex2 = cell2mat(hex_split(3:4, 1));
num2 = strcat(hex2(1, 1), hex2(2, 1));
hex3 = cell2mat(hex_split(5:6, 1));
num3 = strcat(hex3(1, 1), hex3(2, 1));


base10_1 = hex2dec(num1);
base10_2 = hex2dec(num2);
base10_3 = hex2dec(num3);

matlab_color = [base10_1/255, base10_2/255, base10_3/255];

end
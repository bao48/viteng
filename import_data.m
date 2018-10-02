function [Vt, It] = import_data(startnum, endnum, letters_num)
%   import_data(startnum, endnum, letters_num)     Imports data for voltage and current files
%       startnum is where the file name starts
%       endnum is where the file name ends
%       letters_num is how many iterations of the file must be passed
%       through (max 3)
%   Note: all files must be of format 1a-Vt.data or 1a-It.data for this
%   function to work properly
%   Returns [Vt, It], the rows of which are the 1, 2, etc. files and the
%   columns represent the letters. For example, Vt[1, 2] is a cell array for
%   the data in the file 1b-Vt

% make matrix A store all the filenames
names_total_num = endnum-startnum+1;
A_Vt = cell(3, names_total_num);
A_It = cell(3, names_total_num);
for R1 = startnum:endnum
    for letter = 1:letters_num
        if letter == 1
            temp = "a";
            A_Vt{letter, R1-startnum+1} = strcat(num2str(R1), temp, "-Vt.data");
            A_It{letter, R1-startnum+1} = strcat(num2str(R1), temp, "-It.data");
        elseif letter == 2
            temp = "b";
            A_Vt{letter, R1-startnum+1} = strcat(num2str(R1), temp, "-Vt.data");
            A_It{letter, R1-startnum+1} = strcat(num2str(R1), temp, "-It.data");
        elseif letter == 3
            temp = "c";
            A_Vt{letter, R1-startnum+1} = strcat(num2str(R1), temp, "-Vt.data");
            A_It{letter, R1-startnum+1} = strcat(num2str(R1), temp, "-It.data");
        end
    end
end
% row, column
% Make matrix 'data' to store all the data
data_Vt_temp = cell(10000, 3);
data_It_temp = cell(10000, 3);
data_Vt = cell(names_total_num, letters_num);
data_It = cell(names_total_num, letters_num);
for R2 = 1:names_total_num
    for letter = 1:letters_num
        filename_Vt = A_Vt{letter, R2};
        filename_It = A_It{letter, R2};
        delimiterIn = '\t';
        headerlinesIn = 9;
        import_txt_temp_Vt = importdata(filename_Vt,delimiterIn,headerlinesIn);
        import_txt_temp_It = importdata(filename_It,delimiterIn,headerlinesIn);
        data_Vt_temp = num2cell(getfield(import_txt_temp_Vt, 'data'));
        data_It_temp = num2cell(getfield(import_txt_temp_It, 'data'));
        data_Vt{R2, letter} = data_Vt_temp(:, 3);
        data_It{R2, letter} = data_It_temp(:, 3);
    end
end
Vt = data_Vt;
It = data_It;
end
function [out, avg, sd] = get_It_peaks(It, peak_num, posneg)
% get_It_peaks(It, peak_num, posneg)    gets peaks and returns them in
% a matrix. The average and standard deviation of the peaks are also
% generated. [avg, sd]
% It is the cell matrix that has all the data, where the rows are samples
% of the same group and the columns are each different "groups"

[r, c] = size(It);
out = zeros(peak_num*c, r);     % number of rows *c bc sample size, r in columns (i.e. different samples in different columns)
if posneg < 0
    % first goes into the row of each column (so the sample in each group)
    for R1 = 1:r
        for R2 = 1:c
            temp1 = (R2-1)*peak_num+1;
            temp2 = R2*peak_num;
            peak_num_plus = peak_num+1;
            [y, x] = findpeaks(-cell2mat(It{R1, R2}), 'SortStr', 'descend');
            out(temp1:temp2, R1) = y(2:peak_num_plus, 1);
        end
    end
else
    % first goes into the row of each column (so the sample in each group)
    for R1 = 1:r
        for R2 = 1:c
            temp1 = (R2-1)*peak_num+1;
            temp2 = R2*peak_num;
            peak_num_plus = peak_num+1;
            [y, x] = findpeaks(cell2mat(It{R1, R2}), 'SortStr', 'descend');
            out(temp1:temp2, R1) = y(2:peak_num_plus, 1);
        end
    end
end
avg = mean(out);
sd = std(out);
end
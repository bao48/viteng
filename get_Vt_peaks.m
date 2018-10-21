function [allheights, avg, sd] = get_Vt_peaks(Vt, peaknum, how, updown, posneg)
% get_It_peaks(It, peaknum)    analyzing step function heights
% It is the cell matrix that has all the data, where the rows are samples
% of the same group and the columns are each different "groups"
% Ex.
% allheights = heights of peaks
% avg = average of peaks
% sd = standard deviation of peaks
% Vt = data sheet (with cells) of Voltage data
% peaknum = peak number that you would like the program to retrieve (you must at least click twice as many as this number)
% how = vertical (1) or horizontal clicking (any other number)
% updown = top ones clicked first (1) or bottom ones clicked first (any other number)
% posneg = are these peaks positive (1) or negative (-1)?
%
% To control clicking
% space = delete dot
% h = switch to horizontal clicking, (any other number)
% v = switch to vertical clicking, (1)
% 
% t = switch to top - bottom, aka you click all the top ones first (1)
% b = switch to bottom - top, aka you click all the bottom ones first (any other number)


if posneg ~= 1
    if posneg ~= -1
        return
    end
end

[r, c] = size(Vt);
groupheights = zeros(1, 1);
allheights = zeros(1, r);

data_shortened = zeros(20000, 1);

for R1 = 1:r
    for R2 = 1:c
        time = reshape(1:20000, 20000, 1);
        time = time./500;
        data_cell = Vt{R1, R2};
        data_double = cell2mat(data_cell);
        data_shortened = data_double(1:20000, 1);

        tempx = [];
        tempy = [];
        
        % use space to delete last value
        while 0 < 1
            plot(time, data_shortened, ...
                    tempx, tempy, 'r.', 'MarkerSize', 15);
            [tempx1, tempy1, action] = ginput(1);
            if isempty(action)
                break;
            elseif action == 32
                % space to delete
                [a, b] = size(tempx);
                tempx(a) = [];
                tempy(a) = [];
            elseif action == 104
                % change to horizontal clicking for this set
                how = 0;
            elseif action == 118
                % change to vertical clicking for this set
                how = 1;
            elseif action == 116
                % all the top ones first
                updown = 1;
            elseif action == 98
                % all the bottom ones first
                updown = 0;
            else
                tempx = [tempx; tempx1];
                tempy = [tempy; tempy1];
            end
            tempx
            tempy
        end

        dotnum = peaknum*2;
        
        if (how == 1)
            % vertical clicking
            half1 = tempy(1:2:dotnum);
            half2 = tempy(2:2:dotnum);
        else
            % horizontal clicking
            half1 = tempy(1:peaknum);
            half2 = tempy(peaknum+1:peaknum*2);            
        end
        
        if (updown == 1)
            peakheight = (half1-half2)*posneg;
        else
            peakheight = (half2-half1)*posneg;
        end
        
        if (groupheights(1, 1) == 0)
            groupheights = peakheight;
        else
            groupheights = [peakheight; groupheights];
        end
        
    end
    
    if (allheights(1, 1) == 0)
        allheights = groupheights;
    else
        allheights = [allheights groupheights];
    end
    
    peakheight = [];
    groupheights = zeros(peaknum*3, 1);
end
avg = mean(allheights);
sd = std(allheights);
end

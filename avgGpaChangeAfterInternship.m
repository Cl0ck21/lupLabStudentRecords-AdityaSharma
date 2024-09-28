function [gpaChangeArr, noZerosCS_GPA_Differences, avgGpaChange, studentInternshipQuarters] = avgGpaChangeAfterInternship(data, colTitles)

% first identify internship quarters

% for each student in the group, check if they had an internship, and see
% which quarter was prior

% init arr to track which students had an internship, if the value is ___
% the student did not have an internship

studentInternshipQuarters = strings(1, size(data, 1));

timeIndexes = contains(data.Properties.VariableNames, 'Timestamp');
for ii=1:size(data,1)
    studentInternshipQuarters{1, ii} = internshipQuarterCheck(data(ii,:), timeIndexes, ii);
end

% for each student, calculate their average gpa before and after their
% internship
gpaChangeArr = zeros(1, size(data,1));
for ii=1:size(data,1)

    % if this is a student who had an internship
    if (false == strcmp(studentInternshipQuarters{1,ii}, 'null'))
        % find the column index of the quarter after the internship
        afterQtrIndex = -1;
        for cc=1:size(data,2)
            if strcmp(string(data{ii,cc}), studentInternshipQuarters{1, ii})
                afterQtrIndex = cc;
                break
            end
        end
        
        % loop setup 
        avg = 0;
        avgCount = 0;
        % while we are not at the quarter after the internship, sum gpa
        for jj=1:afterQtrIndex
            if strcmp(colTitles{1, jj}, 'CS_GPA')
                avg = avg + data{ii, jj};
                avgCount = avgCount + 1;
            end
            if jj == size(data.Properties.VariableNames, 2)
                error("reached the end of loop in avgGpaChangeAfter")
            end
        end
            
        gpaPrior = avg / avgCount;
            
        % now get gpa after, then get the diff and add to an array
        % note that ii == index for session after internship here 

        %from the index of gpa for the quarter after internship until
        %the very last gpa, sum all cs_gpa
        avg = 0;
        avgCount = 0;
        
        % if this is the first timestamp in the data, just get the next gpa
        if (afterQtrIndex == 22)
            % todo: fix because our index is for the session after
            gpaAfter = data{ii,23};
        else
            for jj=(afterQtrIndex):23
                if strcmp(colTitles{1, jj}, 'CS_GPA')
                    avg = avg + data{ii,jj};
                    avgCount = avgCount + 1;
                end
            end
            gpaAfter = avg / avgCount;
        end
    % calculate difference and store in array
        gpaDiff = gpaAfter - gpaPrior;
        gpaChangeArr(ii) = gpaDiff;
    end
end

% avg out gpa differences
avg = 0;
avgCount = 0;
for ii=1:size(gpaChangeArr, 2)
    if (gpaChangeArr(ii) ~= 0)
        avg = avg + gpaChangeArr(ii);
        avgCount = avgCount + 1;
    end
end

avgGpaChange = (avg) / avgCount;


noZerosCS_GPA_Differences = [];
for ii=1:size(gpaChangeArr,2)
    if(gpaChangeArr(ii) ~= 0)
        noZerosCS_GPA_Differences = [noZerosCS_GPA_Differences, gpaChangeArr(ii)];
    end
end

% going with median rm outliers bc quartiles and median are the only 2 which make sense, and
% data is preseumably normally distributed since we expect there to be a
% generally common impact of an internship

% decided to remove outliers just in case, avgGpaDiff after removing
% outliers was .0025 which means there was no difference before and after.
% probably because data was randomly generated?

% we can use this to conclude that internships boost gpa by a moderate amount on avg (a large amount would be more like .3-.5, small <.1) 
noOutliersNoZeros_CS_GPA_Differences = rmoutliers(noZerosCS_GPA_Differences, "median");
disp("removed " + string(size(noZerosCS_GPA_Differences, 2) - size(noOutliersNoZeros_CS_GPA_Differences, 2)) + " outliers" + newline)
disp("avg gpa diff before removing outliers:")
avgGpaChange
disp("avg gpa diff after removing outliers:")
avgGpaChange = mean(noOutliersNoZeros_CS_GPA_Differences)

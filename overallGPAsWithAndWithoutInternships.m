function [gpaWith, gpaWithout, avgGpaWith, avgGpaWithout, overallAvgGpaDiffWithWithoutInternships] = overallGPAsWithAndWithoutInternships(data, studentInternshipQuarters)

% array inits
gpaWith = [];
gpaWithout = [];
% for each student record, add the overall gpa to the correct array
for ii=1:size(data,1)
    % if the student had an internship
    if false == strcmp(studentInternshipQuarters(ii), 'null')
        gpaWith = [gpaWith, data{ii,24}];
    %if the student didn't have an internship
    else
        gpaWithout = [gpaWithout, data{ii, 24}];
    end
end

avgGpaWith = mean(gpaWith);
avgGpaWithout = mean(gpaWithout);
overallAvgGpaDiffWithWithoutInternships = avgGpaWith - avgGpaWithout;

disp("removing outliers" + newline)
gpaWithSizeBefore = size(gpaWith,2);
gpaWithoutSizeBefore = size(gpaWithout,2);

% remove outliers:
gpaWith = rmoutliers(gpaWith, "median");
gpaWithout = rmoutliers(gpaWithout, "median");

disp("removed " + string(size(gpaWith, 2) - gpaWithSizeBefore) + " outliers");
disp("removed " + string(size(gpaWithout, 2) - gpaWithoutSizeBefore) + " outliers");

% no outliers removed, so we don't need to recalculate
% avgGpaWith = mean(gpaWith)
% avgGpaWithout = mean(gpaWithout)
% overallAvgGpaDiffWithWithoutInternships = avgGpaWith - avgGpaWithout


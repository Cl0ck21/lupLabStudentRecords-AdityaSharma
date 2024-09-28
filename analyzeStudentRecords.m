% read csv
studentRecordsTable = readtable("fake_student_records.csv")

% initialize 1d vector of strings for column titles
colTitles = strings([1, length(studentRecordsTable.Properties.VariableNames)]);

% loop through all column titles and add to the vector
for ii = 1:(length(studentRecordsTable.Properties.VariableNames))
    title = studentRecordsTable.Properties.VariableNames{ii};
    % if it is not the first title, get rid of the "Q#_" at the start of the title
    if (ii == 1)
        colTitles(1) = (title(1:length(title)));
    else
        colTitles(ii) = (title(4:length(title)));
    end
end

[CS_GPA_Differences, avgCS_GpaDiff, studentInternshipQuarters] = avgGpaChangeAfterInternship(studentRecordsTable, colTitles)

noZerosCS_GPA_Differences = [];
for ii=1:size(CS_GPA_Differences,2)
    if(CS_GPA_Differences(ii) ~= 0)
        noZerosCS_GPA_Differences = [noZerosCS_GPA_Differences,CS_GPA_Differences(ii)];
    end
end

% going with median rm outliers bc quartiles and median are the only 2 which make sense, and
% data is preseumably normally distributed since we expect there to be a
% generally common impact of an internship

% decided to remove outliers just in case, avgGpaDiff after removing
% outliers was .0025 which means there was no difference before and after.
% probably because data was randomly generated?

% we can use this to conclude that internships boost gpa by a moderate amount on avg (a large amount would be more like .3-.5, small <.1) 
noOutliersNoZeros_CS_GPA_Differences = rmoutliers(noZerosCS_GPA_Differences, "median")
disp("removed " + string(size(noZerosCS_GPA_Differences, 2) - size(noOutliersNoZeros_CS_GPA_Differences, 2)) + " outliers" + newline)
disp("avg gpa diff before removing outliers:")
avgCS_GpaDiff
disp("avg gpa diff after removing outliers:")
mean(noOutliersNoZeros_CS_GPA_Differences)

% dev: now we will check avg gpa of those with internships vs those
% without. we can either do a graph of those with internships vs without
% over all their quarters with diff colors, or graph before internship, after, and those
% without. also can just get average overall gpas.

[gpaWith, gpaWithout, avgGpaWith, avgGpaWithout, overallAvgGpaDiffWithWithoutInternships] = overallGPAsWithAndWithoutInternships(studentRecordsTable, studentInternshipQuarters)


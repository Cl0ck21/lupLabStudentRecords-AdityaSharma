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

[CS_GPA_Differences, avgCS_GpaDiff] = avgGpaChangeAfterInternship(studentRecordsTable, colTitles)

noZerosCS_GPA_Differences = [];
for ii=1:size(CS_GPA_Differences,2)
    if(CS_GPA_Differences(ii) ~= 0)
        noZerosCS_GPA_Differences = [noZerosCS_GPA_Differences,CS_GPA_Differences(ii)];
    end
end

% going with median rm outliers bc quartiles and median are the only 2 which make sense, and
% data is preseumably normally distributed since we expect there to be a
% generally common impact of an internship

% decided to remove outliers bc the average gpa Diff was about 0.07, which
% seems low when you look at the data. after removing 1 outlier we get avg
% = .1256 which seems more appropriate

% we can use this to conclude that internships boost gpa by a moderate amount on avg (a large amount would be more like .3-.5, small <.1) 
noOutliersNoZeros_CS_GPA_Differences = rmoutliers(noZerosCS_GPA_Differences, "median")
size(noZerosCS_GPA_Differences,2)
size(noOutliersNoZeros_CS_GPA_Differences,2)

avgCS_GpaDiff
mean(noOutliersNoZeros_CS_GPA_Differences)


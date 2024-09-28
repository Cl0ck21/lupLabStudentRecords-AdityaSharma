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

[CS_GPA_Differences, noZerosCS_GPA_Differences, avgCS_GpaDiff, studentInternshipQuarters] = avgGpaChangeAfterInternship(studentRecordsTable, colTitles)
% dev: now we will check avg gpa of those with internships vs those
% without. we can either do a graph of those with internships vs without
% over all their quarters with diff colors, or graph before internship, after, and those
% without. also can just get average overall gpas.

[gpaWith, gpaWithout, avgGpaWith, avgGpaWithout, overallAvgGpaDiffWithWithoutInternships] = overallGPAsWithAndWithoutInternships(studentRecordsTable, studentInternshipQuarters)


% read csv
studentRecordsTable = readtable("fake_student_records.csv");

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

[CS_GPA_Differences, noZerosCS_GPA_Differences, avgCS_GpaDiff, studentInternshipQuarters] = avgGpaChangeAfterInternship(studentRecordsTable, colTitles);
% dev: now we will check avg gpa of those with internships vs those
% without. we can either do a graph of those with internships vs without
% over all their quarters with diff colors, or graph before internship, after, and those
% without. also can just get average overall gpas.

[gpaWith, gpaWithout, avgGpaWith, avgGpaWithout, overallAvgGpaDiffWithWithoutInternships] = overallGPAsWithAndWithoutInternships(studentRecordsTable, studentInternshipQuarters);

% seems like there is no relationship between gpa and totalled credits, we may
% expect higher gpa with fewer credits or vice versa, but since there is no
% trend in the graphs, we can conclude there is no correlation
%GPAvsTotalCredits(studentRecordsTable);

% no relationship between gpa and credits per quarter, probably due to
% randomly generated data. the difference between this analysis and the
% previous one is that this one is on a per quarter basis, and looked at
% gpa and credits per quarter, where the last one only looked at final gpas
% and credits
%GPAvsCreditsPerQuarter(studentRecordsTable);


% no relationships over time, data seems very random, but the distribution
% of data seems different for each of these parameters, will try to fit to
% distributions to test this.
graphGPAandUnitsOverTime(studentRecordsTable);

% in terms of tightness of distribution, i think it goes overall gpa, cs
% gpa, total units, cs units. my guess is a change in range and a degree of
% "flatness" from normally distributed to uniform.


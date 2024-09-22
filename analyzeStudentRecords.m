studentRecordsTable = readtable("fake_student_records.csv")

colTitles = strings([1, length(studentRecordsTable.Properties.VariableNames)]);
for ii = 1:(length(studentRecordsTable.Properties.VariableNames))
    title = studentRecordsTable.Properties.VariableNames{ii};
    if (ii == 1)
        colTitles(1) = (title([1:length(title)]));
    else
        colTitles(ii) = (title([4:length(title)]));
    end
end
colTitles
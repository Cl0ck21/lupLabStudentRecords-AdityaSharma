function [] = graphGPAvsUnitsWithInternshipColor(data)

gpaArray = getOverallGPAs(data);

[csTotalUnitsArr, totalUnitsArr] = getTotalUnits(data);

studentInternshipQuarters = strings(1, size(data, 1));

timeIndexes = contains(data.Properties.VariableNames, 'Timestamp');
for ii=1:size(data,1)
    studentInternshipQuarters{1, ii} = internshipQuarterCheck(data(ii,:), timeIndexes, ii);
end

% handle inits to workaround legend issues
h1 = scatter(1, 1);
h2 = scatter(1, 1);

figure(23);
for ii=1:size(data,1)
    if (false == strcmp(studentInternshipQuarters{1,ii}, 'null'))
        h1 = scatter(totalUnitsArr(ii), gpaArray(ii), 'red');
        hold on
    else
        h2 = scatter(totalUnitsArr(ii), gpaArray(ii), 'blue');
        hold on
    end
end
title('Overall GPA vs Total Units of students with and without Internships')
legend([h1, h2], {'with internship', 'without internship'})
xlabel('Total Units')
ylabel('Overall Gpa')
hold off


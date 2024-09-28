function [gpaChangeArr, avgGpaChange, studentInternshipQuarters] = avgGpaChangeAfterInternship(data, colTitles)

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
        priorQtrIndex = find(contains(num2str(data{ii,:}), studentInternshipQuarters{1, ii}));
        
        jj = 1;

        % if this is the first timestamp in the data, just get the next gpa
        if (priorQtrIndex == 2)
            % todo: fix
            gpaPrior = data(ii,3);
            jj = 2;
        else
            % loop setup 
            avg = 0;
            avgCount = 0;
            % while we are not at the quarter after the internship, sum
            % gpa
            while false == strcmp(data.Properties.VariableNames(jj), studentInternshipQuarters{1, ii})
                if strcmp(colTitles(jj), 'CS_GPA')
                    avg = avg + data{ii,jj};
                    avgCount = avgCount + 1;
                end

                if jj == size(data.Properties.VariableNames, 2)
                    break
                end
                jj = jj + 1;
            end
            gpaPrior = avg / avgCount;
            
            % now get gpa after, then get the diff and add to an array
            % note that ii == index for session after internship here 
        end

        %from the index of gpa for the quarter after internship until
        %the very last gpa, sum all cs_gpa
        avg = 0;
        avgCount = 0;
        if jj == 26
            gpaAfter = -9999;
        else
            for jj=(ii + 1):23
                if strcmp(colTitles(jj), 'CS_GPA')
                    avg = avg + data{ii,jj};
                    avgCount = avgCount + 1;
                end
            end
            gpaAfter = avg / avgCount;
        end
    % calculate difference and store in array
        gpaDiff = gpaAfter - gpaPrior;
        gpaChangeArr(ii) = gpaDiff;
        disp(ii)
    end
end
avg = 0;
avgCount = 0;
for ii=1:size(gpaChangeArr, 2)
    if (gpaChangeArr(ii) ~= 0)
        avg = avg + gpaChangeArr(ii);
        avgCount = avgCount + 1;
    end
end

avgGpaChange = (avg) / avgCount;

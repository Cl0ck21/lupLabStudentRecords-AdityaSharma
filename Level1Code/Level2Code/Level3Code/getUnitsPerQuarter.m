function [csUnitsArr, totalUnitsOverTimeArr] = getUnitsPerQuarter(data)
    % this function returns an array of the credits over each quarter for each student,
    % making this its own file in case I need it again later
    
    % array inits
    csUnitsArr = zeros(1, 5 * size(data,1));
    totalUnitsOverTimeArr = zeros(1, 5 * size(data,1));
    % for each student record, add the per quarter gpa to the correct array
    
    for ii=1:size(data,1)
        for jj=1:5
            % if the student had an internship
            csUnitsArr((5 * ii) + jj - 5) = data{ii, 5 * jj};
            totalUnitsOverTimeArr((5 * ii) + jj - 5) = data{ii, (5 * jj) + 1};
        end
    end
end

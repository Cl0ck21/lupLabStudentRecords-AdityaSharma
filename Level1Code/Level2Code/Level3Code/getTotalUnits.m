function [csTotalUnitsArr, totalUnitsArr] = getTotalUnits(data)
    % this function returns an array of the total credits for each student,
    % making this its own file in case I need it again later
    
    % array inits
    totalUnitsArr = zeros(1, size(data,1));
    csTotalUnitsArr = zeros(1, size(data, 1));
    
    % for each student record, add the overall gpa to the correct array
    for ii=1:size(data,1)
        for jj=1:5
            % if the student had an internship
            csTotalUnitsArr(ii) = csTotalUnitsArr(ii) + data{ii, 5 * jj};
            totalUnitsArr(ii) = totalUnitsArr(ii) + data{ii, (5 * jj) + 1};
        end
    end
end


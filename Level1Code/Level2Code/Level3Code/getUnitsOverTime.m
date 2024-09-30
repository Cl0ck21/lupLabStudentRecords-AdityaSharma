function [csUnitArray, totalUnitArray] = getUnitsOverTime(data)
    % get units from each quarter into the corresponding arrays

    % array inits
    csUnitArray = zeros(size(data,1), 5);
    totalUnitArray = zeros(size(data,1), 5);
    % for each student record, add the units to the correct array
    for ii=1:size(data,1)
        for jj=1:5
            % todo: fix jj * 4
            csUnitArray(ii, jj) = data{ii, 5 * jj};
            totalUnitArray(ii, jj) = data{ii, (5 * jj) + 1};
        end
    end
end
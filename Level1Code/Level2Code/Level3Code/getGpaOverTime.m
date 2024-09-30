function [csGpaArray, overallGpaArray] = getGpaOverTime(data)
    % get gpas from each quarter into the corresponding arrays

    % array inits
    csGpaArray = zeros(size(data,1), 5);
    overallGpaArray = zeros(size(data,1), 5);
    % for each student record, add the overall gpa to the correct array
    for ii=1:size(data,1)
        for jj=1:5
            % todo: fix jj * 4
            csGpaArray(ii, jj) = data{ii, (jj * 5) + 3 - 5};
            overallGpaArray(ii, jj) = data{ii, (jj * 5) + 4 - 5};
        end
    end
end
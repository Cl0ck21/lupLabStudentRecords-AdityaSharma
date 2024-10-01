function [csGpaArray, overallGpaArray] = getGpaPerQuarter(data)
    % get gpas from each quarter into the corresponding arrays

    % array inits
    csGpaArray = zeros(1, 5 * size(data,1));
    overallGpaArray = zeros(1, 5 * size(data,1));
    % for each student record, add the overall gpa to the correct array
    for ii=1:size(data,1)
        for jj=1:5
            % todo: fix jj * 4
            csGpaArray((5 * ii) + jj - 5) = data{ii, (jj * 5) + 3 - 5};
            overallGpaArray((5 * ii) + jj - 5) = data{ii, (jj * 5) + 4 - 5};
        end
    end
end
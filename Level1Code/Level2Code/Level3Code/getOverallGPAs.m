function [gpaArray] = getOverallGPAs(data)
    % array inits
    gpaArray = zeros(1, size(data,1));
    % for each student record, add the overall gpa to the correct array
    for ii=1:size(data,1)
        gpaArray(ii) = data{ii, 24};
    end
end
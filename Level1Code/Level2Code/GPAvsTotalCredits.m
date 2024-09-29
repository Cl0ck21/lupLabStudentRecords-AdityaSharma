function [] = GPAvsTotalCredits(data)
    % graph GPA vs Total Credits for each student
    
    overallGpaArr = getOverallGPAs(data)
    
    [csTotalUnitsArr, totalUnitsArr] = getTotalUnits(data)
    
    
    figure(1);
    scatter(csTotalUnitsArr, overallGpaArr)
    xlim([45, 75])
    title('Overall Gpa vs Cs Units')
    ylabel('Overall Gpa') 
    xlabel('Cs Units') 
    
    hold on
    
    figure(2);
    scatter(totalUnitsArr, overallGpaArr)
    xlim([55, 85])
    title('Overall Gpa vs Total Units')
    ylabel('Overall Gpa') 
    xlabel('Total Units') 
    
    
    hold off

end
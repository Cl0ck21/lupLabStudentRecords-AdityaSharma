function [] = GPAvsCreditsOverTime(data)

    % graph all the units and gpas for each quarter on one big graph
    
    % todo: later need to do a 3d graph of gpa vs units with colors for each
    % quarter
    
    [csGpaPerQuarterArr, overallGpaPerQuarterArr]  = getGpaPerQuarter(data)
    
    [csTotalUnitsOverTimeArr, totalUnitsOverTimeArr] = getUnitsPerQuarter(data)
    
    
    figure(3);
    scatter(csTotalUnitsOverTimeArr, overallGpaPerQuarterArr)
    xlim([0, 25])
    title('Overall Gpa per Quarter vs Cs Units Over Time')
    ylabel('Overall Gpa') 
    xlabel('Cs Units') 
    
    hold on
    
    figure(4);
    scatter(totalUnitsOverTimeArr, overallGpaPerQuarterArr)
    xlim([0, 25])
    title('Overall Gpa per Quarter vs Total Units Over Time')
    ylabel('Overall Gpa') 
    xlabel('Total Units Over Time') 
    
    
    hold off

end
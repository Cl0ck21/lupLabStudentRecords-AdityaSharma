function [] = GPAvsCreditsPerQuarter(data)

    % graph all the units and gpas for each quarter on one big graph
    
    % todo: later need to do a 3d graph of gpa vs units with colors for each
    % quarter
    
    [csGpaPerQuarterArr, overallGpaPerQuarterArr]  = getGpaPerQuarter(data);
    
    [csTotalUnitsPerQuarterArr, totalUnitsPerQuarterArr] = getUnitsPerQuarter(data);
    
    
    figure(3);
    scatter(csTotalUnitsPerQuarterArr, overallGpaPerQuarterArr)
    xlim([0, 25])
    title('Overall Gpa per Quarter vs Cs Units Per Quarter')
    ylabel('Overall Gpa') 
    xlabel('Cs Units Per Quarter') 
    
    hold on
    
    figure(4);
    scatter(totalUnitsPerQuarterArr, overallGpaPerQuarterArr)
    xlim([0, 25])
    title('Overall Gpa per Quarter vs Total Units Per Quarter')
    ylabel('Overall Gpa') 
    xlabel('Total Units Per Quarter') 

    figure(5);
    scatter(csTotalUnitsPerQuarterArr, csGpaPerQuarterArr)
    xlim([0, 25])
    title('Cs Gpa per Quarter vs Cs Units Per Quarter')
    ylabel('Overall Gpa') 
    xlabel('Cs Units Per Quarter') 
    
    figure(6);
    scatter(totalUnitsPerQuarterArr, csGpaPerQuarterArr)
    xlim([0, 25])
    title('Cs Gpa per Quarter vs Total Units Per Quarter')
    ylabel('Overall Gpa') 
    xlabel('Total Units Per Quarter') 
    
    hold off

end
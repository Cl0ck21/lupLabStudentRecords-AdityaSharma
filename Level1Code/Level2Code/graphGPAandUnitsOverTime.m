function [] = graphGPAandUnitsOverTime(data)

    % graph all the units and gpas for each quarter on 4 seperate graphs
    
    [csGpaOverTimeArr, overallGpaOverTimeArr]  = getGpaOverTime(data);
    
    [csUnitsOverTimeArr, totalUnitsOverTimeArr] = getUnitsOverTime(data);
    
    quarters = [1,2,3,4,5];

    figure(7);
    for ii=1:size(data,1)
        plot(quarters, csGpaOverTimeArr(ii, :))
        hold on
    end
    hold off
    %scatter(csTotalUnitsPerQuarterArr, overallGpaOverTimeArr)
    %xlim([0, 25])
    title('CS Gpa over 5 quarters')
    ylabel('Cs Gpa') 
    xlabel('Quarters In Attendance') 
    
    
    figure(8);
    for ii=1:size(data,1)
        plot(quarters, overallGpaOverTimeArr(ii, :))
        hold on
    end
    hold off
    %xlim([0, 25])
    title('Overall Gpa over 5 quarters')
    ylabel('Overall Gpa') 
    xlabel('Quarters In Attendance') 

    figure(9);
    for ii=1:size(data,1)
        plot(quarters, csUnitsOverTimeArr(ii, :))
        hold on
    end
    hold off
    %xlim([0, 25])
    title('CS Units over 5 quarters')
    ylabel('CS Units') 
    xlabel('Quarters In Attendance') 


    figure(10);
    for ii=1:size(data,1)
        plot(quarters, totalUnitsOverTimeArr(ii, :))
        hold on
    end
    hold off
    %scatter(csTotalUnitsPerQuarterArr, overallGpaOverTimeArr)
    %xlim([0, 25])
    title('Total Units over 5 quarters')
    ylabel('Total Units') 
    xlabel('Quarters In Attendance') 
end
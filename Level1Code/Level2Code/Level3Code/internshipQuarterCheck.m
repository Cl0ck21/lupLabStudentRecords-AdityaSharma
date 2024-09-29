function [internPriorQuarterString, internshipBool] = internshipQuarterCheck(studentData, colsWithTimestamp, studIndex)
    % determine whether a student had an internship, and if so return the
    % quarter after their internship
    
    % for all timestamps in student data, see if any are missing
    firstStamp = true;
    prevTime = 0;
    for ii=1:size(studentData,2)
        % if this is a timestamp column, go ahead
        if (colsWithTimestamp(ii) == 1)        
            % if this is our first run, don't compare to previous timestamps,
            % setup for next run
            if firstStamp
                firstStamp = false;
                prevTime = studentData{1,ii};
            else
                currentTime = studentData{1,ii};
    
                % convert nums to strings for switch case
    
                currStr = num2str(currentTime);
                currStrQtr = currStr(length(currStr) - 1:length(currStr));
                currStrYear = currStr(1:4);
    
                prevStr = num2str(prevTime);
                prevStrQtr = prevStr(length(prevStr) - 1:length(prevStr));
                prevStrYear = prevStr(1:4);
                
                % check for different quarter skips
                switch (prevStrQtr)
                    case '01'
                        % see if we found our skipped quarter
                        if (false == strcmp(currStr, [currStrYear, '03']))
                            internPriorQuarterString = currStr;
                            internshipBool = true;
                            %disp("return 1")
                            %disp(prevStr)
                            %disp(currStr)
                            return
                        else
                            prevTime = currentTime;
                            continue
                        end
                    case '03'
                        % see if we found our skipped quarter
                        if (false == strcmp(currStr, [currStrYear, '08']))
                            internPriorQuarterString = currStr;
                            internshipBool = true;
                            %disp("return 2")
                            %disp(prevStr)
                            %disp(currStr)
    
                            return
                        else
                            prevTime = currentTime;
                            continue
                        end
                    case '08'
                        % see if we found our skipped quarter
                        % increment year by 1
                        prevStrYear = num2str(str2double(prevStrYear) + 1);
                        if (false == strcmp(currStr, [prevStrYear, '01']))
                            internPriorQuarterString = currStr;
                            internshipBool = true;
                            %disp("return 3")
                            %disp(prevStr)
                            %disp(currStr)
    
                            return
                        else
                            prevTime = currentTime;
                            continue
                        end
                    otherwise
                        prevStrQtr
                        error("none of the cases in internshipQuarterCheck were run")
                end
            end
        else 
            % not time stamp column, skip
            continue
        end
    end
    
    % if we reach the end of the students data, no internships
    
    internPriorQuarterString = 'null';
    internshipBool = false;
    return

end

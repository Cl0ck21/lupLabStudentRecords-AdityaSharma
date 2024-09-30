function [] = estimateProbDist(data)

[csGpaArray, overallCsGpaArray] = getGpaPerQuarter(data);

[csUnitsArray, totalUnitsArray] = getUnitsPerQuarter(data);


%Cs Gpa Fitting

csNormParams = fitdist(csGpaArray', 'Normal');
csWeiParams = fitdist(csGpaArray', 'Weibull');
csLogParams = fitdist(csGpaArray', 'Logistic');

[hNorm, pNorm, normStats] = chi2gof(csGpaArray, 'CDF', csNormParams);
[hWei, pWei, weiStats] = chi2gof(csGpaArray, 'CDF', csWeiParams);
[hLog, pLog, logStats] = chi2gof(csGpaArray, 'CDF', csLogParams);

figure(11)
plot(csNormParams)
title('Normal Dist Fit of Cs Gpa Values')

figure(12)
plot(csWeiParams)
title('Weibull Dist Fit of Cs Gpa Values')

figure(13)
plot(csLogParams)
title('Logistic Dist Fit of Cs Gpa Values')

disp("Is CS Gpa uniform?")
isuniform(csGpaArray)

disp("Normal p value for CS GPA: ")
pNorm
disp("Weibull p value for CS GPA: ")
pWei
disp("Logistic p value for CS GPA: ")
pLog


% Overall Cs Gpa Fitting

csOverNormParams = fitdist(overallCsGpaArray', 'Normal');
csOverWeiParams = fitdist(overallCsGpaArray', 'Weibull');
csOverLogParams = fitdist(overallCsGpaArray', 'Logistic');

[hOverNorm, pOverNorm, normOverStats] = chi2gof(overallCsGpaArray, 'CDF', csOverNormParams);
[hOverWei, pOverWei, weiOverStats] = chi2gof(overallCsGpaArray, 'CDF', csOverWeiParams);
[hOverLog, pOverLog, logOverStats] = chi2gof(overallCsGpaArray, 'CDF', csOverLogParams);

figure(14)
plot(csOverNormParams)
title('Normal Dist Fit of Overall Cs Gpa Values')

figure(15)
plot(csOverWeiParams)
title('Weibull Dist Fit of Overall Cs Gpa Values')

figure(16)
plot(csOverLogParams)
title('Logistic Dist Fit of Overall Cs Gpa Values')

disp("Is Overall CS Gpa uniform?")
isuniform(overallCsGpaArray)

disp("Normal p value for Overall CS GPA: ")
pOverNorm
disp("Weibull p value for Overall CS GPA: ")
pOverWei
disp("Logistic p value for Overall CS GPA: ")
pOverLog

% CS Units Fitting

csUnitsNormParams = fitdist(csUnitsArray', 'Normal');
csUnitsWeiParams = fitdist(csUnitsArray', 'Weibull');
csUnitsLogParams = fitdist(csUnitsArray', 'Logistic');

[hUnitsNorm, pUnitsNorm, normUnitsStats] = chi2gof(csUnitsArray, 'CDF', csUnitsNormParams);
[hUnitsWei, pUnitsWei, weiUnitsStats] = chi2gof(csUnitsArray, 'CDF', csUnitsWeiParams);
[hUnitsLog, pUnitsLog, logUnitsStats] = chi2gof(csUnitsArray, 'CDF', csUnitsLogParams);

figure(17)
plot(csUnitsNormParams)
title('Normal Dist Fit of Cs Units Values')

figure(18)
plot(csUnitsWeiParams)
title('Weibull Dist Fit of Cs Units Values')

figure(19)
plot(csUnitsLogParams)
title('Logistic Dist Fit of Cs Units Values')

disp("Is Cs Units data uniform?")
isuniform(csUnitsArray)

disp("Normal p value for Cs Units data: ")
pUnitsNorm
disp("Weibull p value for Cs Units data: ")
pUnitsWei
disp("Logistic p value for Cs Units data: ")
pUnitsLog


% CS Total Units Fitting

totalUnitsNormParams = fitdist(totalUnitsArray', 'Normal');
totalUnitsWeiParams = fitdist(totalUnitsArray', 'Weibull');
totalUnitsLogParams = fitdist(totalUnitsArray', 'Logistic');

[hTotalUnitsNorm, pTotalUnitsNorm, normTotalUnitsStats] = chi2gof(totalUnitsArray, 'CDF', totalUnitsNormParams);
[hTotalUnitsWei, pTotalUnitsWei, weiTotalUnitsStats] = chi2gof(totalUnitsArray, 'CDF', totalUnitsWeiParams);
[hTotalUnitsLog, pTotalUnitsLog, logTotalUnitsStats] = chi2gof(totalUnitsArray, 'CDF', totalUnitsLogParams);

figure(20)
plot(totalUnitsNormParams)
title('Normal Dist Fit of Total Units Values')

figure(21)
plot(totalUnitsWeiParams)
title('Weibull Dist Fit of Total Units Values')

figure(22)
plot(totalUnitsLogParams)
title('Logistic Dist Fit of Total Units Values')

disp("Is Total Units data uniform?")
isuniform(totalUnitsArray)

disp("Normal p value for Total Units data: ")
pTotalUnitsNorm
disp("Weibull p value for Total Units data: ")
pTotalUnitsWei
disp("Logistic p value for Total Units data: ")
pTotalUnitsLog

pValArray = [pTotalUnitsNorm, pTotalUnitsWei, pTotalUnitsLog];

totalUnitsHighestProb = max([pTotalUnitsNorm, pTotalUnitsWei, pTotalUnitsLog]);

maxIndex = find(pValArray==totalUnitsHighestProb);
switch maxIndex
    case 1
        disp("Most likely dist for Total Units data is Normal Distribution.")
    case 2
        disp("Most likely dist for Total Units data is Weibull Distribution.")
    case 3
        disp("Most likely dist for Total Units data is Logistic Distribution.")
    otherwise
        error("switch for Total Units Data did not work")
end

%todo: at the end compare all values to say what dist values belong to








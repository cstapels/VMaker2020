% Enter your MATLAB code below
covidChannelID = 1066064;
myData = thingSpeakRead(covidChannelID,'outputFormat','timetable','numDays',300);

sequenceUS = diff(myData.USA);
sequenceChina = diff(myData.China);
sequenceUK = diff(myData.UK);

sequenceTimes = myData.Timestamps(1:end-1);

plot(sequenceTimes, sequenceUS,sequenceTimes,sequenceUK,sequenceTimes,sequenceChina);

ylabel('Daily New Cases');

ylim([0 4E4]);

legend('USA','China','UK','Location','West');

smoothedUS=movmean(sequenceUS,20);
yyaxis right;
plot(sequenceTimes,smoothedUS);
legend('Smoothed US Data','Location','West');

threshold = 0.8 * max(smoothedUS);
yline(threshold);

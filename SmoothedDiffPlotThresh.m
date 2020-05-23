covidChannelID = 1066064;
myData = thingSpeakRead(covidChannelID,'outputFormat','timetable','numDays',300);

sequenceUS = diff(myData.USA);
sequenceTimes = myData.Timestamps(1:end-1);

smoothUS = movmean(sequenceUS,20);

plot(sequenceTimes,smoothUS);

threshhold = 0.8 * max(smoothUS); 
yline(threshhold);

ylabel('Smoothed New Cases');
legend('USA','Location','West');

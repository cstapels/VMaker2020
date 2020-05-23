covidChannelID = 1066064;
myData = thingSpeakRead(covidChannelID,'outputFormat','timetable','numDays',300);

plot(myData.Timestamps,myData.USA,myData.Timestamps,...
    myData.China,myData.Timestamps,myData.Spain);
ylabel('Confirmed Covid Cases');
legend('USA','China','Spain','Location','NorthWest');

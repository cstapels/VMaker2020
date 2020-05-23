covidChannelID = 898224;
myData = thingSpeakRead(covidChannelID, 'ReadKey',covidReadAPIKey,...
    'outputFormat','timetable','numDays',300);

plot(myData.Timestamps,myData.USA,myData.Timestamps,...
    myData.China,myData.Timestamps,myData.Spain);
ylabel('Confirmed Covid Cases');
legend('USA','China','Spain','Location','NorthWest');

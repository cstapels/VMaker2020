covidChannelID = 1066064;
myData = thingSpeakRead(covidChannelID,'outputFormat','timetable','numDays',300);

sequenceUS = diff(myData.USA);
sequenceTimes = myData.Timestamps(1:end-1);
smoothUS = movmean(sequenceUS,20);

threshhold = 0.8 * max(smoothUS); 


if (smoothUS(end) < threshhold)
  
    alertUrl = "https://api.thingspeak.com/alerts/send";
    alertSubject = sprintf("COVID case report");
    alertBody = '80% peak reached.';
    alertApiKey = 'TAKG267RRFGQKJ2HB';
    options = weboptions("HeaderFields", ["ThingSpeak-Alerts-API-Key", alertApiKey ]);
    
    webwrite(alertUrl , "body", alertBody, "subject", alertSubject, options);
end

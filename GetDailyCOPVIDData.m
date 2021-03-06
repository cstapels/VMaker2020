myData = webread('https://pomber.github.io/covid19/timeseries.json');

myUS = struct2table(myData.US);

myChina=struct2table(myData.China);
myItaly=struct2table(myData.Italy);
myUK=struct2table(myData.UnitedKingdom);
mySK=struct2table(myData.Korea_South);
mySpain=struct2table(myData.Spain);
myAus=struct2table(myData.Australia);
myRus=struct2table(myData.Russia);

lastDate=datetime(myUS.date(end));

myAll=timetable(lastDate,myUS.confirmed(end),myChina.confirmed(end),myItaly.confirmed(end),...
    myUK.confirmed(end),mySK.confirmed(end),mySpain.confirmed(end),myAus.confirmed(end),...
    myRus.confirmed(end));

covidChannelID = 1066113;
covidWriteAPIKey= 'KHPSIMKR4EFTX6FG';

resp = thingSpeakWrite(covidChannelID,myAll,'writeKey',covidWriteAPIKey)
© 2020 GitHub, Inc.

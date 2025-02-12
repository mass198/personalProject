trigger accountaddressupdate on Account (before insert, before update) {
    accupdate.updatetheaddress(Trigger.New);}
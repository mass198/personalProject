trigger updateopp on Account (after update) {
    AccoppTriggerhandler.updateopprec(Trigger.New);
}
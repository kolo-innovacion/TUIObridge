import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

CountdownTimer pageTimer;

void timerSetup() {
  pageTimer = CountdownTimerService.getNewCountdownTimer(this).configure(100, 7000);
  pageTimer.reset();
  //timer.start();
}
void onFinishEvent(CountdownTimer t) {
  if (currentPage.timeout) {
    println("Timer ended. Switching to:  "+timeoutPage.name);
    switchPage(timeoutPage.name);
  }
}

void startPageTimer() {
  if (currentPage.timeout) {
    timeoutPage=pages.get(pageDict.get(currentPage.timeoutTo));
    //println(currentPage.name+"  will timeout to  "+timeoutPage.name);
    //println("TIMER RUNNING:  "+pageTimer.isRunning());
    //println("TIMER PAUSED:  "+pageTimer.isPaused());
    pageTimer.stop();
    pageTimer.reset();
    pageTimer.configure(100, currentPage.outTime);
    pageTimer.start();
    println("Page Timer from  "+currentPage.name+"  to "+currentPage.timeoutTo+"  in   "+currentPage.outTime+"  miliseconds" );
  } else {
    //pageTimer.stop();
  }
};

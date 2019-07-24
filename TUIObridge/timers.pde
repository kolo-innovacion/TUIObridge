import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

CountdownTimer pageTimer;

void timerSetup() {
  pageTimer = CountdownTimerService.getNewCountdownTimer(this).configure(1000, 7000);
  pageTimer.reset();
  //timer.start();
}
int aux=0;
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) {
  aux++;
  println(aux+"  Tick Event on timer  "+t+"  time left:  "+timeLeftUntilFinish);
}

void onFinishEvent(CountdownTimer t) {
  aux=0;
  if (currentPage.timeout) {
    println("Timer  "+t+"  ended. Switching to:  "+timeoutPage.name);
    switchPage(timeoutPage.name);
  }
}

void startPageTimer() {
  aux=0;
  println("-------------------------------------------Enter STARTPAGE TIMER");
  if (currentPage.timeout) {
    println("Current Page HAS TIMEOUT");

    timeoutPage=pages.get(pageDict.get(currentPage.timeoutTo));
    println("CURRENT PAGE "+currentPage.name+"  TIMEOUTS TO:  "+timeoutPage.name);
    //println(currentPage.name+"  will timeout to  "+timeoutPage.name);
    //println("TIMER RUNNING:  "+pageTimer.isRunning());
    //println("TIMER PAUSED:  "+pageTimer.isPaused());
    pageTimer.stop();
    println("PAGETIMER STOPPED");
    pageTimer.reset();
    println("PAGETIMER RESETTED");

    if (currentPage.outTime>20000) {
      println(currentPage.name+"  has a timeout longer than 20 sec; timer will be configured to 10 sec");
      pageTimer.configure(1000, 10000);
      println("10 sec pageTimer configured");
    } else {
      pageTimer.configure(1000, currentPage.outTime);

      println(currentPage.name+"  pageTimer set to  "+currentPage.outTime);
    }
    pageTimer.start();
    println("pageTimer STARTED");

    //println("");
    //println("Page Timer from  "+currentPage.name+"  to "+currentPage.timeoutTo+"  in   "+currentPage.outTime+"  miliseconds" );
  } else {
    println("Current Page has NOT TIMEOUT");
  }

  println("-------------------------------------------Leave STARTPAGE TIMER");
};

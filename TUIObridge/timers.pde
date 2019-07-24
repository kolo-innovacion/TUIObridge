import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

CountdownTimer pageTimer;
CountdownTimer idleTimer;

int idlePeriod=10000;

void timerSetup() {
  pageTimer = CountdownTimerService.getNewCountdownTimer(this).configure(100, 7000);
  idleTimer = CountdownTimerService.getNewCountdownTimer(this).configure(200, idlePeriod);
  //pageTimer.reset();
  //timer.start();
}
int aux=0;
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) {
  aux++;
  println(aux+"  Tick Event on timer  "+t+"  time left:  "+timeLeftUntilFinish);
}

void onFinishEvent0(CountdownTimer t) {
  println(t.getId()+"  HAS ENDED");
  if (t.getId()==0) {// timer 0 is pageTimer
    switchPage(timeoutPage.name);
  }

  aux=0;
}
void onFinishEvent(CountdownTimer t) {
  println(t.getId()+"  HAS ENDED");
  if (t.getId()==0) {// timer 0 is pageTimer
    switchPage(timeoutPage.name);
  } else if (t.getId()==1) {//timer 1 is idleTimer

    if (alone) {
      switchPage(initPage);
    }
  }

  aux=0;

  /*
  if (currentPage.timeout) {
   println("Timer  "+t+"  ended. Switching to:  "+timeoutPage.name);
   switchPage(timeoutPage.name);
   }
   */
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
    pageTimer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
    println("PAGETIMER STOPPED");
    pageTimer.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
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
}

void startIdle() {
  if ((currentPage.name.equals("Piso_Menu.mp4"))&&(particles.getCount()==0)&&(!idleTimer.isRunning())&&(tuioCursorList.size()==0)) {
    println("SYSTEM IS ALONE-----------------------------------------");
    idleTimer.start();
  } else {
  }
}

import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

CountdownTimer pageTimer;

void timerSetup() {
  pageTimer = CountdownTimerService.getNewCountdownTimer(this).configure(100, 7000);
  pageTimer.reset();
  //timer.start();
}
void onFinishEvent(CountdownTimer t) {
  switchPage(timeoutPage.name);
}

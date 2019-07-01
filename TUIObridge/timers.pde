import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

CountdownTimer timer;

void timerSetup() {
  timer = CountdownTimerService.getNewCountdownTimer(this).configure(100, 7000);
  timer.reset();
  //timer.start();
}
void onFinishEvent(CountdownTimer t) {
  switchPage("Piso_Predator.mp4");
}

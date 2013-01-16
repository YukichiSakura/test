#include <G7Motors.h>

G7Motors motors;

void setup () {
  int i;

  motors.begin();
  for (i = 0; i < 4; i ++) {
    motors.active(i);
  }
}

void loop () {
  int i, j;

  for (i = 0; i < 4; i ++) {

    for (j = 0; j <= 100; j += 10) {
      motors.write(i, G7MOTORS_CW, j);
      delay(200);
    }

    motors.write(i, G7MOTORS_CW, 0); // free run
    delay(1000);

    for (j = 0; j <= 100; j += 10) {
      motors.write(i, G7MOTORS_CCW, j);
      delay(200);
    }

    motors.write(i, G7MOTORS_BRAKE, 0); // brake
    delay(1000);

  }

}

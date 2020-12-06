import 'lifeCycleManager.dart';

class LocationService extends StoppableService {
  @override
  void start() {
    super.start();
    print('🍉location started🍉');
    // start subscription again
  }

  @override
  void stop() {
    super.stop();
    print('🍉location stopped');

    // cancel stream subscription
  }
}
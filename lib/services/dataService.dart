import 'lifeCycleManager.dart';

class BtataService extends StoppableService {
  @override
  void start() {
    super.start();
    print('Service started🍉');
    // start subscription again
  }

  @override
  void stop() {
    super.stop();
    print('Service stopped');

    // cancel stream subscription
  }
}
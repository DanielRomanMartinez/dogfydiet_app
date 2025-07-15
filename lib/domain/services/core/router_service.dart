import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';

class RouterService {
  const RouterService();

  String getNextPage() {
    return HomeScreen.routePath;
  }
}

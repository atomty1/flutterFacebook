import 'package:meta/meta.dart';
import 'package:myapp/facebook_ui/models/models.dart';


class Story {
  final User ? user;
  final String ? imageUrl;
  final bool ? isViewed;

      Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}


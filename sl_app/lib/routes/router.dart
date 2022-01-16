import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:sl_app/features/gallery/view/gallery_screen.dart';
import 'package:sl_app/features/live/view/live_screen.dart';
import 'package:sl_app/features/real_time/view/real_time_screen.dart';
import 'package:sl_app/features/sections/sections.dart';
import 'package:sl_app/features/word_to_sl/view/word_to_sl_screen.dart';
import 'package:sl_app/main.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomeScreen, initial: true),
    AutoRoute(page: SectionsScreen),
    AutoRoute(page: GalleryScreenWithCubit),
    AutoRoute(page: RealTimeScreenWithCubit),
    AutoRoute(page: LiveScreen),
    AutoRoute(page: WordToSlScreenWithCubit),
  ],
)
class $AppRouter {}

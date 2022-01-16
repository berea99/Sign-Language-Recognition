// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:camera/camera.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../features/gallery/view/gallery_screen.dart' as _i4;
import '../features/live/view/live_screen.dart' as _i6;
import '../features/real_time/view/real_time_screen.dart' as _i5;
import '../features/sections/sections.dart' as _i3;
import '../features/word_to_sl/view/word_to_sl_screen.dart' as _i7;
import '../main.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MyHomeRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<MyHomeRouteArgs>(orElse: () => MyHomeRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i2.MyHomeScreen(key: args.key));
    },
    SectionsRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i3.SectionsScreen());
    },
    GalleryRouteWithCubit.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i4.GalleryScreenWithCubit());
    },
    RealTimeRouteWithCubit.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i5.RealTimeScreenWithCubit());
    },
    LiveRoute.name: (entry) {
      var args = entry.routeData.argsAs<LiveRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry, child: _i6.LiveScreen(args.cameras));
    },
    WordToSlRouteWithCubit.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i7.WordToSlScreenWithCubit());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MyHomeRoute.name, path: '/'),
        _i1.RouteConfig(SectionsRoute.name, path: '/sections-screen'),
        _i1.RouteConfig(GalleryRouteWithCubit.name,
            path: '/gallery-screen-with-cubit'),
        _i1.RouteConfig(RealTimeRouteWithCubit.name,
            path: '/real-time-screen-with-cubit'),
        _i1.RouteConfig(LiveRoute.name, path: '/live-screen'),
        _i1.RouteConfig(WordToSlRouteWithCubit.name,
            path: '/word-to-sl-screen-with-cubit')
      ];
}

class MyHomeRoute extends _i1.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i8.Key? key})
      : super(name, path: '/', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i8.Key? key;
}

class SectionsRoute extends _i1.PageRouteInfo {
  const SectionsRoute() : super(name, path: '/sections-screen');

  static const String name = 'SectionsRoute';
}

class GalleryRouteWithCubit extends _i1.PageRouteInfo {
  const GalleryRouteWithCubit()
      : super(name, path: '/gallery-screen-with-cubit');

  static const String name = 'GalleryRouteWithCubit';
}

class RealTimeRouteWithCubit extends _i1.PageRouteInfo {
  const RealTimeRouteWithCubit()
      : super(name, path: '/real-time-screen-with-cubit');

  static const String name = 'RealTimeRouteWithCubit';
}

class LiveRoute extends _i1.PageRouteInfo<LiveRouteArgs> {
  LiveRoute({required List<_i9.CameraDescription> cameras})
      : super(name,
            path: '/live-screen', args: LiveRouteArgs(cameras: cameras));

  static const String name = 'LiveRoute';
}

class LiveRouteArgs {
  const LiveRouteArgs({required this.cameras});

  final List<_i9.CameraDescription> cameras;
}

class WordToSlRouteWithCubit extends _i1.PageRouteInfo {
  const WordToSlRouteWithCubit()
      : super(name, path: '/word-to-sl-screen-with-cubit');

  static const String name = 'WordToSlRouteWithCubit';
}

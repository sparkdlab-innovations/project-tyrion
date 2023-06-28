import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tyrion/src/utils/segments/app_segment.dart';

part 'home_page_data.freezed.dart';
part 'home_page_data.g.dart';

@freezed
class HomePageData with _$HomePageData {
  const HomePageData._();

  @Assert('pinnedSegments.length <= 2',
      'Pinned Segments must be less than two (2).')
  const factory HomePageData({
    required List<String> pinnedSegments,
  }) = _HomePageData;

  factory HomePageData.fromJson(Map<String, dynamic> json) =>
      _$HomePageDataFromJson(json);

  List<AppSegments> get pinnedSegmentsList => pinnedSegments
      .map((e) => AppSegment.segmentsMap[e])
      .whereType<AppSegments>()
      .toList();

  List<Widget> get pinnedSegmentsWidgets => pinnedSegmentsList
      .map((e) => AppSegment.getWidget(e))
      .whereType<Widget>()
      .toList();

  List<PageRouteInfo<dynamic>> get pinnedSegmentsPageRouteInfos =>
      pinnedSegmentsList
          .map((e) => AppSegment.getPageRouteInfo(e))
          .whereType<PageRouteInfo<dynamic>>()
          .toList();

  List<NavigationDestination> get pinnedSegmentsDestinations =>
      pinnedSegmentsList
          .map((e) => AppSegment.getNavigationDestination(e))
          .whereType<NavigationDestination>()
          .toList();
}

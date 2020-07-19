import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drawer_configs.g.dart';

@JsonSerializable()
class DrawerConfigsModel extends Equatable {
  @JsonKey(name: 'configs')
  final List<DrawerConfig> configs;

  @JsonKey(name: 'extend_configs')
  final List<DrawerConfig> extendConfigs;

  factory DrawerConfigsModel.fromJson(Map<String, dynamic> srcJson) =>
      _$DrawerConfigsModelFromJson(srcJson);

  DrawerConfigsModel({this.configs, this.extendConfigs});

  Map<String, dynamic> toJson() => _$DrawerConfigsModelToJson(this);

  @override
  List<Object> get props => [configs, extendConfigs];
}

@JsonSerializable()
class DrawerConfig extends Equatable {
  @JsonKey(name: 'is_divider')
  final bool isDivider;

  @JsonKey(name: 'text')
  final String text;

  final IconData iconData;

  @JsonKey(name: 'asset_icon')
  final String assetIcon;

  @JsonKey(name: 'url_icon')
  final String urlIcon;

  DrawerConfig({
    this.isDivider: false,
    this.text,
    this.iconData,
    this.assetIcon,
    this.urlIcon,
  });

  factory DrawerConfig.fromJson(Map<String, dynamic> srcJson) =>
      _$DrawerConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DrawerConfigToJson(this);

  @override
  List<Object> get props => [isDivider, text, iconData, assetIcon, urlIcon];
}

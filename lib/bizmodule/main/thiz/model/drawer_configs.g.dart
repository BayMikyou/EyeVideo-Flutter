// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_configs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrawerConfigsModel _$DrawerConfigsModelFromJson(Map<String, dynamic> json) {
  return DrawerConfigsModel(
    configs: (json['configs'] as List)
        ?.map((e) =>
            e == null ? null : DrawerConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    extendConfigs: (json['extend_configs'] as List)
        ?.map((e) =>
            e == null ? null : DrawerConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DrawerConfigsModelToJson(DrawerConfigsModel instance) =>
    <String, dynamic>{
      'configs': instance.configs,
      'extend_configs': instance.extendConfigs,
    };

DrawerConfig _$DrawerConfigFromJson(Map<String, dynamic> json) {
  return DrawerConfig(
    isDivider: json['is_divider'] as bool,
    text: json['text'] as String,
    assetIcon: json['asset_icon'] as String,
    urlIcon: json['url_icon'] as String,
  );
}

Map<String, dynamic> _$DrawerConfigToJson(DrawerConfig instance) =>
    <String, dynamic>{
      'is_divider': instance.isDivider,
      'text': instance.text,
      'asset_icon': instance.assetIcon,
      'url_icon': instance.urlIcon,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectionModel _$SelectionModelFromJson(Map<String, dynamic> json) {
  return SelectionModel(
    (json['itemList'] as List)
        ?.map((e) =>
            e == null ? null : Selection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as int,
    json['total'] as int,
    json['nextPageUrl'] as String,
    json['adExist'] as bool,
  );
}

Map<String, dynamic> _$SelectionModelToJson(SelectionModel instance) =>
    <String, dynamic>{
      'itemList': instance.selectionList,
      'count': instance.count,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'adExist': instance.adExist,
    };

Selection _$SelectionFromJson(Map<String, dynamic> json) {
  return Selection(
    json['type'] as String,
    json['data'] == null
        ? null
        : SelectionData.fromJson(json['data'] as Map<String, dynamic>),
    json['tag'] as String,
    json['id'] as int,
    json['adIndex'] as int,
  );
}

Map<String, dynamic> _$SelectionToJson(Selection instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'tag': instance.tag,
      'id': instance.id,
      'adIndex': instance.adIndex,
    };

SelectionData _$SelectionDataFromJson(Map<String, dynamic> json) {
  return SelectionData(
    json['dataType'] as String,
    json['header'] == null
        ? null
        : SelectionHeader.fromJson(json['header'] as Map<String, dynamic>),
    (json['itemList'] as List)
        ?.map((e) =>
            e == null ? null : Selection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as int,
    (json['addTrack'] as List)?.map((e) => e as String)?.toList(),
    json['id'] as int,
    json['type'] as String,
    json['text'] as String,
    json['subTitle'] as String,
    json['actionUrl'] as String,
    json['follow'] == null
        ? null
        : Follow.fromJson(json['follow'] as Map<String, dynamic>),
    json['content'] == null
        ? null
        : Selection.fromJson(json['content'] as Map<String, dynamic>),
    json['title'] as String,
    json['description'] as String,
    (json['tags'] as List)
        ?.map(
            (e) => e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['consumption'] == null
        ? null
        : Consumption.fromJson(json['consumption'] as Map<String, dynamic>),
    json['resourceType'] as String,
    json['provider'] == null
        ? null
        : Provider.fromJson(json['provider'] as Map<String, dynamic>),
    json['category'] as String,
    json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    json['cover'] == null
        ? null
        : Cover.fromJson(json['cover'] as Map<String, dynamic>),
    json['playUrl'] as String,
    json['duration'] as int,
    json['webUrl'] == null
        ? null
        : WebUrl.fromJson(json['webUrl'] as Map<String, dynamic>),
    json['releaseTime'] as int,
    (json['playInfo'] as List)
        ?.map((e) =>
            e == null ? null : PlayInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['date'] as int,
    (json['labelList'] as List)?.map((e) => e as String)?.toList(),
    json['collected'] as bool,
    json['reallyCollected'] as bool,
    json['played'] as bool,
    json['src'] as int,
  );
}

Map<String, dynamic> _$SelectionDataToJson(SelectionData instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'header': instance.header,
      'itemList': instance.selectionList,
      'count': instance.count,
      'addTrack': instance.addTrack,
      'id': instance.id,
      'type': instance.type,
      'text': instance.text,
      'subTitle': instance.subTitle,
      'actionUrl': instance.actionUrl,
      'follow': instance.follow,
      'content': instance.content,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'consumption': instance.consumption,
      'resourceType': instance.resourceType,
      'provider': instance.provider,
      'category': instance.category,
      'author': instance.author,
      'cover': instance.cover,
      'playUrl': instance.playUrl,
      'duration': instance.duration,
      'webUrl': instance.webUrl,
      'releaseTime': instance.releaseTime,
      'playInfo': instance.playInfo,
      'date': instance.date,
      'labelList': instance.labelList,
      'collected': instance.collected,
      'reallyCollected': instance.reallyCollected,
      'played': instance.played,
      'src': instance.src,
    };

SelectionHeader _$SelectionHeaderFromJson(Map<String, dynamic> json) {
  return SelectionHeader(
    json['id'] as int,
    json['title'] as String,
    json['font'] as String,
    json['subTitle'] as String,
    json['subTitleFont'] as String,
    json['textAlign'] as String,
    json['cover'] as String,
    json['label'] as String,
    json['actionUrl'] as String,
    (json['labelList'] as List)?.map((e) => e as String)?.toList(),
    json['rightText'] as String,
    json['icon'] as String,
    json['iconType'] as String,
    json['description'] as String,
    json['time'] as int,
    json['showHateVideo'] as bool,
  );
}

Map<String, dynamic> _$SelectionHeaderToJson(SelectionHeader instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'font': instance.font,
      'subTitle': instance.subTitle,
      'subTitleFont': instance.subTitleFont,
      'textAlign': instance.textAlign,
      'cover': instance.cover,
      'label': instance.label,
      'actionUrl': instance.actionUrl,
      'labelList': instance.labelList,
      'rightText': instance.rightText,
      'icon': instance.icon,
      'iconType': instance.iconType,
      'description': instance.description,
      'time': instance.time,
      'showHateVideo': instance.showHateVideo,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
    json['id'] as int,
    json['name'] as String,
    json['actionUrl'] as String,
    json['desc'] as String,
    json['bgPicture'] as String,
    json['headerImage'] as String,
    json['tagRecType'] as String,
    json['haveReward'] as bool,
    json['ifNewest'] as bool,
    json['communityIndex'] as int,
  );
}

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'actionUrl': instance.actionUrl,
      'desc': instance.desc,
      'bgPicture': instance.bgPicture,
      'headerImage': instance.headerImage,
      'tagRecType': instance.tagRecType,
      'haveReward': instance.haveReward,
      'ifNewest': instance.ifNewest,
      'communityIndex': instance.communityIndex,
    };

Consumption _$ConsumptionFromJson(Map<String, dynamic> json) {
  return Consumption(
    json['collectionCount'] as int,
    json['shareCount'] as int,
    json['replyCount'] as int,
    json['realCollectionCount'] as int,
  );
}

Map<String, dynamic> _$ConsumptionToJson(Consumption instance) =>
    <String, dynamic>{
      'collectionCount': instance.collectionCount,
      'shareCount': instance.shareCount,
      'replyCount': instance.replyCount,
      'realCollectionCount': instance.realCollectionCount,
    };

Provider _$ProviderFromJson(Map<String, dynamic> json) {
  return Provider(
    json['name'] as String,
    json['alias'] as String,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$ProviderToJson(Provider instance) => <String, dynamic>{
      'name': instance.name,
      'alias': instance.alias,
      'icon': instance.icon,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    json['id'] as int,
    json['icon'] as String,
    json['name'] as String,
    json['description'] as String,
    json['link'] as String,
    json['latestReleaseTime'] as int,
    json['videoNum'] as int,
    json['follow'] == null
        ? null
        : Follow.fromJson(json['follow'] as Map<String, dynamic>),
    json['shield'] == null
        ? null
        : Shield.fromJson(json['shield'] as Map<String, dynamic>),
    json['approvedNotReadyVideoCount'] as int,
    json['ifPgc'] as bool,
    json['recSort'] as int,
    json['expert'] as bool,
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'description': instance.description,
      'link': instance.link,
      'latestReleaseTime': instance.latestReleaseTime,
      'videoNum': instance.videoNum,
      'follow': instance.follow,
      'shield': instance.shield,
      'approvedNotReadyVideoCount': instance.approvedNotReadyVideoCount,
      'ifPgc': instance.ifPgc,
      'recSort': instance.recSort,
      'expert': instance.expert,
    };

Follow _$FollowFromJson(Map<String, dynamic> json) {
  return Follow(
    json['itemType'] as String,
    json['itemId'] as int,
    json['followed'] as bool,
  );
}

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
      'itemType': instance.itemType,
      'itemId': instance.itemId,
      'followed': instance.followed,
    };

Shield _$ShieldFromJson(Map<String, dynamic> json) {
  return Shield(
    json['itemType'] as String,
    json['itemId'] as int,
    json['shielded'] as bool,
  );
}

Map<String, dynamic> _$ShieldToJson(Shield instance) => <String, dynamic>{
      'itemType': instance.itemType,
      'itemId': instance.itemId,
      'shielded': instance.shielded,
    };

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover(
    json['feed'] as String,
    json['detail'] as String,
    json['blurred'] as String,
    json['homepage'] as String,
  );
}

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'feed': instance.feed,
      'detail': instance.detail,
      'blurred': instance.blurred,
      'homepage': instance.homepage,
    };

WebUrl _$WebUrlFromJson(Map<String, dynamic> json) {
  return WebUrl(
    json['raw'] as String,
    json['forWeibo'] as String,
  );
}

Map<String, dynamic> _$WebUrlToJson(WebUrl instance) => <String, dynamic>{
      'raw': instance.raw,
      'forWeibo': instance.forWeibo,
    };

PlayInfo _$PlayInfoFromJson(Map<String, dynamic> json) {
  return PlayInfo(
    json['height'] as int,
    json['width'] as int,
    (json['urlList'] as List)
        ?.map((e) =>
            e == null ? null : UrlList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['name'] as String,
    json['type'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PlayInfoToJson(PlayInfo instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'urlList': instance.urlList,
      'name': instance.name,
      'type': instance.type,
      'url': instance.url,
    };

UrlList _$UrlListFromJson(Map<String, dynamic> json) {
  return UrlList(
    json['name'] as String,
    json['url'] as String,
    json['size'] as int,
  );
}

Map<String, dynamic> _$UrlListToJson(UrlList instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'size': instance.size,
    };

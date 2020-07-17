import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'selection_model.g.dart';

@JsonSerializable()
class SelectionModel extends Equatable {
  @JsonKey(name: 'itemList')
  final List<Selection> selectionList;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'nextPageUrl')
  final String nextPageUrl;

  @JsonKey(name: 'adExist')
  final bool adExist;

  SelectionModel(this.selectionList, this.count, this.total, this.nextPageUrl,
      this.adExist);

  factory SelectionModel.fromJson(Map<String, dynamic> srcJson) =>
      _$SelectionModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SelectionModelToJson(this);

  @override
  List<Object> get props => [selectionList, count, total, nextPageUrl, adExist];
}

@JsonSerializable()
class Selection extends Equatable {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'data')
  final SelectionData data;

  @JsonKey(name: 'tag')
  final String tag;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'adIndex')
  final int adIndex;

  Selection(this.type, this.data, this.tag, this.id, this.adIndex);

  factory Selection.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$SelectionFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$SelectionToJson(this);

  @override
  List<Object> get props => [type, data, tag, id, adIndex];
}

@JsonSerializable()
class SelectionData extends Equatable {
  @JsonKey(name: 'dataType')
  final String dataType;

  @JsonKey(name: 'header')
  final SelectionHeader header;

  @JsonKey(name: 'itemList')
  final List<Selection> selectionList;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'addTrack')
  final List<String> addTrack;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'text')
  final String text;

  @JsonKey(name: 'subTitle')
  final String subTitle;

  @JsonKey(name: 'actionUrl')
  final String actionUrl;

  @JsonKey(name: 'follow')
  final Follow follow;

  @JsonKey(name: 'content')
  final Selection content;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'tags')
  final List<Tags> tags;

  @JsonKey(name: 'consumption')
  final Consumption consumption;

  @JsonKey(name: 'resourceType')
  final String resourceType;

  @JsonKey(name: 'provider')
  final Provider provider;

  @JsonKey(name: 'category')
  final String category;

  @JsonKey(name: 'author')
  final Author author;

  @JsonKey(name: 'cover')
  final Cover cover;

  @JsonKey(name: 'playUrl')
  final String playUrl;

  @JsonKey(name: 'duration')
  final int duration;

  @JsonKey(name: 'webUrl')
  final WebUrl webUrl;

  @JsonKey(name: 'releaseTime')
  final int releaseTime;

  @JsonKey(name: 'playInfo')
  final List<PlayInfo> playInfo;

  @JsonKey(name: 'date')
  final int date;

  @JsonKey(name: 'labelList')
  final List<String> labelList;

  @JsonKey(name: 'collected')
  final bool collected;

  @JsonKey(name: 'reallyCollected')
  final bool reallyCollected;

  @JsonKey(name: 'played')
  final bool played;

  @JsonKey(name: 'src')
  final int src;

  SelectionData(
      this.dataType,
      this.header,
      this.selectionList,
      this.count,
      this.addTrack,
      this.id,
      this.type,
      this.text,
      this.subTitle,
      this.actionUrl,
      this.follow,
      this.content,
      this.title,
      this.description,
      this.tags,
      this.consumption,
      this.resourceType,
      this.provider,
      this.category,
      this.author,
      this.cover,
      this.playUrl,
      this.duration,
      this.webUrl,
      this.releaseTime,
      this.playInfo,
      this.date,
      this.labelList,
      this.collected,
      this.reallyCollected,
      this.played,
      this.src);

  @override
  List<Object> get props => [
        dataType,
        header,
        selectionList,
        count,
        addTrack,
        id,
        type,
        text,
        subTitle,
        actionUrl,
        follow,
        content,
        title,
        description,
        tags,
        consumption,
        resourceType,
        provider,
        category,
        author,
        cover,
        playUrl,
        duration,
        webUrl,
        releaseTime,
        playInfo,
        date,
        labelList,
        collected,
        reallyCollected,
        played,
        src
      ];

  factory SelectionData.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$SelectionDataFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$SelectionDataToJson(this);
}

@JsonSerializable()
class SelectionHeader extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'font')
  final String font;
  @JsonKey(name: 'subTitle')
  final String subTitle;
  @JsonKey(name: 'subTitleFont')
  final String subTitleFont;
  @JsonKey(name: 'textAlign')
  final String textAlign;
  @JsonKey(name: 'cover')
  final String cover;
  @JsonKey(name: 'label')
  final String label;
  @JsonKey(name: 'actionUrl')
  final String actionUrl;
  @JsonKey(name: 'labelList')
  final List<String> labelList;
  @JsonKey(name: 'rightText')
  final String rightText;
  @JsonKey(name: 'icon')
  final String icon;
  @JsonKey(name: 'iconType')
  final String iconType;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'time')
  final int time;
  @JsonKey(name: 'showHateVideo')
  final bool showHateVideo;

  const SelectionHeader(
    this.id,
    this.title,
    this.font,
    this.subTitle,
    this.subTitleFont,
    this.textAlign,
    this.cover,
    this.label,
    this.actionUrl,
    this.labelList,
    this.rightText,
    this.icon,
    this.iconType,
    this.description,
    this.time,
    this.showHateVideo,
  );

  @override
  List<Object> get props => [
        this.id,
        this.title,
        this.font,
        this.subTitle,
        this.subTitleFont,
        this.textAlign,
        this.cover,
        this.label,
        this.actionUrl,
        this.labelList,
        this.rightText,
        this.icon,
        this.iconType,
        this.description,
        this.time,
        this.showHateVideo
      ];

  factory SelectionHeader.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$SelectionHeaderFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$SelectionHeaderToJson(this);
}

@JsonSerializable()
class Tags extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'actionUrl')
  final String actionUrl;

  @JsonKey(name: 'desc')
  final String desc;

  @JsonKey(name: 'bgPicture')
  final String bgPicture;

  @JsonKey(name: 'headerImage')
  final String headerImage;

  @JsonKey(name: 'tagRecType')
  final String tagRecType;

  @JsonKey(name: 'haveReward')
  final bool haveReward;

  @JsonKey(name: 'ifNewest')
  final bool ifNewest;

  @JsonKey(name: 'communityIndex')
  final int communityIndex;

  Tags(
    this.id,
    this.name,
    this.actionUrl,
    this.desc,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.haveReward,
    this.ifNewest,
    this.communityIndex,
  );

  factory Tags.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$TagsFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        id,
        name,
        actionUrl,
        desc,
        bgPicture,
        headerImage,
        tagRecType,
        haveReward,
        ifNewest,
        communityIndex,
      ];
}

@JsonSerializable()
class Consumption extends Equatable {
  @JsonKey(name: 'collectionCount')
  final int collectionCount;

  @JsonKey(name: 'shareCount')
  final int shareCount;

  @JsonKey(name: 'replyCount')
  final int replyCount;

  @JsonKey(name: 'realCollectionCount')
  final int realCollectionCount;

  Consumption(
    this.collectionCount,
    this.shareCount,
    this.replyCount,
    this.realCollectionCount,
  );

  factory Consumption.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$ConsumptionFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        collectionCount,
        shareCount,
        replyCount,
        realCollectionCount,
      ];
}

@JsonSerializable()
class Provider extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'alias')
  final String alias;

  @JsonKey(name: 'icon')
  final String icon;

  Provider(
    this.name,
    this.alias,
    this.icon,
  );

  factory Provider.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$ProviderFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        name,
        alias,
        icon,
      ];
}

@JsonSerializable()
class Author extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'icon')
  final String icon;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'link')
  final String link;

  @JsonKey(name: 'latestReleaseTime')
  final int latestReleaseTime;

  @JsonKey(name: 'videoNum')
  final int videoNum;

  @JsonKey(name: 'follow')
  final Follow follow;

  @JsonKey(name: 'shield')
  final Shield shield;

  @JsonKey(name: 'approvedNotReadyVideoCount')
  final int approvedNotReadyVideoCount;

  @JsonKey(name: 'ifPgc')
  final bool ifPgc;

  @JsonKey(name: 'recSort')
  final int recSort;

  @JsonKey(name: 'expert')
  final bool expert;

  Author(
    this.id,
    this.icon,
    this.name,
    this.description,
    this.link,
    this.latestReleaseTime,
    this.videoNum,
    this.follow,
    this.shield,
    this.approvedNotReadyVideoCount,
    this.ifPgc,
    this.recSort,
    this.expert,
  );

  factory Author.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$AuthorFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        id,
        icon,
        name,
        description,
        link,
        latestReleaseTime,
        videoNum,
        follow,
        shield,
        approvedNotReadyVideoCount,
        ifPgc,
        recSort,
        expert,
      ];
}

@JsonSerializable()
class Follow extends Equatable {
  @JsonKey(name: 'itemType')
  final String itemType;

  @JsonKey(name: 'itemId')
  final int itemId;

  @JsonKey(name: 'followed')
  final bool followed;

  Follow(
    this.itemType,
    this.itemId,
    this.followed,
  );

  factory Follow.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$FollowFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        itemType,
        itemId,
        followed,
      ];
}

@JsonSerializable()
class Shield extends Equatable {
  @JsonKey(name: 'itemType')
  final String itemType;

  @JsonKey(name: 'itemId')
  final int itemId;

  @JsonKey(name: 'shielded')
  final bool shielded;

  Shield(
    this.itemType,
    this.itemId,
    this.shielded,
  );

  factory Shield.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$ShieldFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [itemType, itemId, shielded];
}

@JsonSerializable()
class Cover extends Equatable {
  @JsonKey(name: 'feed')
  final String feed;

  @JsonKey(name: 'detail')
  final String detail;

  @JsonKey(name: 'blurred')
  final String blurred;

  @JsonKey(name: 'homepage')
  final String homepage;

  Cover(
    this.feed,
    this.detail,
    this.blurred,
    this.homepage,
  );

  factory Cover.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$CoverFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        feed,
        detail,
        blurred,
        homepage,
      ];
}

@JsonSerializable()
class WebUrl extends Equatable {
  @JsonKey(name: 'raw')
  final String raw;

  @JsonKey(name: 'forWeibo')
  final String forWeibo;

  WebUrl(
    this.raw,
    this.forWeibo,
  );

  factory WebUrl.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$WebUrlFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [raw, forWeibo];
}

@JsonSerializable()
class PlayInfo extends Equatable {
  @JsonKey(name: 'height')
  final int height;

  @JsonKey(name: 'width')
  final int width;

  @JsonKey(name: 'urlList')
  final List<UrlList> urlList;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'url')
  final String url;

  PlayInfo(
    this.height,
    this.width,
    this.urlList,
    this.name,
    this.type,
    this.url,
  );

  factory PlayInfo.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$PlayInfoFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        height,
        width,
        urlList,
        name,
        type,
        url,
      ];
}

@JsonSerializable()
class UrlList extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'size')
  final int size;

  UrlList(
    this.name,
    this.url,
    this.size,
  );

  factory UrlList.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$UrlListFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  @override
  List<Object> get props => [
        name,
        url,
        size,
      ];
}

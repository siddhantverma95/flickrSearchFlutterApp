import 'dart:convert';

import 'package:equatable/equatable.dart';

class SearchResult extends Equatable{
    final Photos photos;
    final String stat;

    SearchResult({
        this.photos,
        this.stat,
    });

    SearchResult copyWith({
        Photos photos,
        String stat,
    }) => 
        SearchResult(
            photos: photos ?? this.photos,
            stat: stat ?? this.stat,
        );

    factory SearchResult.fromRawJson(String str) => SearchResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        photos: json["photos"] == null ? null : Photos.fromJson(json["photos"]),
        stat: json["stat"] == null ? null : json["stat"],
    );

    Map<String, dynamic> toJson() => {
        "photos": photos == null ? null : photos.toJson(),
        "stat": stat == null ? null : stat,
    };

  @override
  List<Object> get props => [photos, stat];
}

class Photos extends Equatable{
    final int page;
    final int pages;
    final int perpage;
    final String total;
    final List<Photo> photo;

    Photos({
        this.page,
        this.pages,
        this.perpage,
        this.total,
        this.photo,
    });

    Photos copyWith({
        int page,
        int pages,
        int perpage,
        String total,
        List<Photo> photo,
    }) => 
        Photos(
            page: page ?? this.page,
            pages: pages ?? this.pages,
            perpage: perpage ?? this.perpage,
            total: total ?? this.total,
            photo: photo ?? this.photo,
        );

    factory Photos.fromRawJson(String str) => Photos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        page: json["page"] == null ? null : json["page"],
        pages: json["pages"] == null ? null : json["pages"],
        perpage: json["perpage"] == null ? null : json["perpage"],
        total: json["total"] == null ? null : json["total"],
        photo: json["photo"] == null ? null : List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "pages": pages == null ? null : pages,
        "perpage": perpage == null ? null : perpage,
        "total": total == null ? null : total,
        "photo": photo == null ? null : List<dynamic>.from(photo.map((x) => x.toJson())),
    };

  @override
  List<Object> get props => [page, pages, perpage, photo, total];
}

class Photo extends Equatable{
    final String id;
    final Owner owner;
    final String secret;
    final String server;
    final int farm;
    final String title;
    final int ispublic;
    final int isfriend;
    final int isfamily;
    final String urlO;
    final int heightO;
    final int widthO;

    Photo({
        this.id,
        this.owner,
        this.secret,
        this.server,
        this.farm,
        this.title,
        this.ispublic,
        this.isfriend,
        this.isfamily,
        this.urlO,
        this.heightO,
        this.widthO,
    });

    Photo copyWith({
        String id,
        Owner owner,
        String secret,
        String server,
        int farm,
        String title,
        int ispublic,
        int isfriend,
        int isfamily,
        String urlO,
        int heightO,
        int widthO,
    }) => 
        Photo(
            id: id ?? this.id,
            owner: owner ?? this.owner,
            secret: secret ?? this.secret,
            server: server ?? this.server,
            farm: farm ?? this.farm,
            title: title ?? this.title,
            ispublic: ispublic ?? this.ispublic,
            isfriend: isfriend ?? this.isfriend,
            isfamily: isfamily ?? this.isfamily,
            urlO: urlO ?? this.urlO,
            heightO: heightO ?? this.heightO,
            widthO: widthO ?? this.widthO,
        );

    factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"] == null ? null : json["id"],
        owner: json["owner"] == null ? null : ownerValues.map[json["owner"]],
        secret: json["secret"] == null ? null : json["secret"],
        server: json["server"] == null ? null : json["server"],
        farm: json["farm"] == null ? null : json["farm"],
        title: json["title"] == null ? null : json["title"],
        ispublic: json["ispublic"] == null ? null : json["ispublic"],
        isfriend: json["isfriend"] == null ? null : json["isfriend"],
        isfamily: json["isfamily"] == null ? null : json["isfamily"],
        urlO: json["url_o"] == null ? null : json["url_o"],
        heightO: json["height_o"] == null ? null : json["height_o"],
        widthO: json["width_o"] == null ? null : json["width_o"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "owner": owner == null ? null : ownerValues.reverse[owner],
        "secret": secret == null ? null : secret,
        "server": server == null ? null : server,
        "farm": farm == null ? null : farm,
        "title": title == null ? null : title,
        "ispublic": ispublic == null ? null : ispublic,
        "isfriend": isfriend == null ? null : isfriend,
        "isfamily": isfamily == null ? null : isfamily,
        "url_o": urlO == null ? null : urlO,
        "height_o": heightO == null ? null : heightO,
        "width_o": widthO == null ? null : widthO,
    };

  @override
  List<Object> get props => [farm, heightO, id, isfamily, isfriend, ispublic, owner, secret, server,
  title, urlO, widthO];
}

enum Owner { THE_113359486_N08, THE_186256146_N03, THE_185881221_N02 }

final ownerValues = EnumValues({
    "113359486@N08": Owner.THE_113359486_N08,
    "185881221@N02": Owner.THE_185881221_N02,
    "186256146@N03": Owner.THE_186256146_N03
});

class EnumValues<T> extends Equatable {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }

  @override
  List<Object> get props => [map, reverseMap];
}
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    HomeModel({
        required this.info,
        required this.item,
    });

    Info info;
    List<HomeModelItem> item;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        info: Info.fromJson(json["info"]),
        item: List<HomeModelItem>.from(json["item"].map((x) => HomeModelItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class Info {
    Info({
        required this.postmanId,
        required this.name,
        required this.schema,
        required this.exporterId,
    });

    String postmanId;
    String name;
    String schema;
    String exporterId;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
        exporterId: json["_exporter_id"],
    );

    Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
        "_exporter_id": exporterId,
    };
}

class HomeModelItem {
    HomeModelItem({
        required this.name,
        required this.item,
    });

    String name;
    List<ItemItem> item;

    factory HomeModelItem.fromJson(Map<String, dynamic> json) => HomeModelItem(
        name: json["name"],
        item: List<ItemItem>.from(json["item"].map((x) => ItemItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class ItemItem {
    ItemItem({
        required this.name,
        required this.request,
        required this.response,
        this.protocolProfileBehavior,
    });

    String name;
    Request request;
    List<dynamic> response;
    ProtocolProfileBehavior? protocolProfileBehavior;

    factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        name: json["name"],
        request: Request.fromJson(json["request"]),
        response: List<dynamic>.from(json["response"].map((x) => x)),
        protocolProfileBehavior: json["protocolProfileBehavior"] == null ? null : ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x)),
        "protocolProfileBehavior": protocolProfileBehavior?.toJson(),
    };
}

class ProtocolProfileBehavior {
    ProtocolProfileBehavior({
        required this.disabledSystemHeaders,
    });

    DisabledSystemHeaders disabledSystemHeaders;

    factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) => ProtocolProfileBehavior(
        disabledSystemHeaders: DisabledSystemHeaders.fromJson(json["disabledSystemHeaders"]),
    );

    Map<String, dynamic> toJson() => {
        "disabledSystemHeaders": disabledSystemHeaders.toJson(),
    };
}

class DisabledSystemHeaders {
    DisabledSystemHeaders({
        required this.accept,
    });

    bool accept;

    factory DisabledSystemHeaders.fromJson(Map<String, dynamic> json) => DisabledSystemHeaders(
        accept: json["accept"],
    );

    Map<String, dynamic> toJson() => {
        "accept": accept,
    };
}

class Request {
    Request({
        required this.method,
        required this.header,
        this.body,
        required this.url,
    });

    Method method;
    List<Header> header;
    Body? body;
    Url url;

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        method: methodValues.map[json["method"]]!,
        header: List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        url: Url.fromJson(json["url"]),
    );

    Map<String, dynamic> toJson() => {
        "method": methodValues.reverse[method],
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "body": body?.toJson(),
        "url": url.toJson(),
    };
}

class Body {
    Body({
        required this.mode,
        required this.raw,
        required this.options,
    });

    Mode mode;
    String raw;
    Options options;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: modeValues.map[json["mode"]]!,
        raw: json["raw"],
        options: Options.fromJson(json["options"]),
    );

    Map<String, dynamic> toJson() => {
        "mode": modeValues.reverse[mode],
        "raw": raw,
        "options": options.toJson(),
    };
}

enum Mode { RAW }

final modeValues = EnumValues({
    "raw": Mode.RAW
});

class Options {
    Options({
        required this.raw,
    });

    Raw raw;

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        raw: Raw.fromJson(json["raw"]),
    );

    Map<String, dynamic> toJson() => {
        "raw": raw.toJson(),
    };
}

class Raw {
    Raw({
        required this.language,
    });

    Language language;

    factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        language: languageValues.map[json["language"]]!,
    );

    Map<String, dynamic> toJson() => {
        "language": languageValues.reverse[language],
    };
}

enum Language { JSON }

final languageValues = EnumValues({
    "json": Language.JSON
});

class Header {
    Header({
        required this.key,
        required this.value,
        required this.type,
    });

    String key;
    String value;
    String type;

    factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: json["key"],
        value: json["value"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": type,
    };
}

enum Method { POST, PUT, GET, DELETE }

final methodValues = EnumValues({
    "DELETE": Method.DELETE,
    "GET": Method.GET,
    "POST": Method.POST,
    "PUT": Method.PUT
});

class Url {
    Url({
        required this.raw,
        required this.host,
        required this.path,
    });

    String raw;
    List<Host> host;
    List<String> path;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json["raw"],
        host: List<Host>.from(json["host"].map((x) => hostValues.map[x]!)),
        path: List<String>.from(json["path"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "host": List<dynamic>.from(host.map((x) => hostValues.reverse[x])),
        "path": List<dynamic>.from(path.map((x) => x)),
    };
}

enum Host { HOST }

final hostValues = EnumValues({
    "{{host}}": Host.HOST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
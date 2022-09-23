class PostModelResponse {
  final bool? success;
  final Data? data;

  PostModelResponse({
    this.success,
    this.data,
  });

  PostModelResponse copyWith({
    bool? success,
    Data? data,
  }) {
    return PostModelResponse(
      success: success ?? this.success,
      data: data ?? this.data,
    );
  }

  PostModelResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'success': success, 'data': data?.toJson()};
}

class Data {
  final List<Memes>? memes;

  Data({
    this.memes,
  });

  Data copyWith({
    List<Memes>? memes,
  }) {
    return Data(
      memes: memes ?? this.memes,
    );
  }

  Data.fromJson(Map<String, dynamic> json)
      : memes = (json['memes'] as List?)
            ?.map((dynamic e) => Memes.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'memes': memes?.map((e) => e.toJson()).toList()};
}

class Memes {
  final String? id;
  final String? name;
  final String? url;
  final int? width;
  final int? height;
  final int? boxCount;

  Memes({
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.boxCount,
  });

  Memes copyWith({
    String? id,
    String? name,
    String? url,
    int? width,
    int? height,
    int? boxCount,
  }) {
    return Memes(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      boxCount: boxCount ?? this.boxCount,
    );
  }

  Memes.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        url = json['url'] as String?,
        width = json['width'] as int?,
        height = json['height'] as int?,
        boxCount = json['box_count'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'url': url,
        'width': width,
        'height': height,
        'box_count': boxCount
      };
}

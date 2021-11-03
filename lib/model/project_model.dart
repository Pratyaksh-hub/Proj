class ProjectModel {
  late bool success;
  late Data data;

  ProjectModel({required this.success, required this.data});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  late String title;
  late String type;
  late List<Components> components;
  late String coverUrl;

  Data(
      {required this.title,
      required this.type,
      required this.components,
      required this.coverUrl});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components.add(Components.fromJson(v));
      });
    }
    coverUrl = json['coverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['components'] = components.map((v) => v.toJson()).toList();
    data['coverUrl'] = coverUrl;
    return data;
  }
}

class Components {
  late String type;
  late String url;
  late String title;
  late String desc;

  Components(
      {required this.type,
      required this.url,
      required this.title,
      required this.desc});

  Components.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }
}

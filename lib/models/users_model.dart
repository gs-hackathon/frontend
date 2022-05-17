class Users {
  List<Data> data;

  Users({this.data});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      data = <Data>[];
      json['list'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['list'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Challenges> challenges;
  int createdAt;
  String nId;
  String name;
  double points;
  String surname;
  int updatedAt;

  Data(
      {this.challenges,
      this.createdAt,
      this.nId,
      this.name,
      this.points,
      this.surname,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['challenges'] != null) {
      challenges = <Challenges>[];
      json['challenges'].forEach((v) {
        challenges.add(new Challenges.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    nId = json['n_id'];
    name = json['name'];
    points = json['points'];
    surname = json['surname'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.challenges != null) {
      data['challenges'] = this.challenges.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['n_id'] = this.nId;
    data['name'] = this.name;
    data['points'] = this.points;
    data['surname'] = this.surname;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Challenges {
  String continentName;
  int createdAt;
  String description;
  int duration;
  int durationType;
  int id;
  String image;
  String name;
  double reward;
  String shortDescription;
  int updatedAt;

  Challenges(
      {this.continentName,
      this.createdAt,
      this.description,
      this.duration,
      this.durationType,
      this.id,
      this.image,
      this.name,
      this.reward,
      this.shortDescription,
      this.updatedAt});

  Challenges.fromJson(Map<String, dynamic> json) {
    continentName = json['continent_name'];
    createdAt = json['created_at'];
    description = json['description'];
    duration = json['duration'];
    durationType = json['duration_type'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    reward = json['reward'];
    shortDescription = json['short_description'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['continent_name'] = this.continentName;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['duration_type'] = this.durationType;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['reward'] = this.reward;
    data['short_description'] = this.shortDescription;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

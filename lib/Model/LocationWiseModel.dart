class LocationWiseModel {
  int? status;
  bool? isSuccess;
  String? message;
  LocationWiseDataModel? data;

  LocationWiseModel({this.status, this.isSuccess, this.message, this.data});

  LocationWiseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null ? new LocationWiseDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LocationWiseDataModel {
  int? totalCount;
  List<Kitchens>? kitchens;

  LocationWiseDataModel({this.totalCount, this.kitchens});

  LocationWiseDataModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if (json['kitchens'] != null) {
      kitchens = <Kitchens>[];
      json['kitchens'].forEach((v) {
        kitchens!.add(new Kitchens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    if (this.kitchens != null) {
      data['kitchens'] = this.kitchens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kitchens {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? phone;
  int? noOfSeats;
  String? timings;
  int? dineIn;
  int? takeAway;
  String? description;
  String? status;
  int? open;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;
  double? distance;
  bool? isAvailable;
  String? certificateNo;
  String? abn;
  var ratingCount;
  List<Images>? images;
  bool? isFavourited;

  Kitchens(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.phone,
      this.noOfSeats,
      this.timings,
      this.dineIn,
      this.takeAway,
      this.description,
      this.status,
      this.open,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt,
      this.distance,
      this.isAvailable,
      this.certificateNo,
      this.abn,
      this.ratingCount,
      this.images,
      this.isFavourited});

  Kitchens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    noOfSeats = json['no_of_seats'];
    timings = json['timings'];
    dineIn = json['dine_in'];
    takeAway = json['take_away'];
    description = json['description'];
    status = json['status'];
    open = json['open'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
    isAvailable = json['is_available'];
    certificateNo = json['certificate_no'];
    abn = json['abn'];
    ratingCount = json['rating_count'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    isFavourited = json['is_favourited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['no_of_seats'] = this.noOfSeats;
    data['timings'] = this.timings;
    data['dine_in'] = this.dineIn;
    data['take_away'] = this.takeAway;
    data['description'] = this.description;
    data['status'] = this.status;
    data['open'] = this.open;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['distance'] = this.distance;
    data['is_available'] = this.isAvailable;
    data['certificate_no'] = this.certificateNo;
    data['abn'] = this.abn;
    data['rating_count'] = this.ratingCount;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['is_favourited'] = this.isFavourited;
    return data;
  }
}

class Images {
  int? id;
  int? refId;
  String? modelName;
  String? path;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
      this.refId,
      this.modelName,
      this.path,
      this.createdAt,
      this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refId = json['ref_id'];
    modelName = json['model_name'];
    path = json['path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ref_id'] = this.refId;
    data['model_name'] = this.modelName;
    data['path'] = this.path;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

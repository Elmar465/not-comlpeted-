class MyData {
  List<Result>? result;

  MyData({this.result});

  MyData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? name;
  String? description;
  List<Trailers>? trailers;
  String? claim;
  List<Categories>? categories;
  String? mainPicture;
  String? sliderImage;
  double? imdb;
  int? age;
  String? type;
  int? hit;
  int? price;
  String? slug;

  Result(
      {this.id,
      this.name,
      this.description,
      this.trailers,
      this.claim,
      this.categories,
      this.mainPicture,
      this.sliderImage,
      this.imdb,
      this.age,
      this.type,
      this.hit,
      this.price,
      this.slug});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(new Trailers.fromJson(v));
      });
    }
    claim = json['claim'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    mainPicture = json['main_picture'];
    sliderImage = json['slider_image'];
    imdb = json['imdb'];
    age = json['age'];
    type = json['type'];
    hit = json['hit'];
    price = json['price'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.trailers != null) {
      data['trailers'] = this.trailers!.map((v) => v.toJson()).toList();
    }
    data['claim'] = this.claim;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['main_picture'] = this.mainPicture;
    data['slider_image'] = this.sliderImage;
    data['imdb'] = this.imdb;
    data['age'] = this.age;
    data['type'] = this.type;
    data['hit'] = this.hit;
    data['price'] = this.price;
    data['slug'] = this.slug;
    return data;
  }
}

class Trailers {
  String? name;
  String? url;

  Trailers({this.name, this.url});

  Trailers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Categories {
  String? name;
  String? langCode;

  Categories({this.name, this.langCode});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    langCode = json['lang_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lang_code'] = this.langCode;
    return data;
  }
}

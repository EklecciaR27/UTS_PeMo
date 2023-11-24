class Movies {
  String img = "";
  String title = "";
  String duration = "";
  String category = "";
  String rating = "";
  String star = "";
  String globe = "";
  String director = "";
  String storyLine = "";

  Movies({
    required this.img,
    required this.title,
    required this.duration,
    required this.category,
    required this.rating,
    required this.star,
    required this.globe,
    required this.director,
    required this.storyLine,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      img: json['img'],
      title: json['title'],
      duration: json['duration'],
      category: json['category'],
      rating: json['rating'],
      star: json['star'],
      globe: json['globe'],
      director: json['director'],
      storyLine: json['storyLine'],
    );
  }

  static List<Movies> myMovies = [];
}

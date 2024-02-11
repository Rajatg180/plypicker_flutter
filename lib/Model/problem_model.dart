class UserStatusModel {
  final List<UserStatusDetails> result;

  UserStatusModel({required this.result});

  factory UserStatusModel.fromJson(List<dynamic> json) {
    List<UserStatusDetails> result =
        json.map((status) => UserStatusDetails.fromJson(status)).toList();
    return UserStatusModel(result: result);
  }
}

class UserStatusDetails {
  final int id;
  final int contestId;
  final int creationTimeSeconds;
  final int relativeTimeSeconds;
  final ProblemDetails problem;
  final String programmingLanguage;
  final String verdict;

  UserStatusDetails({
    required this.id,
    required this.contestId,
    required this.creationTimeSeconds,
    required this.relativeTimeSeconds,
    required this.problem,
    required this.programmingLanguage,
    required this.verdict,
  });

  factory UserStatusDetails.fromJson(Map<String, dynamic> json) {
    return UserStatusDetails(
      id: json['id'] ?? 0,
      contestId: json['contestId'] ?? 0,
      creationTimeSeconds: json['creationTimeSeconds'] ?? 0,
      relativeTimeSeconds: json['relativeTimeSeconds'] ?? 0,
      problem: ProblemDetails.fromJson(json['problem'] ?? {}),
      programmingLanguage: json['programmingLanguage'] ?? '',
      verdict: json['verdict'] ?? '',
    );
  }
}

class ProblemDetails {
  final int contestId;
  final String index;
  final String name;
  final String type;
  final double points;
  final int rating;
  final List<String> tags;

  ProblemDetails({
    required this.contestId,
    required this.index,
    required this.name,
    required this.type,
    required this.points,
    required this.rating,
    required this.tags,
  });

  factory ProblemDetails.fromJson(Map<String, dynamic> json) {
    return ProblemDetails(
      contestId: json['contestId'] ?? 0,
      index: json['index'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      points: json['points'] ?? 0.0,
      rating: json['rating'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
}

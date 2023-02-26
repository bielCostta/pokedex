import 'package:equatable/equatable.dart';

class StatusEntity extends Equatable {
  const StatusEntity({
    this.baseStat,
    this.effort,
    this.stat,
  });

  final int? baseStat;
  final int? effort;
  final Stat? stat;

  StatusEntity copyWith({
    int? baseStat,
    int? effort,
    Stat? stat,
  }) =>
      StatusEntity(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory StatusEntity.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const StatusEntity();
    return StatusEntity(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };

  @override
  List<Object?> get props => [baseStat, effort, stat];
}

class Stat extends Equatable {
  const Stat({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  Stat copyWith({
    String? name,
    String? url,
  }) =>
      Stat(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  @override
  List<Object?> get props => [name, url];
}

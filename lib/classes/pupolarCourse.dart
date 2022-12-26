import 'package:suggest/classes/suggestion.dart';

class PopularCourse {
  final String code;
  final String sbj;
  final String faculty;
  final List<Suggestion> suggestions;
  final double difficulty;
  final double workload;

  PopularCourse({
    required this.code,
    required this.sbj,
    required this.faculty,
    required this.suggestions,
    required this.difficulty,
    required this.workload,
  });
}

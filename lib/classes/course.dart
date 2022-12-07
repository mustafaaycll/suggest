import 'package:suggest/classes/suggestion.dart';

class Course {
  final String code;
  final String sbj;
  final String faculty;
  final String instructorName;
  final String description;
  final Suggestion instructorSuggestion;
  final List<Suggestion> suggestions;
  final int difficulty;
  final int workload;
  final int su;
  final int ects;

  Course({
    required this.code,
    required this.sbj,
    required this.faculty,
    required this.instructorName,
    required this.description,
    required this.instructorSuggestion,
    required this.suggestions,
    required this.difficulty,
    required this.workload,
    required this.su,
    required this.ects,
  });
}

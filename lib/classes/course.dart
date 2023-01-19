import 'dart:async';

import 'package:suggest/classes/suggestion.dart';
import 'package:suggest/data.dart';

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

List<Course> filteredCourses(List<Course> courses, List<String> codes) {
  return List<Course>.from(courses.where((element) {
    return codes.contains(element.code.toUpperCase());
  })).toList();
}

class StreamedCourses {
  var courses = initializeCourses();
  final _controller = StreamController<List<Course>>();
  Stream<List<Course>> get stream => _controller.stream;

  void initialize() async {
    _controller.sink.add(courses);
  }

  void addSuggestion(Suggestion suggestion, Course course) {
    List<Course> temp = [];

    for (var i = 0; i < courses.length; i++) {
      print(i);
      if (course.code.toUpperCase() == courses[i].code.toUpperCase()) {
        List<Suggestion> tempS = courses[i].suggestions;
        tempS.insert(0, suggestion);
        Course tempC = Course(
          code: courses[i].code,
          sbj: courses[i].sbj,
          faculty: courses[i].faculty,
          instructorName: courses[i].instructorName,
          description: courses[i].description,
          instructorSuggestion: courses[i].instructorSuggestion,
          suggestions: tempS,
          difficulty: courses[i].difficulty,
          workload: courses[i].workload,
          su: courses[i].su,
          ects: courses[i].ects,
        );
        temp.add(tempC);
      } else {
        temp.add(courses[i]);
      }
    }
    _controller.add(temp);
  }
}

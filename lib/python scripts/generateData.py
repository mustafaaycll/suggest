from faker import Faker
import random as rnd

def generateUsername(name):
    elems = [n.lower() for n in name.split(' ')]
    return ".".join(elems)

fake = Faker(['en_US', 'tr_TR'])

file = open("allCourses.txt", "r")
lines = file.readlines()

dart = "List<Course> courses = <Course>[];\n"

for i, line in enumerate(lines):
    print(i)
    elems = line.strip().split('_')
    code = elems[0].strip()
    sbj = elems[1].strip()
    faculty = elems[2].strip()
    instructorName = fake.name()
    while len(instructorName.split(' ')) > 2:
        instructorName = fake.name()

    instructorText = fake.text()
    instructorSuggestion = "Suggestion instructor{} = Suggestion(uname: \"{}\", rank: \"Instructor\", image: \"placeholder\", text: \"{}\", faculty: \"{}\");\n".format(str(i), generateUsername(instructorName), instructorText.replace('\n', ' '), faculty)

    numOfSugg = rnd.randint(4,10)
    possibleFaculties = ["fman", "fens", "fass"]

    studentSuggestionsList = "[{}]"
    studentSuggestionBase = "Suggestion(uname: \"{}\", rank: \"Student\", image: \"placeholder\", text: \"{}\", faculty: \"{}\")"
    studentSuggestions = []
    for j in range(numOfSugg):
        studentName = fake.name()
        while len(studentName.split(' ')) > 2:
            studentName = fake.name()
        studentText = fake.text()
        tempStudentSuggestionBase = studentSuggestionBase
        tempStudentSuggestionBase = tempStudentSuggestionBase.format(generateUsername(studentName), studentText.replace('\n', ' '), rnd.choice(possibleFaculties))
        studentSuggestions.append(tempStudentSuggestionBase)
    studentSuggestionsList.format(',\n'.join(studentSuggestions))
    print(studentSuggestions)

    script = instructorSuggestion
    script += "Course {} = Course(code: \"{}\", sbj: \"{}\", faculty: \"{}\", instructorName: \"{}\", description: \"{}\", instructorSuggestion: {}, suggestions: {}, difficulty: {}, workload: {}, su: {}, ects: {});\ncourses.add({});\n".format(code.replace(' ', ''), code.replace(' ', ''), sbj.replace("\"", "\\\""), faculty, instructorName, "Trial description, later will be replaced", "instructor"+str(i), studentSuggestionsList.format(',\n'.join(studentSuggestions)), rnd.choice([1,2,3,4,5]), rnd.choice([1,2,3,4,5]), rnd.choice([3,4]), rnd.choice([6,7]), code.replace(' ', ''))

    dart += script

output = open("exportedCoursesDart.txt", "w")
output.writelines(dart)
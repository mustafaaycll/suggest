from faker import Faker
import random as rnd
import cv2
import random_face

images = [str(x) for x in range(0, 500)]
chosenImages = []

def unTurk(uname):
    uname = uname.replace("ç", "c")
    uname = uname.replace("ş", "s")
    uname = uname.replace("ğ", "g")
    uname = uname.replace("ı", "i")
    uname = uname.replace("ö", "o")
    uname = uname.replace("ü", "u")
    return uname

def generateUsername(name, isInstructor):
    elems = [n.lower() for n in name.split(' ')]
    if isInstructor:
        return unTurk(".".join(elems))
    else:
        return unTurk("".join(elems))

fake = Faker(['en_US', 'tr_TR'])
engine = random_face.get_engine()

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
    while len(instructorName.split(' ')) > 2 or "." in instructorName:
        instructorName = fake.name()

    instructorText = fake.text()
    instructorUname = generateUsername(instructorName, True)
    instructorPic = rnd.choice(images)
    while instructorPic in chosenImages:
        instructorPic = rnd.choice(images)

    chosenImages.append(instructorPic)

    instructorSuggestion = "Suggestion instructor{} = Suggestion(uname: \"{}\", rank: \"Instructor\", image: \"{}\", text: \"{}\", faculty: \"{}\");\n".format(str(i), instructorUname, instructorPic, instructorText.replace('\n', ' '), faculty)


    numOfSugg = rnd.randint(4,10)
    possibleFaculties = ["fman", "fens", "fass"]

    studentSuggestionsList = "[{}]"
    studentSuggestionBase = "Suggestion(uname: \"{}\", rank: \"Student\", image: \"{}\", text: \"{}\", faculty: \"{}\")"
    studentSuggestions = []
    for j in range(numOfSugg):
        studentName = fake.name()
        while len(studentName.split(' ')) > 2 or "." in studentName:
            studentName = fake.name()
        studentUname = generateUsername(studentName, False)

        studentPic = rnd.choice(images)
        while studentPic in chosenImages:
            studentPic = rnd.choice(images)

        chosenImages.append(studentPic)

        studentText = fake.text()
        tempStudentSuggestionBase = studentSuggestionBase
        tempStudentSuggestionBase = tempStudentSuggestionBase.format(studentUname, studentPic, studentText.replace('\n', ' '), rnd.choice(possibleFaculties))
        studentSuggestions.append(tempStudentSuggestionBase)
    studentSuggestionsList.format(',\n'.join(studentSuggestions))
    print(studentSuggestions)

    script = instructorSuggestion
    script += "Course {} = Course(code: \"{}\", sbj: \"{}\", faculty: \"{}\", instructorName: \"{}\", description: \"{}\", instructorSuggestion: {}, suggestions: {}, difficulty: {}, workload: {}, su: {}, ects: {});\ncourses.add({});\n".format(code.replace(' ', ''), code.replace(' ', ''), sbj.replace("\"", "\\\""), faculty, instructorName, fake.text().replace("\n", " ").replace("\"", "\\\""), "instructor"+str(i), studentSuggestionsList.format(',\n'.join(studentSuggestions)), rnd.choice([1,2,3,4,5]), rnd.choice([1,2,3,4,5]), rnd.choice([3,4]), rnd.choice([6,7]), code.replace(' ', ''))

    dart += script
    chosenImages = []

output = open("exportedCoursesDart.txt", "w")

output.writelines(dart)

output.close()
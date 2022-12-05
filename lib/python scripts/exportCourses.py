
file = open("allCourses.txt", "r")
lines = file.readlines()

dart = "List<Course> courses = <Course>[];\n"

for i, line in enumerate(lines):
    print(i)
    elems = line.strip().split('_')
    code = elems[0].strip()
    sbj = elems[1].strip()
    faculty = elems[2].strip()

    script = "Course " + code.replace(' ', '') + " = Course(code: \"" + code.replace(' ', '') + "\", sbj: \"" + sbj + "\", faculty: \"" + faculty + "\");\ncourses.add(" + code.replace(' ', '') + ");\n"
    dart += script

output = open("exportedCoursesDart.txt", "w")
output.writelines(dart)


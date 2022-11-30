file = open("courseCodes.txt", "r")
lines = file.readlines()
lines.sort()

output = open("courseCodesDart.txt", "w")


dart = "List<Code> codes = <Code>[];\n\n"

for i, line in enumerate(lines):
    elems = line.strip().split('-')
    code = elems[0]
    name = elems[1]
    faculty = elems[2]

    if len(elems) < 3:
        print(i)

    snippet = "Code " + code + " = Code(code: \""+ code +"\", longName: \""+ name +"\", faculty: \"" + faculty + "\");\ncodes.add("+ code+");\n\n"
    dart += snippet

output.write(dart)





pub = open("pubspec.txt", "w")
out = ""
for i in [str(x) for x in range(0,500)]:
    out+="- assets/images/{}.jpg\n".format(i)

pub.writelines(out)
pub.close()
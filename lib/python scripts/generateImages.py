import cv2
import random_face
from threading import Thread

names = [str(i) for i in range(0,500)]

def task(sublist, id):
    engine = random_face.get_engine()
    for n in sublist:
        print("Thread {} working on {}".format(str(id), n))
        face = engine.get_random_face()
        cv2.imwrite("userImages/{}.jpg".format(n), face)

def generate_sublist(master, number, remainder):
    childs = []
    temp = []

    i = 0
    for elem in master:
        temp.append(elem.strip())
        if i == number - 1:
            childs.append(temp)
            temp = []
            i = 0
        else:
            i += 1

    if remainder != 0:
        childs.append([x.strip() for x in master[-1*remainder:]])

    return childs



"""names = open("unames.txt", "r")

lines = names.readlines()
names.close()"""

thread_count = 10
element_count_for_one_thread = len(names) // thread_count
remaining_elems = len(names) % thread_count

groupedNames = generate_sublist(names, element_count_for_one_thread, remaining_elems)

threads = []

for id, child in enumerate(groupedNames):
    thread = Thread(target=task, args=[child, id])
    threads.append(thread)
    thread.start()

pubspec = open("pubspec.txt", "w")
p = ""
for n in names:
    p += "assets/images/{}.jpg\n".format(n.strip())
pubspec.writelines(p)
pubspec.close()

for t in threads:
    t.join()

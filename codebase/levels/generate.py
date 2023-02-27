import os.path as path

file = "clean.txt"

if not path.exists(file):
    f = open(file, "w")

    for row in range(0, 19):
        for col in range(0, 37):
            if (col == 36):
                f.write("1")
            elif (col == 0 or row == 0 or row == 18):
                f.write("1,")
            else:
                f.write("0,")
        f.write("\n")

    f.close()
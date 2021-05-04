lines_seen = set() # holds lines already seen

with open("corpus-porpus.txt", "r+", encoding="utf-8") as f:
    d = f.readlines()
    f.seek(0)
    for i in d:
        if i not in lines_seen:
            f.write(i)
            lines_seen.add(i)
    f.truncate()
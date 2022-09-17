no_of_stu = int(input("enter no of students:"))
records = []
for data in range(no_of_stu):
    name = input("enter name:")
    marks = int(input("enter marks:"))
    a = [name,marks]
    records.append(a)
    print(records)
    a.clear()
print(records)
    
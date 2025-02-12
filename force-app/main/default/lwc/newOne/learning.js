const students = [];

function addstudent(stuName, stuAge, StuRollno, stuDateswhenabsent, stuAddress) {
    const student = {
        name: stuName,
        age: stuAge,
        Rollno: StuRollno,
        dateswhenabsent: stuDateswhenabsent,
        address: stuAddress,
    };
    students.push(student);
}

addstudent("john", 21, 3, [5, 6, 7], {
    street: "1st town",
    pincode: "64766"
})

console.log(JSON.stringify(students));
void main() {
  Students Zaf = Students('Zaf', 'Zaf@gmail', [10,20,30]);
  Students Zaf1 = Students('Zaf1', 'Zaf1@gmail', [10,10,20]);
  Zaf.printStudentDetails();
  Zaf1.printStudentDetails();
}

class Students {
  String? name;
  String? email;
  List<num>? marks;

  Students(this.name, this.email, this.marks);

  printStudentDetails() {
    num totalMarks = marks![0] + marks![1] + marks![2];
    print('Student Details');
    print('---------');
    print('Name: ' + name!);
    print('Email: ' + email!);
    print('Total Marks: ' + totalMarks.toString());
  }
}

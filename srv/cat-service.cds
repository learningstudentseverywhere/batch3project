using {batch3 as my} from '../db/data-model';


@path :'/wisdom'
service students{
    entity Students as projection on my.Students;
    entity Teachers as projection on my.Teachers;
    entity StudentFees as projection on my.StudentFees;
    entity Logs as projection on my.Logs;
    entity CompleteStudentInfo as projection on my.CompleteStudentInfo;
    entity Staffs as projection on my.Staffs;
    entity Parents as projection on my.Parents;
    entity StudentMarks as projection on my.StudentMarks;


   type studentmarkstype {
      subject:String;
      Marks:String;
   }

    //Structure
    type studentOutputStructure{
         student_name : String;
         fees_paid : Boolean;
         parent_name : String;
         student_marks : Array of studentmarkstype;
        
    }

    type inputStudentStructure{
        studentId:String;
        student_name:String;
    }
    function getStudentDetails(studentId:String) returns studentOutputStructure;
 
    action getStudentDetailsAction(Input:inputStudentStructure) returns studentOutputStructure;

}
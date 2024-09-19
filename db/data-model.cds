namespace batch3;

using {managed,cuid} from '@sap/cds/common';


//Datamodel file is used only for creating tables

aspect studentidaspect {
     key student_id : String;
         student_age : Integer;
}

aspect studentheight{
     student_height: Integer;
}


entity Students:studentidaspect,studentheight{
        student_name : String;
        //to_Parents : Association to many Parents on to_Parents.student_id = $self.student_id;
        to_Parents : Composition of many Parents on to_Parents.student_id = $self.student_id;
}


entity StudentMarks:studentidaspect{
      key subject:String;
      Marks:String;
}

entity Parents:studentidaspect {
    key parent_id : String;
     parent_name : String;
     to_Students : Association to many Students on to_Students.student_id  = $self.student_id;
}
entity StudentFees:studentidaspect{
        fees_paid : Boolean;   //True or false
}

entity Teachers{
    key teacher_id : String;
}


entity Logs{
    key student_id : String;
        message : String;
}


entity CompleteStudentInfo{
     key student_id : String;
        student_name : String;
        fees_paid : Boolean;  
}


entity Staffs:cuid,managed{ 
    staff_name : String;
}
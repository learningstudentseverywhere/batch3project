namespace batch3;

using {managed,cuid} from '@sap/cds/common';




aspect studentidaspect {
     key student_id : String;
         student_age : Integer;
}

aspect studentheight{
     student_height: Integer;
}

entity Students:studentidaspect,studentheight{
        student_name : String;
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
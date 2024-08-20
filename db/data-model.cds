namespace batch3;



entity Students{
    key student_id : String;
        student_name : String;
}


entity StudentFees{
    key student_id : String;   //English letters
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


entity Sample{
    key sample:String;
}
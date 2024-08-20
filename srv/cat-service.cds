using {batch3 as my} from '../db/data-model';


@path :'/wisdom'
service students{
    entity Students as projection on my.Students;
    entity Teachers as projection on my.Teachers;
    entity StudentFees as projection on my.StudentFees;
    entity Logs as projection on my.Logs;
    entity CompleteStudentInfo as projection on my.CompleteStudentInfo;
    entity Students1 as projection on my.Students;
    entity Students2 as projection on my.Students;
}
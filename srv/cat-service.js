const cds = require('@sap/cds');


module.exports = cds.service.impl(
    async function(){

   this.before('CREATE','Students',async req=>{
          
            // Fetching the student id
           let student_idFromUser = req.data.student_id; 
           
           //Check in the student fees table whether the student is present or not
            let studentPresent = await SELECT.from('batch3_StudentFees').where({student_id:student_idFromUser});

            if(studentPresent.length==0){
                req.reject({
                   code:'500',
                   message:'Please pay the fees before entering in students table' 
                });
            }
   });
    
   this.after('CREATE','Students',async req=>{
      let finalData = {
        student_id:req.student_id,
        message :"Student Created Successfully"
      }
     let valueInserted = await INSERT.into('batch3_Logs').entries(finalData);
      console.log(valueInserted);


   });


   this.on('READ','CompleteStudentInfo',async req=>{
  
          let student_idFromUser = req.params[0].student_id;
          let result = {
            "student_id" : student_idFromUser,
            "student_name" : "",
            "fees_paid" : ""
          }

          let studentName = await SELECT.from('batch3_Students').where(
            {student_id:student_idFromUser}
          );

          result.student_name = studentName[0].student_name
          let studentFees = await SELECT.from('batch3_StudentFees').where({student_id:student_idFromUser});


          result.fees_paid = studentFees[0].fees_paid

          //return result;
          req.reply(result)

   });


   this.on('CREATE','CompleteStudentInfo',async req=>{
    console.log('Entered Complete Info');
});
   
    this.on('getStudentDetails', async req => {
      let student_id = req.data.studentId!=''? req.data.studentId:"1002"
      let result = {
        student_name: "",
        fees_paid: "",
        parent_name: "",
        student_marks:[]

      }
      let studentdetails = await SELECT.from('batch3_Students').where({ student_id: student_id });
      let studentfeesdetails = await SELECT.from('batch3_StudentFees').where({ student_id: student_id });
      let studentparentdetails = await SELECT.from('batch3_Parents').where({ student_id: student_id });
      let studentMarks = await SELECT.from('batch3_StudentMarks').where({ student_id: student_id }).columns('Marks','subject').limit(5);

      result.student_name = studentdetails[0].student_name;
      result.fees_paid = studentfeesdetails[0].fees_paid;
      result.parent_name = studentparentdetails[0].parent_name;
      result.student_marks = studentMarks;
      console.log('Entered Custom Function');

      return result;
    })

   

    }
);
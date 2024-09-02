const cds = require('@sap/cds');
const registerStudentHandler = require('./Handler/studentsService');

module.exports = cds.service.impl(
    async function(){

      registerStudentHandler(this,cds);


    }
);
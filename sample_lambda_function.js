
let student = {
    Name : "Delvin Joseph",
    Course : "Bcom",
    RollNo : 44,
    Batch : 2020
    }
exports.handler = async (event) => {
    // TODO implement
  console.log("<<< Working Fine >>>");
   if(event.httpMethod==='GET'){
       return getStudentRecord(event);
       
  }
   if(event.httpMethod==='POST'){
       return createStudentRecord(event);
   }
   
};  
   
   
 function getStudentRecord(event){
     
     const response={
         statusCode: 200,
         body: JSON.stringify({
             student_details: student
         })
     };
     return response;
 }
 
 function createStudentRecord(event){
     const body = JSON.parse(event.body);
     const response={
         statusCode : 200,
         body : JSON.stringify({
             message : "Successfully Created",
             details : body
         })
     };
   return response;
 }
 

   
   
   
   
   
   
   

import { faker } from '@faker-js/faker';
import fs from "fs";

const numberOfRows = 250_000;

let data =  "INSERT INTO account"+"\n"+"\t(first_name, last_name, nickname, birthday, gender, email, profile_pic)"+"\n"+"\tVALUES";

for (let i = 0; i <numberOfRows; i++) {
   let firstName = faker.name.firstName().replace('\'', '');
   let lastName = faker.name.lastName().replace('\'', '');
   let nickName;
   if(firstName.length>5){
        nickName= firstName.slice(0, 5);
   }else{
    nickName=firstName;
   }
   let birthday = `${faker.date.betweens('1990-01-01', '2004-01-01', 1)[0].toISOString().split('T')[0]}`;
   let gender = faker.name.gender(true).charAt(0); 
   let mail = faker.unique(faker.internet.exampleEmail);

   data+= `\n('${firstName}', '${lastName}', '${nickName}', '${birthday}', '${gender}', '${nickName}.${mail}', '${firstName}.png')`;
   i + 1 < numberOfRows ? data+=",":data+=";"
}

fs.writeFile('result.sql', data, (err) => {
    if(err){
        console.log(err);
    }
}

)


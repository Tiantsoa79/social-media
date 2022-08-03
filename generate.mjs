import { faker } from '@faker-js/faker';
import fs from "fs";

const numberOfRows = 250_000;

let data =  "INSERT INTO account VALUES ";

for (let i = 0; i <=numberOfRows; i++) {
   let firstName = faker.name.firstName().replace('\'', '');
   let lastName = faker.name.lastName().replace('\'', '');
   let nickName  = faker.name.middleName().replace('\'', '');
   let birthday = `${faker.date.betweens('1990-01-01', '2004-01-01', 1)[0].toISOString().split('T')[0]}`;
   let gender = faker.name.gender(true); 
   let mail = faker.internet.email();

   data+= `\n(${i}, '${firstName}', '${lastName}', '${nickName}', '${birthday}', '${gender}', '${mail}')`;
   i + 1 < numberOfRows ? data+=",":data+=";"
}

fs.writeFile('result.sql', data, (err) => {
    if(err){
        console.log(err);
    }
}

)


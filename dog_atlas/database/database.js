require ('dotenv').config();

const mssql = require('mssql');

console.log('SERVER:', process.env.DB_SERVER);
console.log('USER:', process.env.DB_USER);
console.log('DATABASE:', process.env.DB_NAME);
console.log('PASSWORD:', process.env.DB_PASSWORD);

//Create connection func
const connection = {
    server: process.env.DB_SERVER,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,

    options: { 
        encrypt: false,
        trustServerCertificate: true
    }
};

const PromisePool = mssql.connect(connection) 
    .then (pool => {
        console.log('Connected to the database :D');
        return pool;
    })
    .catch (err => {
        console.error('Error connecting to the database :(', err);
        process.exit(1);
    });


module.exports = {mssql, PromisePool};
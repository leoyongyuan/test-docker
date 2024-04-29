const express = require('express')
const app = express()
const port = 3000
app.use(express.static('./dist')) 
app.listen(port, () => console.log(`服务器 ${port} 开启成功!`))
const TAG_VERSION_ENV = process.env.TAG_VERSION_ENV;
console.log(`My variable is: ${TAG_VERSION_ENV}`);


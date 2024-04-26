const express = require('express')
const app = express()
const port = 3000 // 自定义端口号（不要与已存在端口冲突）
app.use(express.static('../dist')) // dist 是项目的打包资源路径，一般为根目录下dist
app.listen(port, () => console.log(`服务器 ${port} 开启成功!`))
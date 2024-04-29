const express = require("express");
const path = require("path");
const app = express();
const port = 3000;
app.use(express.static(path.join(__dirname, "dist")));
app.listen(port, () => console.log(`服务器 ${port} 开启成功!`));
app.get("*", (req, res) => {
	res.sendFile(path.join(__dirname, "dist", "index.html"));
});
const TAG_VERSION_ENV = process.env.TAG_VERSION_ENV;
console.log(`My variable is: ${TAG_VERSION_ENV}`);

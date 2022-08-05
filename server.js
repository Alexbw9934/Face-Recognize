const express = require('express')
const path = require('path')
const { get } = require('request')
var mysql = require('mysql');
var multer  =   require('multer');

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "recog_face"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("DB Connected!");
});

var storage = multer.diskStorage({   
  destination: function(req, file, cb) { 
     cb(null, './photos');    
  }, 
  filename: function (req, file, cb) { 
     cb(null, Date.now() + "-" + file.originalname);   
  }
});

const upload = multer({
  storage: storage
});

app.post("/api/photo", upload.single("file"), (req, res) =>{
  var sql = "INSERT INTO faces (FaceImage, LeftEye, RightEye, EyesDistance, EarLeft, EarRight, EyersDstance, JawSize) VALUES ('"+ Date.now() + "-" + req.file.originalname +"', '"+ req.body.leftEye +"', '"+ req.body.rightEye +"', "+ req.body.distanceEye +", '"+ req.body.leftEar +"', '"+ req.body.rightEar +"', "+ req.body.distanceEar +", "+ req.body.jaw +")";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  try {
    res.send(req.files);
  } catch (error) {
    console.log(error);
    res.send(400);
  }
});

const viewsDir = path.join(__dirname, 'views')
app.use(express.static(viewsDir))
app.use(express.static(path.join(__dirname, './public')))
app.use(express.static(path.join(__dirname, './weights')))
app.use(express.static(path.join(__dirname, './dist')))

app.get('/', (req, res) => res.sendFile(path.join(viewsDir, 'faceLandmarkDetection.html')))

app.post('/fetch_external_image', async (req, res) => {
  const { imageUrl } = req.body
  if (!imageUrl) {
    return res.status(400).send('imageUrl param required')
  }
  try {
    const externalResponse = await request(imageUrl)
    res.set('content-type', externalResponse.headers['content-type'])
    return res.status(202).send(Buffer.from(externalResponse.body))
  } catch (err) {
    return res.status(404).send(err.toString())
  }
})

app.listen(3000, () => console.log('Listening on port 3000!'))

function request(url, returnBuffer = true, timeout = 10000) {
  return new Promise(function(resolve, reject) {
    const options = Object.assign(
      {},
      {
        url,
        isBuffer: true,
        timeout,
        headers: {
          'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
        }
      },
      returnBuffer ? { encoding: null } : {}
    )

    get(options, function(err, res) {
      if (err) return reject(err)
      return resolve(res)
    })
  })
}
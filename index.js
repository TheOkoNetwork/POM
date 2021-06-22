const express = require('express')
const app = express()
const path = require('path')

const port = process.env.PORT || 3000

app.use(express.static('public'))

const initApp = async () => {
  app.listen(port, () => {
    console.log(`POM listening at http://0.0.0.0:${port}`)
  })
}
app.get('/__/firebase/init.json', async function (req, res) {
  res.send(JSON.parse(process.env.FIREBASE_INIT_JSON))
})

// keep me last, used to mimic the redirect all to /index.html of firebase hosting
app.get('*', function (request, response, next) {
  response.sendFile(path.resolve(__dirname, 'public/index.html'))
})
initApp()

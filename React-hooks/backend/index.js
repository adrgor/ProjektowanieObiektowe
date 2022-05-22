const express = require('express')
const cors = require('cors')
const app = express()
app.disable("x-powered-by");
const port = 3002

app.use(cors({
    origin: "http://localhost:3000"
}))
app.use(express.json());

const services = [
    {
        'id': 1,
        'service_name': 'Barber',
        'company_name': 'Barber House',
        'price': 80
    }, 
    {
        'id': 2,
        'service_name': 'Tattoo',
        'company_name': 'Rock\'n\'Roll tattoo',
        'price': 200
    },
    {
        'id': 3,
        'service_name': 'Masage',
        'company_name': 'Holy spa',
        'price': 100
    },
    {
        'id': 4,
        'service_name': 'Manicure',
        'company_name': 'Nobu nails',
        'price': 50
    }
]

app.get('/', (_req, res) => {
  res.send(JSON.stringify(services))
})

app.post('/orders', (req,res) => {
    console.log("Order received:")
    console.log(req.body)
    res.sendStatus(200)
})

app.post('/checkout', (req, res) => {
    console.log('Payment details received ')
    console.log(req.body)
    res.sendStatus(200)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
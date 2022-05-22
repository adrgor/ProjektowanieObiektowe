import { createContext, useState } from 'react'
import { BrowserRouter, Route, Routes, Link } from 'react-router-dom'
import ServiceList from './components/ServiceList'
import Orders from './components/Orders'
import Checkout from './components/Checkout'

export const OrdersContext = createContext()
export const SetOrdersContext = createContext()


function App() {

  const [orders, setOrders] = useState([])

  return (
    <div className="App">
      <OrdersContext.Provider value={orders}>
        <SetOrdersContext.Provider value={setOrders}>

          <BrowserRouter>
            <div id="header">
              <Link to="/"> <div>Home</div> </Link>
              <Link to="/orders"> <div>Orders</div> </Link>
            </div>

            <Routes>
              <Route path='/' exact element={<ServiceList/>} />
              <Route path='/orders' element={<Orders/>}/>
              <Route path='/checkout' element={<Checkout/>}/>
            </Routes>
          </BrowserRouter>


        </SetOrdersContext.Provider>
      </OrdersContext.Provider>
    </div>
  );
}

export default App;

import {React, useState, useContext} from 'react'
import OrderItem from './OrderItem'
import { Link } from 'react-router-dom';
import { OrdersContext, SetOrdersContext } from '../App';

const Orders = ( ) => {

    const orders = useContext(OrdersContext)
    const setOrders = useContext(SetOrdersContext)

    function sendOrdersToBackend() {
        const body = JSON.stringify([...orders])

        const res = fetch('http://localhost:3002/orders', {
            mode: 'cors',
            method: "POST",
            headers: {
                "Content-Type": 'application/json'
            }, 
            body
        })
    }

    return (
        <div className="basket">
            <p>Your basket</p>

            {orders.length > 0 ? orders.map((order) => (<OrderItem id={order.id} companyName={order.company_name} serviceName={order.service_name} price={order.price}/>)) :
            <div style={{margin: "auto", textAlign: "center"}}>No products in basket</div>}
            <div className="summary">
                Summary: ${orders.map(order => order.price).reduce((partialSum, a) => partialSum + a, 0)}
            </div>
            {orders.length > 0 && <Link to="/checkout"> <div className="checkout" onClick={sendOrdersToBackend}>Go to checkout ></div></Link>}
        </div>
    );
}


export default Orders;

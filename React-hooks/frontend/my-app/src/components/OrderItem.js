import React, { useContext } from 'react'
import { OrdersContext, SetOrdersContext } from '../App';
import placeholderImg from '../images/placeholder.png'

const OrderItem = (props) => {

    const orders = useContext(OrdersContext)
    const setOrders = useContext(SetOrdersContext)

    let display = {}

    function removeOrder(id) {
        console.log('chcę usunąć order o id ', id)
        let newOrders = [...orders]
        newOrders = newOrders.filter(order => order.id !== id)
        setOrders(newOrders)
        console.log(orders)
    }

    return (
        <div className="basket-item">
            <img src={placeholderImg} alt="Placeholder" style={{height: "100%"}}/>
            <div style={{margin: "auto"}}>{props.serviceName}</div>
            <div style={{margin: "auto"}}>{props.companyName}</div>
            <div style={{margin:"auto"}}>{props.price}</div>
            <div style={{border: "1px solid black", height: "50px", paddingLeft: "2em", paddingRight: "2em",  margin: "auto", textAlign: "center", lineHeight: "50px"}}
                onClick={() => removeOrder(props.id)}>Remove</div>
            
        </div>
    );
}


export default OrderItem;

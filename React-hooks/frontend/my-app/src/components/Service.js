import React, { useContext } from 'react'
import { OrdersContext, SetOrdersContext } from '../App'
import placeholderImg from '../images/placeholder.png'

const Service = (props) => {

    const orders = useContext(OrdersContext)
    const setOrders = useContext(SetOrdersContext)

    function addItemToOrders() {
        if(orders.map(order => order.id).includes(props.id)){
            console.log('already present')
        } else {
            setOrders(prev => {
                setOrders([...prev, {
                    'id': props.id,
                    'service_name': props.serviceName,
                    'company_name': props.companyName,
                    'price': props.price
                }])
            })
        }
    }

    return (
        <div className="service">
            <img src={placeholderImg} alt="Placeholder" style={{width: "100%"}}/>
            <div className="details">
                <div style={{height:"2em"}}>{props.serviceName}</div>
                <div style={{height:"2em"}}>{props.companyName}</div>
                <div style={{padding: "0.5em", maxHeight: "1em"}}>{props.price + "zł"}</div>
                <div style={{borderTop: "1px solid black", margin: "auto", textAlign: "center"}} onClick={addItemToOrders}>Add to basket</div>
            </div>
        </div>
    )
}

export default Service

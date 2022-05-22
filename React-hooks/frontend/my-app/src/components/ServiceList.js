import React, { useContext, useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { OrdersContext } from '../App'
import Service from './Service'

const ServiceList = () => {

    const [services, setServices] = useState([])

    useEffect(() => {
        const fetchServices = async () => {
            const res = await fetch('http://localhost:3002')
            const data = await res.json()
            setServices(data)
      }
        fetchServices()
      }, [])

    const orders = useContext(OrdersContext)

    const buttonStyle = {
        width: "fit-content",
        textAlign: "center",
        marginTop: "2em",
        fontSize: "2em",
        padding: "0.5em",
        paddingLeft: "1em",
        paddingRight: "1em",
        backgroundColor: "#000e29",
        borderRadius: "50000px",
        color: "#efefef",
        minWidth: "5em",
        margin: "auto"
    }

    return (
        <>
        <div className='item-list'>
            {services.length <= 0 ? <div>No services found</div> : services.map(service => (<Service id={service.id} serviceName={service.service_name} companyName={service.company_name} price={service.price}/>))}
        </div>
        {orders.length > 0 && <Link to="/orders"><div style={buttonStyle}>Go to basket ({orders.length})></div></Link>}
        </>
    )
}


export default ServiceList;
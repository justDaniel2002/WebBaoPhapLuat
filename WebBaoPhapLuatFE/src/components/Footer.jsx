import React from 'react'
import logo from '../assets/bplLOGO.png'
import { FooterData } from '../data/data'

export default function Footer() {
  return (
    <div className='bg-slate-50 py-10'>
        <img className='w-1/6 m-auto mb-5' src={logo}/>
        <div className='grid grid-rows-6 grid-flow-col text-neutral-500 mb-20 px-40'>
            {FooterData.map(data => <div className='mb-3 pl-10'>{data}</div>)}
            <div className='mb-3 pl-10'>E-mail: <span className='font-medium'>baodientuphapluat@gmail.com</span></div>
            <div className='mb-3 pl-10'>Hotline: <span className='font-medium'>0904 868 118</span></div>
            <div className='mb-3 pl-10'>Liên hệ quảng cáo: <span className='font-medium'>0904 868 118</span></div>
        </div>
        <hr className='my-5'/>
        <div className='text-center'>© All rights reserved - Bản quyền thuộc về Báo Pháp luật Việt Nam</div>
    </div>
  )
}

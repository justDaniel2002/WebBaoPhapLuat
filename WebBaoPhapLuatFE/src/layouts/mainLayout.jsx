import { Outlet } from "react-router-dom";
import { Navbar } from "../components/Navbar";
import { Header } from "../components/Hearder";
import Footer from "../components/Footer";

export const MainLayout = () => {
    return <>
    <Header />
    
    <Navbar />
    
    <div className="px-40">
     
      <Outlet />
    </div>
    <Footer />
    </>
}

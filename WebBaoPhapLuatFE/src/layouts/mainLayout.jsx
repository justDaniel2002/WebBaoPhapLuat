import { Outlet } from "react-router-dom";
import { Navbar } from "../components/Navbar";
import { Header } from "../components/Hearder";

export const MainLayout = () => {
    return <>
    <Header />
    <div className="px-40">
      <Navbar />
      <Outlet />
    </div>
    </>
}

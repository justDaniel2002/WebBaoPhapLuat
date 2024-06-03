import { useRecoilState } from "recoil";
import { accountState } from "../state/AccountState";
import { useEffect } from "react";
import { Link, Outlet, useNavigate } from "react-router-dom";
import { MenuAdmin } from "../data/data";

export const AdminLayout = () => {
    // const [account, setAccount] = useRecoilState(accountState);

    // const navigate = useNavigate()
    // useEffect(() => {
    //     if(!account){
    //         navigate("/auth/login")
    //     }
    // })
    return <>
    <div className="flex">
        <div className="w-1/4 px-5 pt-10 border rounded-r-lg">
            {MenuAdmin.map(menu => <Link className="mb-5 text-neutral-500 bg-neutral-200 hover:bg-white border rounded-3xl">{menu.content}</Link>)}
        </div>
        <div className="w-3/4">
            <Outlet />
        </div>
    </div>
    </>
}
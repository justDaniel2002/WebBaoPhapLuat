import { useRecoilState } from "recoil";
import { accountState } from "../state/AccountState";
import { useEffect } from "react";
import { Link, Outlet, useLocation, useNavigate } from "react-router-dom";
import { MenuAdmin, MenuManager } from "../data/data";

export const AdminLayout = () => {
  const [account, setAccount] = useRecoilState(accountState);
  const location = useLocation();
  const navigate = useNavigate();
  useEffect(() => {
    console.log("account", account)
    if (account?.roleId>2||account==undefined) {
      navigate("/");
    }
  });

  const signOut = () => {
    setAccount(undefined)
  }
  return (
    <>
      <div className="flex">
        <div className="w-1/6 px-5 pt-10 border rounded-r-lg flex flex-col justify-between font-light h-screen">
          <div>
            {account?.roleId == 1?<>
              {MenuAdmin.map((menu) => (
              <Link
                to={`/${menu.link}`}
                className={`block px-5 py-1 text-lg mb-5 hover:font-bold ${
                  location.pathname?.includes(menu.link)
                    ? `font-bold text-red-600 bg-white`
                    : `text-neutral-500 bg-neutral-200`
                } hover:bg-white hover:text-red-600 transition-all border rounded-3xl`}
              >
                {menu.content}
              </Link>
            ))}
            </>:account?.roleId == 2?<>
            {MenuManager.map((menu) => (
              <Link
                to={`/${menu.link}`}
                className={`block px-5 py-1 text-lg mb-5 hover:font-bold ${
                  location.pathname?.includes(menu.link)
                    ? `font-bold text-red-600 bg-white`
                    : `text-neutral-500 bg-neutral-200`
                } hover:bg-white hover:text-red-600 transition-all border rounded-3xl`}
              >
                {menu.content}
              </Link>
            ))}</>:<></>}
          </div>

          <div onClick={signOut} className=" px-5 py-1 text-xl mb-5 text-neutral-500 bg-neutral-200 hover:font-bold hover:bg-white hover:text-red-600 transition-all border rounded-3xl">
            Đăng xuất
          </div>
        </div>
        <div className="w-5/6">
          <Outlet />
        </div>
      </div>
    </>
  );
};

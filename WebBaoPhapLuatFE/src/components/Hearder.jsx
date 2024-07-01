import { Icon } from "@iconify/react/dist/iconify.js";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useRecoilState } from "recoil";
import { accountState } from "../state/AccountState";

export const Header = () => {
  const [account, setAccount] = useRecoilState(accountState)
  const [search, setSearch] = useState("")
  const navigate = useNavigate()
  return (
    <>
      <div className="py-3 mb-7 border-b border-neutral-400 text-neutral-700 px-20 bg-neutral-100 font-thin flex justify-between items-center">
        <div className="flex items-center">
          <Icon icon="ph:phone-thin" className="mr-2" /> Hotline: 0904 868 118{" "}
          <Icon icon="iconamoon:email-thin" className="mr-2 ml-4" /> Email:
          baodientuphapluat@gmail.com
        </div>
        <div className="flex items-center">
          <input onKeyDown={event => {
            if(search.length==0){
              return
            }
            if(event.key === 'Enter'){
              navigate(`/SearchPosts/${search}`)
            }
          }} value={search} onChange={event => setSearch(event.target.value)} className="px-3 mr-5" placeholder="Tìm kiếm" />
          {account?.roleId==3&&<div onClick={() => navigate("/FavorPosts")} className="hover:bg-red-600 hover:text-white px-2 py-1">Bài viết yêu thích</div>}

           {account?<div onClick={() => setAccount(undefined)} className="hover:bg-red-600 hover:text-white px-2 py-1">Đăng xuất</div>:<div onClick={() => navigate("/auth/login")} className="hover:bg-red-600 hover:text-white px-2 py-1">Đăng nhập/Đăng ký</div>} 
          {account?.roleId==1?<div onClick={() => navigate("/Admin")} className="hover:bg-red-600 hover:text-white px-2 py-1">Quản trị viên</div>:""} 
          {account?.roleId==2?<div onClick={() => navigate("/commentManager")} className="hover:bg-red-600 hover:text-white px-2 py-1">Quản lý</div>:""} 
        </div>
      </div>
    </>
  );
};

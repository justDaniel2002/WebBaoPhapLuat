import { Icon } from "@iconify/react/dist/iconify.js";
import { useNavigate } from "react-router-dom";

export const Header = () => {

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
          <input className="px-3 mr-5" placeholder="Tìm kiếm" />

          <div onClick={() => navigate("/auth/login")} className="hover:bg-red-600 hover:text-white px-2 py-1">Đăng nhập/Đăng ký</div>
        </div>
      </div>
    </>
  );
};

import { Link, useNavigate } from "react-router-dom";
import logo from "../../assets/bplLOGO.png";
import { useState } from "react";
import { toast } from "react-toastify";
import { isValidEmail } from "../../helpers/helpers";
import { SignIn } from "../../api/service";
import { useRecoilState } from "recoil";
import { accountState } from "../../state/AccountState";
export const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [account, setAccount] = useRecoilState(accountState);
  const navigate = useNavigate();

  const onSubmit = () => {
    if (email.trim().length == 0) {
      toast.warning("Nhập email");
      return;
    }

    if (password.trim().length == 0) {
      toast.warning("Nhập mật khẩu");
      return;
    }

    if (!isValidEmail(email)) {
      toast.warning("Email sai định dạng");
      return;
    }

    SignIn({ email, password })
      .then((res) => {
        if(res==null){
          toast.error("Đăng nhập thất bại");
        }
        else toast.success("Đăng nhập thành công");
        setAccount(res);
        if (res?.roleId==3) {
          navigate("/");
        } else if (res?.roleId == 1 || res?.roleId == 2) {
          navigate("/Admin");
        }
      })
      .catch(() => toast.error("Đăng nhập thất bại"));
  };
  return (
    <>
      <div className="mt-20 w-1/3 m-auto border-2 border-red-500 rounded-xl">
        <img onClick={() => navigate("/")} src={logo} />
        <hr className="my-5 text-red-500" />
        <div className="text-center text-xl font-bold mb-5">Đăng Nhập</div>
        <div className="px-10 py-5">
          <div className="mb-5">
            <div className="text-neutral-500 mb-2">Email</div>
            <input
              value={email}
              onChange={(event) => setEmail(event.target.value)}
              className="w-full rounded-lg px-5 py-2 bg-neutral-100"
              placeholder="abc@gmail.com"
            />
          </div>
          <div className="mb-10">
            <div className="text-neutral-500 mb-2">Mật khẩu</div>
            <input
              value={password}
              onChange={(event) => setPassword(event.target.value)}
              className="w-full rounded-lg px-5 py-2 bg-neutral-100"
              type="password"
            />
          </div>

          <button
            onClick={onSubmit}
            className="mb-5 w-40 block m-auto rounded-3xl text-lg text-red-500 border-2 border-red-500 hover:bg-red-500 hover:text-white"
          >
            Đăng Nhập
          </button>
          <div className="text-center">
            <Link
              to={"/auth/register"}
              className="text-lg text-red-500 hover:text-neutral-500"
            >
              Đăng Ký
            </Link>
          </div>
        </div>
      </div>
    </>
  );
};

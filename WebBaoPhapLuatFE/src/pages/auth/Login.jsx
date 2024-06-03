import logo from "../../assets/bplLOGO.png";
export const Login = () => {
  return (
    <>
      <div className="mt-20 w-1/3 m-auto border-2 border-red-500 rounded-xl">
        <img src="logo" />
        <hr className="my-5 text-red-500" />
        <div className="text-center text-xl font-bold mb-5">Đăng Nhập</div>
        <div className="mb-5">
            <div className="text-neutral-500 mb-2">Email</div>
            <input className="w-full rounded-xl p-1 bg-neutral-100" placeholder="abc@gmail.com"/>
        </div>
        <div className="mb-10">
            <div className="text-neutral-500 mb-2">Mật khẩu</div>
            <input className="w-full rounded-xl p-1 bg-neutral-100" type="password"/>
        </div>

        <button className="w-40 m-auto rounded-3xl text-lg text-red-500 border-2 border-red-500">Đăng Nhập</button>
      </div>
    </>
  );
};

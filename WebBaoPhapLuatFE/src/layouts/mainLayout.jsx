import { Outlet } from "react-router-dom";
import { Navbar } from "../components/Navbar";
import { Header } from "../components/Hearder";
import Footer from "../components/Footer";
import { useState } from "react";
import { Icon } from "@iconify/react/dist/iconify.js";

export const MainLayout = () => {
  const [Chat, setChat] = useState();

  const btnPrs = () => {
    if (!Chat) {
      setChat(
        <div className="top-5 right-40 fixed">
          <iframe
            height={660}
            width={800}
            src="https://www.facebook.com/messages/e2ee/t/7735635129848075"
          ></iframe>
        </div>
      );
    } else setChat(undefined);
  };
  return (
    <>
      <Header />

      <Navbar />

      <div className="px-40">
        <Outlet />
        {Chat}
        <button
          onClick={btnPrs}
          className="fixed right-10 bottom-10 p-3 rounded-full bg-white text-4xl border-2"
        >
          <Icon icon="logos:messenger" />
        </button>
      </div>
      <Footer />
    </>
  );
};

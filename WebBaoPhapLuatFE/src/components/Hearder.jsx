import { Icon } from "@iconify/react/dist/iconify.js";

export const Header = () => {
  return (
    <>
      <div className="py-3 mb-7 border-b border-neutral-400 text-neutral-700 px-20 bg-neutral-100 font-thin flex justify-between items-center">
        <div className="flex items-center">
          <Icon icon="ph:phone-thin" className="mr-2" /> Hotline: 0904 868 118{" "}
          <Icon icon="iconamoon:email-thin" className="mr-2 ml-4" /> Email:
          baodientuphapluat@gmail.com
        </div>
        <div>
          <input className="px-3" placeholder="Tìm kiếm" />
        </div>
      </div>
    </>
  );
};

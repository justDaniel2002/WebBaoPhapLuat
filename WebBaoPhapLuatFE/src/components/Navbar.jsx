import { Icon } from "@iconify/react";
import logo from "../assets/bplLOGO.png";
import { Link } from "react-router-dom";
import { categories, tags } from "../data/data";
export const Navbar = () => {
  return (
    <>
      
      <Link to={"/"}>
        <img src={logo} />
      </Link>
      <div className="my-5 flex justify-around shadow-xl">
        {tags.map((tags) => (
          <div className="px-3 py-1">{tags.toUpperCase()}</div>
        ))}
      </div>
      <div className="flex mb-7 justify-around">
        {categories.map((cate) => (
          <img src={cate} />
        ))}
      </div>
    </>
  );
};

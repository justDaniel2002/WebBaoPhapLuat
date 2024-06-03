import { Icon } from "@iconify/react";
import logo from "../assets/bplLOGO.png";
import { Link, useNavigate } from "react-router-dom";
import { categories, tags } from "../data/data";
import { useEffect, useState } from "react";
import { getCategories, getTags } from "../api/api";
import { getApi } from "../api/service";
export const Navbar = () => {
  const [categories, setcategories] = useState([])
  const [tags, setTags] = useState([])

  const navigate = useNavigate()  
  useEffect(() => {
    getApi(getCategories).then(res => setcategories(res))
    getApi(getTags).then(res => setTags(res))
  },[])
  return (
    <>
      
      <Link to={"/"}>
        <img src={logo} />
      </Link>
      <div className="my-5 flex justify-around shadow-xl">
        {tags.map((tag) => (
          <div onClick={() => navigate(`/PostByTag/${tag?.tagId}`)} className="px-3 py-1">{tag?.tagName?.toUpperCase()}</div>
        ))}
      </div>
      <div className="flex mb-7 justify-around">
        {categories.map((cate) => (
          <img onClick={() => navigate(`/PostByCate/${cate?.categoryId}`)} src={cate?.imageURL} />
        ))}
      </div>
    </>
  );
};

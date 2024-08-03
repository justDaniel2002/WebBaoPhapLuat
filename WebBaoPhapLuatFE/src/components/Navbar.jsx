import { Icon } from "@iconify/react";
import logo from "../assets/bplLOGO.png";
import { Link, useNavigate } from "react-router-dom";
import { categories, tags } from "../data/data";
import { useEffect, useRef, useState } from "react";
import { getCategories, getTags } from "../api/api";
import { getApi } from "../api/service";
export const Navbar = () => {
  const iconMenuRef = useRef(null);
  const MenuRef = useRef(null);

  const [categories, setcategories] = useState([]);
  const [tags, setTags] = useState([]);

  const navigate = useNavigate();
  useEffect(() => {
    getApi(getCategories).then((res) => setcategories(res));
    getApi(getTags).then((res) => setTags(res));
  }, []);

  const onMouseOverIconMenu = () => {
    if(MenuRef.current.classList.contains("hidden")){
      MenuRef.current.classList.remove("hidden")
      MenuRef.current.classList.add("grid")
    }
  }

  const onMouseLeaveMenu = () => {
    if(!MenuRef.current.classList.contains("hidden")){
      MenuRef.current.classList.add("hidden")
      MenuRef.current.classList.remove("grid")
    }
  }
  const onMouseOverTag = (tagId) => {
    // Find the target child element within the parent element
    const targetElement = document.querySelector(`#innerTag${tagId}`);

    if (targetElement.classList.contains("hidden")) {
      targetElement.classList.remove("hidden");
    }
  };

  const onMouseLeaveTag = (tagId) => {
    // Find the target child element within the parent element
    const targetElement = document.querySelector(`#innerTag${tagId}`);

    if (!targetElement.classList.contains("hidden")) {
      targetElement.classList.add("hidden");
    }
  };
  return (
    <>
      <div className="px-80">
        <Link to={"/"}>
          <img src={logo} />
        </Link>
      </div>
      <div onMouseLeave={onMouseLeaveMenu} className="my-5 flex justify-around shadow-xl items-center text-red-500 text-3xl px-20 flex-wrap">
        <Icon icon="ic:twotone-home" onClick={() => navigate(`/`)} />
        {tags.map((tag) => (
          <>
            <div
              onMouseOver={() => onMouseOverTag(tag?.tagId)}
              onMouseOut={() => onMouseLeaveTag(tag?.tagId)}
              className=" text-black text-base hover:bg-neutral-100 hover:text-red-500"
            >
              <div
                className="mb-2 px-3 py-1"
                onClick={() => navigate(`/PostByTag/${tag?.tagId}`)}
              >
                {tag?.tagName?.toUpperCase()}
              </div>
              {tag?.InnerTag?.length ? (
                <div
                  id={`innerTag${tag?.tagId}`}
                  className="border absolute hidden text-lg  bg-white text-black "
                >
                  {tag?.InnerTag?.map((inner) => (
                    <div onClick={() => navigate(`/PostByInnerTag/${inner?.innerTagId}`)} className=" hover:bg-neutral-100 pl-3 pr-20 py-4">
                      {inner?.innerTagName}
                    </div>
                  ))}
                </div>
              ) : (
                ""
              )}
            </div>

            {/* <li className="px-3 py-1 h-10">
              <span>{tag?.tagName?.toUpperCase()}</span>

           <ul className="absolute">
           {tag?.InnerTag?.map((inner) => (
                <li><span>{inner?.innerTagName}</span></li>
              ))}
           </ul>
            </li> */}
          </>
        ))}
        <div>
          <Icon ref={iconMenuRef} onMouseOver={onMouseOverIconMenu} className="hover:bg-neutral-100" icon="gg:menu-right" />
          <div ref={MenuRef} className="hidden bg-white absolute w-full left-0 text-black grid-cols-5 text-base gap-5 px-28 py-10">
            {tags.map((tag) => (
              <div>
                <div className="mb-5 font-medium hover:text-red-500">
                  {tag?.tagName}
                </div>
                {tag?.InnerTag?.map((inner) => (
                  <div onClick={() => navigate(`/PostByInnerTag/${inner?.innerTagId}`)} className="mb-3 hover:text-red-500">
                    {inner?.innerTagName}
                  </div>
                ))}
              </div>
            ))}
          </div>
        </div>

        <div className="relative w-full h-0"></div>
      </div>
      <div className="flex mb-7 justify-between px-20">
        {categories.map((cate) => (
          <img
            onClick={() => navigate(`/PostByCate/${cate?.categoryId}`)}
            src={cate?.imageURL}
          />
        ))}
      </div>
    </>
  );
};

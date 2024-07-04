import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getApi, postApi, putApi } from "../../api/service";
import {
  getCategories,
  getTags,
  get_del_edit_PostById,
} from "../../api/api";
import { toast } from "react-toastify";
import { accountState } from "../../state/AccountState";
import { useRecoilState } from "recoil";

export default function AddOnePostPage() {
  const [account, setAccount] = useRecoilState(accountState)
  const [post, setPost] = useState({});
  const [tags, setTags] = useState([]);
  const [categories, setCategories] = useState([]);
  const [selectedTag, setSelectedTag] = useState()


  useEffect(() => {

    getApi(getTags).then((res) => {
      console.log("tags", res)
      setTags(res)
      setSelectedTag(res[0])
    });
    getApi(getCategories).then((res) => setCategories(res));
  }, []);

  

  const add = () => {
    try {
       const addP = {...post, createdBy: account.accountId}
       postApi(get_del_edit_PostById, addP).then(() => {
        toast.success("Thêm bài đăng thành công")
       });
    } catch (error) {
      toast.error("Thêm lỗi");
      console.log(error);
    }
  };
  return (
    <div className="px-40 pt-10 pb-20 font-thin">
      <div className="mb-5">
        <div className="mb-3 text-2xl">Tiêu đề</div>
        <input
          value={post?.title}
          onChange={(event) => setPost({ ...post, title: event.target.value })}
          className="w-full rounded-xl px-5 py-3 border"
        />
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">Mô tả</div>
        <textarea
          value={post?.description}
          onChange={(event) =>
            setPost({ ...post, description: event.target.value })
          }
          className="w-full rounded-xl px-5 py-3 border"
        />
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">URL ảnh</div>
        <input
          value={post?.imageURL}
          onChange={(event) =>
            setPost({ ...post, imageURL: event.target.value })
          }
          className="w-full rounded-xl px-5 py-3 border"
        />
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">Chủ đề</div>
        <select
          value={post?.categoryId ?? 1}
          onChange={(event) =>
            setPost({ ...post, categoryId: parseInt(event.target.value) })
          }
          className="w-1/3 px-5 py-3 rounded-xl border"
        >
          {categories.map((cate) => (
            <option value={cate?.categoryId}>{cate?.categoryName}</option>
          ))}
        </select>
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">Tag</div>
        <select
          
          value={post?.tagId ?? 1}
          onChange={(event) =>{
            setPost({ ...post, tagId: parseInt(event.target.value) })
            const tag = tags.find(tag => tag?.tagId == event.target.value)
            setSelectedTag(tag)
          }
          }
          className="w-1/3 px-5 py-3 rounded-xl border"
        >
          {tags.map((tag) => (
            <option value={tag?.tagId}>{tag?.tagName}</option>
          ))}
        </select>
      </div>

      {selectedTag?.InnerTag?.length?<div className="mb-5">
        <div className="mb-3 text-2xl">Inner Tag</div>
        <select
          
          value={post?.innerTagId ?? 1}
          onChange={(event) =>
            setPost({ ...post, innerTagId: parseInt(event.target.value) })
          }
          className="w-1/3 px-5 py-3 rounded-xl border"
        >
          {selectedTag?.InnerTag.map((innerTag) => (
            <option value={innerTag?.innerTagId}>{innerTag?.innerTagName}</option>
          ))}
        </select>
      </div>:""}
      <div className="mb-5">
        <div className="mb-3 text-2xl">Nội dung</div>
        <textarea
          value={post?.content}
          onChange={(event) =>
            setPost({ ...post, content: event.target.value })
          }
          className="w-full rounded-xl px-5 py-3 border h-40"
        />
      </div>

      <div className="flex justify-end">
        <button
          onClick={add}
          className="border px-5 py-1 rounded-3xl text-red-600 hover:font-bold transition-all text-xl"
        >
          Thêm
        </button>
      </div>
    </div>
  );
}

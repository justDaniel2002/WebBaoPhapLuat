import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getApi, postApi, putApi } from "../../api/service";
import { addTagForPost, getCategories, getTags, get_del_edit_PostById } from "../../api/api";
import { toast } from "react-toastify";

export default function EditPostPage() {
  const [post, setPost] = useState();
  const [tags, setTags] = useState([]);
  const [categories, setCategories] = useState([]);
  const [postTags, setPostTags] = useState([]);

  const params = useParams();
  const id = params.id;

  useEffect(() => {
    getApi(get_del_edit_PostById, id).then((res) => {
      setPost(res);
      if (res?.postTags) {
        setPostTags(res.postTags.map((pt) => pt.tagId));
      }
    });

    getApi(getTags).then((res) => setTags(res));
    getApi(getCategories).then((res) => setCategories(res));
  },[]);

  const handleChange = (event) => {
    const options = event.target.options;
    const selected = [];
    for (const option of options) {
      if (option.selected) {
        selected.push(option.value);
      }
    }
    setPostTags(selected);
  };

  const update = async () => {
    try {
      await postApi(addTagForPost, postTags, post?.postId)
    await putApi(get_del_edit_PostById, post, post?.postId)
    toast.success("Cập nhập thành công")
    } catch (error) {
      toast.error("Cập nhập lỗi")
      console.log(error)
    }
  }
  return (
    <div className="px-40 pt-10 pb-20 font-thin">
      <div className="mb-5">
        <div className="mb-3 text-2xl">Tiêu đề</div>
        <input value={post?.title} onChange={(event) => setPost({...post, title: event.target.value})} className="w-full rounded-xl px-5 py-3 border" />
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">Mô tả</div>
        <textarea value={post?.description} onChange={(event) => setPost({...post, description: event.target.value})} className="w-full rounded-xl px-5 py-3 border"/>
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">URL ảnh</div>
        <input value={post?.imageURL} onChange={(event) => setPost({...post, imageURL: event.target.value})} className="w-full rounded-xl px-5 py-3 border" />
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">Chủ đề</div>
        <select
          value={post?.categoryId ?? 1}
          onChange={(event) => setPost({...post, categoryId: event.target.value})}
          className="w-1/3 px-5 py-3 rounded-xl border"
        >
          {categories.map((cate) => (
            <option value={cate?.categoryId}>{cate?.categoryName}</option>
          ))}
        </select>
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">Tag</div>
        <select onChange={handleChange} value={postTags} multiple className="w-1/3 px-5 py-3 rounded-xl border">
          {tags.map((tag) => (
            <option value={tag?.tagId}>{tag?.tagName}</option>
          ))}
        </select>
      </div>
      <div className="mb-5">
        <div className="mb-3 text-2xl">Nội dung</div>
        <textarea value={post?.content} onChange={(event) => setPost({...post, content: event.target.value})} className="w-full rounded-xl px-5 py-3 border h-40"/>
      </div>

      <div className="flex justify-end">
        <button onClick={update} className="border px-5 py-1 rounded-3xl text-red-600 hover:font-bold transition-all text-xl">Cập nhập</button>
      </div>
    </div>
  );
}

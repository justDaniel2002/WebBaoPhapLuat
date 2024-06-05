import React, { useEffect, useState } from "react";
import logo from "../../assets/bplLOGO.png";
import { useNavigate } from "react-router-dom";
import {
  getPosts,
  getPostsByAuthor,
  get_del_edit_PostById,
} from "../../api/api";
import { delApi, getApi } from "../../api/service";
import { accountState } from "../../state/AccountState";
import { useRecoilState } from "recoil";

export default function CreatedPostPage() {
  const [account, setAccount] = useRecoilState(accountState);
  const [posts, setPosts] = useState([]);
  
  const navigate = useNavigate();
  useEffect(() => {
    getApi(getPostsByAuthor, account?.accountId).then((res) => setPosts(res));
  }, []);

  const deletePost = (id) => {
    delApi(get_del_edit_PostById, id).then(() => {
      getApi(getPosts).then((res) => setPosts(res));
    });
  };
  return (
    <div className="pt-20 px-10 flex flex-wrap">
      {posts.map((post) => (
        <div className="hover:-translate-y-5 transition-all rounded-xl border w-3/12 pb-3 shadow-2xl mr-5 mb-10 flex flex-col justify-between">
          <img className="mb-5" src={post?.imageURL ?? logo} />
          <div className="px-5">
            <div className="font-bold text-lg">{post?.title}</div>
            <div className="text-neutral-500 truncate">{post?.description}</div>
            <div className="text-right text-xs text-neutral-500">
              {post?.createdDate}
            </div>
            <div className="flex justify-end mt-5">
              <button
                onClick={() => navigate(`/createdPost/EditPost/${post?.postId}`)}
                className="hover:font-bold transition-all rounded-3xl px-5 py-1 border font-thin text-red-600 mr-3"
              >
                Chỉnh sửa
              </button>
              <button
                onClick={() => deletePost(post?.postId)}
                className="hover:font-bold transition-all rounded-3xl px-5 py-1 font-thin bg-red-600 text-white"
              >
                Xóa
              </button>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}
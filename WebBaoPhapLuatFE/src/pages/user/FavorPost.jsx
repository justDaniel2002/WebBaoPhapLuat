import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { getApi } from "../../api/service";
import { favorPosts, getCategoryById, getPostByCate, get_putFavorPosts } from "../../api/api";
import { useRecoilState } from "recoil";
import { accountState } from "../../state/AccountState";

export default function FavorPost() {
  const [account, setAccount] = useRecoilState(accountState);
  const [posts, setPosts] = useState([]);

  const navigate = useNavigate();
  useEffect(() => {
    getApi(get_putFavorPosts, account?.accountId).then((res) => setPosts(res));
  }, []);
  return (
    <div className="py-16">
      <div className="text-2xl text-red-600 mb-10">
        Các bài viết yêu thích
      </div>
      <div>
        {!posts?.length>0&&<div>Không có bài viết được yêu thích</div>}
        {posts.map((post) => (
          <div
            onClick={() => navigate(`/PostDetail/${post?.postId}`)}
            className="my-20 hover:text-red-500"
          >
            <div className="text-xl mb-3 font-bold">{post?.title}</div>
            <div className="flex">
              {post?.imageURL ? (
                <img src={post?.imageURL} className="w-1/5 mr-2" />
              ) : (
                ""
              )}
              <div className="text-neutral-500">{post?.description}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
